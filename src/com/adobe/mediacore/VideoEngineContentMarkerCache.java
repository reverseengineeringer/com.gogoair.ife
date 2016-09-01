package com.adobe.mediacore;

import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

final class VideoEngineContentMarkerCache
{
  private static final long INVALID_TIME = -1L;
  private static final String LOG_TAG = "[PSDK]::" + VideoEngineContentMarkerCache.class.getSimpleName();
  private boolean _allEventsDispatched;
  private final Logger _logger = Log.getLogger(LOG_TAG);
  private final int _mainContentId;
  private final List _markerInfos = new ArrayList();
  private final VideoEngineDispatcher _videoEngineDispatcher;
  
  public VideoEngineContentMarkerCache(VideoEngineDispatcher paramVideoEngineDispatcher, int paramInt)
  {
    _videoEngineDispatcher = paramVideoEngineDispatcher;
    _mainContentId = paramInt;
  }
  
  public void addMarker(VideoEngineTimeline.TimeMapping paramTimeMapping, int paramInt, long paramLong)
  {
    synchronized (_markerInfos)
    {
      if (paramTimeMapping.getTime() == -1L) {
        return;
      }
      _markerInfos.add(new MarkerInfo(paramInt, paramTimeMapping.getTime(), paramLong));
      return;
    }
  }
  
  public boolean containsMarkerFor(long paramLong)
  {
    synchronized (_markerInfos)
    {
      if (_markerInfos.isEmpty()) {
        return false;
      }
      Iterator localIterator = _markerInfos.iterator();
      while (localIterator.hasNext())
      {
        MarkerInfo localMarkerInfo = (MarkerInfo)localIterator.next();
        if ((paramLong >= localMarkerInfo.getTimestamp()) && (paramLong < localMarkerInfo.getTimestamp() + localMarkerInfo.getDuration())) {
          return true;
        }
      }
    }
    return false;
  }
  
  public void dispatchEvents(long paramLong)
  {
    for (;;)
    {
      MarkerInfo localMarkerInfo;
      int i;
      synchronized (_markerInfos)
      {
        if ((_markerInfos.isEmpty()) || (_allEventsDispatched)) {
          return;
        }
        _allEventsDispatched = true;
        Iterator localIterator = _markerInfos.iterator();
        if (!localIterator.hasNext()) {
          break label422;
        }
        localMarkerInfo = (MarkerInfo)localIterator.next();
        if ((paramLong < localMarkerInfo.getTimestamp()) || (paramLong >= localMarkerInfo.getTimestamp() + localMarkerInfo.getDuration())) {
          continue;
        }
        i = 1;
        localIterator = _markerInfos.iterator();
        if (!localIterator.hasNext()) {
          break label418;
        }
        localMarkerInfo = (MarkerInfo)localIterator.next();
        _allEventsDispatched = false;
        if ((paramLong >= localMarkerInfo.getTimestamp()) && (paramLong < localMarkerInfo.getTimestamp() + localMarkerInfo.getDuration()))
        {
          j = 1;
          if ((j == 0) || (localMarkerInfo.isEventDispatched())) {
            break label302;
          }
          _logger.i(LOG_TAG + "#dispatchEvents", "Dispatching event for contentId [" + localMarkerInfo.getContentId() + "] at time [" + localMarkerInfo.getTimestamp() + "], when current time is [" + paramLong + "]");
          localMarkerInfo.setEventDispatched(true);
          _videoEngineDispatcher.dispatch(ContentMarkerEvent.createContentMarkerEvent(localMarkerInfo.getContentId(), localMarkerInfo.getTimestamp()));
          return;
        }
      }
      int j = 0;
      continue;
      label302:
      if ((j == 0) && (localMarkerInfo.isEventDispatched())) {
        localMarkerInfo.setEventDispatched(false);
      }
      if (i == 0)
      {
        _logger.i(LOG_TAG + "#dispatchEvents", "Dispatching event for contentId [" + _mainContentId + "] at time [" + paramLong + "], when current time is [" + paramLong + "]");
        _videoEngineDispatcher.dispatch(ContentMarkerEvent.createContentMarkerEvent(_mainContentId, paramLong));
        continue;
        label418:
        return;
        label422:
        i = 0;
      }
    }
  }
  
  static class MarkerInfo
  {
    private final int _contentId;
    private final long _duration;
    private boolean _eventDispatched;
    private final long _timestamp;
    
    public MarkerInfo(int paramInt, long paramLong1, long paramLong2)
    {
      _timestamp = paramLong1;
      _contentId = paramInt;
      _duration = paramLong2;
    }
    
    public int getContentId()
    {
      return _contentId;
    }
    
    long getDuration()
    {
      return _duration;
    }
    
    public long getTimestamp()
    {
      return _timestamp;
    }
    
    public boolean isEventDispatched()
    {
      return _eventDispatched;
    }
    
    public void setEventDispatched(boolean paramBoolean)
    {
      _eventDispatched = paramBoolean;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoEngineContentMarkerCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */