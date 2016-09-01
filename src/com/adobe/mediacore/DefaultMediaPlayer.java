package com.adobe.mediacore;

import android.content.Context;
import android.os.Handler;
import com.adobe.ave.MediaErrorCode;
import com.adobe.ave.PlayState;
import com.adobe.ave.drm.DRMManager;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.AdSignalingMode;
import com.adobe.mediacore.metadata.AdvertisingMetadata;
import com.adobe.mediacore.metadata.DefaultMetadataKeys;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.qos.metrics.PlaybackMetrics;
import com.adobe.mediacore.session.NotificationHistory;
import com.adobe.mediacore.timeline.Timeline;
import com.adobe.mediacore.timeline.advertising.AdPolicyMode;
import com.adobe.mediacore.timeline.advertising.PlacementInformation;
import com.adobe.mediacore.timeline.advertising.PlacementInformation.Mode;
import com.adobe.mediacore.timeline.advertising.PlacementInformation.Type;
import com.adobe.mediacore.timeline.advertising.customadmarkers.CustomRangeHelper;
import com.adobe.mediacore.utils.TimeRange;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public final class DefaultMediaPlayer
  implements MediaPlayer
{
  private static final int DEFAULT_CONTENT_ID = 0;
  private static final String LOG_TAG = "[PSDK]::" + DefaultMediaPlayer.class.getSimpleName();
  private final long INTERNAL_TIMER_PERIOD = 250L;
  private AdClientFactory _adClientFactory;
  private AdSignalingMode _adSignalingMode;
  private AdTimeline _adTimeline;
  private TimelineMonitor _adTimelineMonitor;
  private MediaPlayerItem _backgroundItem;
  private MediaResource _backgroundResource;
  private TextFormat _closedCaptionsTextFormat = null;
  private Context _context;
  private boolean _cuesResolved;
  private MediaPlayer.PlayerState _currentStatus = MediaPlayer.PlayerState.IDLE;
  private CustomAdPlaybackManager _customAdPlaybackManager;
  private Handler _handler;
  private VideoEngineTimeline.TimeMapping _initialTime = VideoEngineTimeline.TimeMapping.createInvalid();
  private Runnable _internalTimer;
  private boolean _internalTimerRunning;
  private boolean _isPrepared = false;
  private MediaPlayerItem _item;
  private final Logger _logger = Log.getLogger(LOG_TAG);
  private MediaPlayerClient _mediaPlayerClient;
  private MediaPlayerView _mediaPlayerView;
  private final PostRollEndListener _onPostRollComplete = new DefaultMediaPlayer.14(this);
  private PlaybackMetrics _playbackMetrics;
  private boolean _preparePending = false;
  private MediaResource _resource;
  private final SeekAdjustCompletedListener _seekAdjustCompletedListener = new DefaultMediaPlayer.1(this);
  private boolean _seekNeeded = false;
  private boolean _shouldStopInternalTimer;
  private long _startPosition;
  private TrickPlayManager _trickPlayManager;
  private VideoEngineAdapter _videoEngineAdapter;
  private VideoEngineDispatcher _videoEngineDispatcher;
  
  DefaultMediaPlayer(Context paramContext)
  {
    _context = paramContext;
    _handler = new Handler();
    _internalTimer = new DefaultMediaPlayer.2(this);
    _videoEngineDispatcher = new VideoEngineDispatcher();
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.RESOURCE_LOADED, new DefaultMediaPlayer.3(this));
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.CONTENT_PLACEMENT_COMPLETE, new DefaultMediaPlayer.4(this));
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.ITEM_CREATED, new DefaultMediaPlayer.5(this));
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.ITEM_UPDATED, new DefaultMediaPlayer.6(this));
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.ITEM_READY, new DefaultMediaPlayer.7(this));
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.BUFFERING_FULL, new DefaultMediaPlayer.8(this));
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.VIEW_CLICKED, new DefaultMediaPlayer.9(this));
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.AUDIO_TRACK_FAILED, new DefaultMediaPlayer.10(this));
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.VIDEO_ERROR, new DefaultMediaPlayer.11(this));
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.VIDEO_STATE_CHANGED, new DefaultMediaPlayer.12(this));
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.PROFILE_CHANGED, new DefaultMediaPlayer.13(this));
    _videoEngineAdapter = new VideoEngineAdapter(_context, _videoEngineDispatcher);
    _videoEngineAdapter.initialize();
    _mediaPlayerView = new MediaPlayerView(_context, _videoEngineAdapter, _videoEngineDispatcher);
    _videoEngineAdapter.setView(_mediaPlayerView.getVideoEngineView());
    _customAdPlaybackManager = new CustomAdPlaybackManager(_videoEngineDispatcher, _videoEngineAdapter, this, _context);
    _playbackMetrics = _videoEngineAdapter.getPlaybackMetrics();
  }
  
  private void adjustDesiredSeekPosition(long paramLong)
  {
    long l;
    if (paramLong == -2L) {
      if (_item.isLive())
      {
        _logger.i(LOG_TAG + "#adjustDesiredSeekPosition", "Seeking starting at client live point ");
        _videoEngineDispatcher.dispatch(SeekEvent.createSeekAdjustCompleted(VideoEngineTimeline.TimeMapping.createLivePoint().getTime()));
        l = paramLong;
      }
    }
    do
    {
      for (;;)
      {
        VideoEngineTimeline.TimeMapping localTimeMapping = VideoEngineTimeline.TimeMapping.create(-1, l);
        _logger.i(LOG_TAG + "#adjustDesiredSeekPosition", "Seeking starting [" + localTimeMapping.toString() + "].");
        if ((_adTimelineMonitor != null) && (_playbackMetrics != null))
        {
          _videoEngineAdapter.pause();
          if (_seekAdjustCompletedListener != null)
          {
            _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.SEEK_ADJUST_COMPLETED, _seekAdjustCompletedListener);
            _customAdPlaybackManager.attachSeekListener();
          }
          localTimeMapping = _adTimelineMonitor.adjustSeekPosition(localTimeMapping, _playbackMetrics.getTime(), AdPolicyMode.SEEK);
          _logger.i(LOG_TAG + "#adjustDesiredSeekPosition", "Adjusted seek position is [" + localTimeMapping.toString() + "].");
        }
        return;
        _logger.w(LOG_TAG + "#seek", "Invalid parameter. Seeking to the client live point is not allowed for video on demand content. Will use default value.");
        l = _playbackMetrics.getSeekableRange().getBegin();
      }
      l = paramLong;
    } while (_playbackMetrics.getSeekableRange().contains(paramLong));
    if (paramLong > _playbackMetrics.getSeekableRange().getEnd()) {}
    for (paramLong = _playbackMetrics.getSeekableRange().getEnd();; paramLong = _playbackMetrics.getSeekableRange().getBegin())
    {
      _logger.w(LOG_TAG + "#seek", "Desired seek position is not included in the seekble range. Will use default value " + paramLong);
      l = paramLong;
      break;
    }
  }
  
  private VideoEngineTimeline.TimeMapping adjustDesiredStartPosition(long paramLong)
  {
    if (paramLong == -2L) {
      return getInitialTimeForLive();
    }
    if (!_playbackMetrics.getSeekableRange().contains(paramLong))
    {
      _logger.w(LOG_TAG + "#adjustDesiredStartPosition", "Desired start position is not included in the seekble range. Will used default values.");
      if (_item.isLive()) {
        return getInitialTimeForLive();
      }
      return VideoEngineTimeline.TimeMapping.create(-1, _playbackMetrics.getSeekableRange().getBegin());
    }
    return VideoEngineTimeline.TimeMapping.create(-1, paramLong);
  }
  
  private void beginLoadResource()
  {
    _logger.i(LOG_TAG + "#beginLoadResource", "Loading of media resource is starting. [" + _resource + "].");
    _isPrepared = false;
    _videoEngineAdapter.load(_resource, 0);
    _videoEngineAdapter.setView(_mediaPlayerView.getVideoEngineView());
  }
  
  private void checkAndThrowIfError()
    throws IllegalStateException
  {
    if (_currentStatus == MediaPlayer.PlayerState.ERROR) {
      throw new IllegalStateException("The media player is in ERROR state. You'll need to reset it before further use.");
    }
  }
  
  private void checkAndThrowIfReleased()
    throws IllegalStateException
  {
    if (_currentStatus == MediaPlayer.PlayerState.RELEASED) {
      throw new IllegalStateException("The media player has been released. No method can be invoked anymore.");
    }
  }
  
  public static MediaPlayer create(Context paramContext)
  {
    return new DefaultMediaPlayer(paramContext);
  }
  
  private static List createInitialPlacementInformations(MediaPlayerItem paramMediaPlayerItem, AdSignalingMode paramAdSignalingMode, VideoEngineTimeline.TimeMapping paramTimeMapping)
  {
    if (paramAdSignalingMode == AdSignalingMode.DEFAULT) {
      throw new IllegalArgumentException("adSignalingMode should not be set to DEFAULT. The adSignalingMode should be already adjusted to the actual value (MANIFEST_CUES or SERVER_MAP) based on the media player item type.");
    }
    ArrayList localArrayList = new ArrayList();
    paramMediaPlayerItem = new CustomRangeHelper(paramMediaPlayerItem.getResource().getMetadata());
    if (paramMediaPlayerItem.hasRanges() == null) {
      if (paramAdSignalingMode == AdSignalingMode.SERVER_MAP) {
        localArrayList.add(new PlacementInformation(PlacementInformation.Type.SERVER_MAP, -1L, 0L));
      }
    }
    do
    {
      do
      {
        do
        {
          return localArrayList;
        } while (paramAdSignalingMode != AdSignalingMode.MANIFEST_CUES);
        localArrayList.add(new PlacementInformation(PlacementInformation.Type.PRE_ROLL, paramTimeMapping.getTime(), -1L));
        return localArrayList;
        if (paramMediaPlayerItem.hasRanges() == "mark")
        {
          localArrayList.add(new PlacementInformation(PlacementInformation.Type.CUSTOM_TIME_RANGES, PlacementInformation.Mode.MARK, -1L, 0L));
          return localArrayList;
        }
        if (paramMediaPlayerItem.hasRanges() != "delete") {
          break;
        }
        localArrayList.add(new PlacementInformation(PlacementInformation.Type.CUSTOM_TIME_RANGES, PlacementInformation.Mode.DELETE, -1L, 0L));
        if (paramAdSignalingMode == AdSignalingMode.SERVER_MAP)
        {
          localArrayList.add(new PlacementInformation(PlacementInformation.Type.SERVER_MAP, -1L, 0L));
          return localArrayList;
        }
      } while (paramAdSignalingMode != AdSignalingMode.MANIFEST_CUES);
      localArrayList.add(new PlacementInformation(PlacementInformation.Type.PRE_ROLL, paramTimeMapping.getTime(), -1L));
      return localArrayList;
    } while (paramMediaPlayerItem.hasRanges() != "replace");
    localArrayList.add(new PlacementInformation(PlacementInformation.Type.CUSTOM_TIME_RANGES, PlacementInformation.Mode.DELETE, -1L, 0L));
    localArrayList.add(new PlacementInformation(PlacementInformation.Type.CUSTOM_TIME_RANGES, PlacementInformation.Mode.REPLACE, -1L, 0L));
    return localArrayList;
  }
  
  private AdSignalingMode extractAdSignalingMode(MediaPlayerItem paramMediaPlayerItem)
  {
    AdSignalingMode localAdSignalingMode = AdSignalingMode.DEFAULT;
    Object localObject1 = paramMediaPlayerItem.getResource().getMetadata();
    MetadataNode localMetadataNode = (MetadataNode)localObject1;
    CustomRangeHelper localCustomRangeHelper = new CustomRangeHelper((Metadata)localObject1);
    Object localObject2;
    if ((localObject1 != null) && ((localObject1 instanceof MetadataNode)))
    {
      localObject1 = null;
      if (localMetadataNode.containsNode(DefaultMetadataKeys.AUDITUDE_METADATA_KEY.getValue())) {
        localObject1 = (AdvertisingMetadata)localMetadataNode.getNode(DefaultMetadataKeys.AUDITUDE_METADATA_KEY.getValue());
      }
      localObject2 = localObject1;
      if (localMetadataNode.containsKey(DefaultMetadataKeys.ADVERTISING_METADATA.getValue())) {
        localObject2 = (AdvertisingMetadata)localMetadataNode.getNode(DefaultMetadataKeys.ADVERTISING_METADATA.getValue());
      }
      if (localObject2 != null)
      {
        localObject1 = ((AdvertisingMetadata)localObject2).getSignalingMode();
        if ((localCustomRangeHelper.hasRanges() == "replace") || (localCustomRangeHelper.hasRanges() == "mark"))
        {
          localObject1 = AdSignalingMode.CUSTOM_TIME_RANGES;
          ((AdvertisingMetadata)localObject2).setSignalingMode(AdSignalingMode.CUSTOM_TIME_RANGES);
        }
      }
    }
    for (;;)
    {
      if ((localObject1 == AdSignalingMode.CUSTOM_TIME_RANGES) && (localCustomRangeHelper.hasRanges() != "replace"))
      {
        localObject2 = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.UNDEFINED_TIME_RANGES, "Ad signaling mode is CUSTOM TIME RANGES but there are no replace time ranges.");
        _videoEngineDispatcher.dispatch(OperationFailedEvent.createEvent((MediaPlayerNotification.Warning)localObject2));
      }
      localObject2 = localObject1;
      if (localObject1 == AdSignalingMode.DEFAULT)
      {
        if (paramMediaPlayerItem.isLive()) {
          localObject2 = AdSignalingMode.MANIFEST_CUES;
        }
      }
      else {
        return (AdSignalingMode)localObject2;
      }
      if ((localCustomRangeHelper.hasRanges() == "replace") || (localCustomRangeHelper.hasRanges() == "mark")) {
        return AdSignalingMode.CUSTOM_TIME_RANGES;
      }
      return AdSignalingMode.SERVER_MAP;
      localObject1 = localAdSignalingMode;
    }
  }
  
  private boolean extractEnableLivePreroll(MediaPlayerItem paramMediaPlayerItem)
  {
    paramMediaPlayerItem = paramMediaPlayerItem.getResource().getMetadata();
    MetadataNode localMetadataNode = (MetadataNode)paramMediaPlayerItem;
    if ((paramMediaPlayerItem != null) && ((paramMediaPlayerItem instanceof MetadataNode)))
    {
      paramMediaPlayerItem = null;
      if (localMetadataNode.containsNode(DefaultMetadataKeys.AUDITUDE_METADATA_KEY.getValue())) {
        paramMediaPlayerItem = (AdvertisingMetadata)localMetadataNode.getNode(DefaultMetadataKeys.AUDITUDE_METADATA_KEY.getValue());
      }
      if (!localMetadataNode.containsKey(DefaultMetadataKeys.ADVERTISING_METADATA.getValue())) {
        break label106;
      }
      paramMediaPlayerItem = (AdvertisingMetadata)localMetadataNode.getNode(DefaultMetadataKeys.ADVERTISING_METADATA.getValue());
    }
    label106:
    for (;;)
    {
      if ((paramMediaPlayerItem != null) && (paramMediaPlayerItem.getEnableLivePreroll() != null)) {
        return Boolean.valueOf(paramMediaPlayerItem.getEnableLivePreroll()).booleanValue();
      }
      return true;
    }
  }
  
  private VideoEngineTimeline.TimeMapping getInitialTimeForLive()
  {
    return VideoEngineTimeline.TimeMapping.create(-1, _videoEngineAdapter.getCurrentTime());
  }
  
  private boolean isErrorRecoverable(MediaPlayerNotification.Error paramError)
  {
    if ((paramError.getCode() == MediaPlayerNotification.ErrorCode.CONTENT_ERROR) || (paramError.getCode() == MediaPlayerNotification.ErrorCode.MANIFEST_ERROR)) {}
    do
    {
      return true;
      if (paramError.getCode() == MediaPlayerNotification.ErrorCode.SEEK_ERROR)
      {
        _videoEngineAdapter.play();
        return true;
      }
      try
      {
        int i = Integer.parseInt(paramError.getMetadata().getValue("NATIVE_ERROR_CODE"));
        MediaErrorCode localMediaErrorCode = MediaErrorCode.values()[i];
        switch (15.$SwitchMap$com$adobe$ave$MediaErrorCode[localMediaErrorCode.ordinal()])
        {
        case 1: 
        case 2: 
        case 3: 
        default: 
          return false;
        }
      }
      catch (Exception paramError)
      {
        return false;
      }
      paramError = paramError.getMetadata().getValue("DESCRIPTION");
      if (paramError == null) {
        return false;
      }
      paramError = paramError.split(",");
      if (paramError.length == 0) {
        return false;
      }
      paramError = paramError[0].split("::=");
      if (paramError.length != 2) {
        return false;
      }
      if ((!paramError[0].equals("url")) && (!paramError[0].equals("rendition url"))) {
        return false;
      }
    } while (paramError[1].endsWith(".ts"));
    return false;
  }
  
  private void loadAdComponents(MediaPlayerItem paramMediaPlayerItem)
  {
    _adTimeline = new AdTimeline(_videoEngineAdapter.getTimeline());
    _adTimelineMonitor = new TimelineMonitor(_videoEngineDispatcher, _adTimeline);
    _adSignalingMode = extractAdSignalingMode(paramMediaPlayerItem);
    if (_adSignalingMode != AdSignalingMode.MANIFEST_CUES) {}
    for (boolean bool = true;; bool = false)
    {
      _cuesResolved = bool;
      if (_adClientFactory == null) {
        _adClientFactory = new DefaultAdvertisingFactory(_adSignalingMode, _context);
      }
      _mediaPlayerClient = new MediaPlayerClient(_videoEngineDispatcher, _item, _videoEngineAdapter, _adClientFactory, _adSignalingMode);
      _mediaPlayerClient.initialize(_initialTime, _adTimelineMonitor);
      _trickPlayManager = new TrickPlayManager(this, paramMediaPlayerItem, _videoEngineAdapter, _adTimelineMonitor, _videoEngineDispatcher);
      return;
    }
  }
  
  private void playerIsPrepared()
  {
    if (_isPrepared) {
      return;
    }
    _isPrepared = true;
    setStatus(MediaPlayer.PlayerState.PREPARED, null);
    _videoEngineDispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.PREPARED));
  }
  
  private void resetInternalComponents()
  {
    _shouldStopInternalTimer = true;
    stopInternalTimer();
    _item = null;
    _initialTime = VideoEngineTimeline.TimeMapping.createInvalid();
    _resource = null;
  }
  
  private void resolveCues()
  {
    _logger.i(LOG_TAG + "#resolveCues", "Entering in-stream cue resolving.");
    if ((_item != null) && (_resource != null) && (_mediaPlayerClient != null))
    {
      _logger.i(LOG_TAG + "resolveCues", "Starting in-stream cue resolving.");
      _mediaPlayerClient.update(_playbackMetrics.getTime(), _playbackMetrics.getPlaybackRange());
      return;
    }
    _logger.w(LOG_TAG + "#resolveCues", "Unable to resolve cues.");
    endAdResolving();
  }
  
  private void startInternalTimer()
  {
    if (_internalTimerRunning) {}
    do
    {
      return;
      _shouldStopInternalTimer = false;
      _internalTimerRunning = true;
    } while (_handler == null);
    _handler.postDelayed(_internalTimer, 250L);
  }
  
  private void unloadAdComponents()
  {
    if (_adTimelineMonitor != null) {
      _adTimelineMonitor.clear();
    }
    if ((_videoEngineAdapter != null) && (_videoEngineAdapter.getTimeline() != null)) {
      _videoEngineAdapter.getTimeline().clear();
    }
    if (_mediaPlayerClient != null) {
      _mediaPlayerClient.unload();
    }
    _mediaPlayerClient = null;
    _adTimelineMonitor = null;
    _adTimeline = null;
  }
  
  private void updateVideoEngineAdapter()
  {
    checkAndThrowIfReleased();
    _logger.i(LOG_TAG + "#updateVideoEngineAdapter", "Releasing the media player associated resources.");
    unloadAdComponents();
    resetInternalComponents();
    if (_videoEngineAdapter != null)
    {
      _logger.i(LOG_TAG + "#updateVideoEngineAdapter()", "Destroying the media player instance.");
      _videoEngineAdapter.release();
      _videoEngineAdapter = null;
    }
    setStatus(MediaPlayer.PlayerState.IDLE, null);
    _videoEngineAdapter = new VideoEngineAdapter(_context, _videoEngineDispatcher);
    _videoEngineAdapter.initialize();
    _videoEngineAdapter.setBackgroundMediaResource(_backgroundResource);
    _mediaPlayerView.updateVideoEngine(_context, _videoEngineAdapter);
    _videoEngineAdapter.setView(_mediaPlayerView.getVideoEngineView());
    _customAdPlaybackManager.updateVideoEngineAdapter(_videoEngineAdapter);
    _playbackMetrics = _videoEngineAdapter.getPlaybackMetrics();
  }
  
  public void addEventListener(MediaPlayer.Event paramEvent, MediaPlayer.EventListener paramEventListener)
  {
    checkAndThrowIfReleased();
    if (_videoEngineDispatcher != null) {
      _videoEngineDispatcher.addEventListener(paramEvent, paramEventListener);
    }
  }
  
  public long convertToLocalTime(long paramLong)
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    if (_videoEngineDispatcher != null)
    {
      paramLong = _videoEngineAdapter.convertToLocalTime(paramLong);
      if (paramLong != -1L) {}
    }
    else
    {
      return 0L;
    }
    return paramLong;
  }
  
  void endAdResolving()
  {
    if (_currentStatus == MediaPlayer.PlayerState.ERROR)
    {
      _logger.w(LOG_TAG + "#endAdResolving", "Ignore event as media player is in ERROR state.");
      return;
    }
    if (!_cuesResolved)
    {
      _cuesResolved = true;
      _logger.i(LOG_TAG + "#endAdResolving", "Revisiting manifest cues.");
      resolveCues();
    }
    _logger.i(LOG_TAG + "#endAdResolving", "Ad resolving and placement process is complete.");
    if (_playbackMetrics != null) {
      _playbackMetrics.update();
    }
    playerIsPrepared();
  }
  
  public BufferControlParameters getBufferControlParameters()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    return _videoEngineAdapter.getBufferControlParameters();
  }
  
  public TimeRange getBufferedRange()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    return _playbackMetrics.getBufferedRange();
  }
  
  public TextFormat getCCStyle()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    if (_closedCaptionsTextFormat != null) {
      return _closedCaptionsTextFormat;
    }
    _closedCaptionsTextFormat = new TextFormatBuilder(TextFormat.Font.DEFAULT, TextFormat.Size.DEFAULT, TextFormat.FontEdge.DEFAULT, TextFormat.Color.DEFAULT, TextFormat.Color.DEFAULT, TextFormat.Color.DEFAULT, TextFormat.Color.DEFAULT, -1, -1, -1, "default").toTextFormat();
    return _closedCaptionsTextFormat;
  }
  
  public MediaPlayer.Visibility getCCVisibility()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    return _videoEngineAdapter.getCaptionsVisibility();
  }
  
  public MediaPlayerItem getCurrentItem()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    return _item;
  }
  
  public long getCurrentTime()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    if ((_videoEngineAdapter == null) || (!_videoEngineAdapter.isInitialised()))
    {
      if (_initialTime.getTime() == -3L) {
        return 0L;
      }
      return _initialTime.getTime();
    }
    long l = _playbackMetrics.getTime();
    if (_adTimelineMonitor.skippingAdBreaks())
    {
      if (_trickPlayManager.getCurrentPlaybackRate() > 0.0F) {}
      for (int i = 1;; i = -1) {
        return i * _adTimelineMonitor.skippedDuration() + l;
      }
    }
    return l;
  }
  
  public CustomAdView getCustomAdView()
  {
    checkAndThrowIfReleased();
    return _customAdPlaybackManager.getCustomAdView();
  }
  
  public DRMManager getDRMManager()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    return _videoEngineAdapter.getDRMManager();
  }
  
  public long getLocalTime()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    if ((_videoEngineAdapter == null) || (!_videoEngineAdapter.isInitialised())) {
      return 0L;
    }
    return _playbackMetrics.getTimeLocal();
  }
  
  public NotificationHistory getNotificationHistory()
  {
    if (_videoEngineDispatcher != null) {
      return _videoEngineDispatcher.getNotificationHistory();
    }
    return null;
  }
  
  public PlaybackMetrics getPlaybackMetrics()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    return _playbackMetrics;
  }
  
  public TimeRange getPlaybackRange()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    return _playbackMetrics.getPlaybackRange();
  }
  
  public float getRate()
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    return _trickPlayManager.getCurrentPlaybackRate();
  }
  
  public TimeRange getSeekableRange()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    return _playbackMetrics.getSeekableRange();
  }
  
  public MediaPlayer.PlayerState getStatus()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    return _currentStatus;
  }
  
  public Timeline getTimeline()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    return _adTimeline;
  }
  
  public TrickPlayManager getTrickPlayManager()
  {
    return _trickPlayManager;
  }
  
  public MediaPlayerView getView()
  {
    checkAndThrowIfReleased();
    return _mediaPlayerView;
  }
  
  public void pause()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    if ((_customAdPlaybackManager.getCustomAdView() != null) && (_customAdPlaybackManager.getCustomAdView().isActive())) {
      _customAdPlaybackManager.getCustomAdView().loadUrl("javascript:PrimetimeJS.pause()");
    }
    do
    {
      return;
      if (_trickPlayManager != null)
      {
        if (_trickPlayManager.trickPlayEnabled())
        {
          _logger.w(LOG_TAG + "#pause", "MediaPlayer.pause() is called during trick-play - changing rate to 0.0 ");
          _trickPlayManager.changePlaybackRate(0.0F);
          return;
        }
        _trickPlayManager.updatePlaybackRate(0.0F);
      }
      HashSet localHashSet = new HashSet();
      localHashSet.add(MediaPlayer.PlayerState.PREPARED);
      localHashSet.add(MediaPlayer.PlayerState.READY);
      localHashSet.add(MediaPlayer.PlayerState.PLAYING);
      localHashSet.add(MediaPlayer.PlayerState.PAUSED);
      localHashSet.add(MediaPlayer.PlayerState.COMPLETE);
      localHashSet.add(MediaPlayer.PlayerState.SUSPENDED);
      MediaPlayer.PlayerState localPlayerState = getStatus();
      if (!localHashSet.contains(localPlayerState)) {
        throw new IllegalStateException("Invalid player status [ " + localPlayerState.toString() + "] for operation [play].");
      }
      if (localPlayerState == MediaPlayer.PlayerState.PAUSED)
      {
        if (_trickPlayManager.isReturningFromTrickPlay())
        {
          _videoEngineAdapter.pause();
          return;
        }
        _logger.w(LOG_TAG + "#pause", "Playback already paused.");
        return;
      }
      _logger.i(LOG_TAG + "#play", "Playback pausing.");
      _videoEngineAdapter.pause();
      setStatus(MediaPlayer.PlayerState.PAUSED, null);
    } while (!_videoEngineAdapter.isBufferFull());
    stopInternalTimer();
  }
  
  public void play()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    if ((_customAdPlaybackManager.getCustomAdView() != null) && (_customAdPlaybackManager.getCustomAdView().isActive()))
    {
      _customAdPlaybackManager.getCustomAdView().loadUrl("javascript:PrimetimeJS.resume()");
      return;
    }
    if (_trickPlayManager != null)
    {
      if (_trickPlayManager.trickPlayEnabled())
      {
        _logger.w(LOG_TAG + "#play", "MediaPlayer.play() is called during trick-play - changing rate to 1.0");
        _trickPlayManager.changePlaybackRate(1.0F);
        return;
      }
      _trickPlayManager.updatePlaybackRate(1.0F);
    }
    HashSet localHashSet = new HashSet();
    localHashSet.add(MediaPlayer.PlayerState.PREPARED);
    localHashSet.add(MediaPlayer.PlayerState.READY);
    localHashSet.add(MediaPlayer.PlayerState.PLAYING);
    localHashSet.add(MediaPlayer.PlayerState.PAUSED);
    localHashSet.add(MediaPlayer.PlayerState.SUSPENDED);
    MediaPlayer.PlayerState localPlayerState = getStatus();
    if ((!localHashSet.contains(localPlayerState)) && ((_trickPlayManager == null) || (!_trickPlayManager.isReturningFromTrickPlay()))) {
      throw new IllegalStateException("Invalid player status [ " + localPlayerState.toString() + "] for operation [play].");
    }
    if (localPlayerState == MediaPlayer.PlayerState.PLAYING)
    {
      if ((_videoEngineAdapter.getPlayerState() == PlayState.SUSPENDED) || (_trickPlayManager.isReturningFromTrickPlay()) || (_videoEngineAdapter.getPlayerState() == PlayState.TRICK_PLAY))
      {
        _videoEngineAdapter.play();
        return;
      }
      _logger.w(LOG_TAG + "#play", "Playback already in progress.");
      return;
    }
    _logger.i(LOG_TAG + "#play", "Playback starting.");
    _videoEngineAdapter.play();
    if (_seekNeeded)
    {
      _logger.i(LOG_TAG + "#play", "Performing initial seek at position [" + _initialTime.toString() + "].");
      _seekNeeded = false;
      seekToLocalTime(_initialTime.getTime());
    }
    setStatus(MediaPlayer.PlayerState.PLAYING, null);
  }
  
  public void prepareBuffer()
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    MediaPlayer.PlayerState localPlayerState = getStatus();
    if (localPlayerState == MediaPlayer.PlayerState.PREPARED)
    {
      if (_seekNeeded)
      {
        _logger.i(LOG_TAG + "#play", "Performing initial seek at position [" + _initialTime.toString() + "].");
        _seekNeeded = false;
        _videoEngineAdapter.seek(VideoEngineTimeline.TimeMapping.create(-1, _videoEngineAdapter.getVirtualTimeForLocalTime(_initialTime.getTime())), true);
      }
      _logger.i(LOG_TAG + "#prepareBuffer", "Prepare buffer.");
      _videoEngineAdapter.prepareBuffer();
      return;
    }
    _logger.i(LOG_TAG + "#prepareBuffer", "Invalid player status [" + localPlayerState.toString() + "] for operation [prepareBuffer].");
  }
  
  public void prepareToPlay()
    throws IllegalStateException
  {
    prepareToPlay(-2L);
  }
  
  public void prepareToPlay(long paramLong)
    throws IllegalStateException
  {
    boolean bool2 = true;
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    Object localObject = getStatus();
    if (localObject == MediaPlayer.PlayerState.PREPARING) {
      _logger.w(LOG_TAG + "#prepareToPlay", "Initialization is already in progress, we will ignore any additional requests until completion.");
    }
    for (;;)
    {
      return;
      if (_resource == null) {
        throw new IllegalStateException("Invalid current playback item (the item must not be null).Before calling prepareToPlay(), indicate the playback item through replaceCurrentItem() method.");
      }
      if ((localObject == MediaPlayer.PlayerState.INITIALIZING) && (!_preparePending))
      {
        _startPosition = paramLong;
        _preparePending = true;
        _logger.w(LOG_TAG + "#prepareToPlay", "Resource loading is already in progress. This operation will be called automatically after the loading has completed");
        return;
      }
      if (localObject != MediaPlayer.PlayerState.INITIALIZED) {
        throw new IllegalStateException("Invalid player state. prepareToPlay method must be called only once after replaceCurrentItem method.");
      }
      setStatus(MediaPlayer.PlayerState.PREPARING, null);
      if (_item == null)
      {
        _logger.w(LOG_TAG + "#prepareToPlay", "MediaPlayerItem is null. Unable to proceed with preparing resource: [" + _resource + "].");
        return;
      }
      _initialTime = adjustDesiredStartPosition(paramLong);
      boolean bool1 = bool2;
      if (!_item.isLive()) {
        if ((_playbackMetrics == null) || (_playbackMetrics.getSeekableRange() == null) || (_initialTime.getTime() == _playbackMetrics.getSeekableRange().getBegin())) {
          break label366;
        }
      }
      label366:
      for (bool1 = bool2;; bool1 = false)
      {
        _seekNeeded = bool1;
        loadAdComponents(_item);
        localObject = createInitialPlacementInformations(_item, _adSignalingMode, _initialTime);
        if ((!((List)localObject).isEmpty()) && ((!getCurrentItem().isLive()) || (extractEnableLivePreroll(_item)))) {
          break;
        }
        endAdResolving();
        return;
      }
      if (localObject != null)
      {
        _mediaPlayerClient.registerPlacement(((List)localObject).size());
        localObject = ((List)localObject).iterator();
        while (((Iterator)localObject).hasNext())
        {
          PlacementInformation localPlacementInformation = (PlacementInformation)((Iterator)localObject).next();
          _mediaPlayerClient.beginResolveAds(localPlacementInformation);
        }
      }
    }
  }
  
  public void registerAdClientFactory(AdClientFactory paramAdClientFactory)
  {
    if (paramAdClientFactory == null) {
      throw new IllegalArgumentException("adClientFactory parameter can not be null. If you  need to reset the advertising factory to the default one, then provide a new DefaultAdvertisingFactory instance.");
    }
    _logger.i(LOG_TAG + "#registerAdvertisingFactory", "Registering custom ad client factory.");
    _adClientFactory = paramAdClientFactory;
  }
  
  public void registerCurrentItemAsBackgroundItem()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    _logger.d(LOG_TAG + "#registerCurrentItemAsBackgroundItem", "Register current item as background item.");
    if (_item != null)
    {
      _backgroundResource = _resource;
      _backgroundItem = _item;
      _logger.d(LOG_TAG + "#registerCurrentItemAsBackgroundItem", "Background rsource url: " + _resource.getUrl());
    }
  }
  
  public void release()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    _logger.i(LOG_TAG + "#release", "Releasing the media player associated resources.");
    unloadAdComponents();
    resetInternalComponents();
    _internalTimer = null;
    _handler = null;
    if (_videoEngineAdapter != null)
    {
      _logger.i(LOG_TAG + "#release()", "Destroying the media player instance.");
      _videoEngineAdapter.release();
    }
    if (_mediaPlayerView != null)
    {
      _mediaPlayerView.detachView();
      _mediaPlayerView = null;
    }
    if (_customAdPlaybackManager != null)
    {
      _customAdPlaybackManager.reset();
      _customAdPlaybackManager = null;
    }
    setStatus(MediaPlayer.PlayerState.RELEASED, null);
  }
  
  public void removeEventListener(MediaPlayer.Event paramEvent, MediaPlayer.EventListener paramEventListener)
  {
    checkAndThrowIfReleased();
    if (_videoEngineDispatcher != null) {
      _videoEngineDispatcher.removeEventListener(paramEvent, paramEventListener);
    }
  }
  
  public void replaceCurrentItem(MediaResource paramMediaResource)
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    if (_resource != paramMediaResource)
    {
      if (getStatus() != MediaPlayer.PlayerState.IDLE) {
        updateVideoEngineAdapter();
      }
      _resource = paramMediaResource;
      setStatus(MediaPlayer.PlayerState.INITIALIZING, null);
      beginLoadResource();
      _videoEngineDispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.ITEM_REPLACED));
      return;
    }
    _logger.w(LOG_TAG + "#replaceCurrentItem", "Ignoring command as the same media resource is provided. If you want to force the reloading of the same media resource, call method reset first.");
  }
  
  public void reset()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    _logger.i(LOG_TAG + "#reset", "Reseting the media player associated resources.");
    unloadAdComponents();
    resetInternalComponents();
    if (_videoEngineAdapter != null)
    {
      _logger.i(LOG_TAG + "#reset()", "Reseting the media player instance");
      _videoEngineAdapter.reset();
      _mediaPlayerView.resetView();
      if (_customAdPlaybackManager.getCustomAdView() != null) {
        _customAdPlaybackManager.getCustomAdView().reset();
      }
    }
    setStatus(MediaPlayer.PlayerState.IDLE, null);
  }
  
  public void seek(long paramLong)
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    if ((_trickPlayManager != null) && (_trickPlayManager.trickPlayEnabled()))
    {
      _logger.w(LOG_TAG + "#seek", "MediaPlayer.seek() is not allowed during trick-play.");
      return;
    }
    HashSet localHashSet = new HashSet();
    localHashSet.add(MediaPlayer.PlayerState.PREPARED);
    localHashSet.add(MediaPlayer.PlayerState.READY);
    localHashSet.add(MediaPlayer.PlayerState.PLAYING);
    localHashSet.add(MediaPlayer.PlayerState.PAUSED);
    localHashSet.add(MediaPlayer.PlayerState.COMPLETE);
    localHashSet.add(MediaPlayer.PlayerState.SUSPENDED);
    MediaPlayer.PlayerState localPlayerState = getStatus();
    if (!localHashSet.contains(localPlayerState)) {
      throw new IllegalStateException("Invalid player status [ " + localPlayerState.toString() + "] for operation [play].");
    }
    _customAdPlaybackManager.setStartTimeOfSeekOrTrickPlay(getCurrentTime());
    adjustDesiredSeekPosition(paramLong);
  }
  
  public void seekToLocalTime(long paramLong)
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    if (_videoEngineAdapter != null) {
      seek(_videoEngineAdapter.getVirtualTimeForLocalTime(paramLong));
    }
  }
  
  public void setABRControlParameters(ABRControlParameters paramABRControlParameters)
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    _logger.i(LOG_TAG + "#setABRControlParameters", "Setting ABR control params: " + paramABRControlParameters.toString());
    _videoEngineAdapter.setABRControlParameters(paramABRControlParameters);
  }
  
  public void setBufferControlParameters(BufferControlParameters paramBufferControlParameters)
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    if (paramBufferControlParameters == null) {
      throw new IllegalArgumentException("BufferControlParameters parameter must not be null.");
    }
    _logger.i(LOG_TAG + "#setBufferControlParameters", "Setting buffer control params: " + paramBufferControlParameters.toString());
    _videoEngineAdapter.setBufferControlParameters(paramBufferControlParameters);
  }
  
  public void setCCStyle(TextFormat paramTextFormat)
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    _closedCaptionsTextFormat = paramTextFormat;
    _videoEngineAdapter.setCaptionsControlParameters(paramTextFormat);
  }
  
  public void setCCVisibility(MediaPlayer.Visibility paramVisibility)
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    _videoEngineAdapter.setCaptionsVisibility(paramVisibility);
  }
  
  public void setCustomAdTimeout(int paramInt)
  {
    _customAdPlaybackManager.getCustomAdView().setTimeout(paramInt);
  }
  
  public void setCustomConfiguration(String paramString)
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    _logger.i(LOG_TAG + "#setCustomConfiguration", "Setting custom configuration: " + paramString);
    _videoEngineAdapter.setCustomConfiguration(paramString);
  }
  
  public void setRate(float paramFloat)
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    _logger.i(LOG_TAG + "#setRate", "Setting playback rate: " + paramFloat);
    _trickPlayManager.changePlaybackRate(paramFloat);
    if (paramFloat > 1.0D)
    {
      _customAdPlaybackManager.setStartTimeOfSeekOrTrickPlay(getCurrentTime());
      _customAdPlaybackManager.attachSeekListener();
    }
  }
  
  protected void setStatus(MediaPlayer.PlayerState paramPlayerState, MediaPlayerNotification.Error paramError)
  {
    try
    {
      checkAndThrowIfReleased();
      _logger.i(LOG_TAG + "#setStatus", "Set player state to: " + paramPlayerState.toString() + ".");
      _currentStatus = paramPlayerState;
      if (_videoEngineDispatcher != null) {
        _videoEngineDispatcher.dispatch(StateChangedEvent.createChangedEvent(_currentStatus, paramError));
      }
      return;
    }
    finally
    {
      paramPlayerState = finally;
      throw paramPlayerState;
    }
  }
  
  public void setVolume(int paramInt)
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    _videoEngineAdapter.setVolume(paramInt);
  }
  
  public boolean shouldTriggerSubscribedTagEvent()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    if (_videoEngineAdapter != null) {
      return _videoEngineAdapter.shouldTriggerSubscribedTagEvent(getCurrentTime());
    }
    return true;
  }
  
  void stopInternalTimer()
  {
    _shouldStopInternalTimer = true;
    _internalTimerRunning = false;
    if (_handler != null) {
      _handler.removeCallbacks(_internalTimer);
    }
  }
  
  public void unregisterCurrentBackgroundItem()
    throws IllegalStateException
  {
    checkAndThrowIfReleased();
    checkAndThrowIfError();
    if (_backgroundResource != null) {
      _backgroundResource = null;
    }
    if (_backgroundItem != null) {
      _backgroundItem = null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultMediaPlayer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */