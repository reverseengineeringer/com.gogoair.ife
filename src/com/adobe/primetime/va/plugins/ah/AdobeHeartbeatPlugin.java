package com.adobe.primetime.va.plugins.ah;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.Trigger;
import com.adobe.primetime.core.plugin.BasePlugin;
import com.adobe.primetime.core.plugin.IPluginConfig;
import com.adobe.primetime.core.plugin.ParamMapping;
import com.adobe.primetime.core.plugin.PluginManager;
import com.adobe.primetime.core.radio.Channel;
import com.adobe.primetime.core.radio.Radio;
import com.adobe.primetime.va.ErrorInfo;
import com.adobe.primetime.va.plugins.ah.engine.clock.Clock;
import com.adobe.primetime.va.plugins.ah.engine.context.Context;
import com.adobe.primetime.va.plugins.ah.engine.filter.ReportFilter;
import com.adobe.primetime.va.plugins.ah.engine.network.Network;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class AdobeHeartbeatPlugin
  extends BasePlugin
{
  private static final String AA_AD_START = "sc_ad_start";
  private static final String AA_START = "aa_start";
  private static final String ADOBE_ANALYTICS_PLUGIN = "adobe-analytics";
  private static final String ADOBE_HEARTBEAT_PLUGIN = "adobe-heartbeat";
  private static final String AD_COMPLETE = "ad_complete";
  private static final String AD_START = "ad_start";
  private static final String BITRATE_CHANGE = "bitrate_change";
  private static final String BUFFER_COMPLETE = "buffer_complete";
  private static final String BUFFER_START = "buffer_start";
  private static final String CHAPTER_COMPLETE = "chapter_complete";
  private static final String CHAPTER_START = "chapter_start";
  private static final String CLOCK_SERVICE = "service.clock";
  private static final String CMD_DISABLE_REPORTING_TIMER = "clock:reporting.pause";
  private static final String CMD_ENABLE_CHECK_STATUS_TIMER = "clock:check_status.resume";
  private static final String ERROR = "error";
  private static final String ERROR_SOURCE_HEARTBEAT = "sourceErrorHeartbeat";
  private static String EVENT_API_AA_AD_START;
  private static String EVENT_API_AA_START = "api:aa_start";
  private static String EVENT_API_AD_COMPLETE;
  private static String EVENT_API_AD_START;
  private static String EVENT_API_BITRATE_CHANGE = "api:bitrate_change";
  private static String EVENT_API_BUFFER_START;
  private static String EVENT_API_CHAPTER_COMPLETE;
  private static String EVENT_API_CHAPTER_START;
  private static String EVENT_API_CONFIG;
  private static String EVENT_API_PAUSE;
  private static String EVENT_API_PLAY;
  private static String EVENT_API_QUANTUM_END = "api:quantum_end";
  private static String EVENT_API_SEEK_COMPLETE;
  private static String EVENT_API_SEEK_START;
  private static String EVENT_API_TRACK_ERROR;
  private static String EVENT_API_TRACK_INTERNAL_ERROR;
  private static String EVENT_API_VIDEO_COMPLETE;
  private static String EVENT_API_VIDEO_LOAD;
  private static String EVENT_API_VIDEO_START;
  private static String EVENT_API_VIDEO_UNLOAD;
  private static final String EVENT_CLOCK_CHECK_STATUS_GET_SETTINGS = "clock:check_status.get_settings";
  private static final String HEARTBEAT_CHANNEL = "heartbeat-channel";
  private static final String KEY_CHECK_STATUS_SERVER = "check_status_server";
  private static final String KEY_ERROR_ID = "error_id";
  private static final String KEY_PUBLISHER = "publisher";
  private static final String KEY_QUIET_MODE = "quiet_mode";
  private static final String KEY_RESET = "reset";
  private static final String KEY_SOURCE = "source";
  private static final String KEY_SSL = "ssl";
  private static final String KEY_TRACKING_SERVER = "tracking_server";
  private static final String NAME = "adobe-heartbeat";
  private static final String PAUSE = "pause";
  private static final String PLAY = "play";
  private static final String PLAYER_PLUGIN = "player";
  private static final String SEEK_COMPLETE = "seek_complete";
  private static final String SEEK_START = "seek_start";
  private static final String TIMER_REPORTING = "heartbeat.reporting";
  private static final String TIMER_REPORTING_TICK = "heartbeat.reporting.tick";
  private static final String TRACK_ERROR = "track_error";
  private static final String VIDEO_COMPLETE = "video_complete";
  private static final String VIDEO_LOAD = "video_load";
  private static final String VIDEO_START = "video_start";
  private static final String VIDEO_UNLOAD = "video_unload";
  private static final String VIDEO_UNLOADED = "video_unloaded";
  private Channel _channel = _radio.channel("heartbeat-channel");
  private Clock _clock;
  private ICallback _cmdAdComplete = new AdobeHeartbeatPlugin.11(this);
  private ICallback _cmdAdStart = new AdobeHeartbeatPlugin.10(this);
  private ICallback _cmdAnalyticsAdStart = new AdobeHeartbeatPlugin.3(this);
  private ICallback _cmdAnalyticsError = new AdobeHeartbeatPlugin.1(this);
  private ICallback _cmdAnalyticsStart = new AdobeHeartbeatPlugin.2(this);
  private ICallback _cmdBitrateChange = new AdobeHeartbeatPlugin.18(this);
  private ICallback _cmdBufferComplete = new AdobeHeartbeatPlugin.13(this);
  private ICallback _cmdBufferStart = new AdobeHeartbeatPlugin.12(this);
  private ICallback _cmdChapterComplete = new AdobeHeartbeatPlugin.17(this);
  private ICallback _cmdChapterStart = new AdobeHeartbeatPlugin.16(this);
  private ICallback _cmdClockReportingTick = new AdobeHeartbeatPlugin.20(this);
  private ICallback _cmdPause = new AdobeHeartbeatPlugin.9(this);
  private ICallback _cmdPlay = new AdobeHeartbeatPlugin.8(this);
  private ICallback _cmdSeekComplete = new AdobeHeartbeatPlugin.15(this);
  private ICallback _cmdSeekStart = new AdobeHeartbeatPlugin.14(this);
  private ICallback _cmdTrackError = new AdobeHeartbeatPlugin.19(this);
  private ICallback _cmdVideoComplete = new AdobeHeartbeatPlugin.7(this);
  private ICallback _cmdVideoLoad = new AdobeHeartbeatPlugin.4(this);
  private ICallback _cmdVideoStart = new AdobeHeartbeatPlugin.6(this);
  private ICallback _cmdVideoUnload = new AdobeHeartbeatPlugin.5(this);
  private AdobeHeartbeatPluginConfig _config;
  private Context _context;
  private AdobeHeartbeatPluginDelegate _delegate;
  private ErrorInfo _errorInfo;
  private ReportFilter _filter;
  private boolean _isBuffering;
  private boolean _isConfigured = false;
  private boolean _isPaused;
  private boolean _isSeeking;
  private boolean _isTrackingSessionActive = false;
  private Network _network;
  private ICallback _onError = new AdobeHeartbeatPlugin.21(this);
  private Radio _radio = new Radio(_logger);
  
  static
  {
    EVENT_API_AA_AD_START = "api:aa_ad_start";
    EVENT_API_CONFIG = "api:config";
    EVENT_API_VIDEO_LOAD = "api:video_load";
    EVENT_API_VIDEO_UNLOAD = "api:video_unload";
    EVENT_API_VIDEO_START = "api:video_start";
    EVENT_API_VIDEO_COMPLETE = "api:video_complete";
    EVENT_API_AD_START = "api:ad_start";
    EVENT_API_AD_COMPLETE = "api:ad_complete";
    EVENT_API_PLAY = "api:play";
    EVENT_API_PAUSE = "api:pause";
    EVENT_API_BUFFER_START = "api:buffer_start";
    EVENT_API_SEEK_START = "api:seek_start";
    EVENT_API_SEEK_COMPLETE = "api:seek_complete";
    EVENT_API_CHAPTER_START = "api:chapter_start";
    EVENT_API_CHAPTER_COMPLETE = "api:chapter_complete";
    EVENT_API_TRACK_ERROR = "api:track_error";
    EVENT_API_TRACK_INTERNAL_ERROR = "api:track_internal_error";
  }
  
  public AdobeHeartbeatPlugin(AdobeHeartbeatPluginDelegate paramAdobeHeartbeatPluginDelegate)
  {
    super("adobe-heartbeat");
    _delegate = paramAdobeHeartbeatPluginDelegate;
    _context = new Context(_channel, _logger);
    _filter = new ReportFilter(_channel, _logger);
    _network = new Network(_channel, _logger);
    _setupDataResolver();
  }
  
  private void _registerBehaviours()
  {
    _pluginManager.registerBehaviour(new Trigger("player", "video_load"), this, "handleVideoLoad", null);
    _pluginManager.registerBehaviour(new Trigger("player", "video_unload"), this, "handleVideoUnload", null);
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(new ParamMapping("player", "video.id", "videoId"));
    localArrayList.add(new ParamMapping("player", "video.name", "videoName"));
    localArrayList.add(new ParamMapping("player", "video.length", "videoLength"));
    localArrayList.add(new ParamMapping("player", "video.playhead", "playhead"));
    localArrayList.add(new ParamMapping("player", "video.playerName", "playerName"));
    localArrayList.add(new ParamMapping("player", "video.streamType", "streamType"));
    localArrayList.add(new ParamMapping("player", "qos.fps", "fps"));
    localArrayList.add(new ParamMapping("player", "qos.droppedFrames", "droppedFrames"));
    localArrayList.add(new ParamMapping("player", "qos.bitrate", "bitrate"));
    localArrayList.add(new ParamMapping("player", "qos.startupTime", "startupTime"));
    localArrayList.add(new ParamMapping("adobe-analytics", "rsid", "rsid"));
    localArrayList.add(new ParamMapping("adobe-analytics", "tracking_server", "trackingServer"));
    localArrayList.add(new ParamMapping("adobe-analytics", "channel", "channel"));
    localArrayList.add(new ParamMapping("adobe-analytics", "meta.video.*", "metaVideo"));
    localArrayList.add(new ParamMapping("adobe-analytics", "ssl", "useSsl"));
    localArrayList.add(new ParamMapping("adobe-heartbeat", "publisher", "publisher"));
    localArrayList.add(new ParamMapping("adobe-heartbeat", "sdk", "sdk"));
    localArrayList.add(new ParamMapping("adobe-heartbeat", "ovp", "ovp"));
    localArrayList.add(new ParamMapping("adobe-heartbeat", "version", "version"));
    localArrayList.add(new ParamMapping("adobe-heartbeat", "api_level", "apiLvl"));
    _pluginManager.registerBehaviour(new Trigger("player", "video_start"), this, "handleVideoStart", localArrayList);
    localArrayList = new ArrayList();
    localArrayList.add(new ParamMapping("player", "qos.fps", "fps"));
    localArrayList.add(new ParamMapping("player", "qos.droppedFrames", "droppedFrames"));
    localArrayList.add(new ParamMapping("player", "qos.bitrate", "bitrate"));
    localArrayList.add(new ParamMapping("player", "qos.startupTime", "startupTime"));
    _pluginManager.registerBehaviour(new Trigger("player", "video_complete"), this, "handleVideoComplete", localArrayList);
    localArrayList = new ArrayList();
    localArrayList.add(new ParamMapping("player", "video.playhead", "playhead"));
    localArrayList.add(new ParamMapping("player", "qos.fps", "fps"));
    localArrayList.add(new ParamMapping("player", "qos.droppedFrames", "droppedFrames"));
    localArrayList.add(new ParamMapping("player", "qos.bitrate", "bitrate"));
    localArrayList.add(new ParamMapping("player", "qos.startupTime", "startupTime"));
    _pluginManager.registerBehaviour(new Trigger("player", "play"), this, "handlePlay", localArrayList);
    localArrayList = new ArrayList();
    localArrayList.add(new ParamMapping("player", "video.playhead", "playhead"));
    localArrayList.add(new ParamMapping("player", "qos.fps", "fps"));
    localArrayList.add(new ParamMapping("player", "qos.droppedFrames", "droppedFrames"));
    localArrayList.add(new ParamMapping("player", "qos.bitrate", "bitrate"));
    localArrayList.add(new ParamMapping("player", "qos.startupTime", "startupTime"));
    _pluginManager.registerBehaviour(new Trigger("player", "pause"), this, "handlePause", localArrayList);
    localArrayList = new ArrayList();
    localArrayList.add(new ParamMapping("player", "video.playhead", "playhead"));
    localArrayList.add(new ParamMapping("player", "ad.id", "adId"));
    localArrayList.add(new ParamMapping("player", "ad.name", "adName"));
    localArrayList.add(new ParamMapping("player", "ad.length", "adLength"));
    localArrayList.add(new ParamMapping("player", "ad.position", "adPosition"));
    localArrayList.add(new ParamMapping("player", "pod.name", "podName"));
    localArrayList.add(new ParamMapping("player", "pod.playerName", "podPlayerName"));
    localArrayList.add(new ParamMapping("player", "pod.position", "podPosition"));
    localArrayList.add(new ParamMapping("player", "pod.startTime", "podSecond"));
    localArrayList.add(new ParamMapping("player", "qos.fps", "fps"));
    localArrayList.add(new ParamMapping("player", "qos.droppedFrames", "droppedFrames"));
    localArrayList.add(new ParamMapping("player", "qos.bitrate", "bitrate"));
    localArrayList.add(new ParamMapping("player", "qos.startupTime", "startupTime"));
    localArrayList.add(new ParamMapping("adobe-analytics", "meta.video.*", "metaVideo"));
    localArrayList.add(new ParamMapping("adobe-analytics", "meta.ad.*", "metaAd"));
    _pluginManager.registerBehaviour(new Trigger("player", "ad_start"), this, "handleAdStart", localArrayList);
    localArrayList = new ArrayList();
    localArrayList.add(new ParamMapping("player", "video.playhead", "playhead"));
    localArrayList.add(new ParamMapping("player", "ad.isInAdBreak", "isInAdBreak"));
    localArrayList.add(new ParamMapping("player", "qos.fps", "fps"));
    localArrayList.add(new ParamMapping("player", "qos.droppedFrames", "droppedFrames"));
    localArrayList.add(new ParamMapping("player", "qos.bitrate", "bitrate"));
    localArrayList.add(new ParamMapping("player", "qos.startupTime", "startupTime"));
    _pluginManager.registerBehaviour(new Trigger("player", "ad_complete"), this, "handleAdComplete", localArrayList);
    localArrayList = new ArrayList();
    localArrayList.add(new ParamMapping("player", "video.playhead", "playhead"));
    localArrayList.add(new ParamMapping("player", "qos.fps", "fps"));
    localArrayList.add(new ParamMapping("player", "qos.droppedFrames", "droppedFrames"));
    localArrayList.add(new ParamMapping("player", "qos.bitrate", "bitrate"));
    localArrayList.add(new ParamMapping("player", "qos.startupTime", "startupTime"));
    _pluginManager.registerBehaviour(new Trigger("player", "buffer_start"), this, "handleBufferStart", localArrayList);
    localArrayList = new ArrayList();
    localArrayList.add(new ParamMapping("player", "video.playhead", "playhead"));
    localArrayList.add(new ParamMapping("player", "qos.fps", "fps"));
    localArrayList.add(new ParamMapping("player", "qos.droppedFrames", "droppedFrames"));
    localArrayList.add(new ParamMapping("player", "qos.bitrate", "bitrate"));
    localArrayList.add(new ParamMapping("player", "qos.startupTime", "startupTime"));
    _pluginManager.registerBehaviour(new Trigger("player", "buffer_complete"), this, "handleBufferComplete", localArrayList);
    localArrayList = new ArrayList();
    localArrayList.add(new ParamMapping("player", "video.playhead", "playhead"));
    _pluginManager.registerBehaviour(new Trigger("player", "seek_start"), this, "handleSeekStart", localArrayList);
    localArrayList = new ArrayList();
    localArrayList.add(new ParamMapping("player", "video.playhead", "playhead"));
    localArrayList.add(new ParamMapping("player", "ad.isInAd", "isInAd"));
    localArrayList.add(new ParamMapping("player", "ad.id", "adId"));
    localArrayList.add(new ParamMapping("player", "ad.position", "adPosition"));
    localArrayList.add(new ParamMapping("player", "pod.playerName", "podPlayerName"));
    localArrayList.add(new ParamMapping("player", "pod.position", "podPosition"));
    localArrayList.add(new ParamMapping("player", "chapter.isInChapter", "isInChapter"));
    localArrayList.add(new ParamMapping("player", "chapter.position", "chapterPosition"));
    localArrayList.add(new ParamMapping("player", "chapter.name", "chapterName"));
    localArrayList.add(new ParamMapping("player", "chapter.length", "chapterLength"));
    localArrayList.add(new ParamMapping("player", "chapter.startTime", "chapterOffset"));
    localArrayList.add(new ParamMapping("player", "qos.fps", "fps"));
    localArrayList.add(new ParamMapping("player", "qos.droppedFrames", "droppedFrames"));
    localArrayList.add(new ParamMapping("player", "qos.bitrate", "bitrate"));
    localArrayList.add(new ParamMapping("player", "qos.startupTime", "startupTime"));
    _pluginManager.registerBehaviour(new Trigger("player", "seek_complete"), this, "handleSeekComplete", localArrayList);
    localArrayList = new ArrayList();
    localArrayList.add(new ParamMapping("player", "video.playhead", "playhead"));
    localArrayList.add(new ParamMapping("player", "chapter.position", "chapterPosition"));
    localArrayList.add(new ParamMapping("player", "chapter.name", "chapterName"));
    localArrayList.add(new ParamMapping("player", "chapter.length", "chapterLength"));
    localArrayList.add(new ParamMapping("player", "chapter.startTime", "chapterOffset"));
    localArrayList.add(new ParamMapping("player", "qos.fps", "fps"));
    localArrayList.add(new ParamMapping("player", "qos.droppedFrames", "droppedFrames"));
    localArrayList.add(new ParamMapping("player", "qos.bitrate", "bitrate"));
    localArrayList.add(new ParamMapping("player", "qos.startupTime", "startupTime"));
    localArrayList.add(new ParamMapping("adobe-analytics", "meta.video.*", "metaVideo"));
    localArrayList.add(new ParamMapping("adobe-analytics", "meta.chapter.*", "metaChapter"));
    _pluginManager.registerBehaviour(new Trigger("player", "chapter_start"), this, "handleChapterStart", localArrayList);
    localArrayList = new ArrayList();
    localArrayList.add(new ParamMapping("player", "video.playhead", "playhead"));
    localArrayList.add(new ParamMapping("player", "qos.fps", "fps"));
    localArrayList.add(new ParamMapping("player", "qos.droppedFrames", "droppedFrames"));
    localArrayList.add(new ParamMapping("player", "qos.bitrate", "bitrate"));
    localArrayList.add(new ParamMapping("player", "qos.startupTime", "startupTime"));
    _pluginManager.registerBehaviour(new Trigger("player", "chapter_complete"), this, "handleChapterComplete", localArrayList);
    localArrayList = new ArrayList();
    localArrayList.add(new ParamMapping("player", "video.playhead", "playhead"));
    localArrayList.add(new ParamMapping("player", "qos.fps", "fps"));
    localArrayList.add(new ParamMapping("player", "qos.droppedFrames", "droppedFrames"));
    localArrayList.add(new ParamMapping("player", "qos.bitrate", "bitrate"));
    localArrayList.add(new ParamMapping("player", "qos.startupTime", "startupTime"));
    _pluginManager.registerBehaviour(new Trigger("player", "bitrate_change"), this, "handleBitrateChange", localArrayList);
    localArrayList = new ArrayList();
    _pluginManager.registerBehaviour(new Trigger("player", "track_error"), this, "handleTrackError", localArrayList);
    localArrayList = new ArrayList();
    localArrayList.add(new ParamMapping("player", "video.playhead", "playhead"));
    localArrayList.add(new ParamMapping("player", "qos.fps", "fps"));
    localArrayList.add(new ParamMapping("player", "qos.droppedFrames", "droppedFrames"));
    localArrayList.add(new ParamMapping("player", "qos.bitrate", "bitrate"));
    localArrayList.add(new ParamMapping("player", "qos.startupTime", "startupTime"));
    _pluginManager.registerBehaviour(new Trigger("service.clock", "heartbeat.reporting.tick"), this, "handleClockReportingTick", localArrayList);
    localArrayList = new ArrayList();
    _pluginManager.registerBehaviour(new Trigger("adobe-analytics", "error"), this, "handleAnalyticsError", localArrayList);
    localArrayList = new ArrayList();
    localArrayList.add(new ParamMapping("adobe-analytics", "vid", "vid"));
    localArrayList.add(new ParamMapping("adobe-analytics", "aid", "aid"));
    localArrayList.add(new ParamMapping("adobe-analytics", "mid", "mid"));
    localArrayList.add(new ParamMapping("adobe-analytics", "userId.id", "dpid"));
    localArrayList.add(new ParamMapping("adobe-analytics", "puuid.id", "dpuuid"));
    localArrayList.add(new ParamMapping("player", "video.playhead", "playhead"));
    localArrayList.add(new ParamMapping("player", "qos.fps", "fps"));
    localArrayList.add(new ParamMapping("player", "qos.droppedFrames", "droppedFrames"));
    localArrayList.add(new ParamMapping("player", "qos.bitrate", "bitrate"));
    localArrayList.add(new ParamMapping("player", "qos.startupTime", "startupTime"));
    _pluginManager.registerBehaviour(new Trigger("adobe-analytics", "aa_start"), this, "handleAnalyticsStart", localArrayList);
    localArrayList = new ArrayList();
    localArrayList.add(new ParamMapping("player", "video.playhead", "playhead"));
    localArrayList.add(new ParamMapping("player", "qos.fps", "fps"));
    localArrayList.add(new ParamMapping("player", "qos.droppedFrames", "droppedFrames"));
    localArrayList.add(new ParamMapping("player", "qos.bitrate", "bitrate"));
    localArrayList.add(new ParamMapping("player", "qos.startupTime", "startupTime"));
    _pluginManager.registerBehaviour(new Trigger("adobe-analytics", "sc_ad_start"), this, "handleAnalyticsAdStart", localArrayList);
  }
  
  private void _registerCommands()
  {
    _pluginManager.comply(this, "handleAnalyticsError", _cmdAnalyticsError);
    _pluginManager.comply(this, "handleAnalyticsStart", _cmdAnalyticsStart);
    _pluginManager.comply(this, "handleAnalyticsAdStart", _cmdAnalyticsAdStart);
    _pluginManager.comply(this, "handleVideoLoad", _cmdVideoLoad);
    _pluginManager.comply(this, "handleVideoUnload", _cmdVideoUnload);
    _pluginManager.comply(this, "handleVideoStart", _cmdVideoStart);
    _pluginManager.comply(this, "handleVideoComplete", _cmdVideoComplete);
    _pluginManager.comply(this, "handlePlay", _cmdPlay);
    _pluginManager.comply(this, "handlePause", _cmdPause);
    _pluginManager.comply(this, "handleAdStart", _cmdAdStart);
    _pluginManager.comply(this, "handleAdComplete", _cmdAdComplete);
    _pluginManager.comply(this, "handleBufferStart", _cmdBufferStart);
    _pluginManager.comply(this, "handleBufferComplete", _cmdBufferComplete);
    _pluginManager.comply(this, "handleSeekStart", _cmdSeekStart);
    _pluginManager.comply(this, "handleSeekComplete", _cmdSeekComplete);
    _pluginManager.comply(this, "handleChapterStart", _cmdChapterStart);
    _pluginManager.comply(this, "handleChapterComplete", _cmdChapterComplete);
    _pluginManager.comply(this, "handleBitrateChange", _cmdBitrateChange);
    _pluginManager.comply(this, "handleTrackError", _cmdTrackError);
    _pluginManager.comply(this, "handleClockReportingTick", _cmdClockReportingTick);
  }
  
  private void _resumePlaybackIfPossible(Object paramObject)
  {
    if (_errorInfo != null) {}
    while ((_isPaused) || (_isSeeking) || (_isBuffering)) {
      return;
    }
    _channel.trigger(new Event(EVENT_API_PLAY, paramObject));
  }
  
  private void _setupDataResolver()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("version", new AdobeHeartbeatPlugin.22(this));
    localHashMap.put("api_level", new AdobeHeartbeatPlugin.23(this));
    localHashMap.put("tracking_server", new AdobeHeartbeatPlugin.24(this));
    localHashMap.put("publisher", new AdobeHeartbeatPlugin.25(this));
    localHashMap.put("quiet_mode", new AdobeHeartbeatPlugin.26(this));
    localHashMap.put("ovp", new AdobeHeartbeatPlugin.27(this));
    localHashMap.put("sdk", new AdobeHeartbeatPlugin.28(this));
    localHashMap.put("is_primetime", new AdobeHeartbeatPlugin.29(this));
    localHashMap.put("psdk_version", new AdobeHeartbeatPlugin.30(this));
    _dataResolver = new AdobeHeartbeatPlugin.31(this, localHashMap);
  }
  
  protected boolean _canProcess()
  {
    if (!_isConfigured)
    {
      _logger.error(_logTag, "_canProcess() > Plugin not configured.");
      return false;
    }
    if (_errorInfo != null)
    {
      _logger.error(_logTag, "_canProcess() > Plugin in ERROR state.");
      return false;
    }
    return super._canProcess();
  }
  
  protected void _teardown()
  {
    _logger.debug(_logTag, "#_teardown()");
    _context.destroy();
    _clock.destroy();
    _filter.destroy();
    _network.destroy();
    _radio.shutdown();
  }
  
  public void bootstrap(PluginManager paramPluginManager)
  {
    super.bootstrap(paramPluginManager);
    _channel.on("error", _onError, this);
    _clock = new Clock(_pluginManager, _channel, _logger);
    _channel.command("clock:check_status.resume", null);
    _channel.trigger(new Event("clock:check_status.get_settings", null));
    _registerCommands();
    _registerBehaviours();
  }
  
  public void configure(IPluginConfig paramIPluginConfig)
  {
    if (paramIPluginConfig == null) {
      throw new Error("Reference tp the configuration data cannot be NULL.");
    }
    if (!(paramIPluginConfig instanceof AdobeHeartbeatPluginConfig)) {
      throw new Error("Expected config data to be instance of AdobeHeartbeatPluginConfig.");
    }
    _config = ((AdobeHeartbeatPluginConfig)paramIPluginConfig);
    if (_config.debugLogging) {
      _logger.enable();
    }
    for (;;)
    {
      _logger.debug(_logTag, "#configure({trackingServer=" + _config.getTrackingServer() + ", publisher=" + _config.getPublisher() + ", quietMode=" + _config.quietMode + ", ssl=" + _config.ssl + "})");
      paramIPluginConfig = _config.getTrackingServer() + "/settings/";
      HashMap localHashMap = new HashMap();
      localHashMap.put("tracking_server", _config.getTrackingServer());
      localHashMap.put("check_status_server", paramIPluginConfig);
      localHashMap.put("publisher", _config.getPublisher());
      localHashMap.put("quiet_mode", Boolean.valueOf(_config.quietMode));
      localHashMap.put("ssl", Boolean.valueOf(_config.ssl));
      _channel.trigger(new Event(EVENT_API_CONFIG, localHashMap));
      _isConfigured = true;
      return;
      _logger.disable();
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.AdobeHeartbeatPlugin
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */