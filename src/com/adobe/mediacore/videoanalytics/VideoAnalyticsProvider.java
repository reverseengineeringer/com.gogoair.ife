package com.adobe.mediacore.videoanalytics;

import android.content.Context;
import com.adobe.mediacore.MediaPlayer;
import com.adobe.mediacore.MediaPlayer.Event;
import com.adobe.mediacore.MediaPlayer.PlaybackEventListener;
import com.adobe.mediacore.Version;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.primetime.core.plugin.IPlugin;
import com.adobe.primetime.va.ErrorInfo;
import com.adobe.primetime.va.Heartbeat;
import com.adobe.primetime.va.HeartbeatConfig;
import com.adobe.primetime.va.HeartbeatDelegate;
import com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin;
import com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPluginConfig;
import com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPluginDelegate;
import com.adobe.primetime.va.plugins.ah.AdobeHeartbeatPlugin;
import com.adobe.primetime.va.plugins.ah.AdobeHeartbeatPluginConfig;
import com.adobe.primetime.va.plugins.ah.AdobeHeartbeatPluginDelegate;
import com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin;
import com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPluginConfig;
import java.util.ArrayList;
import java.util.List;

public final class VideoAnalyticsProvider
{
  private static final String LOG_TAG = "[PSDK-VA]::" + VideoAnalyticsProvider.class.getSimpleName();
  private static final Logger _logger = Log.getLogger(LOG_TAG);
  private AdobeAnalyticsPlugin _aaPlugin;
  private AdobeHeartbeatPlugin _ahPlugin;
  private Context _context;
  private List _extensions;
  private Heartbeat _heartbeat;
  private boolean _heartbeatConfigured;
  private MediaPlayer _mediaPlayer;
  private final MediaPlayer.PlaybackEventListener _playbackListener = new VideoAnalyticsProvider.1(this);
  private VideoPlayerPlugin _playerPlugin;
  private VideoAnalyticsPSDKWrapper _playerWrapper;
  
  public VideoAnalyticsProvider(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public VideoAnalyticsProvider(Context paramContext, List paramList)
  {
    if (paramContext == null) {
      throw new IllegalArgumentException("Context instance cannot be NULL");
    }
    _context = paramContext;
    _extensions = paramList;
  }
  
  private void configure()
  {
    if ((_mediaPlayer != null) && (_mediaPlayer.getCurrentItem() != null) && (!_heartbeatConfigured))
    {
      if (VideoAnalyticsPSDKPlayerUtils.getVideoAnalyticsMetadata(_mediaPlayer.getCurrentItem()) == null) {
        break label63;
      }
      configureAdobeAnalyticsPlugin();
      configureAdobeHearbeatPlugin();
      configureVideoPlayerPlugin();
      configureHeartbeat();
    }
    for (;;)
    {
      _heartbeatConfigured = true;
      return;
      label63:
      _logger.w(LOG_TAG + "#configure", "VideoHeartbeat error: VideoAnalyticsMetadata not set on player item");
    }
  }
  
  private void configureAdobeAnalyticsPlugin()
  {
    _aaPlugin = new AdobeAnalyticsPlugin(new PSDKAdobeAnalyticsPluginDelegate());
    AdobeAnalyticsPluginConfig localAdobeAnalyticsPluginConfig = new AdobeAnalyticsPluginConfig();
    channel = VideoAnalyticsPSDKPlayerUtils.getChannel(_mediaPlayer.getCurrentItem());
    debugLogging = VideoAnalyticsPSDKPlayerUtils.getDebugLoggingSetting(_mediaPlayer.getCurrentItem()).booleanValue();
    _aaPlugin.configure(localAdobeAnalyticsPluginConfig);
  }
  
  private void configureAdobeHearbeatPlugin()
  {
    _ahPlugin = new AdobeHeartbeatPlugin(new PSDKAdobeHeartbeatPluginDelegate());
    AdobeHeartbeatPluginConfig localAdobeHeartbeatPluginConfig = new AdobeHeartbeatPluginConfig(VideoAnalyticsPSDKPlayerUtils.getHeartbeatTrackingServer(_mediaPlayer.getCurrentItem()), VideoAnalyticsPSDKPlayerUtils.getHeartbeatPublisher(_mediaPlayer.getCurrentItem()));
    sdk = VideoAnalyticsPSDKPlayerUtils.getAppVersion(_mediaPlayer.getCurrentItem());
    __psdkVersion = Version.getVersion();
    __isPrimetime = true;
    debugLogging = VideoAnalyticsPSDKPlayerUtils.getDebugLoggingSetting(_mediaPlayer.getCurrentItem()).booleanValue();
    quietMode = VideoAnalyticsPSDKPlayerUtils.getQuietModeSetting(_mediaPlayer.getCurrentItem()).booleanValue();
    ssl = VideoAnalyticsPSDKPlayerUtils.getUseSSLSetting(_mediaPlayer.getCurrentItem()).booleanValue();
    _ahPlugin.configure(localAdobeHeartbeatPluginConfig);
  }
  
  private void configureHeartbeat()
  {
    _heartbeat = new Heartbeat(new PSDKAdobeHeartbeatDelegate(), getPlugins());
    HeartbeatConfig localHeartbeatConfig = new HeartbeatConfig();
    debugLogging = VideoAnalyticsPSDKPlayerUtils.getDebugLoggingSetting(_mediaPlayer.getCurrentItem()).booleanValue();
    _heartbeat.configure(localHeartbeatConfig);
  }
  
  private void configureVideoPlayerPlugin()
  {
    _playerWrapper = new VideoAnalyticsPSDKWrapper(_context, _mediaPlayer);
    _playerPlugin = new VideoPlayerPlugin(_playerWrapper);
    _playerWrapper.setPlayerPlugin(_playerPlugin);
    _playerWrapper.setAnalyticsPlugin(_aaPlugin);
    VideoPlayerPluginConfig localVideoPlayerPluginConfig = new VideoPlayerPluginConfig();
    debugLogging = VideoAnalyticsPSDKPlayerUtils.getDebugLoggingSetting(_mediaPlayer.getCurrentItem()).booleanValue();
    _playerPlugin.configure(localVideoPlayerPluginConfig);
  }
  
  private List getPlugins()
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(_playerPlugin);
    if (_aaPlugin != null) {
      localArrayList.add(_aaPlugin);
    }
    localArrayList.add(_ahPlugin);
    if (_extensions != null)
    {
      int i = 0;
      while (i < _extensions.size())
      {
        IPlugin localIPlugin = ((VideoAnalyticsExtension)_extensions.get(i)).getExtension(_mediaPlayer.getCurrentItem());
        if (localIPlugin != null) {
          localArrayList.add(localIPlugin);
        }
        i += 1;
      }
    }
    return localArrayList;
  }
  
  public void attachMediaPlayer(MediaPlayer paramMediaPlayer)
  {
    if (paramMediaPlayer == null) {
      throw new IllegalArgumentException("The provided media player cannot be NULL.");
    }
    _logger.i(LOG_TAG + "#attachMediaPlayer", "Attach mediaplayer.");
    detachMediaPlayer();
    _mediaPlayer = paramMediaPlayer;
    _mediaPlayer.addEventListener(MediaPlayer.Event.PLAYBACK, _playbackListener);
    configure();
  }
  
  public void detachMediaPlayer()
  {
    if (_mediaPlayer != null)
    {
      _logger.i(LOG_TAG + "#detachMediaPlayer", "Detach mediaplayer.");
      _mediaPlayer.removeEventListener(MediaPlayer.Event.PLAYBACK, _playbackListener);
    }
    if (_playerWrapper != null)
    {
      _playerWrapper.endSession();
      _playerWrapper = null;
    }
    if (_heartbeat != null)
    {
      _heartbeat.destroy();
      _heartbeat = null;
    }
    _playerPlugin = null;
    _ahPlugin = null;
    _aaPlugin = null;
    _mediaPlayer = null;
    _heartbeatConfigured = false;
  }
  
  class PSDKAdobeAnalyticsPluginDelegate
    extends AdobeAnalyticsPluginDelegate
  {
    private final String LOG_TAG = "[PSDK-VA]::" + PSDKAdobeAnalyticsPluginDelegate.class.getSimpleName();
    private final Logger _logger = Log.getLogger(LOG_TAG);
    
    PSDKAdobeAnalyticsPluginDelegate() {}
    
    public void onError(ErrorInfo paramErrorInfo)
    {
      _logger.e(LOG_TAG + "#onError", "VideoHeartbeat error: " + paramErrorInfo.getMessage() + " (" + paramErrorInfo.getDetails() + ")");
    }
  }
  
  class PSDKAdobeHeartbeatDelegate
    extends HeartbeatDelegate
  {
    private final String LOG_TAG = "[PSDK-VA]::" + PSDKAdobeHeartbeatDelegate.class.getSimpleName();
    private final Logger _logger = Log.getLogger(LOG_TAG);
    
    PSDKAdobeHeartbeatDelegate() {}
    
    public void onError(ErrorInfo paramErrorInfo)
    {
      _logger.e(LOG_TAG + "#onError", "VideoHeartbeat error: " + paramErrorInfo.getMessage() + " (" + paramErrorInfo.getDetails() + ")");
    }
  }
  
  class PSDKAdobeHeartbeatPluginDelegate
    extends AdobeHeartbeatPluginDelegate
  {
    private final String LOG_TAG = "[PSDK-VA]::" + PSDKAdobeHeartbeatPluginDelegate.class.getSimpleName();
    private final Logger _logger = Log.getLogger(LOG_TAG);
    
    PSDKAdobeHeartbeatPluginDelegate() {}
    
    public void onError(ErrorInfo paramErrorInfo)
    {
      _logger.e(LOG_TAG + "#onError", "VideoHeartbeat error: " + paramErrorInfo.getMessage() + " (" + paramErrorInfo.getDetails() + ")");
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.videoanalytics.VideoAnalyticsProvider
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */