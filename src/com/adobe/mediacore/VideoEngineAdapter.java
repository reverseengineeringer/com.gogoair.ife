package com.adobe.mediacore;

import android.content.Context;
import com.adobe.ave.ABRParameters;
import com.adobe.ave.ABRParameters.ABRPolicy;
import com.adobe.ave.ContainerType;
import com.adobe.ave.DataType;
import com.adobe.ave.Dictionary;
import com.adobe.ave.ListenerType;
import com.adobe.ave.MediaErrorCode;
import com.adobe.ave.NetworkingParameters;
import com.adobe.ave.PeriodInfo;
import com.adobe.ave.PlayState;
import com.adobe.ave.Timeline;
import com.adobe.ave.VideoEngine;
import com.adobe.ave.VideoEngineException;
import com.adobe.ave.VideoEngineListener;
import com.adobe.ave.VideoEngineView;
import com.adobe.ave.drm.DRMManager;
import com.adobe.mediacore.info.AudioTrack;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.AdSignalingMode;
import com.adobe.mediacore.metadata.DefaultMetadataKeys;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.qos.LoadInfo;
import com.adobe.mediacore.qos.LoadInfo.Type;
import com.adobe.mediacore.qos.metrics.PlaybackMetrics;
import com.adobe.mediacore.system.NetworkConfiguration;
import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;
import com.adobe.mediacore.utils.NumberUtils;
import com.adobe.mediacore.utils.StringUtils;
import com.adobe.mediacore.utils.TimeRange;
import java.io.File;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

final class VideoEngineAdapter
{
  private static final String AUDIO = "AUDIO";
  private static final String DICTIONARY_TYPE = "_dictionaryType";
  private static final String ID3 = "ID3";
  private static final long INITIAL_BUFFER_TIME = 2000L;
  private static final String LOG_TAG = "[PSDK]::" + VideoEngineAdapter.class.getSimpleName();
  private static final long PLAY_BUFFER_TIME = 30000L;
  private static final int UNKNOWN_CONTENT_ID = -1;
  private static final int UNKNOWN_PERIOD_INDEX = -1;
  private static final Logger _logger = Log.getLogger(LOG_TAG);
  private List _adTags;
  private boolean _alreadyReleased;
  private MediaResource _backgroundMediaResource = null;
  private BackgroundVideoEngineItem _backgroundVideoEngineItem;
  private int _contentId;
  private Context _context;
  private ABRControlParameters _desiredABRControlParameters;
  private BufferControlParameters _desiredBufferControlParameters = getDefaultBufferingParameters();
  private TextFormat _desiredCaptionsControlParameters;
  private MediaPlayer.Visibility _desiredCaptionsVisibility;
  private VideoEngineTimeline.TimeMapping _desiredSeekPositon;
  private int _desiredVolume;
  private DRMManager _drmManager;
  private DRMMetadataCache _drmMetadataCache;
  private boolean _hasSurface = false;
  private boolean _isBuffering;
  private boolean _isInitialised;
  private boolean _isProtected;
  private boolean _isSeeking;
  private boolean _isTempBuffer = false;
  private int _lastKnownContentId;
  private long _lastKnownProfile;
  private long _lastKnownTime;
  private MediaResource _mediaResource;
  private final List _pendingOperations = new CopyOnWriteArrayList();
  private PlayState _playerState;
  private VideoEngineTimelineProxy _timelineProxy;
  private VideoEngine _videoEngine;
  private VideoEngineDispatcher _videoEngineDispatcher;
  private VideoEngineItem _videoEngineItem;
  private VideoEngineListener _videoEngineListener;
  private VideoEnginePlaybackMetrics _videoEnginePlaybackMetrics;
  private VideoEngineTimeline _videoEngineTimeline;
  
  public VideoEngineAdapter(Context paramContext, VideoEngineDispatcher paramVideoEngineDispatcher)
  {
    if (paramContext == null) {
      throw new IllegalArgumentException("Video engine context parameter must not be null.");
    }
    if (paramVideoEngineDispatcher == null) {
      throw new IllegalArgumentException("Video engine dispatcher parameter must not be null.");
    }
    _context = paramContext;
    _videoEngineDispatcher = paramVideoEngineDispatcher;
    _drmMetadataCache = new DRMMetadataCache();
    resetState();
  }
  
  private long calculateVirtualTime(VideoEngineTimeline.TimeMapping paramTimeMapping)
  {
    long l2 = paramTimeMapping.getTime();
    try
    {
      Object localObject = _videoEngine.getTimeline();
      long l1 = l2;
      if (localObject != null)
      {
        localObject = ((Timeline)localObject).getPeriodInfo(paramTimeMapping.getPeriod());
        l1 = l2;
        if (localObject != null)
        {
          l1 = paramTimeMapping.getTime();
          long l3 = localStartTime;
          long l4 = virtualStartTime;
          l1 = l4 + (l1 - l3);
        }
      }
      return l1;
    }
    catch (VideoEngineException paramTimeMapping)
    {
      _logger.w(LOG_TAG + "#calculateVirtualTime", "Exception raised while accessing the timeline { code = " + paramTimeMapping.getErrorCode() + ", description = " + paramTimeMapping.getDetailMessage() + " }");
    }
    return l2;
  }
  
  private void checkAndDispatchBufferingComplete()
  {
    if ((!_isBuffering) || (_isSeeking)) {}
    do
    {
      return;
      _isBuffering = false;
      if (_isTempBuffer)
      {
        setBufferTime(_desiredBufferControlParameters.getPlayBufferTime());
        _isTempBuffer = false;
      }
    } while (_videoEngineDispatcher == null);
    _videoEngineDispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.BUFFERING_COMPLETED));
  }
  
  private String convertOpacity(int paramInt)
  {
    if (paramInt == -1) {
      return "default";
    }
    return String.valueOf(paramInt);
  }
  
  private ContainerType convertType(MediaResource.Type paramType)
  {
    if (paramType == MediaResource.Type.HDS) {
      return ContainerType.F4M;
    }
    if (paramType == MediaResource.Type.HLS) {
      return ContainerType.HLS;
    }
    return ContainerType.UNDEFINED;
  }
  
  private VideoEngineListener createEngineListener()
  {
    return new VideoEngineAdapter.1(this);
  }
  
  private static LoadInfo createLoadInformationFrom(String paramString)
  {
    if (StringUtils.isEmpty(paramString)) {
      return null;
    }
    paramString = (MetadataNode)StringUtils.extractFromString(paramString.replace("rendition url", "url"), ",", "::=");
    if (!paramString.containsKey("url")) {
      return null;
    }
    String str = paramString.getValue("url");
    if ((!paramString.containsKey("sizeBytes")) && (!paramString.containsKey("downloadTime(ms)")) && (!paramString.containsKey("trackType")))
    {
      _logger.i(LOG_TAG + "#getFileLoadInfo", "Manifest load info parsed for url [" + str + "]");
      return LoadInfo.createManifestLoadInformation(str);
    }
    long l1 = NumberUtils.parseLong(paramString.getValue("sizeBytes"), 0L);
    long l2 = NumberUtils.parseLong(paramString.getValue("downloadTime(ms)"), 0L);
    long l3 = NumberUtils.parseLong(paramString.getValue("mediaDuration(ms)"), 0L);
    int j = (int)NumberUtils.parseLong(paramString.getValue("periodIndex"), 0L);
    if (!paramString.containsKey("trackName"))
    {
      _logger.i(LOG_TAG + "#getFileLoadInfo", "Video load info parsed for url [" + str + "]");
      return LoadInfo.createFragmentLoadInformation(str, j, l1, l3, l2);
    }
    int i = 0;
    try
    {
      long l4 = NumberUtils.parseNumber(paramString.getValue("trackIndex"), 0L);
      i = (int)l4;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      for (;;) {}
    }
    _logger.i(LOG_TAG + "#getFileLoadInfo", "Audio load info parsed for url [" + str + "]");
    return LoadInfo.createTrackLoadInformation(str, j, l1, l3, l2, paramString.getValue("trackName"), paramString.getValue("trackType"), i);
  }
  
  private String encodeToHTTPHeader(Metadata paramMetadata)
  {
    String str1 = "";
    String str2 = str1;
    if (paramMetadata != null)
    {
      str2 = str1;
      if (!paramMetadata.isEmpty())
      {
        Iterator localIterator = paramMetadata.keySet().iterator();
        str2 = str1;
        if (localIterator.hasNext())
        {
          str2 = (String)localIterator.next();
          String str3 = paramMetadata.getValue(str2);
          if ((StringUtils.isEmpty(str2)) || (StringUtils.isEmpty(str3))) {
            break label122;
          }
          str1 = str1 + str2 + "=" + str3 + "; ";
        }
      }
    }
    label122:
    for (;;)
    {
      break;
      return str2;
    }
  }
  
  private long extractVirtualTime()
    throws VideoEngineException
  {
    Object localObject = _videoEngine.getTimeline();
    if (localObject != null)
    {
      localObject = ((Timeline)localObject).getPeriodInfo(_desiredSeekPositon.getPeriod());
      if (localObject != null) {
        return virtualStartTime;
      }
    }
    return _desiredSeekPositon.getTime();
  }
  
  private int getContentIdByTime(long paramLong)
  {
    try
    {
      Timeline localTimeline = _videoEngine.getTimeline();
      Object localObject;
      if (localTimeline != null)
      {
        int i = firstPeriodIndex;
        int j = lastPeriodIndex;
        while (i < j + 1)
        {
          localObject = localTimeline.getPeriodInfo(i);
          if (localObject != null)
          {
            long l1 = virtualStartTime;
            long l2 = duration;
            if ((l1 <= paramLong) && (paramLong <= l2 + l1))
            {
              i = userData;
              return i;
            }
          }
          i += 1;
        }
      }
      MetadataNode localMetadataNode;
      return -1;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      localObject = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.PERIOD_INFO_ERROR, "Get period info operation has failed.");
      localMetadataNode = new MetadataNode();
      localMetadataNode.setValue("DESCRIPTION", localVideoEngineException.getMessage());
      ((MediaPlayerNotification.Error)localObject).setMetadata(localMetadataNode);
      if (_videoEngineDispatcher != null) {
        _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent((MediaPlayerNotification.Error)localObject));
      }
    }
  }
  
  static BufferControlParameters getDefaultBufferingParameters()
  {
    return BufferControlParameters.createDual(2000L, 30000L);
  }
  
  private MediaPlayerNotification.Error getFileLoadErrorNotification(LoadInfo paramLoadInfo)
  {
    Object localObject = null;
    MediaPlayerNotification.Error localError = null;
    if (paramLoadInfo == null)
    {
      localObject = localError;
      return (MediaPlayerNotification.Error)localObject;
    }
    localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.DOWNLOAD_ERROR, "An error has occurred while attempting to download data.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("URL", paramLoadInfo.getUrl());
    localError.setMetadata(localMetadataNode);
    switch (2.$SwitchMap$com$adobe$mediacore$qos$LoadInfo$Type[paramLoadInfo.getType().ordinal()])
    {
    default: 
      paramLoadInfo = (LoadInfo)localObject;
    }
    for (;;)
    {
      localObject = paramLoadInfo;
      if (paramLoadInfo == null) {
        break;
      }
      paramLoadInfo.setInnerNotification(localError);
      return paramLoadInfo;
      paramLoadInfo = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.MANIFEST_ERROR, "An error has occurred while downloading a manifest.");
      continue;
      paramLoadInfo = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.CONTENT_ERROR, "An error has occurred while downloading a fragment.");
    }
  }
  
  private PeriodInfo getPeriodById(int paramInt)
  {
    try
    {
      Timeline localTimeline = _videoEngine.getTimeline();
      Object localObject;
      if (localTimeline != null)
      {
        int i = firstPeriodIndex;
        int j = lastPeriodIndex;
        while (i < j + 1)
        {
          localObject = localTimeline.getPeriodInfo(i);
          if (localObject != null)
          {
            int k = userData;
            if (k == paramInt) {
              return (PeriodInfo)localObject;
            }
          }
          i += 1;
        }
      }
      MetadataNode localMetadataNode;
      return null;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      localObject = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.PERIOD_INFO_ERROR, "Get period info operation has failed.");
      localMetadataNode = new MetadataNode();
      localMetadataNode.setValue("DESCRIPTION", localVideoEngineException.getMessage());
      ((MediaPlayerNotification.Error)localObject).setMetadata(localMetadataNode);
      if (_videoEngineDispatcher != null) {
        _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent((MediaPlayerNotification.Error)localObject));
      }
    }
  }
  
  private String getUrl(MediaResource paramMediaResource)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (paramMediaResource != null)
    {
      localObject1 = localObject2;
      if (paramMediaResource.getUrl() != null) {
        localObject1 = paramMediaResource.getUrl();
      }
    }
    return (String)localObject1;
  }
  
  private boolean handleAudioTrackError(LoadInfo paramLoadInfo)
  {
    if ((paramLoadInfo == null) || (paramLoadInfo.getType() != LoadInfo.Type.TRACK)) {}
    while (!"AUDIO".equalsIgnoreCase(paramLoadInfo.getTrackType())) {
      return false;
    }
    Iterator localIterator = _videoEngineItem.getAudioTracks().iterator();
    AudioTrack localAudioTrack;
    do
    {
      if (!localIterator.hasNext()) {
        break;
      }
      localAudioTrack = (AudioTrack)localIterator.next();
    } while (!localAudioTrack.getName().equals(paramLoadInfo.getTrackName()));
    for (paramLoadInfo = localAudioTrack;; paramLoadInfo = null)
    {
      if (_videoEngineDispatcher != null) {
        _videoEngineDispatcher.dispatch(AudioTrackEvent.createAudioTrackFailedEvent(paramLoadInfo));
      }
      return true;
    }
  }
  
  private boolean isAdPeriod(PeriodInfo paramPeriodInfo)
  {
    int i = userData;
    if (_videoEngineTimeline != null)
    {
      Iterator localIterator;
      do
      {
        paramPeriodInfo = _videoEngineTimeline.getAdBreakPlacements().iterator();
        while (!localIterator.hasNext())
        {
          if (!paramPeriodInfo.hasNext()) {
            break;
          }
          localIterator = ((AdBreakPlacement)paramPeriodInfo.next()).getAdBreak().adsIterator();
        }
      } while (((Ad)localIterator.next()).getId() != i);
      return true;
    }
    return false;
  }
  
  private boolean isAveTimelineValid()
  {
    try
    {
      Timeline localTimeline = _videoEngine.getTimeline();
      if (localTimeline == null)
      {
        _logger.e(LOG_TAG + "#onTimeline", "VideoEngine timeline is null. Ignoring event.");
        return false;
      }
    }
    catch (VideoEngineException localVideoEngineException)
    {
      _logger.e(LOG_TAG + "#onTimeline", "Exception while trying to read VideoEngine timeline.", localVideoEngineException);
      return false;
    }
    showDebuggingInformation(localVideoEngineException);
    return true;
  }
  
  private boolean isID3Dictionary(Dictionary paramDictionary)
  {
    boolean bool2 = false;
    try
    {
      paramDictionary = paramDictionary.getValueByKey("_dictionaryType");
      boolean bool1 = bool2;
      if (paramDictionary != null)
      {
        boolean bool3 = paramDictionary.equals("ID3");
        bool1 = bool2;
        if (bool3) {
          bool1 = true;
        }
      }
      return bool1;
    }
    catch (VideoEngineException paramDictionary)
    {
      _logger.e(LOG_TAG + "#isID3Dictionary", "Video engine exception raised while accesing the dictionary", paramDictionary);
    }
    return false;
  }
  
  private boolean preventSeekAtClientLivePoint(VideoEngineTimeline.TimeMapping paramTimeMapping)
  {
    try
    {
      long l = _videoEngine.getTime();
      if ((!_isInitialised) && (getCurrentItem().isLive()) && (paramTimeMapping.getTime() == l))
      {
        _isInitialised = true;
        return true;
      }
    }
    catch (VideoEngineException paramTimeMapping)
    {
      _logger.w(LOG_TAG + "#preventSeekAtClientLivePoint", "Unable to retrive current time from video engine");
      return false;
    }
    return false;
  }
  
  static void printLivePlaybackWindowState(VideoEnginePlaybackMetrics paramVideoEnginePlaybackMetrics)
  {
    if (paramVideoEnginePlaybackMetrics != null)
    {
      paramVideoEnginePlaybackMetrics.update();
      TimeRange localTimeRange = paramVideoEnginePlaybackMetrics.getPlaybackRange();
      long l1 = paramVideoEnginePlaybackMetrics.getTime();
      long l2 = paramVideoEnginePlaybackMetrics.getReadHead();
      if (localTimeRange != null) {
        _logger.i(LOG_TAG + "#printLivePlaybackWindowState", "PlaybackRange = " + localTimeRange.toString());
      }
      for (;;)
      {
        _logger.i(LOG_TAG + "#printLivePlaybackWindowState", "Current time = " + l1 + "; read head = " + l2);
        return;
        _logger.w(LOG_TAG + "#printLivePlaybackWindowState", "Cannot print playback range");
      }
    }
    _logger.w(LOG_TAG + "#printLivePlaybackWindowState", "Cannot print playback metrics");
  }
  
  private void resetState()
  {
    _logger.i(LOG_TAG + "#resetState()", "Releasing mediaResource.");
    _mediaResource = null;
    _logger.i(LOG_TAG + "#resetState()", "Releasing _videoEngineItem.");
    _videoEngineItem = null;
    _logger.i(LOG_TAG + "#resetState()", "Releasing others.");
    _isBuffering = false;
    _isSeeking = false;
    _isInitialised = false;
    _isProtected = false;
    _desiredCaptionsVisibility = MediaPlayer.Visibility.INVISIBLE;
    _desiredSeekPositon = VideoEngineTimeline.TimeMapping.createInvalid();
    _drmMetadataCache.reset();
    _lastKnownContentId = -1;
    _lastKnownTime = 0L;
    _alreadyReleased = true;
  }
  
  private void setBufferTime(long paramLong)
  {
    try
    {
      _videoEngine.setBufferTime(paramLong);
      return;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      MediaPlayerNotification.Error localError;
      do
      {
        localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.SET_BUFFER_TIME_ERROR, "Set buffer time operation has failed.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("DESCRIPTION", localVideoEngineException.getMessage());
        localMetadataNode.setValue("PLAY_BUFFER_TIME", paramLong + "");
        localError.setMetadata(localMetadataNode);
      } while (_videoEngineDispatcher == null);
      _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent(localError));
    }
  }
  
  private boolean shouldUseContentCache(Metadata paramMetadata)
  {
    return (paramMetadata == null) || (!paramMetadata.containsKey(DefaultMetadataKeys.DISABLE_CONTENT_CACHING.getValue())) || (!paramMetadata.getValue(DefaultMetadataKeys.DISABLE_CONTENT_CACHING.getValue()).equalsIgnoreCase("true"));
  }
  
  private void showDebuggingInformation(Timeline paramTimeline)
  {
    _logger.i(LOG_TAG + "#showDebuggingInformation", "Displaying debug information.");
    VideoEngineTimeline.printTimeline(paramTimeline);
    printLivePlaybackWindowState(_videoEnginePlaybackMetrics);
  }
  
  public long convertToLocalTime(long paramLong)
  {
    try
    {
      Object localObject1 = AdSignalingMode.DEFAULT;
      if (_videoEngineTimeline != null) {
        localObject1 = _videoEngineTimeline.getAdSignalingMode();
      }
      long l1;
      if (getCurrentItem() != null)
      {
        l1 = paramLong;
        if (getCurrentItem().isLive()) {
          break label256;
        }
        if (localObject1 == AdSignalingMode.MANIFEST_CUES) {
          return paramLong;
        }
      }
      Timeline localTimeline = _videoEngine.getTimeline();
      localObject1 = null;
      if (localTimeline != null)
      {
        int i = firstPeriodIndex;
        while (i <= lastPeriodIndex)
        {
          PeriodInfo localPeriodInfo = localTimeline.getPeriodInfo(i);
          Object localObject2 = localObject1;
          if (localPeriodInfo != null)
          {
            localObject2 = localObject1;
            if (!isAdPeriod(localPeriodInfo)) {
              localObject2 = localPeriodInfo;
            }
          }
          if (localPeriodInfo != null)
          {
            l1 = virtualStartTime;
            long l2 = duration;
            if ((l1 <= paramLong) && (paramLong <= l2 + l1))
            {
              if (!isAdPeriod(localPeriodInfo)) {
                return localStartTime + (paramLong - l1);
              }
              if (localObject2 != null)
              {
                paramLong = localStartTime;
                l1 = duration;
                return paramLong + l1;
              }
              if (localObject2 == null) {
                return 0L;
              }
            }
          }
          i += 1;
          localObject1 = localObject2;
        }
      }
      return l1;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      _logger.w(LOG_TAG + "#convertToLocalTime", "Exception raised while trying to access the timeline ", localVideoEngineException);
      l1 = -1L;
    }
  }
  
  protected VideoEngineTimelineProxy createVideoEngineTimelineProxy()
  {
    Object localObject = null;
    try
    {
      Timeline localTimeline = _videoEngine.getTimeline();
      localObject = localTimeline;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      for (;;)
      {
        _logger.w(LOG_TAG + "#createVideoEngineTimelineProxy", "VideoException raised while accesing the timeline", localVideoEngineException);
      }
    }
    _timelineProxy = new VideoEngineTimelineProxy((Timeline)localObject, _videoEnginePlaybackMetrics);
    return _timelineProxy;
  }
  
  public void enableTrickPlay(float paramFloat, boolean paramBoolean)
  {
    if (!_hasSurface)
    {
      TrickPlayOperation localTrickPlayOperation = new TrickPlayOperation(paramFloat, paramBoolean);
      localTrickPlayOperation.setVideoEngineAdapter(this);
      _pendingOperations.add(localTrickPlayOperation);
    }
    MediaPlayerNotification.Warning localWarning;
    do
    {
      return;
      try
      {
        if (_videoEngine.getPlayState() == PlayState.SUSPENDED) {
          play();
        }
        if (paramBoolean) {
          _videoEngineTimeline.removeAdsOnSourceTimeline();
        }
        if (paramFloat <= 0.0F) {
          break;
        }
        _logger.i(LOG_TAG + "#enableTrickPlay", "transitioning to fast forward");
        _videoEngine.fastForward(paramFloat);
        return;
      }
      catch (VideoEngineException localVideoEngineException)
      {
        localWarning = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.TRICKPLAY_RATE_CHANGE_FAIL, "Playback rate change failed.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("DESCRIPTION", localVideoEngineException.getMessage());
        localWarning.setMetadata(localMetadataNode);
      }
    } while (_videoEngineDispatcher == null);
    _videoEngineDispatcher.dispatch(OperationFailedEvent.createEvent(localWarning));
    return;
    if (paramFloat < -1.0F)
    {
      _logger.i(LOG_TAG + "#enableTrickPlay", "transitioning to fast rewind");
      _videoEngine.rewind(-1.0F * paramFloat);
      return;
    }
    throw new IllegalArgumentException(String.format("Rate [{0}] is not allowed in this version.}", new Object[] { Float.valueOf(paramFloat) }));
  }
  
  public ABRControlParameters getABRControlParameters()
  {
    return _desiredABRControlParameters;
  }
  
  public BufferControlParameters getBufferControlParameters()
  {
    return _desiredBufferControlParameters;
  }
  
  public TextFormat getCaptionsControlParameters()
  {
    return _desiredCaptionsControlParameters;
  }
  
  public MediaPlayer.Visibility getCaptionsVisibility()
  {
    return _desiredCaptionsVisibility;
  }
  
  public VideoEngineItem getCurrentItem()
  {
    return _videoEngineItem;
  }
  
  public long getCurrentTime()
  {
    long l = 0L;
    try
    {
      if (_videoEngine != null) {
        l = _videoEngine.getTime();
      }
      return l;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      MediaPlayerNotification.Error localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.RETRIEVE_TIME_ERROR, "Get client live point operation has failed.");
      MetadataNode localMetadataNode = new MetadataNode();
      localMetadataNode.setValue("DESCRIPTION", localVideoEngineException.getMessage());
      localError.setMetadata(localMetadataNode);
      if (_videoEngineDispatcher != null) {
        _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent(localError));
      }
    }
    return _lastKnownTime;
  }
  
  public DRMManager getDRMManager()
  {
    return _drmManager;
  }
  
  public long getLocalTime()
  {
    try
    {
      long l = convertToLocalTime(_videoEngine.getTime());
      return l;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      _logger.w(LOG_TAG + "#getLocalTime", "Exception raised while trying to access the timeline ", localVideoEngineException);
    }
    return 0L;
  }
  
  public PlaybackMetrics getPlaybackMetrics()
  {
    return _videoEnginePlaybackMetrics;
  }
  
  protected PlayState getPlayerState()
  {
    return _playerState;
  }
  
  Timeline getRawTimeline()
    throws VideoEngineException
  {
    return _videoEngine.getTimeline();
  }
  
  public VideoEngineTimeline getTimeline()
  {
    return _videoEngineTimeline;
  }
  
  public long getVirtualTimeForLocalTime(long paramLong)
  {
    try
    {
      if ((getCurrentItem() != null) && (getCurrentItem().isLive())) {
        return paramLong;
      }
      Timeline localTimeline = _videoEngine.getTimeline();
      if (localTimeline != null)
      {
        int i = firstPeriodIndex;
        while (i <= lastPeriodIndex)
        {
          PeriodInfo localPeriodInfo = localTimeline.getPeriodInfo(i);
          if (localPeriodInfo != null)
          {
            long l1 = localStartTime;
            long l2 = duration;
            if ((l1 <= paramLong) && (paramLong <= l2 + l1) && (!isAdPeriod(localPeriodInfo)))
            {
              l2 = virtualStartTime;
              return l2 + (paramLong - l1);
            }
          }
          i += 1;
        }
      }
      return 0L;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      _logger.w(LOG_TAG + "#getVirtualTimeForLocalTime", "Unable to get virtual time for this local time. ", localVideoEngineException);
    }
  }
  
  public int getVolume()
  {
    return _desiredVolume;
  }
  
  boolean hasAllDataBuffered()
  {
    if ((_videoEnginePlaybackMetrics == null) || (_videoEngineItem == null)) {}
    VideoEnginePlaybackMetrics localVideoEnginePlaybackMetrics;
    do
    {
      return false;
      localVideoEnginePlaybackMetrics = _videoEnginePlaybackMetrics;
    } while ((_videoEngineItem.isLive()) || (localVideoEnginePlaybackMetrics.getTime() + localVideoEnginePlaybackMetrics.getBufferLength() < localVideoEnginePlaybackMetrics.getPlaybackRange().getDuration()) || (localVideoEnginePlaybackMetrics.getBufferLength() <= 0L));
    return true;
  }
  
  public void initialize()
  {
    try
    {
      _videoEngine = new VideoEngine();
      _videoEngineListener = createEngineListener();
      Object localObject = EnumSet.of(ListenerType.ERROR, new ListenerType[] { ListenerType.PLAY_STATE, ListenerType.STREAM_SWITCH, ListenerType.STREAM_METADATA, ListenerType.DRM_METADATA, ListenerType.TIMELINE, ListenerType.DATA, ListenerType.MANIFEST_LOAD, ListenerType.LOAD_INFO, ListenerType.SEEK_COMPLETE, ListenerType.WARNING, ListenerType.DICTIONARY_DATA, ListenerType.DRM_ERROR, ListenerType.BACKGROUND_MANIFEST_ERROR, ListenerType.BACKGROUND_MANIFEST_WARNING, ListenerType.PAUSE_AT_PERIOD_END });
      _videoEngine.addListener((Set)localObject, _videoEngineListener);
      _drmManager = DRMManager.getSharedManager(_context);
      _videoEngine.setDRMManager(_drmManager);
      localObject = _context.getFilesDir().getAbsolutePath();
      _videoEngine.setLocalStoragePath((String)localObject);
      _videoEnginePlaybackMetrics = new VideoEnginePlaybackMetrics();
      return;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      MediaPlayerNotification.Error localError;
      do
      {
        localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.ENGINE_CREATION_ERROR, "Unexpected error while creating the video engine.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("DESCRIPTION", localVideoEngineException.getMessage());
        localError.setMetadata(localMetadataNode);
      } while (_videoEngineDispatcher == null);
      _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent(localError));
    }
  }
  
  public void injectData(VideoEngineTimeline.TimeMapping paramTimeMapping, byte[] paramArrayOfByte)
    throws VideoEngineException
  {
    if (paramArrayOfByte == null)
    {
      _logger.e(LOG_TAG + "#injectData", "Input data object is null.");
      return;
    }
    long l = calculateVirtualTime(paramTimeMapping);
    _videoEngine.injectData(DataType.DT_AMF, l, paramArrayOfByte, paramArrayOfByte.length);
    _logger.i(LOG_TAG + "#injectData", "Injected data at virtual time [" + l + "]");
  }
  
  protected boolean isBufferFull()
  {
    if ((_videoEnginePlaybackMetrics == null) || (_videoEngineItem == null) || (_desiredBufferControlParameters == null)) {}
    while ((_videoEnginePlaybackMetrics.getBufferLength() < _desiredBufferControlParameters.getPlayBufferTime()) && (!hasAllDataBuffered())) {
      return false;
    }
    return true;
  }
  
  public boolean isInitialised()
  {
    return _isInitialised;
  }
  
  public void load(MediaResource paramMediaResource, int paramInt)
  {
    resetState();
    Object localObject2;
    Object localObject3;
    String[] arrayOfString;
    try
    {
      _mediaResource = paramMediaResource;
      _contentId = paramInt;
      localObject2 = _mediaResource.getUrl();
      localObject3 = convertType(_mediaResource.getType());
      Object localObject1 = PSDKConfig.getAdTagsWithDefault();
      _videoEngine.setCuePointTags((String[])localObject1, localObject1.length);
      _logger.i(LOG_TAG + "#load", "Setting ad cues: " + Arrays.toString((Object[])localObject1) + ".");
      arrayOfString = StringUtils.getReunion((String[])localObject1, PSDKConfig.getSubscribedTags());
      _videoEngine.setSubscribedTags(arrayOfString, arrayOfString.length);
      _logger.i(LOG_TAG + "#load", "Setting subscribed cues: " + Arrays.toString(arrayOfString) + ".");
      _adTags = Arrays.asList((Object[])localObject1);
      setBufferControlParameters(_desiredBufferControlParameters);
      localObject1 = _mediaResource.getMetadata();
      if ((localObject1 != null) && ((localObject1 instanceof MetadataNode)) && (((MetadataNode)localObject1).containsNode(DefaultMetadataKeys.NETWORK_CONFIGURATION.getValue())))
      {
        Object localObject4 = (NetworkConfiguration)((MetadataNode)localObject1).getNode(DefaultMetadataKeys.NETWORK_CONFIGURATION.getValue());
        localObject1 = "";
        if (((NetworkConfiguration)localObject4).getCookieHeaders() != null) {
          localObject1 = encodeToHTTPHeader(((NetworkConfiguration)localObject4).getCookieHeaders());
        }
        boolean bool1 = ((NetworkConfiguration)localObject4).getUseCookieHeadersForAllRequests();
        boolean bool2 = ((NetworkConfiguration)localObject4).getUseRedirectedUrl();
        Object localObject5 = ((NetworkConfiguration)localObject4).getCustomHeaders();
        int i = ((NetworkConfiguration)localObject4).getMasterUpdateInterval();
        localObject1 = new NetworkingParameters((String)localObject1, bool1);
        _videoEngine.setNetworkingParameters((NetworkingParameters)localObject1);
        useRedirectedUrl(bool2);
        if (localObject5 != null)
        {
          localObject1 = ((HashMap)localObject5).entrySet().iterator();
          while (((Iterator)localObject1).hasNext())
          {
            localObject5 = (Map.Entry)((Iterator)localObject1).next();
            localObject4 = (String)((Map.Entry)localObject5).getKey();
            localObject5 = (String[])((Map.Entry)localObject5).getValue();
            _videoEngine.addCustomHeader((String)localObject4, (String[])localObject5, localObject5.length);
          }
        }
        masterUpdateInterval(i);
      }
    }
    catch (VideoEngineException localVideoEngineException)
    {
      localObject2 = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.RESOURCE_LOAD_ERROR, "Video engine load-resource operation has failed.");
      localObject3 = new MetadataNode();
      ((Metadata)localObject3).setValue("DESCRIPTION", localVideoEngineException.getMessage());
      ((Metadata)localObject3).setValue("RESOURCE", paramMediaResource.toString());
      ((MediaPlayerNotification.Error)localObject2).setMetadata((Metadata)localObject3);
      if (_videoEngineDispatcher != null) {
        _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent((MediaPlayerNotification.Error)localObject2));
      }
      return;
    }
    while (_backgroundMediaResource != null)
    {
      _videoEngine.setSubscribedTagsForBackgroundManifest(arrayOfString, arrayOfString.length);
      _logger.i(LOG_TAG + "#load", "Setting subscribed cues on background stream: " + Arrays.toString(arrayOfString) + ".");
      _videoEngine.loadWithBackgroundManifest((String)localObject2, (ContainerType)localObject3, paramInt, getUrl(_backgroundMediaResource));
      return;
      useRedirectedUrl(true);
      masterUpdateInterval(-1);
    }
    _videoEngine.load((String)localObject2, (ContainerType)localObject3, paramInt);
  }
  
  public void masterUpdateInterval(int paramInt)
  {
    try
    {
      _videoEngine.setMasterUpdateInterval(paramInt);
      return;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      _logger.e(LOG_TAG + "#masterUpdateInterval", "Not successful", localVideoEngineException);
    }
  }
  
  public void pause()
  {
    Object localObject;
    if (!_hasSurface)
    {
      PlayOperation localPlayOperation = new PlayOperation();
      localObject = new PauseOperation();
      ((PlayerOperation)localObject).setVideoEngineAdapter(this);
      localPlayOperation.setVideoEngineAdapter(this);
      _pendingOperations.add(localPlayOperation);
      _pendingOperations.add(localObject);
    }
    do
    {
      return;
      try
      {
        if (_videoEngine.getPlayState() == PlayState.SUSPENDED) {
          play();
        }
        _videoEngine.setScreenOnWhilePlaying(false);
        _videoEngine.pause();
        return;
      }
      catch (VideoEngineException localVideoEngineException)
      {
        localObject = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.PAUSE_ERROR, "Pause operation has failed.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("DESCRIPTION", localVideoEngineException.getMessage());
        ((MediaPlayerNotification.Error)localObject).setMetadata(localMetadataNode);
      }
    } while (_videoEngineDispatcher == null);
    _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent((MediaPlayerNotification.Error)localObject));
  }
  
  public void play()
  {
    if (!_hasSurface)
    {
      PlayOperation localPlayOperation = new PlayOperation();
      localPlayOperation.setVideoEngineAdapter(this);
      _pendingOperations.add(localPlayOperation);
    }
    MediaPlayerNotification.Error localError;
    do
    {
      return;
      try
      {
        if ((getCurrentItem() != null) && (!getCurrentItem().isLive())) {
          _isInitialised = true;
        }
        _videoEngine.setScreenOnWhilePlaying(true);
        _videoEngine.play();
        return;
      }
      catch (VideoEngineException localVideoEngineException)
      {
        localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.PLAYBACK_ERROR, "Play operation has failed.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("DESCRIPTION", localVideoEngineException.getMessage());
        localError.setMetadata(localMetadataNode);
      }
    } while (_videoEngineDispatcher == null);
    _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent(localError));
  }
  
  public void prepareBuffer()
  {
    try
    {
      _videoEngine.prepareBuffer();
      return;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      MediaPlayerNotification.Error localError;
      do
      {
        localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.RESOURCE_LOAD_ERROR, "Video engine prepare buffer operation has failed.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("DESCRIPTION", localVideoEngineException.getMessage());
        if (_mediaResource != null) {
          localMetadataNode.setValue("RESOURCE", _mediaResource.getUrl());
        }
      } while (_videoEngineDispatcher == null);
      _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent(localError));
    }
  }
  
  public void release()
  {
    reset();
    try
    {
      _videoEngine.removeListener(_videoEngineListener);
      _videoEngine.release();
      return;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      MediaPlayerNotification.Error localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.ENGINE_RELEASE_ERROR, "Video engine release operation has failed.");
      MetadataNode localMetadataNode = new MetadataNode();
      localMetadataNode.setValue("DESCRIPTION", localVideoEngineException.getMessage());
      localMetadataNode.setValue("NATIVE_ERROR_CODE", localVideoEngineException.getErrorCode().getValue() + "");
      localMetadataNode.setValue("NATIVE_ERROR_NAME", localVideoEngineException.getErrorCode().name());
      localError.setMetadata(localMetadataNode);
      if (_videoEngineDispatcher != null) {
        _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent(localError));
      }
      return;
    }
    finally
    {
      _drmManager = null;
      _videoEngineListener = null;
      _videoEngine = null;
      _videoEngineItem = null;
      _mediaResource = null;
      _videoEngineDispatcher = null;
      _context = null;
    }
  }
  
  public void releaseResources()
  {
    try
    {
      if (!_alreadyReleased) {
        _videoEngine.releaseGPUResources();
      }
      return;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      MediaPlayerNotification.Error localError;
      do
      {
        localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.ENGINE_RESOURCES_RELEASE_ERROR, "Video engine release-resources operation has failed.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("DESCRIPTION", localVideoEngineException.getMessage());
        localMetadataNode.setValue("NATIVE_ERROR_CODE", localVideoEngineException.getErrorCode().getValue() + "");
        localMetadataNode.setValue("NATIVE_ERROR_NAME", localVideoEngineException.getErrorCode().name());
        localError.setMetadata(localMetadataNode);
      } while (_videoEngineDispatcher == null);
      _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent(localError));
    }
  }
  
  public void reset()
  {
    _pendingOperations.clear();
    resetState();
    _desiredABRControlParameters = null;
    _desiredBufferControlParameters = getDefaultBufferingParameters();
    try
    {
      _videoEnginePlaybackMetrics.reset();
      _videoEngine.setScreenOnWhilePlaying(false);
      _logger.i(LOG_TAG + "Calling video engine reset", "Releasing.");
      _videoEngine.reset();
      _logger.i(LOG_TAG + "video engine reset called", "Releasing.");
      _videoEngineDispatcher.destroyNotificationHistory();
      return;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      MediaPlayerNotification.Error localError;
      do
      {
        localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.ENGINE_RESET_ERROR, "Video engine reset operation has failed.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("DESCRIPTION", localVideoEngineException.getMessage());
        localMetadataNode.setValue("NATIVE_ERROR_CODE", localVideoEngineException.getErrorCode().getValue() + "");
        localMetadataNode.setValue("NATIVE_ERROR_NAME", localVideoEngineException.getErrorCode().name());
        localError.setMetadata(localMetadataNode);
      } while (_videoEngineDispatcher == null);
      _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent(localError));
    }
  }
  
  protected void restorePlayer(MediaPlayer.PlayerState paramPlayerState, boolean paramBoolean)
  {
    if (_hasSurface) {
      _logger.w(LOG_TAG + "#suspendPlayer", "Player is already restored. Current state [" + getPlayerState() + "].");
    }
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            _hasSurface = true;
          } while (_videoEngine == null);
          if (!_pendingOperations.isEmpty())
          {
            _logger.i(LOG_TAG + "#restorePlayer", "Executing [" + _pendingOperations.size() + "] pending operation(s).");
            paramPlayerState = _pendingOperations.iterator();
            while (paramPlayerState.hasNext())
            {
              PlayerOperation localPlayerOperation = (PlayerOperation)paramPlayerState.next();
              _logger.i(LOG_TAG + "#restorePlayer", "Executing operation: " + localPlayerOperation.getClass() + ".");
              localPlayerOperation.execute();
            }
            _pendingOperations.clear();
            return;
          }
        } while ((!isInitialised()) || (paramPlayerState == null) || (paramPlayerState == MediaPlayer.PlayerState.COMPLETE));
        _logger.i(LOG_TAG + "#restorePlayer", "Restoring video engine to state [" + paramPlayerState + "].");
      } while (paramBoolean);
      play();
    } while ((paramPlayerState != MediaPlayer.PlayerState.PAUSED) && (paramPlayerState != MediaPlayer.PlayerState.SUSPENDED));
    pause();
  }
  
  public void returnFromTrickPlay()
  {
    _videoEngineTimeline.restoreAdsOnSourceTimeline();
  }
  
  public void seek(VideoEngineTimeline.TimeMapping paramTimeMapping)
  {
    seek(paramTimeMapping, false);
  }
  
  public void seek(VideoEngineTimeline.TimeMapping paramTimeMapping, boolean paramBoolean)
  {
    boolean bool = true;
    if ((paramTimeMapping == null) || (paramTimeMapping.isInvalid()))
    {
      _logger.w(LOG_TAG + "#seek", "Ignoring seek to invalid position.");
      return;
    }
    if ((!_hasSurface) && (!paramBoolean))
    {
      PlayOperation localPlayOperation = new PlayOperation();
      localPlayOperation.setVideoEngineAdapter(this);
      _pendingOperations.add(localPlayOperation);
      paramTimeMapping = new SeekOperation(paramTimeMapping);
      paramTimeMapping.setVideoEngineAdapter(this);
      _pendingOperations.add(paramTimeMapping);
      return;
    }
    for (;;)
    {
      try
      {
        if (preventSeekAtClientLivePoint(paramTimeMapping)) {
          break;
        }
        _videoEnginePlaybackMetrics.update();
        if (paramTimeMapping.getTime() == -2L)
        {
          l1 = _videoEnginePlaybackMetrics.getSeekableRange().getEnd();
          _desiredSeekPositon = VideoEngineTimeline.TimeMapping.create(paramTimeMapping.getPeriod(), l1);
          if (!paramBoolean)
          {
            _isSeeking = true;
            if (_videoEngineDispatcher != null) {
              _videoEngineDispatcher.dispatch(SeekEvent.createSeekStarted(_desiredSeekPositon.getTime()));
            }
            _isBuffering = true;
            if (_videoEngineDispatcher != null) {
              _videoEngineDispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.BUFFERING_STARTED));
            }
          }
          if (_videoEngine.getPlayState() == PlayState.SUSPENDED) {
            play();
          }
          _logger.i(LOG_TAG + "#seek", "Seeking to position " + paramTimeMapping.toString());
          if (paramTimeMapping.getPeriod() == -1) {
            break label400;
          }
          _videoEngine.seekToLocalTime(paramTimeMapping.getPeriod(), paramTimeMapping.getTime());
          return;
        }
      }
      catch (VideoEngineException paramTimeMapping)
      {
        _logger.w(LOG_TAG + "#seek", "Seek has failed to position " + _desiredSeekPositon.toString());
        _videoEngineListener.onSeekComplete(_videoEngine, MediaErrorCode.SEEK_FAILED);
        return;
      }
      _desiredSeekPositon = paramTimeMapping;
    }
    label400:
    if (paramTimeMapping.getTime() == -2L)
    {
      _videoEngine.seekToLivePoint();
      return;
    }
    long l1 = _videoEngine.getTime();
    long l2 = _videoEngine.getBufferLength();
    long l3 = paramTimeMapping.getTime();
    if ((l1 <= l3) && (l3 <= l2 + l1)) {}
    for (paramBoolean = bool;; paramBoolean = false)
    {
      _videoEngine.seek(paramTimeMapping.getTime(), paramBoolean);
      return;
    }
  }
  
  public void setABRControlParameters(ABRControlParameters paramABRControlParameters)
  {
    _desiredABRControlParameters = paramABRControlParameters;
    try
    {
      localObject = new ABRParameters();
      startBitsPerSecond = paramABRControlParameters.getInitialBitRate();
      minBitsPerSecond = paramABRControlParameters.getMinBitRate();
      maxBitsPerSecond = paramABRControlParameters.getMaxBitRate();
      switch (paramABRControlParameters.getABRPolicy())
      {
      case ???: 
        for (;;)
        {
          _videoEngine.setABRParameters((ABRParameters)localObject);
          return;
          policy = ABRParameters.ABRPolicy.ABR_AGGRESSIVE;
        }
      }
    }
    catch (VideoEngineException paramABRControlParameters)
    {
      for (;;)
      {
        Object localObject = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.SET_ABR_PARAMETERS_ERROR, "Set ABR params operation has failed.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("DESCRIPTION", paramABRControlParameters.getMessage());
        ((MediaPlayerNotification.Error)localObject).setMetadata(localMetadataNode);
        if (_videoEngineDispatcher == null) {
          break;
        }
        _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent((MediaPlayerNotification.Error)localObject));
        return;
        policy = ABRParameters.ABRPolicy.ABR_MODERATE;
        continue;
        policy = ABRParameters.ABRPolicy.ABR_CONSERVATIVE;
      }
    }
  }
  
  public void setBackgroundMediaResource(MediaResource paramMediaResource)
  {
    _backgroundMediaResource = paramMediaResource;
  }
  
  public void setBufferControlParameters(BufferControlParameters paramBufferControlParameters)
  {
    try
    {
      _desiredBufferControlParameters = paramBufferControlParameters;
      _videoEngine.setInitialBufferTime(paramBufferControlParameters.getInitialBufferTime());
      _videoEngine.setBufferTime(paramBufferControlParameters.getPlayBufferTime());
      return;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      MediaPlayerNotification.Error localError;
      do
      {
        localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.SET_BUFFER_PARAMETERS_ERROR, "Set buffer control parameters operation has failed.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("DESCRIPTION", localVideoEngineException.getMessage());
        localMetadataNode.setValue("INITIAL_BUFFER_TIME", paramBufferControlParameters.getInitialBufferTime() + "");
        localMetadataNode.setValue("PLAY_BUFFER_TIME", paramBufferControlParameters.getPlayBufferTime() + "");
        localError.setMetadata(localMetadataNode);
      } while (_videoEngineDispatcher == null);
      _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent(localError));
    }
  }
  
  public void setCaptionsControlParameters(TextFormat paramTextFormat)
  {
    _desiredCaptionsControlParameters = paramTextFormat;
    try
    {
      paramTextFormat = _desiredCaptionsControlParameters.getFont().getValue();
      localObject1 = _desiredCaptionsControlParameters.getFontColor().getValue();
      localObject2 = _desiredCaptionsControlParameters.getFontEdge().getValue();
      String str1 = _desiredCaptionsControlParameters.getBackgroundColor().getValue();
      String str2 = _desiredCaptionsControlParameters.getFillColor().getValue();
      String str3 = _desiredCaptionsControlParameters.getEdgeColor().getValue();
      String str4 = _desiredCaptionsControlParameters.getSize().getValue();
      String str5 = convertOpacity(_desiredCaptionsControlParameters.getFontOpacity());
      String str6 = convertOpacity(_desiredCaptionsControlParameters.getBackgroundOpacity());
      String str7 = convertOpacity(_desiredCaptionsControlParameters.getFillOpacity());
      String str8 = _desiredCaptionsControlParameters.getBottomInset();
      _videoEngine.setCaptionStyle(new String[] { "font", "font_color", "font_edge", "background_color", "fill_color", "edge_color", "size", "font_opacity", "background_opacity", "fill_opacity", "bottom_inset" }, new String[] { paramTextFormat, localObject1, localObject2, str1, str2, str3, str4, str5, str6, str7, str8 }, 11);
      return;
    }
    catch (VideoEngineException paramTextFormat)
    {
      Object localObject1 = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.SET_CC_STYLING_ERROR, "Set CC-styling operation has failed.");
      Object localObject2 = new MetadataNode();
      ((Metadata)localObject2).setValue("DESCRIPTION", paramTextFormat.getMessage());
      ((MediaPlayerNotification.Error)localObject1).setMetadata((Metadata)localObject2);
      _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent((MediaPlayerNotification.Error)localObject1));
    }
  }
  
  public void setCaptionsVisibility(MediaPlayer.Visibility paramVisibility)
  {
    if (_desiredCaptionsVisibility != paramVisibility) {
      _desiredCaptionsVisibility = paramVisibility;
    }
    for (;;)
    {
      try
      {
        localObject = _videoEngine;
        if (paramVisibility == MediaPlayer.Visibility.VISIBLE)
        {
          bool = true;
          ((VideoEngine)localObject).enableCaptions(bool);
          return;
        }
      }
      catch (VideoEngineException paramVisibility)
      {
        boolean bool;
        Object localObject = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.SET_CC_VISIBILITY_ERROR, "Set CC visibility operation has failed.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("DESCRIPTION", paramVisibility.getMessage());
        ((MediaPlayerNotification.Error)localObject).setMetadata(localMetadataNode);
        if (_videoEngineDispatcher == null) {
          continue;
        }
        _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent((MediaPlayerNotification.Error)localObject));
      }
      bool = false;
    }
  }
  
  public void setCustomConfiguration(String paramString)
  {
    try
    {
      _videoEngine.setCustomConfiguration(paramString);
      return;
    }
    catch (VideoEngineException paramString) {}
  }
  
  public void setView(VideoEngineView paramVideoEngineView)
  {
    try
    {
      _videoEngine.setView(paramVideoEngineView);
      return;
    }
    catch (VideoEngineException paramVideoEngineView)
    {
      MediaPlayerNotification.Error localError;
      do
      {
        localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.ENGINE_SET_VIEW_ERROR, "Set view operation has failed.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("DESCRIPTION", paramVideoEngineView.getMessage());
        localError.setMetadata(localMetadataNode);
      } while (_videoEngineDispatcher == null);
      _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent(localError));
    }
  }
  
  public void setVolume(int paramInt)
  {
    try
    {
      _desiredVolume = paramInt;
      _videoEngine.setVolume(_desiredVolume);
      return;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      MediaPlayerNotification.Error localError;
      do
      {
        localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.SET_VOLUME_ERROR, "Set volume operation has failed.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("DESCRIPTION", localVideoEngineException.getMessage());
        localMetadataNode.setValue("VOLUME", paramInt + "");
        localError.setMetadata(localMetadataNode);
      } while (_videoEngineDispatcher == null);
      _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent(localError));
    }
  }
  
  public boolean shouldTriggerSubscribedTagEvent(long paramLong)
  {
    if (_videoEngineTimeline != null) {
      return _videoEngineTimeline.shouldTriggerSubscribedTagEvent(paramLong);
    }
    return true;
  }
  
  protected void suspendPlayer()
  {
    if (!_hasSurface)
    {
      _logger.w(LOG_TAG + "#suspendPlayer", "Player is already suspended.");
      return;
    }
    _logger.i(LOG_TAG + "#suspendPlayer", "Releasing GPU resources and suspending video engine.");
    _hasSurface = false;
    releaseResources();
  }
  
  public void useRedirectedUrl(boolean paramBoolean)
  {
    try
    {
      _videoEngine.useRedirectedUrl(paramBoolean);
      return;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      _logger.e(LOG_TAG + "#useRedirectedUrl", "Not successful", localVideoEngineException);
    }
  }
  
  protected class VideoEnginePlaybackMetrics
    extends PlaybackMetrics
  {
    private static final int DEFAULT_TARGET_DURATION = 10000;
    private static final long READ_HEAD_DELTA = 0L;
    private long _clientLivePoint;
    private boolean _dispatchedBufferFull;
    private long _readHead;
    private long _savedBufferLength;
    
    protected VideoEnginePlaybackMetrics() {}
    
    private void checkAndDispatchBufferFullEvent()
    {
      if ((_dispatchedBufferFull) && (!hasAllDataBuffered()) && (_bufferLength <= _desiredBufferControlParameters.getPlayBufferTime()) && (_savedBufferLength != _bufferLength)) {
        _dispatchedBufferFull = false;
      }
      if (_dispatchedBufferFull) {}
      do
      {
        do
        {
          return;
          _dispatchedBufferFull = false;
          _savedBufferLength = _bufferLength;
        } while (!isBufferFull());
        _dispatchedBufferFull = true;
      } while (_videoEngineDispatcher == null);
      _videoEngineDispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.BUFFERING_FULL));
    }
    
    protected void doUpdate()
    {
      try
      {
        if (_videoEngine == null) {
          return;
        }
        if ((!_isSeeking) || (_desiredSeekPositon == null) || (_desiredSeekPositon.getTime() == -3L)) {
          break label545;
        }
        if (_desiredSeekPositon.getPeriod() != -1) {
          break label531;
        }
        _time = _desiredSeekPositon.getTime();
      }
      catch (VideoEngineException localVideoEngineException)
      {
        for (;;)
        {
          Timeline localTimeline;
          long l3;
          VideoEngineAdapter._logger.e(VideoEngineAdapter.LOG_TAG + "#doUpdate", "Unable to update metrics.", localVideoEngineException);
          Object localObject = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.GET_QOS_DATA_ERROR, "An error has occurred while attempting to retrieve the QOS information.");
          MetadataNode localMetadataNode = new MetadataNode();
          localMetadataNode.setValue("DESCRIPTION", localVideoEngineException.getMessage());
          ((MediaPlayerNotification.Error)localObject).setMetadata(localMetadataNode);
          if (_videoEngineDispatcher == null) {
            break;
          }
          _videoEngineDispatcher.dispatch(ErrorEvent.createVideoErrorEvent((MediaPlayerNotification.Error)localObject));
          return;
          label531:
          _time = VideoEngineAdapter.this.extractVirtualTime();
          continue;
          label545:
          _time = _videoEngine.getTime();
          continue;
          long l2 = virtualDuration;
          localObject = localVideoEngineException.getPeriodInfo(lastPeriodIndex);
          long l1 = l2;
          if (localObject != null)
          {
            l1 = l2;
            if (virtualStartTime + l2 > virtualStartTime + duration) {
              l1 = virtualStartTime + duration - virtualStartTime;
            }
          }
          _seekableRange = TimeRange.createRange(virtualStartTime, l1);
        }
      }
      _timeLocal = getLocalTime();
      _bufferLength = _videoEngine.getBufferLength();
      _readHead = (_time + _bufferLength + 0L);
      _bufferTime = _desiredBufferControlParameters.getPlayBufferTime();
      localTimeline = _videoEngine.getTimeline();
      if (localTimeline != null)
      {
        l1 = Math.min(_time, virtualStartTime);
        _playbackRange = TimeRange.createRange(l1, virtualStartTime - l1 + virtualDuration);
        if (complete == 0)
        {
          _clientLivePoint = _videoEngine.getClientLivePoint();
          if (_clientLivePoint >= virtualDuration + virtualStartTime) {
            VideoEngineAdapter._logger.i(VideoEngineAdapter.LOG_TAG + "#DEBUG", "Client live point = " + _clientLivePoint + " virtual start time = " + virtualStartTime + " virtual end time  = " + (virtualStartTime + virtualDuration));
          }
          l1 = _clientLivePoint;
          l2 = virtualStartTime;
          _seekableRange = TimeRange.createRange(virtualStartTime, l1 - l2);
          l1 = _videoEngine.getTime();
          l2 = _bufferLength;
          l3 = virtualStartTime;
          _bufferedRange = TimeRange.createRange(l1, Math.min(l2, virtualDuration + l3 - _videoEngine.getTime()));
        }
      }
      else
      {
        _frameRate = _videoEngine.getQosFrameRate();
        _droppedFramesCount = _videoEngine.getQosDroppedFrameCount();
        _bitrate = _lastKnownProfile;
        checkAndDispatchBufferFullEvent();
        return;
      }
    }
    
    public long getReadHead()
    {
      return _readHead;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoEngineAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */