package com.adobe.mediacore.videoanalytics;

import android.content.Context;
import android.os.Handler;
import com.adobe.mediacore.MediaPlayer;
import com.adobe.mediacore.MediaPlayer.AdPlaybackEventListener;
import com.adobe.mediacore.MediaPlayer.Event;
import com.adobe.mediacore.MediaPlayer.PlaybackEventListener;
import com.adobe.mediacore.MediaPlayer.PlayerState;
import com.adobe.mediacore.MediaPlayer.QOSEventListener;
import com.adobe.mediacore.MediaPlayerItem;
import com.adobe.mediacore.MediaPlayerNotification;
import com.adobe.mediacore.MediaPlayerNotification.NotificationCode;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.qos.PlaybackInformation;
import com.adobe.mediacore.qos.QOSProvider;
import com.adobe.mediacore.timeline.Timeline;
import com.adobe.mediacore.timeline.TimelineMarker;
import com.adobe.mediacore.utils.TimeRange;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin;
import com.adobe.primetime.va.plugins.videoplayer.AdBreakInfo;
import com.adobe.primetime.va.plugins.videoplayer.AdInfo;
import com.adobe.primetime.va.plugins.videoplayer.ChapterInfo;
import com.adobe.primetime.va.plugins.videoplayer.QoSInfo;
import com.adobe.primetime.va.plugins.videoplayer.VideoInfo;
import com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin;
import com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPluginDelegate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class VideoAnalyticsPSDKWrapper
  extends VideoPlayerPluginDelegate
{
  private static final String LOG_TAG = "[PSDK-VA]::" + VideoAnalyticsPSDKWrapper.class.getSimpleName();
  private static final long UDPATE_TIMER_PERIOD = 500L;
  private static final Logger _logger = Log.getLogger(LOG_TAG);
  private Long _adBreakIndex;
  private AdBreakInfo _adBreakInfo;
  private Long _adIndex;
  private AdInfo _adInfo;
  private AdobeAnalyticsPlugin _analyticsPlugin;
  private Long _bitrate = Long.valueOf(-1L);
  private Long _chapterBoundaryOffset = Long.valueOf(1L);
  private ChapterInfo _chapterInfo;
  private List _chapters;
  private VideoAnalyticsChapterData _currentChapter;
  private Double _currentTime;
  private Boolean _customChaptersSet = Boolean.valueOf(false);
  private Boolean _defaultChaptersSet = Boolean.valueOf(false);
  private Handler _handler;
  private Boolean _inAd = Boolean.valueOf(false);
  private Runnable _internalTimer;
  private Boolean _internalTimerRunning = Boolean.valueOf(false);
  private Boolean _isContentLoaded = Boolean.valueOf(false);
  private Boolean _isSeeking = Boolean.valueOf(false);
  private MediaPlayer _player;
  private VideoPlayerPlugin _playerPlugin;
  private MediaPlayer.PlayerState _previousState;
  private Double _previousTime;
  private QOSProvider _qosProvider;
  private Boolean _shouldStopInternalTimer = Boolean.valueOf(false);
  private VideoInfo _videoInfo;
  private MediaPlayer.AdPlaybackEventListener adPlaybackEventListener = new VideoAnalyticsPSDKWrapper.5(this);
  private final ICallback onVideoComplete = new VideoAnalyticsPSDKWrapper.2(this);
  private MediaPlayer.PlaybackEventListener playbackEventListener = new VideoAnalyticsPSDKWrapper.3(this);
  private MediaPlayer.QOSEventListener qosEventListener = new VideoAnalyticsPSDKWrapper.4(this);
  
  public VideoAnalyticsPSDKWrapper(Context paramContext, MediaPlayer paramMediaPlayer)
  {
    if (paramContext == null) {
      throw new IllegalArgumentException("Context instance cannot be NULL");
    }
    if (paramMediaPlayer == null) {
      _logger.i(LOG_TAG + "#PlayerPlugin", "The provided media player cannot be null.");
    }
    _player = paramMediaPlayer;
    attachPlayerToQosProvider(paramContext);
    setUpTimer();
    addEventListeners();
  }
  
  private void addEventListeners()
  {
    if (_player != null)
    {
      _player.addEventListener(MediaPlayer.Event.AD_PLAYBACK, adPlaybackEventListener);
      _player.addEventListener(MediaPlayer.Event.QOS, qosEventListener);
    }
  }
  
  private void attachPlayerToQosProvider(Context paramContext)
  {
    _logger.i(LOG_TAG + "#attachMediaPlayer", "Attach mediaplayer.");
    if (_qosProvider == null) {
      _qosProvider = new QOSProvider(paramContext);
    }
    _qosProvider.attachMediaPlayer(_player);
  }
  
  private void beginTracking()
  {
    _logger.i(LOG_TAG + "#beginTracking", "Open video.");
    if (_isContentLoaded.booleanValue()) {
      return;
    }
    _adBreakIndex = Long.valueOf(0L);
    _videoInfo = new VideoInfo();
    _videoInfo.id = VideoAnalyticsPSDKPlayerUtils.getVideoId(_player.getCurrentItem());
    _videoInfo.name = VideoAnalyticsPSDKPlayerUtils.getVideoName(_player.getCurrentItem());
    _videoInfo.playerName = VideoAnalyticsPSDKPlayerUtils.getPlayerName(_player.getCurrentItem());
    _videoInfo.length = Double.valueOf(VideoAnalyticsPSDKPlayerUtils.getMainAssetDuration(_player));
    _videoInfo.playhead = playhead();
    VideoInfo localVideoInfo = _videoInfo;
    if (_player.getCurrentItem().isLive()) {}
    for (String str = "live";; str = "vod")
    {
      streamType = str;
      _isContentLoaded = Boolean.valueOf(true);
      _isSeeking = Boolean.valueOf(false);
      _analyticsPlugin.setVideoMetadata(VideoAnalyticsPSDKPlayerUtils.getVideoMetadata(_player.getCurrentItem()));
      _playerPlugin.trackVideoLoad();
      return;
    }
  }
  
  private void closeVideo()
  {
    _logger.i(LOG_TAG + "#closeVideo", "Close video.");
    _isContentLoaded = Boolean.valueOf(false);
    _customChaptersSet = Boolean.valueOf(false);
    _isSeeking = Boolean.valueOf(false);
    _playerPlugin.trackVideoUnload();
  }
  
  private void createInternalTimer()
  {
    _handler = new Handler();
    _internalTimer = new VideoAnalyticsPSDKWrapper.1(this);
  }
  
  private void detachPlayerFromQoSProvider()
  {
    if (_player != null)
    {
      _logger.i(LOG_TAG + "#detachMediaPlayer", "Detach mediaplayer.");
      _qosProvider.detachMediaPlayer();
    }
  }
  
  private void handleStatusPlaying()
  {
    if (VideoAnalyticsPSDKPlayerUtils.getChapterTrackingEnabled(_player.getCurrentItem()).booleanValue())
    {
      updateDefaultChapters();
      updateCustomChapters();
    }
    beginTracking();
    if (!_isSeeking.booleanValue()) {
      _playerPlugin.trackPlay();
    }
  }
  
  private void onMediaError(MediaPlayerNotification paramMediaPlayerNotification)
  {
    _logger.i(LOG_TAG + "#onMediaError", "MediaplayerNotification: " + paramMediaPlayerNotification.toString() + ".");
    String str = paramMediaPlayerNotification.getCode().getCode() + "";
    for (paramMediaPlayerNotification = paramMediaPlayerNotification.getInnerNotification(); paramMediaPlayerNotification != null; paramMediaPlayerNotification = paramMediaPlayerNotification.getInnerNotification()) {
      str = str + "." + paramMediaPlayerNotification.getCode().getCode();
    }
    _playerPlugin.trackVideoPlayerError(str);
  }
  
  private Double playhead()
  {
    if ((_isContentLoaded.booleanValue()) && (_currentTime != null))
    {
      _logger.i(LOG_TAG + "#_playhead()", "playhead=" + String.valueOf(_currentTime) + ".");
      return _currentTime;
    }
    return Double.valueOf(-1.0D);
  }
  
  private void removeEventListeners()
  {
    if (_player != null)
    {
      _player.removeEventListener(MediaPlayer.Event.AD_PLAYBACK, adPlaybackEventListener);
      _player.removeEventListener(MediaPlayer.Event.QOS, qosEventListener);
    }
  }
  
  private void resetCurrentChapter()
  {
    _logger.i(LOG_TAG + "#resetCurrentChapter", "Reset current chapter.");
    if ((_chapters != null) && (_currentTime.doubleValue() != 0.0D))
    {
      double d = _player.convertToLocalTime(_player.getPlaybackRange().getEnd()) / VideoAnalyticsPSDKPlayerUtils.PSDK_TIME_SCALE.doubleValue();
      if (_currentTime.doubleValue() <= Double.valueOf(d).doubleValue() - _chapterBoundaryOffset.longValue()) {
        break label118;
      }
      updateCurrentChapter(null, -1L);
    }
    label118:
    label233:
    for (;;)
    {
      return;
      int i = 0;
      VideoAnalyticsChapterData localVideoAnalyticsChapterData;
      if (i < _chapters.size())
      {
        localVideoAnalyticsChapterData = (VideoAnalyticsChapterData)_chapters.get(i);
        if ((_currentTime.doubleValue() <= localVideoAnalyticsChapterData.getStartTime().doubleValue() + _chapterBoundaryOffset.longValue()) || (_currentTime.doubleValue() >= localVideoAnalyticsChapterData.getEndTime().doubleValue() - _chapterBoundaryOffset.longValue())) {}
      }
      for (;;)
      {
        if (localVideoAnalyticsChapterData == _currentChapter) {
          break label233;
        }
        updateCurrentChapter(null, -1L);
        return;
        i += 1;
        break;
        localVideoAnalyticsChapterData = null;
      }
    }
  }
  
  private void setUpTimer()
  {
    createInternalTimer();
    startInternalTimer();
  }
  
  private void startInternalTimer()
  {
    _logger.i(LOG_TAG + "#startInternalTimer", "Start timer.");
    if (_internalTimerRunning.booleanValue()) {}
    do
    {
      return;
      _shouldStopInternalTimer = Boolean.valueOf(false);
      _internalTimerRunning = Boolean.valueOf(true);
    } while (_handler == null);
    _handler.postDelayed(_internalTimer, 500L);
  }
  
  private void stopInternalTimer()
  {
    _logger.i(LOG_TAG + "#stopInternalTimer", "Stop timer.");
    _shouldStopInternalTimer = Boolean.valueOf(true);
    _internalTimerRunning = Boolean.valueOf(false);
    if (_handler != null) {
      _handler.removeCallbacks(_internalTimer);
    }
  }
  
  private void updateCurrentChapter(VideoAnalyticsChapterData paramVideoAnalyticsChapterData, long paramLong)
  {
    _currentChapter = paramVideoAnalyticsChapterData;
    _chapterInfo = new ChapterInfo();
    if ((paramVideoAnalyticsChapterData != null) && (paramLong != -1L))
    {
      _chapterInfo.name = paramVideoAnalyticsChapterData.getName();
      _chapterInfo.length = Double.valueOf(paramVideoAnalyticsChapterData.getEndTime().doubleValue() - paramVideoAnalyticsChapterData.getStartTime().doubleValue());
      _chapterInfo.startTime = paramVideoAnalyticsChapterData.getStartTime();
      _chapterInfo.position = Long.valueOf(1L + paramLong);
      return;
    }
    _chapterInfo = null;
  }
  
  private void updateCustomChapters()
  {
    _logger.i(LOG_TAG + "#updateChapterMetadata", "Update chapter metadata");
    if ((!_customChaptersSet.booleanValue()) && (VideoAnalyticsPSDKPlayerUtils.getChapters(_player.getCurrentItem()) != null))
    {
      _logger.i(LOG_TAG + "#updateChapterMetadata", "Override default chapters.");
      _chapters = VideoAnalyticsPSDKPlayerUtils.getChapters(_player.getCurrentItem());
      _customChaptersSet = Boolean.valueOf(true);
    }
  }
  
  private void updateDefaultChapters()
  {
    if ((_customChaptersSet.booleanValue()) || (_defaultChaptersSet.booleanValue())) {
      return;
    }
    _chapters = new ArrayList();
    Object localObject1 = _player.getPlaybackRange();
    double d1 = _player.convertToLocalTime(((TimeRange)localObject1).getBegin()) / VideoAnalyticsPSDKPlayerUtils.PSDK_TIME_SCALE.doubleValue();
    double d3 = _player.convertToLocalTime(((TimeRange)localObject1).getEnd()) / VideoAnalyticsPSDKPlayerUtils.PSDK_TIME_SCALE.doubleValue();
    localObject1 = _player.getTimeline().timelineMarkers();
    int i = 0;
    while (((Iterator)localObject1).hasNext())
    {
      Object localObject2 = (TimelineMarker)((Iterator)localObject1).next();
      double d2 = _player.convertToLocalTime(((TimelineMarker)localObject2).getTime()) / VideoAnalyticsPSDKPlayerUtils.PSDK_TIME_SCALE.doubleValue();
      if (d2 - d1 != 0.0D)
      {
        localObject2 = new VideoAnalyticsChapterData(d1, d2);
        StringBuilder localStringBuilder = new StringBuilder().append("chapter_");
        i += 1;
        ((VideoAnalyticsChapterData)localObject2).setName(i);
        _logger.i(LOG_TAG + "#extractDefaultChapters", "New chapter: " + ((VideoAnalyticsChapterData)localObject2).toString() + ".");
        _chapters.add(localObject2);
        d1 = d2;
      }
    }
    if ((d1 - d3 != 0.0D) && (d3 - d1 >= _chapterBoundaryOffset.longValue()))
    {
      localObject1 = new VideoAnalyticsChapterData(d1, d3);
      ((VideoAnalyticsChapterData)localObject1).setName("chapter_" + (i + 1));
      _logger.i(LOG_TAG + "#extractDefaultChapters", "New chapter: " + ((VideoAnalyticsChapterData)localObject1).toString() + ".");
      _chapters.add(localObject1);
    }
    _defaultChaptersSet = Boolean.valueOf(true);
  }
  
  public void endSession()
  {
    closeVideo();
    stopInternalTimer();
    removeEventListeners();
    detachPlayerFromQoSProvider();
  }
  
  public AdBreakInfo getAdBreakInfo()
  {
    return _adBreakInfo;
  }
  
  public AdInfo getAdInfo()
  {
    return _adInfo;
  }
  
  public ChapterInfo getChapterInfo()
  {
    return _chapterInfo;
  }
  
  public MediaPlayer.PlaybackEventListener getPlaybackEventListener()
  {
    return playbackEventListener;
  }
  
  public QoSInfo getQoSInfo()
  {
    QoSInfo localQoSInfo = new QoSInfo();
    if (_qosProvider != null)
    {
      bitrate = Long.valueOf(_qosProvider.getPlaybackInformation().getBitrate());
      fps = Double.valueOf(_qosProvider.getPlaybackInformation().getFrameRate());
      droppedFrames = Long.valueOf(_qosProvider.getPlaybackInformation().getDroppedFrameCount());
      startupTime = Double.valueOf(_qosProvider.getPlaybackInformation().getTimeToStart());
    }
    _logger.i(LOG_TAG + "#dataResolver", "Get qos info: " + String.valueOf(bitrate) + "; " + String.valueOf(fps) + "; " + String.valueOf(droppedFrames) + "; " + String.valueOf(startupTime));
    return localQoSInfo;
  }
  
  public VideoInfo getVideoInfo()
  {
    return _videoInfo;
  }
  
  public void setAnalyticsPlugin(AdobeAnalyticsPlugin paramAdobeAnalyticsPlugin)
  {
    _analyticsPlugin = paramAdobeAnalyticsPlugin;
  }
  
  public void setPlayerPlugin(VideoPlayerPlugin paramVideoPlayerPlugin)
  {
    _playerPlugin = paramVideoPlayerPlugin;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.videoanalytics.VideoAnalyticsPSDKWrapper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */