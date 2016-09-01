package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.radio.Channel;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AdDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AdobeAnalyticsDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AssetDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.CUserDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.ChapterDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.EventDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.EventDao.TYPE;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.QoSDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.ServiceProviderDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.SessionDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.StreamDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.UserDao;
import com.adobe.primetime.va.plugins.ah.engine.model.report.Report;
import com.adobe.primetime.va.plugins.ah.engine.model.report.TrackItem;
import java.security.SecureRandom;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class Context
{
  private static final String CMD_DISABLE_REPORTING_TIMER = "clock:reporting.pause";
  private static final String CMD_ENABLE_REPORTING_TIMER = "clock:reporting.resume";
  private static final String ERROR_SOURCE_PLAYER = "sourceErrorSDK";
  private static final String EVENT_API_AA_AD_START = "api:aa_ad_start";
  private static final String EVENT_API_AA_START = "api:aa_start";
  private static final String EVENT_API_AD_COMPLETE = "api:ad_complete";
  private static final String EVENT_API_AD_START = "api:ad_start";
  private static final String EVENT_API_BITRATE_CHANGE = "api:bitrate_change";
  private static final String EVENT_API_BUFFER_START = "api:buffer_start";
  private static final String EVENT_API_CHAPTER_COMPLETE = "api:chapter_complete";
  private static final String EVENT_API_CHAPTER_START = "api:chapter_start";
  private static final String EVENT_API_PAUSE = "api:pause";
  private static final String EVENT_API_PLAY = "api:play";
  private static final String EVENT_API_QUANTUM_END = "api:quantum_end";
  private static final String EVENT_API_SEEK_COMPLETE = "api:seek_complete";
  private static final String EVENT_API_SEEK_START = "api:seek_start";
  private static final String EVENT_API_TRACK_ERROR = "api:track_error";
  private static final String EVENT_API_TRACK_INTERNAL_ERROR = "api:track_internal_error";
  private static final String EVENT_API_VIDEO_COMPLETE = "api:video_complete";
  private static final String EVENT_API_VIDEO_LOAD = "api:video_load";
  private static final String EVENT_API_VIDEO_START = "api:video_start";
  private static final String EVENT_API_VIDEO_UNLOAD = "api:video_unload";
  private static final String EVENT_CONTEXT_REPORT_AVAILABLE = "context:report_available";
  private static final String EVENT_NET_CHECK_STATUS_COMPLETE = "net:check_status_complete";
  private static final String KEY_CALLBACK = "callback";
  private static final String KEY_REPORT = "report";
  private static final String KEY_RESET = "reset";
  private static final String KEY_TRACK_EXTERNAL_ERRORS = "track_external_errors";
  private static final String REQ_REPORTING_INTERVAL = "reporting_interval";
  private static final String REQ_SESSION_ID = "session_id";
  private String _activeAssetId;
  public AdobeAnalyticsDao _adobeAnalyticsData;
  public AssetDao _assetData;
  private long _autoComputedStartupTime;
  public Channel _channel;
  private Context _context;
  public CUserDao _cuserData;
  private InputDataValidator _inputDataValidator;
  private boolean _isAnalyticsStarted;
  private boolean _isDestroyed;
  private boolean _isTrackingSessionActive;
  private boolean _isVideoComplete;
  private TrackItem _lastInBandItem;
  private String _logTag;
  private ILogger _logger;
  private final ICallback _onApiAdComplete = new Context.14(this);
  private final ICallback _onApiAdStart = new Context.13(this);
  private final ICallback _onApiAnalyticsAdStart = new Context.3(this);
  private final ICallback _onApiAnalyticsStart = new Context.2(this);
  private final ICallback _onApiBitrateChange = new Context.17(this);
  private final ICallback _onApiBufferStart = new Context.10(this);
  private final ICallback _onApiChapterComplete = new Context.16(this);
  private final ICallback _onApiChapterStart = new Context.15(this);
  private final ICallback _onApiPause = new Context.9(this);
  private final ICallback _onApiPlay = new Context.8(this);
  private final ICallback _onApiQuantumEnd = new Context.20(this);
  private final ICallback _onApiSeekComplete = new Context.12(this);
  private final ICallback _onApiSeekStart = new Context.11(this);
  private final ICallback _onApiTrackError = new Context.18(this);
  private final ICallback _onApiTrackInternalError = new Context.19(this);
  private final ICallback _onApiVideoComplete = new Context.7(this);
  private final ICallback _onApiVideoLoad = new Context.4(this);
  private final ICallback _onApiVideoStart = new Context.6(this);
  private final ICallback _onApiVideoUnload = new Context.5(this);
  private final ICallback _onNetworkCheckStatusComplete = new Context.21(this);
  public QoSDao _qosData;
  private ReportFactory _reportFactory;
  public ServiceProviderDao _serviceProviderData;
  public SessionDao _sessionData;
  private AdDao _stashedAdData;
  private ChapterDao _stashedChapterData;
  public StreamDao _streamData;
  private boolean _trackExternalErrors;
  public UserDao _userData;
  
  public Context(Channel paramChannel, ILogger paramILogger)
  {
    if (paramChannel == null) {
      throw new Error("Reference to the channel object cannot be NULL.");
    }
    _channel = paramChannel;
    if (paramILogger == null) {
      throw new Error("Reference to the logger object cannot be NULL.");
    }
    _logTag = Context.class.getSimpleName();
    _logger = paramILogger;
    _assetData = null;
    _streamData = null;
    _qosData = null;
    _sessionData = null;
    _cuserData = null;
    _adobeAnalyticsData = new AdobeAnalyticsDao();
    _serviceProviderData = new ServiceProviderDao();
    _userData = new UserDao();
    _isAnalyticsStarted = false;
    _isTrackingSessionActive = false;
    _isVideoComplete = false;
    _activeAssetId = null;
    _isDestroyed = false;
    _reportFactory = new ReportFactory(this, _logger);
    _inputDataValidator = new InputDataValidator(new Context.1(this));
    _stashedChapterData = null;
    _stashedAdData = null;
    _trackExternalErrors = true;
    _context = this;
    _installEventListeners();
  }
  
  private boolean _checkCall(String paramString)
  {
    if (!_isTrackingSessionActive)
    {
      _logger.warn(_logTag, "#" + paramString + "() > No active tracking session.");
      return false;
    }
    if (_isVideoComplete)
    {
      _logger.warn(_logTag, "#" + paramString + "() > The video content already completed.");
      return false;
    }
    return true;
  }
  
  private static String _generateSessionId()
  {
    SecureRandom localSecureRandom = new SecureRandom();
    return "" + new Date().getTime() + localSecureRandom.nextInt(1000000000);
  }
  
  private void _installEventListeners()
  {
    _channel.on("api:aa_start", _onApiAnalyticsStart, this);
    _channel.on("api:aa_ad_start", _onApiAnalyticsAdStart, this);
    _channel.on("api:video_load", _onApiVideoLoad, this);
    _channel.on("api:video_unload", _onApiVideoUnload, this);
    _channel.on("api:video_start", _onApiVideoStart, this);
    _channel.on("api:video_complete", _onApiVideoComplete, this);
    _channel.on("api:ad_start", _onApiAdStart, this);
    _channel.on("api:ad_complete", _onApiAdComplete, this);
    _channel.on("api:play", _onApiPlay, this);
    _channel.on("api:pause", _onApiPause, this);
    _channel.on("api:buffer_start", _onApiBufferStart, this);
    _channel.on("api:seek_start", _onApiSeekStart, this);
    _channel.on("api:seek_complete", _onApiSeekComplete, this);
    _channel.on("api:chapter_start", _onApiChapterStart, this);
    _channel.on("api:chapter_complete", _onApiChapterComplete, this);
    _channel.on("api:bitrate_change", _onApiBitrateChange, this);
    _channel.on("api:track_error", _onApiTrackError, this);
    _channel.on("api:track_internal_error", _onApiTrackInternalError, this);
    _channel.on("api:quantum_end", _onApiQuantumEnd, this);
    _channel.on("net:check_status_complete", _onNetworkCheckStatusComplete, this);
    _channel.reply("session_id", new Context.22(this));
  }
  
  private void _resetInternalState()
  {
    _logger.debug(_logTag, "#_resetInternalState()");
    _isTrackingSessionActive = false;
    _isVideoComplete = false;
    _autoComputedStartupTime = 0L;
    _streamData = new StreamDao();
    _qosData = new QoSDao();
    _sessionData = new SessionDao();
    _assetData = new AssetDao();
    _stashedAdData = null;
    _stashedChapterData = null;
  }
  
  private void _sendHit(TrackItem paramTrackItem)
  {
    ChapterDao localChapterDao = null;
    Object localObject = new HashMap();
    long l = new Date().getTime();
    EventDao.TYPE localTYPE = EventDao.TYPE.valueOf(paramTrackItem.getEventDao().getType());
    switch (Context.23.$SwitchMap$com$adobe$primetime$va$plugins$ah$engine$model$dao$EventDao$TYPE[localTYPE.ordinal()])
    {
    default: 
      createAndSendReport(paramTrackItem);
    }
    do
    {
      do
      {
        return;
        if (_lastInBandItem != null)
        {
          _lastInBandItem.getEventDao().setDuration(l - _lastInBandItem.getEventDao().getTs());
          _lastInBandItem.getEventDao().setTs(l);
          _lastInBandItem.getEventDao().setPlayhead(paramTrackItem.getEventDao().getPlayhead());
          _lastInBandItem.getQoSDao().setStartupTime(paramTrackItem.getQoSDao().getStartupTime());
          _lastInBandItem.getQoSDao().isStartupTimeOverridden = getQoSDaoisStartupTimeOverridden;
          if ((_lastInBandItem.getEventDao().getType() == "start") && (_lastInBandItem.getAssetDao().getType() == "main")) {
            _autoComputedStartupTime += _lastInBandItem.getEventDao().getDuration();
          }
          if (paramTrackItem != _lastInBandItem) {
            createAndSendReport(_lastInBandItem);
          }
        }
        createAndSendReport(paramTrackItem);
        _lastInBandItem = paramTrackItem;
        ((Map)localObject).clear();
        ((Map)localObject).put("reset", Boolean.valueOf(true));
        _channel.command("clock:reporting.resume", localObject);
        return;
        if (_lastInBandItem != null)
        {
          _lastInBandItem.getEventDao().setDuration(l - _lastInBandItem.getEventDao().getTs());
          _lastInBandItem.getEventDao().setTs(l);
          _lastInBandItem.getEventDao().setPlayhead(paramTrackItem.getEventDao().getPlayhead());
          _lastInBandItem.getQoSDao().setStartupTime(paramTrackItem.getQoSDao().getStartupTime());
          _lastInBandItem.getQoSDao().isStartupTimeOverridden = getQoSDaoisStartupTimeOverridden;
          createAndSendReport(_lastInBandItem);
        }
        createAndSendReport(paramTrackItem);
        if (paramTrackItem.getAssetDao().getType() == "main")
        {
          _lastInBandItem = null;
          ((Map)localObject).clear();
          ((Map)localObject).put("reset", Boolean.valueOf(true));
          _channel.command("clock:reporting.pause", localObject);
          return;
        }
      } while (paramTrackItem.getAssetDao().getType() != "ad");
      _lastInBandItem.getAssetDao().setAdData(null);
      _lastInBandItem.getAssetDao().setType("main");
      return;
      if (_lastInBandItem != null)
      {
        _lastInBandItem.getEventDao().setDuration(l - _lastInBandItem.getEventDao().getTs());
        _lastInBandItem.getEventDao().setTs(l);
        _lastInBandItem.getEventDao().setPlayhead(paramTrackItem.getEventDao().getPlayhead());
        _lastInBandItem.getQoSDao().setStartupTime(paramTrackItem.getQoSDao().getStartupTime());
        _lastInBandItem.getQoSDao().isStartupTimeOverridden = getQoSDaoisStartupTimeOverridden;
        createAndSendReport(_lastInBandItem);
      }
      createAndSendReport(paramTrackItem);
    } while (_lastInBandItem == null);
    localObject = _lastInBandItem.getAssetDao();
    if (paramTrackItem.getEventDao().getType() == "chapter_start") {
      localChapterDao = new ChapterDao(paramTrackItem.getAssetDao().getChapterData());
    }
    ((AssetDao)localObject).setChapterData(localChapterDao);
    _lastInBandItem.getEventDao().setDuration(0L);
    createAndSendReport(_lastInBandItem);
  }
  
  private void _uninstallEventListeners()
  {
    _channel.off(null, null, this);
  }
  
  private void _updateQoSInfo(Map paramMap)
  {
    QoSDao localQoSDao = _qosData;
    if (paramMap.get("bitrate") != null)
    {
      localObject = paramMap.get("bitrate");
      localQoSDao.setBitrate(((Long)localObject).longValue());
      localQoSDao = _qosData;
      if (paramMap.get("fps") == null) {
        break label174;
      }
      localObject = paramMap.get("fps");
      label68:
      localQoSDao.setFps(((Double)localObject).doubleValue());
      localQoSDao = _qosData;
      if (paramMap.get("droppedFrames") == null) {
        break label182;
      }
    }
    label174:
    label182:
    for (Object localObject = paramMap.get("droppedFrames");; localObject = Long.valueOf(0L))
    {
      localQoSDao.setDroppedFrames(((Long)localObject).longValue());
      if (paramMap.get("startupTime") == null) {
        break label190;
      }
      _qosData.setStartupTime(((Double)paramMap.get("startupTime")).longValue());
      _qosData.isStartupTimeOverridden = true;
      return;
      localObject = Long.valueOf(0L);
      break;
      localObject = Double.valueOf(0.0D);
      break label68;
    }
    label190:
    _qosData.setStartupTime(_autoComputedStartupTime);
    _qosData.isStartupTimeOverridden = false;
  }
  
  void createAndSendReport(TrackItem paramTrackItem)
  {
    Object localObject = _reportFactory.createReportForItem(paramTrackItem);
    if (!getQosDataisStartupTimeOverridden) {
      ((Report)localObject).getQosData().setStartupTime(_autoComputedStartupTime);
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("report", localObject);
    _channel.trigger(new Event("context:report_available", localHashMap));
    if ((((Report)localObject).getEventData().getType() == "play") || (((Report)localObject).getEventData().getType() == "buffer") || (((Report)localObject).getEventData().getType() == "start"))
    {
      localObject = new HashMap();
      ((Map)localObject).put("reset", Boolean.valueOf(true));
      _channel.command("clock:reporting.resume", localObject);
    }
    if (paramTrackItem.getEventDao().getType().equalsIgnoreCase("api:aa_start")) {
      _isAnalyticsStarted = true;
    }
  }
  
  public void destroy()
  {
    if (_isDestroyed) {
      return;
    }
    _isDestroyed = true;
    _logger.debug(_logTag, "#destroy()");
    _uninstallEventListeners();
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */