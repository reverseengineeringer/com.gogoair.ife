package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.plugin.BasePlugin;
import com.adobe.primetime.core.plugin.IPluginConfig;
import java.util.HashMap;
import java.util.Map;

public class VideoPlayerPlugin
  extends BasePlugin
{
  public static final String AD_COMPLETE = "ad_complete";
  public static final String AD_START = "ad_start";
  public static final String BITRATE_CHANGE = "bitrate_change";
  public static final String BUFFER_COMPLETE = "buffer_complete";
  public static final String BUFFER_START = "buffer_start";
  public static final String CHAPTER_COMPLETE = "chapter_complete";
  public static final String CHAPTER_START = "chapter_start";
  private static final String ERROR_SOURCE_APPLICATION = "sourceErrorExternal";
  private static final String ERROR_SOURCE_PLAYER = "sourceErrorSDK";
  private static final String KEY_CALLBACK = "callback";
  private static final String KEY_ERROR_ID = "error_id";
  private static final String KEY_SOURCE = "source";
  private static final String NAME = "player";
  public static final String PAUSE = "pause";
  public static final String PLAY = "play";
  public static final String SEEK_COMPLETE = "seek_complete";
  public static final String SEEK_START = "seek_start";
  public static final String TRACK_ERROR = "track_error";
  public static final String VIDEO_COMPLETE = "video_complete";
  public static final String VIDEO_LOAD = "video_load";
  public static final String VIDEO_START = "video_start";
  public static final String VIDEO_UNLOAD = "video_unload";
  private VideoPlayerPluginDelegate _delegate;
  private boolean _isTrackingSessionActive;
  private boolean _isTrackingSessionStarted;
  private final ICallback cacheAdBreakInfo = new VideoPlayerPlugin.3(this);
  private final ICallback cacheAdInfo = new VideoPlayerPlugin.2(this);
  private final ICallback cacheChapterInfo = new VideoPlayerPlugin.4(this);
  private final ICallback cacheQoSInfo = new VideoPlayerPlugin.5(this);
  private final ICallback cacheVideoInfo = new VideoPlayerPlugin.1(this);
  
  public VideoPlayerPlugin(VideoPlayerPluginDelegate paramVideoPlayerPluginDelegate)
  {
    super("player");
    if (paramVideoPlayerPluginDelegate == null) {
      throw new Error("PlayerPluginDelegate cannot be NULL");
    }
    _delegate = paramVideoPlayerPluginDelegate;
    _isTrackingSessionActive = false;
    _isTrackingSessionStarted = false;
    _setupDataResolver();
  }
  
  private void _setupDataResolver()
  {
    HashMap localHashMap1 = new HashMap();
    HashMap localHashMap2 = new HashMap();
    localHashMap1.put("video.id", new VideoPlayerPlugin.6(this, localHashMap2));
    localHashMap1.put("video.name", new VideoPlayerPlugin.7(this, localHashMap2));
    localHashMap1.put("video.length", new VideoPlayerPlugin.8(this, localHashMap2));
    localHashMap1.put("video.playerName", new VideoPlayerPlugin.9(this, localHashMap2));
    localHashMap1.put("video.streamType", new VideoPlayerPlugin.10(this, localHashMap2));
    localHashMap1.put("video.playhead", new VideoPlayerPlugin.11(this, localHashMap2));
    localHashMap1.put("pod.name", new VideoPlayerPlugin.12(this, localHashMap2));
    localHashMap1.put("pod.playerName", new VideoPlayerPlugin.13(this, localHashMap2));
    localHashMap1.put("pod.position", new VideoPlayerPlugin.14(this, localHashMap2));
    localHashMap1.put("pod.startTime", new VideoPlayerPlugin.15(this, localHashMap2));
    localHashMap1.put("ad.isInAdBreak", new VideoPlayerPlugin.16(this, localHashMap2));
    localHashMap1.put("ad.isInAd", new VideoPlayerPlugin.17(this, localHashMap2));
    localHashMap1.put("ad.id", new VideoPlayerPlugin.18(this, localHashMap2));
    localHashMap1.put("ad.name", new VideoPlayerPlugin.19(this, localHashMap2));
    localHashMap1.put("ad.length", new VideoPlayerPlugin.20(this, localHashMap2));
    localHashMap1.put("ad.position", new VideoPlayerPlugin.21(this, localHashMap2));
    localHashMap1.put("chapter.isInChapter", new VideoPlayerPlugin.22(this, localHashMap2));
    localHashMap1.put("chapter.name", new VideoPlayerPlugin.23(this, localHashMap2));
    localHashMap1.put("chapter.length", new VideoPlayerPlugin.24(this, localHashMap2));
    localHashMap1.put("chapter.position", new VideoPlayerPlugin.25(this, localHashMap2));
    localHashMap1.put("chapter.startTime", new VideoPlayerPlugin.26(this, localHashMap2));
    localHashMap1.put("qos.bitrate", new VideoPlayerPlugin.27(this, localHashMap2));
    localHashMap1.put("qos.fps", new VideoPlayerPlugin.28(this, localHashMap2));
    localHashMap1.put("qos.droppedFrames", new VideoPlayerPlugin.29(this, localHashMap2));
    localHashMap1.put("qos.startupTime", new VideoPlayerPlugin.30(this, localHashMap2));
    _dataResolver = new VideoPlayerPlugin.31(this, localHashMap2, localHashMap1);
  }
  
  private boolean _startSessionIfNeeded(String paramString)
  {
    if (!_isTrackingSessionActive)
    {
      _logger.warn(_logTag, "#" + paramString + "() > No active tracking session.");
      return false;
    }
    if (!_isTrackingSessionStarted)
    {
      _logger.info(_logTag, "#" + paramString + "() > Tracking session auto-start.");
      trackSessionStart();
    }
    return true;
  }
  
  public void configure(IPluginConfig paramIPluginConfig)
  {
    if (paramIPluginConfig == null) {
      throw new Error("Reference tp the configuration data cannot be NULL.");
    }
    if (!(paramIPluginConfig instanceof VideoPlayerPluginConfig)) {
      throw new Error("Expected config data to be instance of VideoPlayerPluginConfig.");
    }
    paramIPluginConfig = (VideoPlayerPluginConfig)paramIPluginConfig;
    if (debugLogging) {
      _logger.enable();
    }
    for (;;)
    {
      _logger.debug(_logTag, "configure(debugLogging=" + debugLogging + ")");
      return;
      _logger.disable();
    }
  }
  
  public void trackAdComplete()
  {
    _logger.info(_logTag, "#trackAdComplete()");
    if (!_canProcess()) {}
    while (!_startSessionIfNeeded("trackAdComplete")) {
      return;
    }
    _trigger("ad_complete", null);
  }
  
  public void trackAdStart()
  {
    _logger.info(_logTag, "#trackAdStart()");
    if (!_canProcess()) {}
    while (!_startSessionIfNeeded("trackAdStart")) {
      return;
    }
    _trigger("ad_start", null);
  }
  
  public void trackApplicationError(String paramString)
  {
    _logger.info(_logTag, "#trackApplicationError(errorId=" + paramString + ")");
    if (!_startSessionIfNeeded("trackApplicationError")) {
      return;
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("source", "sourceErrorExternal");
    localHashMap.put("error_id", paramString);
    _trigger("track_error", localHashMap);
  }
  
  public void trackBitrateChange()
  {
    _logger.info(_logTag, "#trackBitrateChange()");
    if (!_canProcess()) {}
    while (!_startSessionIfNeeded("trackBitrateChange")) {
      return;
    }
    _trigger("bitrate_change", null);
  }
  
  public void trackBufferComplete()
  {
    _logger.info(_logTag, "#trackBufferComplete()");
    if (!_canProcess()) {}
    while (!_startSessionIfNeeded("trackBufferComplete")) {
      return;
    }
    _trigger("buffer_complete", null);
  }
  
  public void trackBufferStart()
  {
    _logger.info(_logTag, "#trackBufferStart()");
    if (!_canProcess()) {}
    while (!_startSessionIfNeeded("trackBufferStart")) {
      return;
    }
    _trigger("buffer_start", null);
  }
  
  public void trackChapterComplete()
  {
    _logger.info(_logTag, "trackChapterComplete()");
    if (!_canProcess()) {}
    while (!_startSessionIfNeeded("trackChapterComplete")) {
      return;
    }
    _trigger("chapter_complete", null);
  }
  
  public void trackChapterStart()
  {
    _logger.info(_logTag, "#trackChapterStart()");
    if (!_canProcess()) {}
    while (!_startSessionIfNeeded("trackChapterStart")) {
      return;
    }
    _trigger("chapter_start", null);
  }
  
  public void trackComplete(ICallback paramICallback)
  {
    _logger.info(_logTag, "#trackComplete()");
    if (!_canProcess()) {}
    while (!_startSessionIfNeeded("trackComplete")) {
      return;
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("callback", paramICallback);
    _trigger("video_complete", localHashMap);
  }
  
  public void trackPause()
  {
    _logger.info(_logTag, "#trackPause()");
    if (!_canProcess()) {}
    while (!_startSessionIfNeeded("trackPause")) {
      return;
    }
    _trigger("pause", null);
  }
  
  public void trackPlay()
  {
    _logger.info(_logTag, "#trackPlay()");
    if (!_canProcess()) {}
    while (!_startSessionIfNeeded("trackPlay")) {
      return;
    }
    _trigger("play", null);
  }
  
  public void trackSeekComplete()
  {
    _logger.info(_logTag, "#trackSeekComplete()");
    if (!_canProcess()) {}
    while (!_startSessionIfNeeded("trackSeekComplete")) {
      return;
    }
    _trigger("seek_complete", null);
  }
  
  public void trackSeekStart()
  {
    _logger.info(_logTag, "#trackSeekStart()");
    if (!_canProcess()) {}
    while (!_startSessionIfNeeded("trackSeekStart")) {
      return;
    }
    _trigger("seek_start", null);
  }
  
  public void trackSessionStart()
  {
    _logger.info(_logTag, "#trackSessionStart()");
    if (!_canProcess()) {
      return;
    }
    if (!_isTrackingSessionActive)
    {
      _logger.warn(_logTag, "#trackSessionStart() > No active tracking session.");
      return;
    }
    if (_isTrackingSessionStarted)
    {
      _logger.info(_logTag, "#trackSessionStart() > Tracking session already started.");
      return;
    }
    _isTrackingSessionStarted = true;
    _trigger("video_start", null);
  }
  
  public void trackVideoLoad()
  {
    _logger.info(_logTag, "#trackVideoLoad()");
    if (!_canProcess()) {
      return;
    }
    _trigger("video_load", null);
    _isTrackingSessionActive = true;
    _isTrackingSessionStarted = false;
  }
  
  public void trackVideoPlayerError(String paramString)
  {
    _logger.info(_logTag, "#trackVideoPlayerError(errorId=" + paramString + ")");
    if (!_startSessionIfNeeded("trackVideoPlayerError")) {
      return;
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("source", "sourceErrorSDK");
    localHashMap.put("error_id", paramString);
    _trigger("track_error", localHashMap);
  }
  
  public void trackVideoUnload()
  {
    _logger.info(_logTag, "#trackVideoUnload()");
    if (!_canProcess()) {
      return;
    }
    if (!_isTrackingSessionActive)
    {
      _logger.warn(_logTag, "#trackVideoUnload() > No active tracking session.");
      return;
    }
    _trigger("video_unload", null);
    _isTrackingSessionActive = false;
    _isTrackingSessionStarted = false;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */