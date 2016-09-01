package com.adobe.primetime.va.plugins.ah.engine.filter;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.radio.Channel;
import com.adobe.primetime.core.radio.CommandQueue;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AdDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AssetDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.EventDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.SessionDao;
import com.adobe.primetime.va.plugins.ah.engine.model.report.Report;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class ReportFilter
{
  private static final String CMD_ENABLE_FLUSH_FILTER_TIMER = "clock:flush_filter.resume";
  private static final String EVENT_CLOCK_FLUSH_FILTER_TICK = "clock:flush_filter.tick";
  private static final String EVENT_CONTEXT_REPORT_AVAILABLE = "context:report_available";
  private static final String EVENT_FILTER_REPORT_AVAILABLE = "filter:data_available";
  private static final String KEY_REPEAT_COUNT = "repeat_count";
  private static final String KEY_REPORT = "report";
  private static final String KEY_RESET = "reset";
  private static final long PLAY_EVENT_DURATION_THRESHOLD = 250L;
  private static final String REQ_SESSION_ID = "session_id";
  private ICallback _bufferReport = new ReportFilter.1(this);
  private Channel _channel;
  private ICallback _flushBufferReport = new ReportFilter.2(this);
  private boolean _isBufferingInProgress;
  private boolean _isDestroyed;
  private String _logTag;
  private ILogger _logger;
  private ICallback _onClockFlushFilterTick = new ReportFilter.4(this);
  private ICallback _onContextReportAvailable = new ReportFilter.3(this);
  private Map _reportBuffer;
  private Map _tsHistory;
  private CommandQueue _workQueue;
  
  public ReportFilter(Channel paramChannel, ILogger paramILogger)
  {
    if (paramChannel == null) {
      throw new Error("Reference to the channel object cannot be NULL.");
    }
    _channel = paramChannel;
    if (paramILogger == null) {
      throw new Error("Reference to the logger object cannot be NULL.");
    }
    _logTag = ReportFilter.class.getSimpleName();
    _logger = paramILogger;
    _isDestroyed = false;
    _isBufferingInProgress = false;
    _reportBuffer = new HashMap();
    _tsHistory = new HashMap();
    _workQueue = new CommandQueue();
    _installEventListeners();
  }
  
  private static ArrayList _filterInBandReports(ArrayList paramArrayList)
  {
    ArrayList localArrayList = new ArrayList();
    paramArrayList = paramArrayList.iterator();
    while (paramArrayList.hasNext())
    {
      Report localReport = (Report)paramArrayList.next();
      if ((localReport.getEventData().getType() == "play") || (localReport.getEventData().getType() == "buffer") || (localReport.getEventData().getType() == "start")) {
        localArrayList.add(localReport);
      }
    }
    return localArrayList;
  }
  
  private static ArrayList _filterPauseReports(ArrayList paramArrayList)
  {
    ArrayList localArrayList = new ArrayList();
    paramArrayList = paramArrayList.iterator();
    while (paramArrayList.hasNext())
    {
      Report localReport = (Report)paramArrayList.next();
      if (localReport.getEventData().getType() != "pause") {
        localArrayList.add(localReport);
      }
    }
    return localArrayList;
  }
  
  private static ArrayList _filterPlayReports(ArrayList paramArrayList)
  {
    ArrayList localArrayList1 = new ArrayList();
    Iterator localIterator = paramArrayList.iterator();
    while (localIterator.hasNext())
    {
      Report localReport = (Report)localIterator.next();
      if (localReport.getEventData().getType() == "play")
      {
        if (localReport.getEventData().getDuration() > 250L)
        {
          localArrayList1.add(localReport);
        }
        else if ((localReport.getEventData().getDuration() == 0L) && (localReport.getAssetData().getType() == "main"))
        {
          ArrayList localArrayList2 = _filterInBandReports(paramArrayList);
          if (localArrayList2.indexOf(localReport) == localArrayList2.size() - 1) {
            localArrayList1.add(localReport);
          }
        }
      }
      else {
        localArrayList1.add(localReport);
      }
    }
    return localArrayList1;
  }
  
  private static ArrayList _filterStartReports(ArrayList paramArrayList)
  {
    ArrayList localArrayList = new ArrayList();
    paramArrayList = paramArrayList.iterator();
    int j = -1;
    int i = -1;
    if (paramArrayList.hasNext())
    {
      Report localReport = (Report)paramArrayList.next();
      int k;
      if (localReport.getEventData().getType() == "start") {
        if (localReport.getAssetData().getType() == "main") {
          if (i == -1)
          {
            localArrayList.add(localReport);
            k = localArrayList.size();
            i = j;
            j = k - 1;
          }
        }
      }
      for (;;)
      {
        k = j;
        j = i;
        i = k;
        break;
        localReport.getEventData().setPrevTs(-1L);
        localArrayList.set(i, localReport);
        k = i;
        i = j;
        j = k;
        continue;
        if (j == -1)
        {
          localArrayList.add(localReport);
          k = localArrayList.size() - 1;
          j = i;
          i = k;
        }
        else
        {
          localReport.getEventData().setPrevTs(-1L);
          localArrayList.set(j, localReport);
          k = i;
          i = j;
          j = k;
          continue;
          localArrayList.add(localReport);
          k = i;
          i = j;
          j = k;
        }
      }
    }
    return localArrayList;
  }
  
  private void _installEventListeners()
  {
    _channel.on("context:report_available", _onContextReportAvailable, this);
    _channel.on("clock:flush_filter.tick", _onClockFlushFilterTick, this);
  }
  
  private void _uninstallEventListeners()
  {
    _channel.off(null, null, this);
  }
  
  private void computePrevTsValues(ArrayList paramArrayList)
  {
    Iterator localIterator = paramArrayList.iterator();
    if (localIterator.hasNext())
    {
      Report localReport = (Report)localIterator.next();
      String str = localReport.getSessionData().getSessionId();
      if (!_tsHistory.containsKey(str)) {
        _tsHistory.put(str, new HashMap());
      }
      Object localObject = new StringBuilder().append(localReport.getEventData().getType()).append(".");
      if (localReport.getAssetData().getType().equalsIgnoreCase("ad")) {}
      for (paramArrayList = localReport.getAssetData().getAdData().getAdId();; paramArrayList = localReport.getAssetData().getVideoId())
      {
        paramArrayList = paramArrayList;
        localObject = (HashMap)_tsHistory.get(str);
        if (((HashMap)localObject).containsKey(paramArrayList)) {
          localReport.getEventData().setPrevTs(((Long)((HashMap)_tsHistory.get(str)).get(paramArrayList)).longValue());
        }
        ((HashMap)localObject).put(paramArrayList, Long.valueOf(localReport.getEventData().getTs()));
        break;
      }
    }
  }
  
  public void destroy()
  {
    if (_isDestroyed) {
      return;
    }
    _logger.debug(_logTag, "#destroy()");
    _uninstallEventListeners();
    _workQueue.cancelAllCommands();
    _reportBuffer.clear();
    _tsHistory.clear();
    _isBufferingInProgress = false;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.filter.ReportFilter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */