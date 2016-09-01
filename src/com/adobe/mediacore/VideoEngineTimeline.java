package com.adobe.mediacore;

import android.os.Handler;
import com.adobe.ave.InsertionResult;
import com.adobe.ave.PeriodInfo;
import com.adobe.ave.Timeline;
import com.adobe.ave.VideoEngineException;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.AdSignalingMode;
import com.adobe.mediacore.metadata.BlackoutMetadata;
import com.adobe.mediacore.metadata.DefaultMetadataKeys;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.qos.metrics.PlaybackMetrics;
import com.adobe.mediacore.timeline.TimelineOperation;
import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdAsset;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdBreak.Type;
import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;
import com.adobe.mediacore.timeline.advertising.AdBreakRemoval;
import com.adobe.mediacore.timeline.advertising.AdPolicyMode;
import com.adobe.mediacore.timeline.advertising.ContentRemoval;
import com.adobe.mediacore.timeline.advertising.PlacementInformation;
import com.adobe.mediacore.timeline.advertising.PlacementInformation.Type;
import com.adobe.mediacore.utils.TimeRange;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

final class VideoEngineTimeline
{
  private static final int DELTA = 5;
  private static final int INSERTION_DELTA = 300;
  public static final int INVALID_CONTENT_ID = -1;
  private static final String LOG_TAG = "[PSDK]::" + VideoEngineTimeline.class.getSimpleName();
  private static final int READ_HEAD_DELTA = 10000;
  private static final Logger _logger = Log.getLogger(LOG_TAG);
  private final int START_AD_BREAK_ID = 3000;
  private List _acceptedAds;
  private long _acceptedReplaceDuration;
  private final List _adBreakPlacements = new ArrayList();
  private final Map _adBreaksPlacementToRemove = new HashMap();
  private final ContentCache _contentCache;
  private final ContentLoader _contentLoader;
  private VideoEngineContentMarkerCache _contentMarkerCache;
  private Runnable _executor;
  private Handler _handler;
  private TimeMapping _initialTimeMapping = TimeMapping.createInvalid();
  private List _insertedAds = new ArrayList();
  private final int _mainContentId;
  private MediaPlayerClient _mediaPlayerClient;
  private final MediaResource _mediaResource;
  private int _nextTimelineId = 3000;
  private final AdBreakManifestLoadCompleteListener _onAdBreakCompleteLoadListener = new VideoEngineTimeline.2(this);
  private AdBreakPlacement _processingAdBreakPlacement;
  private final VideoEngineAdapter _videoEngineAdapter;
  private final VideoEngineDispatcher _videoEngineDispatcher;
  
  public VideoEngineTimeline(VideoEngineDispatcher paramVideoEngineDispatcher, VideoEngineAdapter paramVideoEngineAdapter, MediaResource paramMediaResource, int paramInt, boolean paramBoolean)
  {
    if (paramVideoEngineDispatcher == null) {
      throw new IllegalArgumentException("Video engine dispatcher parameter must not be null.");
    }
    if (paramVideoEngineAdapter == null) {
      throw new IllegalArgumentException("Video engine parameter must not be null.");
    }
    _videoEngineDispatcher = paramVideoEngineDispatcher;
    if (paramBoolean) {
      _logger.i(LOG_TAG, "Content cache is enabled.");
    }
    for (_contentCache = new ContentMapCache();; _contentCache = new ContentNoCache())
    {
      _contentLoader = new ContentLoader(_videoEngineDispatcher, _contentCache);
      _videoEngineAdapter = paramVideoEngineAdapter;
      _mediaResource = paramMediaResource;
      _mainContentId = paramInt;
      initialise();
      clearAdBreakPlacement();
      return;
      _logger.i(LOG_TAG, "Content cache is disabled.");
    }
  }
  
  private void acceptAd(AdHandle paramAdHandle, Ad paramAd)
  {
    paramAdHandle = Ad.cloneAd(paramAd, paramAdHandle.getDuration(), _nextTimelineId);
    _acceptedAds.add(paramAdHandle);
  }
  
  private void add(AdBreakPlacement paramAdBreakPlacement)
  {
    synchronized (_adBreakPlacements)
    {
      _adBreakPlacements.add(paramAdBreakPlacement);
      return;
    }
  }
  
  private boolean adjusAdBreakPlacementPosition(AdBreakPlacement paramAdBreakPlacement, Ad paramAd)
    throws VideoEngineException
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramAd != null)
    {
      paramAd = getPeriod(paramAd.getId());
      bool1 = bool2;
      if (paramAd != null)
      {
        long l = paramAd.getVirtualTime();
        bool1 = bool2;
        if (paramAdBreakPlacement.getTime() != l)
        {
          _logger.i(LOG_TAG + "#adjusAdBreakPlacementPosition", "Adjusting ad break position from [" + paramAdBreakPlacement.getTime() + "] to [" + l + "].");
          paramAd = paramAdBreakPlacement.getPlacement();
          paramAdBreakPlacement.setPlacement(new PlacementInformation(paramAd.getType(), l, paramAd.getDuration()));
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  private long calculateAdsDuration(List paramList)
  {
    paramList = paramList.iterator();
    AdHandle localAdHandle;
    long l;
    for (int i = 0; paramList.hasNext(); i = (int)(localAdHandle.getDuration() + l))
    {
      localAdHandle = (AdHandle)paramList.next();
      l = i;
    }
    return i;
  }
  
  private long calculateFailoverReplaceDuration(long paramLong, AdHandle paramAdHandle)
  {
    long l = 0L;
    if ((paramLong > 0L) || (paramLong - paramAdHandle.getDuration() > 0L)) {
      l = paramLong - paramAdHandle.getDuration();
    }
    return l;
  }
  
  private void clearAdBreakPlacement()
  {
    _acceptedAds = null;
    _processingAdBreakPlacement = null;
  }
  
  private void endAdBreakPlacement()
  {
    AdBreakPlacement localAdBreakPlacement = _processingAdBreakPlacement;
    ??? = localAdBreakPlacement.getAdBreak();
    Object localObject4 = localAdBreakPlacement.getPlacement();
    int i;
    Object localObject6;
    label255:
    label437:
    label523:
    label563:
    Object localObject8;
    label721:
    Object localObject3;
    int j;
    label779:
    label835:
    int k;
    if (_acceptedAds.size() > 0)
    {
      i = 0;
      if (i < _acceptedAds.size()) {
        if (!((Ad)_acceptedAds.get(i)).isCustomAdMarker())
        {
          Object localObject1 = (Ad)_acceptedAds.get(i);
          long l2 = ((PlacementInformation)localObject4).getTime();
          long l1 = l2;
          if (localObject1 != null)
          {
            l1 = l2;
            if (((Ad)localObject1).getPrimaryAsset().getMediaResource().getUrl() != null)
            {
              localObject6 = getVirtualTimeFor((Ad)localObject1);
              l1 = l2;
              if (localObject6 != null)
              {
                l1 = ((Long)localObject6).longValue();
                _logger.i(LOG_TAG + "#endAdBreakPlacement", "PlacementInformation information is " + l1 + " for " + ((Ad)localObject1).getId());
              }
            }
          }
          localObject1 = new PlacementInformation(((PlacementInformation)localObject4).getType(), l1, ((PlacementInformation)localObject4).getDuration());
          localObject4 = AdBreak.createAdBreak(_acceptedAds, l1, _acceptedReplaceDuration, ((AdBreak)???).getTag());
          ((AdBreak)localObject4).setIsWatched(((AdBreak)???).isWatched());
          clearAdBreakPlacement();
          if (localObject4 != null)
          {
            localObject6 = new AdBreakPlacement((AdBreak)localObject4, (PlacementInformation)localObject1);
            add((AdBreakPlacement)localObject6);
            _videoEngineAdapter.getPlaybackMetrics().update();
            _logger.d(LOG_TAG + "#remove", "Seekable range is  = " + _videoEngineAdapter.getPlaybackMetrics().getSeekableRange().toString());
            _logger.d(LOG_TAG + "#remove", "Playback range is  = " + _videoEngineAdapter.getPlaybackMetrics().getPlaybackRange().toString());
          }
        }
        else
        {
          Object localObject7;
          for (;;)
          {
            synchronized (_adBreakPlacements)
            {
              Iterator localIterator = _adBreakPlacements.iterator();
              if (!localIterator.hasNext()) {
                break label1100;
              }
              localObject4 = (AdBreakPlacement)localIterator.next();
              if ((localObject4 != null) && (((AdBreakPlacement)localObject4).getAdBreak() != null)) {
                break label523;
              }
              _logger.w(LOG_TAG + "#endAdBreakPlacement", "Unable to retrieve valid Ad Break.");
            }
            i += 1;
            break;
            try
            {
              localObject7 = ((AdBreakPlacement)localObject4).getAdBreak().adsIterator();
              Ad localAd;
              do
              {
                if (!((Iterator)localObject7).hasNext()) {
                  break;
                }
                localAd = (Ad)((Iterator)localObject7).next();
              } while (localAd.isCustomAdMarker());
              if ((localAd != null) && (adjusAdBreakPlacementPosition((AdBreakPlacement)localObject4, localAd)))
              {
                localObject7 = ((AdBreakPlacement)localObject4).getAdBreak();
                localObject4 = ((AdBreak)localObject7).adsIterator();
                while (((Iterator)localObject4).hasNext())
                {
                  localObject8 = (Ad)((Iterator)localObject4).next();
                  if (!((Ad)localObject8).isCustomAdMarker())
                  {
                    i = getPeriod(((Ad)localObject8).getId()).getPeriodIndex();
                    localObject8 = _videoEngineAdapter.getRawTimeline();
                    ((Timeline)localObject8).clearPauseAtPeriodEnd(i - 1);
                    ((Timeline)localObject8).clearPauseAtPeriodEnd(i + 1);
                  }
                }
              }
            }
            catch (VideoEngineException localVideoEngineException)
            {
              _logger.w(LOG_TAG + "#endAdBreakPlacement", "A VideoEngineException occured while accessing the timeline", localVideoEngineException);
            }
          }
          ((AdBreak)localObject7).adsIterator();
          if (localVideoEngineException == null) {
            break label1171;
          }
          i = localVideoEngineException.getId();
          localObject8 = ((AdBreak)localObject7).adsIterator();
          localObject3 = null;
          while (((Iterator)localObject8).hasNext())
          {
            localObject4 = (Ad)((Iterator)localObject8).next();
            if (!((Ad)localObject4).isCustomAdMarker()) {
              localObject3 = localObject4;
            }
          }
          if (localObject3 == null) {
            break label1166;
          }
          j = ((Ad)localObject3).getId();
          localObject3 = ((AdBreak)localObject7).adsIterator();
          for (;;)
          {
            if (((Iterator)localObject3).hasNext()) {
              if (((Ad)((Iterator)localObject3).next()).getId() == j) {
                if (((Iterator)localObject3).hasNext())
                {
                  localObject3 = (Ad)((Iterator)localObject3).next();
                  localObject4 = ((AdBreak)localObject7).adsIterator();
                  if (((Iterator)localObject4).hasNext())
                  {
                    localObject4 = (Ad)((Iterator)localObject4).next();
                    if (((Ad)localObject4).isCustomAdMarker())
                    {
                      k = getPeriod(i).getPeriodIndex();
                      _videoEngineAdapter.getRawTimeline().setPauseAtPeriodEnd(k - 1, ((Ad)localObject4).getId());
                    }
                  }
                  k = i;
                  if (localObject3 != null)
                  {
                    k = getPeriod(j).getPeriodIndex();
                    _videoEngineAdapter.getRawTimeline().setPauseAtPeriodEnd(k, ((Ad)localObject3).getId());
                    k = i;
                  }
                  label933:
                  if (k != j)
                  {
                    localObject8 = ((AdBreak)localObject7).adsIterator();
                    for (;;)
                    {
                      if (((Iterator)localObject8).hasNext())
                      {
                        localObject3 = (Ad)((Iterator)localObject8).next();
                        if (((Ad)localObject3).getId() == k)
                        {
                          break label1197;
                          label979:
                          if (((Iterator)localObject8).hasNext())
                          {
                            localObject4 = (Ad)((Iterator)localObject8).next();
                            if (((Ad)localObject4).isCustomAdMarker())
                            {
                              label1009:
                              if (localObject4 == null) {
                                break label1200;
                              }
                              i = getPeriod(((Ad)localObject3).getId()).getPeriodIndex();
                              _videoEngineAdapter.getRawTimeline().setPauseAtPeriodEnd(i, ((Ad)localObject4).getId());
                              break label1200;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    label1100:
    label1166:
    label1171:
    label1197:
    label1200:
    for (;;)
    {
      if (((Iterator)localObject8).hasNext())
      {
        localObject4 = (Ad)((Iterator)localObject8).next();
        localObject3 = localObject4;
        if (!((Ad)localObject4).isCustomAdMarker()) {
          localObject3 = localObject4;
        }
      }
      else
      {
        k = ((Ad)localObject3).getId();
        break label933;
        break label437;
        localObject3 = localObject4;
        break label979;
        _videoEngineDispatcher.dispatch(AdBreakPlacementEvent.createPlacementCompletedEvent(localAdBreakPlacement, (AdBreakPlacement)localObject6));
        _videoEngineDispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.TIMELINE_UPDATED));
        return;
        _videoEngineDispatcher.dispatch(AdBreakPlacementEvent.createPlacementFailedEvent(localAdBreakPlacement));
        return;
        localObject4 = null;
        break label1009;
        localObject3 = null;
        break label1197;
        localObject3 = null;
        break label835;
        j = -1;
        break label779;
        i = -1;
        break label721;
        localObject3 = null;
        break label563;
        localObject3 = null;
        break;
        localObject3 = null;
        localObject4 = null;
        break label255;
        break label979;
      }
    }
  }
  
  private void generateInsertedAds()
  {
    _insertedAds = new ArrayList();
    if (_contentCache != null)
    {
      Iterator localIterator = _adBreakPlacements.iterator();
      int i = 0;
      while (localIterator.hasNext())
      {
        Object localObject1 = (AdBreakPlacement)localIterator.next();
        if (localObject1 != null)
        {
          Object localObject2 = ((AdBreakPlacement)localObject1).getPlacement();
          localObject1 = ((AdBreakPlacement)localObject1).getAdBreak().adsIterator();
          long l = 0L;
          if (localObject2 != null) {
            l = ((PlacementInformation)localObject2).getDuration();
          }
          while (((Iterator)localObject1).hasNext())
          {
            localObject2 = (Ad)((Iterator)localObject1).next();
            if ((localObject2 != null) && (((Ad)localObject2).getPrimaryAsset() != null) && (((Ad)localObject2).getPrimaryAsset().getMediaResource() != null))
            {
              AdHandle localAdHandle = _contentCache.getHandle(((Ad)localObject2).getPrimaryAsset().getMediaResource().getUrl());
              if ((localAdHandle != null) && (_videoEngineAdapter != null))
              {
                TimeMapping localTimeMapping = getAdTimeMapping(((Ad)localObject2).getId());
                if (!localTimeMapping.isInvalid())
                {
                  localObject2 = new InsertedAd(i, localTimeMapping, localAdHandle, (Ad)localObject2, l);
                  _insertedAds.add(localObject2);
                }
              }
            }
          }
          i += 1;
        }
      }
    }
    _logger.i(LOG_TAG + "#generateInsertedAds", "InsertedAds List size = " + _insertedAds.size());
  }
  
  private TimeMapping getAdTimeMapping(int paramInt)
  {
    try
    {
      Timeline localTimeline = _videoEngineAdapter.getRawTimeline();
      if (localTimeline == null) {
        return TimeMapping.createInvalid();
      }
      int j = firstPeriodIndex;
      int i = 0;
      if (j <= lastPeriodIndex)
      {
        PeriodInfo localPeriodInfo = localTimeline.getPeriodInfo(j);
        if ((localPeriodInfo != null) && (userData == paramInt))
        {
          long l = _videoEngineAdapter.convertToLocalTime(virtualStartTime);
          if (i != 0) {
            return TimeMapping.create(j, l);
          }
          if (j - 1 >= 0) {
            return TimeMapping.create(j - 1, l);
          }
          return TimeMapping.create(j, l);
        }
        if (localPeriodInfo != null)
        {
          i = userData;
          int k = _mainContentId;
          if (i == k) {}
        }
        for (i = 1;; i = 0)
        {
          j += 1;
          break;
        }
      }
      return TimeMapping.createInvalid();
    }
    catch (VideoEngineException localVideoEngineException)
    {
      _logger.w(LOG_TAG + "#getAdTimeMapping", "Exception raised while getting ad timemapping. {" + localVideoEngineException.getErrorCode() + "," + localVideoEngineException.getDetailMessage() + "}");
      return TimeMapping.createInvalid();
    }
  }
  
  private TimeMapping getAdjustedPlacementTimeMapping(TimeMapping paramTimeMapping)
  {
    try
    {
      Object localObject = _videoEngineAdapter.getRawTimeline();
      TimeMapping localTimeMapping = paramTimeMapping;
      if (localObject != null)
      {
        int i = paramTimeMapping.getPeriod();
        localTimeMapping = paramTimeMapping;
        if (i != -1)
        {
          localObject = ((Timeline)localObject).getPeriodInfo(paramTimeMapping.getPeriod());
          long l = paramTimeMapping.getTime() - localStartTime;
          _logger.i(LOG_TAG + "#getAdjustedPlacementTimeMapping", "Diff between proposed position and period local start: " + l);
          localTimeMapping = paramTimeMapping;
          if (l > 2L)
          {
            localTimeMapping = paramTimeMapping;
            if (l <= 300L)
            {
              _logger.i(LOG_TAG + "#getAdjustedPlacementTimeMapping", "Adjust Insertion position from " + paramTimeMapping.getTime() + " to " + localStartTime);
              localTimeMapping = TimeMapping.create(i, localStartTime);
            }
          }
        }
      }
      return localTimeMapping;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      _logger.w(LOG_TAG + "#getAdjustedPlacementTimeMapping", "Exception raised while adjusting placement time mapping. {" + localVideoEngineException.getErrorCode() + "," + localVideoEngineException.getDetailMessage() + "}");
    }
    return paramTimeMapping;
  }
  
  private TimeMapping getAdjustedTimeMapping(long paramLong)
  {
    long l = paramLong;
    if (paramLong > 2147483647L) {
      l = 2147483647L;
    }
    return mapLocalTime(l);
  }
  
  private TimeMapping getNextTimeMapping(int paramInt)
  {
    try
    {
      Object localObject = _videoEngineAdapter.getRawTimeline();
      if (localObject != null)
      {
        if (paramInt < lastPeriodIndex) {
          return new TimeMapping(paramInt + 1, 0L, null);
        }
        PeriodInfo localPeriodInfo = ((Timeline)localObject).getPeriodInfo(lastPeriodIndex);
        localObject = new TimeMapping(lastPeriodIndex, duration + 5L, null);
        return (TimeMapping)localObject;
      }
    }
    catch (VideoEngineException localVideoEngineException)
    {
      _logger.w(LOG_TAG + "#getNextTimeMapping", "Could not create time mapping for ad insertion.");
    }
    return null;
  }
  
  private int getNextTimelineId()
  {
    try
    {
      int i = _nextTimelineId;
      _nextTimelineId = (i + 1);
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  private TimeRange[] getNonSeekableRanges()
  {
    if ((_mediaResource != null) && (_mediaResource.getMetadata() != null) && ((_mediaResource.getMetadata() instanceof MetadataNode)))
    {
      Object localObject = (MetadataNode)_mediaResource.getMetadata();
      if ((localObject != null) && (((MetadataNode)localObject).containsKey(DefaultMetadataKeys.BLACKOUT_METADATA_KEY.getValue())))
      {
        localObject = (BlackoutMetadata)((MetadataNode)localObject).getNode(DefaultMetadataKeys.BLACKOUT_METADATA_KEY.getValue());
        if (localObject != null) {
          return ((BlackoutMetadata)localObject).getNonSeekableRanges();
        }
      }
    }
    return null;
  }
  
  private Period getPeriod(int paramInt)
    throws VideoEngineException
  {
    Timeline localTimeline = _videoEngineAdapter.getRawTimeline();
    int i = firstPeriodIndex;
    while (i <= lastPeriodIndex)
    {
      PeriodInfo localPeriodInfo = localTimeline.getPeriodInfo(i);
      if ((localPeriodInfo != null) && (userData == paramInt)) {
        return new Period(i, localPeriodInfo);
      }
      i += 1;
    }
    return null;
  }
  
  private Long getVirtualTimeFor(Ad paramAd)
  {
    try
    {
      Timeline localTimeline = _videoEngineAdapter.getRawTimeline();
      int i = firstPeriodIndex;
      while (i <= lastPeriodIndex)
      {
        PeriodInfo localPeriodInfo = localTimeline.getPeriodInfo(i);
        if ((localPeriodInfo != null) && (userData == paramAd.getId()))
        {
          long l = virtualStartTime;
          return Long.valueOf(l);
        }
        i += 1;
      }
      return null;
    }
    catch (VideoEngineException paramAd)
    {
      _logger.w(LOG_TAG + "#getVirtualTimeFor", "Exception raised while trying to access the timeline ", paramAd);
    }
  }
  
  private void initialise()
  {
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.AD_BREAK_MANIFEST_LOAD_COMPLETE, _onAdBreakCompleteLoadListener);
    _handler = new Handler();
    _executor = new VideoEngineTimeline.1(this);
  }
  
  private boolean isLive()
  {
    boolean bool2 = false;
    try
    {
      Timeline localTimeline = _videoEngineAdapter.getRawTimeline();
      boolean bool1 = bool2;
      if (localTimeline != null)
      {
        bool1 = bool2;
        if (complete == 0) {
          bool1 = true;
        }
      }
      return bool1;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      _logger.w(LOG_TAG + "#isLive", "Could not obtain timeline from VideoEngine ", localVideoEngineException);
    }
    return false;
  }
  
  private boolean isWithinBounds(long paramLong1, long paramLong2)
  {
    boolean bool2 = false;
    try
    {
      Timeline localTimeline = _videoEngineAdapter.getRawTimeline();
      long l1 = getPeriodInfofirstPeriodIndex).localStartTime;
      long l2 = getPeriodInfolastPeriodIndex).localStartTime;
      long l3 = getPeriodInfolastPeriodIndex).duration;
      l2 += l3;
      boolean bool1 = bool2;
      if (paramLong1 >= l1)
      {
        bool1 = bool2;
        if (paramLong1 < l2)
        {
          bool1 = bool2;
          if (paramLong2 > l1)
          {
            bool1 = bool2;
            if (paramLong2 <= l2) {
              bool1 = true;
            }
          }
        }
      }
      return bool1;
    }
    catch (VideoEngineException localVideoEngineException) {}
    return false;
  }
  
  private void loadAds()
  {
    _logger.i(LOG_TAG + "#loadAds", "Starting to load ad manifests for adBreak = " + _processingAdBreakPlacement.getAdBreak().toString());
    int i = 0;
    for (;;)
    {
      try
      {
        Timeline localTimeline = _videoEngineAdapter.getRawTimeline();
        if (localTimeline == null) {
          continue;
        }
        _contentLoader.setVideoEngineTimeline(localTimeline);
        i = 1;
      }
      catch (VideoEngineException localVideoEngineException)
      {
        _logger.w(LOG_TAG + "#loadAds", "Exception raised while trying to access the video engine timeline { code = " + localVideoEngineException.getErrorCode() + ", description = " + localVideoEngineException.getDetailMessage() + "}");
        continue;
        _logger.w(LOG_TAG + "#loadAds", "Timeline retrieve from the VideoEngine is invalid. Ending ad break placement");
        endAdBreakPlacement();
      }
      if (i == 0) {
        continue;
      }
      _handler.post(_executor);
      return;
      _logger.w(LOG_TAG + "#loadAds", "Timeline received on the from the video engine is null");
    }
  }
  
  private TimeMapping mapLocalTime(long paramLong)
  {
    PeriodInfo localPeriodInfo1;
    try
    {
      Object localObject = _videoEngineAdapter.getRawTimeline();
      if (localObject == null) {
        return TimeMapping.createInvalid();
      }
      localPeriodInfo1 = ((Timeline)localObject).getPeriodInfo(lastPeriodIndex);
      if ((localPeriodInfo1 != null) && (paramLong >= _videoEngineAdapter.convertToLocalTime(virtualStartTime + duration)))
      {
        localObject = new TimeMapping(lastPeriodIndex, paramLong, null);
        return (TimeMapping)localObject;
      }
    }
    catch (VideoEngineException localVideoEngineException)
    {
      _logger.w(LOG_TAG + "#mapLocalTime", "Exception raised while mapping time on timeline. {" + localVideoEngineException.getErrorCode() + "," + localVideoEngineException.getDetailMessage() + "}");
      return TimeMapping.createInvalid();
    }
    int j = firstPeriodIndex;
    int k = lastPeriodIndex;
    for (;;)
    {
      if (j < k + 1)
      {
        PeriodInfo localPeriodInfo2 = localVideoEngineException.getPeriodInfo(j);
        if ((localPeriodInfo2 == null) || (userData != _mainContentId)) {
          break label291;
        }
        long l1 = localStartTime;
        long l2 = duration;
        i = j;
        if (paramLong >= l1) {
          if ((l1 > paramLong) || (paramLong >= l2 + l1)) {
            break label291;
          }
        }
      }
      for (int i = j;; i = -1)
      {
        j = i;
        if (i == -1)
        {
          if (localPeriodInfo1 != null) {
            return TimeMapping.createInvalid();
          }
          j = lastPeriodIndex;
        }
        return new TimeMapping(j, paramLong, null);
      }
      label291:
      j += 1;
    }
  }
  
  private void placeAdBreak(List paramList1, List paramList2)
  {
    _logger.i(LOG_TAG + "#placeAdBreak", "Ad break placement process starting.");
    long l1 = calculateAdsDuration(paramList2);
    long l2 = _processingAdBreakPlacement.getPlacement().getDuration();
    if (l2 != 0L) {}
    for (;;)
    {
      _acceptedReplaceDuration = l1;
      TimeMapping localTimeMapping;
      int k;
      int j;
      int m;
      int i;
      label142:
      Object localObject;
      if ((_processingAdBreakPlacement.getPlacement().getType().equals(PlacementInformation.Type.PRE_ROLL)) && (!_initialTimeMapping.isInvalid()))
      {
        localTimeMapping = getAdjustedTimeMapping(_initialTimeMapping.getTime());
        k = 1;
        if (localTimeMapping.isInvalid()) {
          endAdBreakPlacement();
        }
        localTimeMapping = getAdjustedPlacementTimeMapping(localTimeMapping);
        j = localTimeMapping.getPeriod();
        m = 0;
        i = 0;
        if (m >= paramList1.size()) {
          break label800;
        }
        localObject = (Ad)paramList1.get(m);
        if (!((Ad)localObject).isCustomAdMarker()) {
          break label453;
        }
        localObject = Ad.cloneAd((Ad)localObject, ((Ad)localObject).getDuration(), _nextTimelineId);
        _acceptedAds.add(localObject);
        _nextTimelineId += 1;
        if (paramList2.size() <= 0) {
          break label347;
        }
        n = 1;
        label224:
        if (n == 0) {}
      }
      for (;;)
      {
        try
        {
          localObject = _videoEngineAdapter.getRawTimeline();
          if (localObject != null)
          {
            if ((k == 0) || (j == 0)) {
              continue;
            }
            ((Timeline)localObject).setPauseAtPeriodEnd(j - 1, _nextTimelineId - 1);
            _logger.i(LOG_TAG + "#placeContent", "Adding the Pause at the end of Period :" + j);
          }
        }
        catch (VideoEngineException localVideoEngineException)
        {
          label347:
          _logger.w(LOG_TAG + "#placeContent", "Exception raised while placing Pause at Period End. {" + localVideoEngineException.getErrorCode() + "," + localVideoEngineException.getDetailMessage() + "}");
          continue;
        }
        m += 1;
        break label142;
        localTimeMapping = getAdjustedTimeMapping(_processingAdBreakPlacement.getTime());
        k = 0;
        break;
        n = 0;
        break label224;
        if (k == 0) {
          ((Timeline)localObject).setPauseAtPeriodEnd(j, _nextTimelineId - 1);
        }
      }
      label453:
      AdHandle localAdHandle = (AdHandle)paramList2.get(i);
      int n = placeContent(localTimeMapping, localAdHandle.getHandle(), _nextTimelineId, l1);
      _logger.i(LOG_TAG + "#placeAdBreak", "Placecontent: time=" + localTimeMapping.toString() + ", adHandle=" + localAdHandle + ", replaceDuration=" + l1);
      if (n != -1)
      {
        _logger.i(LOG_TAG + "#placeAdBreak", "Ad inserted at period " + n + " with contentId = " + _nextTimelineId + " url = " + localVideoEngineException.getPrimaryAsset().getMediaResource().getUrl());
        acceptAd(localAdHandle, localVideoEngineException);
        localTimeMapping = getNextTimeMapping(n);
        _nextTimelineId += 1;
        j += 1;
        l1 = 0L;
      }
      for (;;)
      {
        i += 1;
        break;
        _logger.i(LOG_TAG + "#placeAdBreak", "Ad insertion failed for contentId = " + _nextTimelineId + " url = " + localVideoEngineException.getPrimaryAsset().getMediaResource().getUrl());
        removeContent(_nextTimelineId, true);
        l1 = calculateFailoverReplaceDuration(l1, localAdHandle);
        _acceptedReplaceDuration = l1;
        j -= 1;
      }
      label800:
      endAdBreakPlacement();
      return;
      l1 = l2;
    }
  }
  
  private int placeContent(TimeMapping paramTimeMapping, int paramInt1, int paramInt2, long paramLong)
  {
    try
    {
      Timeline localTimeline = _videoEngineAdapter.getRawTimeline();
      if (localTimeline != null)
      {
        _logger.i(LOG_TAG + "#placeContent", "Placing content at " + paramTimeMapping.toString() + " for handle " + paramInt1 + " contentId = " + paramInt2 + " replaceDuration = " + paramLong);
        paramTimeMapping = localTimeline.insertByLocalTime(paramTimeMapping.getPeriod(), paramTimeMapping.getTime(), paramInt1, paramInt2, paramLong);
        if (paramTimeMapping == null) {
          return -1;
        }
        paramInt1 = periodIndex;
        return paramInt1;
      }
    }
    catch (VideoEngineException paramTimeMapping)
    {
      _logger.w(LOG_TAG + "#placeContent", "Exception raised while placing content. {" + paramTimeMapping.getErrorCode() + "," + paramTimeMapping.getDetailMessage() + "}");
    }
    return -1;
  }
  
  static void printTimeline(Timeline paramTimeline)
  {
    _logger.i(LOG_TAG + "#printTimeline", "Showing the AVE timeline:");
    if (paramTimeline == null) {
      _logger.w(LOG_TAG + "#printTimeline", "Invalid AVE timeline");
    }
    for (;;)
    {
      return;
      try
      {
        int i = firstPeriodIndex;
        while (i <= lastPeriodIndex)
        {
          PeriodInfo localPeriodInfo = paramTimeline.getPeriodInfo(i);
          if (localPeriodInfo != null) {
            _logger.i(LOG_TAG + "#printTimeline", "> " + i + " vStart: " + virtualStartTime + " lStart: " + localStartTime + " - duration: " + duration + " contentId: " + userData);
          }
          i += 1;
        }
        return;
      }
      catch (VideoEngineException paramTimeline)
      {
        _logger.w(LOG_TAG + "#printTimeline", "Exception raised while accessing the video engine timeline{ code = " + String.valueOf(paramTimeline.getErrorCode()) + ", message = " + String.valueOf(paramTimeline.getDetailMessage()) + "}");
      }
    }
  }
  
  private boolean processCustomMarkers()
  {
    Iterator localIterator = _processingAdBreakPlacement.getAdBreak().adsIterator();
    long l1 = 0L;
    boolean bool = false;
    while (localIterator.hasNext())
    {
      Ad localAd = (Ad)localIterator.next();
      if (localAd.getPrimaryAsset().getMediaResource().getUrl() != null) {
        break label344;
      }
      int i = getNextTimelineId();
      long l2 = localAd.getDuration();
      TimeMapping localTimeMapping = getAdjustedTimeMapping(_processingAdBreakPlacement.getAdBreak().getTime() + l1);
      if (!localTimeMapping.isInvalid())
      {
        long l3 = _processingAdBreakPlacement.getAdBreak().getTime();
        long l4 = l3 + l2;
        if (!isWithinBounds(l3, l4)) {
          _logger.w(LOG_TAG + "#processCustomMarkers", "Invalid TimeRange [" + l3 + ", " + l4 + "], 'begin' or 'end' value is out of bounds of stream");
        }
        if (!placeContentMarker(localTimeMapping, i, l2)) {
          break label344;
        }
        localAd = Ad.cloneAd(localAd, l2, i);
        _logger.i(LOG_TAG + "#placeAd", "Placing custom ad-marker in " + String.valueOf(localTimeMapping.toString()) + " with replacement duration [" + 0L + "]. " + localAd.toString());
        _acceptedAds.add(localAd);
        l1 += l2;
        bool = true;
      }
    }
    label344:
    for (;;)
    {
      break;
      if (bool)
      {
        getAdjustedTimeMapping(l1 + _processingAdBreakPlacement.getAdBreak().getTime());
        endAdBreakPlacement();
      }
      return bool;
    }
  }
  
  private void removeByLocalTime(TimelineOperation paramTimelineOperation)
  {
    _logger.d(LOG_TAG + "#removeByLocalTime", "Starting to remove the AdBreak by local time");
    Object localObject1 = ((AdBreakRemoval)paramTimelineOperation).getAdBreak();
    Object localObject2 = ((AdBreak)localObject1).adsIterator();
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = new ArrayList();
    _logger.d(LOG_TAG + "#removeByLocalTime", "Seekable range is  = " + _videoEngineAdapter.getPlaybackMetrics().getSeekableRange().toString());
    _logger.d(LOG_TAG + "#removeByLocalTime", "Playback range is  = " + _videoEngineAdapter.getPlaybackMetrics().getPlaybackRange().toString());
    Object localObject3;
    while (((Iterator)localObject2).hasNext())
    {
      localObject3 = (Ad)((Iterator)localObject2).next();
      if (((AdBreak)localObject1).getReplaceDuration() != 0L) {}
      for (boolean bool = true;; bool = false)
      {
        _logger.d(LOG_TAG + "#removeByLocalTime", "Removing the content with id = " + ((Ad)localObject3).getId() + " and replace content is set to " + bool);
        if (!removeContent(((Ad)localObject3).getId(), bool)) {
          break label377;
        }
        _logger.d(LOG_TAG + "#removeByLocalTime", "Removing the content with id = " + ((Ad)localObject3).getId() + " succeded");
        localArrayList1.add(localObject3);
        break;
      }
      label377:
      localArrayList2.add(localObject3);
      _logger.w(LOG_TAG + "#removeByLocalTime", "Removing the content with id = " + ((Ad)localObject3).getId() + " failed");
      MediaPlayerNotification.Warning localWarning = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.GENERIC_WARNING, "Failed to remove content from timeline");
      MetadataNode localMetadataNode = new MetadataNode();
      localMetadataNode.setValue("AD_BREAK", ((AdBreakRemoval)paramTimelineOperation).getAdBreak().toString());
      localMetadataNode.setValue("AD", ((Ad)localObject3).toString());
      localWarning.setMetadata(localMetadataNode);
      _videoEngineDispatcher.dispatch(OperationFailedEvent.createEvent(localWarning));
    }
    _videoEngineAdapter.getPlaybackMetrics().update();
    _logger.d(LOG_TAG + "#removeByLocalTime", "Seekable range is  = " + _videoEngineAdapter.getPlaybackMetrics().getSeekableRange().toString());
    _logger.d(LOG_TAG + "#removeByLocalTime", "Playback range is  = " + _videoEngineAdapter.getPlaybackMetrics().getPlaybackRange().toString());
    label808:
    for (;;)
    {
      try
      {
        printTimeline(_videoEngineAdapter.getRawTimeline());
        localObject1 = null;
        localObject3 = _adBreakPlacements.iterator();
        if (((Iterator)localObject3).hasNext())
        {
          localObject2 = (AdBreakPlacement)((Iterator)localObject3).next();
          if (!((AdBreakPlacement)localObject2).getPlacement().equals(paramTimelineOperation.getPlacement())) {
            break label808;
          }
          localObject1 = localObject2;
        }
      }
      catch (VideoEngineException localVideoEngineException)
      {
        _logger.d(LOG_TAG + "#removeByLocalTime", "Unable to retrieve thet timeline in order to print the timeline");
        continue;
        if (updateAdBreakPlacement(localArrayList2, localArrayList1, localVideoEngineException)) {
          _videoEngineDispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.TIMELINE_UPDATED));
        }
        _videoEngineDispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.ADBREAK_REMOVAL_COMPLETED));
        return;
      }
    }
  }
  
  /* Error */
  private void removeByVirtualTime(TimelineOperation paramTimelineOperation)
  {
    // Byte code:
    //   0: iconst_m1
    //   1: istore_3
    //   2: getstatic 93	com/adobe/mediacore/VideoEngineTimeline:_logger	Lcom/adobe/mediacore/logging/Logger;
    //   5: new 65	java/lang/StringBuilder
    //   8: dup
    //   9: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   12: getstatic 85	com/adobe/mediacore/VideoEngineTimeline:LOG_TAG	Ljava/lang/String;
    //   15: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   18: ldc_w 853
    //   21: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   24: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   27: ldc_w 855
    //   30: invokeinterface 382 3 0
    //   35: aload_1
    //   36: checkcast 784	com/adobe/mediacore/timeline/advertising/AdBreakRemoval
    //   39: invokevirtual 785	com/adobe/mediacore/timeline/advertising/AdBreakRemoval:getAdBreak	()Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    //   42: astore 11
    //   44: aload 11
    //   46: invokevirtual 395	com/adobe/mediacore/timeline/advertising/AdBreak:adsIterator	()Ljava/util/Iterator;
    //   49: astore 10
    //   51: aload 10
    //   53: invokeinterface 279 1 0
    //   58: ifeq +956 -> 1014
    //   61: aload 10
    //   63: invokeinterface 283 1 0
    //   68: checkcast 183	com/adobe/mediacore/timeline/advertising/Ad
    //   71: astore_1
    //   72: aload_1
    //   73: invokevirtual 299	com/adobe/mediacore/timeline/advertising/Ad:isCustomAdMarker	()Z
    //   76: ifne -25 -> 51
    //   79: aload_1
    //   80: ifnull +929 -> 1009
    //   83: aload_1
    //   84: invokevirtual 225	com/adobe/mediacore/timeline/advertising/Ad:getId	()I
    //   87: istore_2
    //   88: aload 11
    //   90: invokevirtual 395	com/adobe/mediacore/timeline/advertising/AdBreak:adsIterator	()Ljava/util/Iterator;
    //   93: astore 12
    //   95: aconst_null
    //   96: astore_1
    //   97: aload 12
    //   99: invokeinterface 279 1 0
    //   104: ifeq +29 -> 133
    //   107: aload 12
    //   109: invokeinterface 283 1 0
    //   114: checkcast 183	com/adobe/mediacore/timeline/advertising/Ad
    //   117: astore 10
    //   119: aload 10
    //   121: invokevirtual 299	com/adobe/mediacore/timeline/advertising/Ad:isCustomAdMarker	()Z
    //   124: ifne -27 -> 97
    //   127: aload 10
    //   129: astore_1
    //   130: goto -33 -> 97
    //   133: aload_1
    //   134: ifnull +8 -> 142
    //   137: aload_1
    //   138: invokevirtual 225	com/adobe/mediacore/timeline/advertising/Ad:getId	()I
    //   141: istore_3
    //   142: iconst_0
    //   143: istore 5
    //   145: getstatic 93	com/adobe/mediacore/VideoEngineTimeline:_logger	Lcom/adobe/mediacore/logging/Logger;
    //   148: new 65	java/lang/StringBuilder
    //   151: dup
    //   152: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   155: getstatic 85	com/adobe/mediacore/VideoEngineTimeline:LOG_TAG	Ljava/lang/String;
    //   158: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   161: ldc_w 853
    //   164: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   167: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   170: new 65	java/lang/StringBuilder
    //   173: dup
    //   174: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   177: ldc_w 372
    //   180: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   183: aload_0
    //   184: getfield 158	com/adobe/mediacore/VideoEngineTimeline:_videoEngineAdapter	Lcom/adobe/mediacore/VideoEngineAdapter;
    //   187: invokevirtual 363	com/adobe/mediacore/VideoEngineAdapter:getPlaybackMetrics	()Lcom/adobe/mediacore/qos/metrics/PlaybackMetrics;
    //   190: invokevirtual 376	com/adobe/mediacore/qos/metrics/PlaybackMetrics:getSeekableRange	()Lcom/adobe/mediacore/utils/TimeRange;
    //   193: invokevirtual 379	com/adobe/mediacore/utils/TimeRange:toString	()Ljava/lang/String;
    //   196: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   199: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   202: invokeinterface 382 3 0
    //   207: getstatic 93	com/adobe/mediacore/VideoEngineTimeline:_logger	Lcom/adobe/mediacore/logging/Logger;
    //   210: new 65	java/lang/StringBuilder
    //   213: dup
    //   214: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   217: getstatic 85	com/adobe/mediacore/VideoEngineTimeline:LOG_TAG	Ljava/lang/String;
    //   220: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   223: ldc_w 853
    //   226: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   229: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   232: new 65	java/lang/StringBuilder
    //   235: dup
    //   236: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   239: ldc_w 384
    //   242: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   245: aload_0
    //   246: getfield 158	com/adobe/mediacore/VideoEngineTimeline:_videoEngineAdapter	Lcom/adobe/mediacore/VideoEngineAdapter;
    //   249: invokevirtual 363	com/adobe/mediacore/VideoEngineAdapter:getPlaybackMetrics	()Lcom/adobe/mediacore/qos/metrics/PlaybackMetrics;
    //   252: invokevirtual 387	com/adobe/mediacore/qos/metrics/PlaybackMetrics:getPlaybackRange	()Lcom/adobe/mediacore/utils/TimeRange;
    //   255: invokevirtual 379	com/adobe/mediacore/utils/TimeRange:toString	()Ljava/lang/String;
    //   258: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   261: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   264: invokeinterface 382 3 0
    //   269: aload_0
    //   270: iload_2
    //   271: invokespecial 229	com/adobe/mediacore/VideoEngineTimeline:getPeriod	(I)Lcom/adobe/mediacore/VideoEngineTimeline$Period;
    //   274: astore_1
    //   275: aload_0
    //   276: iload_3
    //   277: invokespecial 229	com/adobe/mediacore/VideoEngineTimeline:getPeriod	(I)Lcom/adobe/mediacore/VideoEngineTimeline$Period;
    //   280: astore 10
    //   282: iload 5
    //   284: istore 4
    //   286: aload_1
    //   287: ifnull +117 -> 404
    //   290: iload 5
    //   292: istore 4
    //   294: aload 10
    //   296: ifnull +108 -> 404
    //   299: aload_0
    //   300: aload_1
    //   301: invokevirtual 232	com/adobe/mediacore/VideoEngineTimeline$Period:getVirtualTime	()J
    //   304: aload 10
    //   306: invokevirtual 232	com/adobe/mediacore/VideoEngineTimeline$Period:getVirtualTime	()J
    //   309: aload 10
    //   311: invokevirtual 856	com/adobe/mediacore/VideoEngineTimeline$Period:getDuration	()J
    //   314: ladd
    //   315: invokespecial 859	com/adobe/mediacore/VideoEngineTimeline:removeContentByVirtualTime	(JJ)Z
    //   318: istore 4
    //   320: getstatic 93	com/adobe/mediacore/VideoEngineTimeline:_logger	Lcom/adobe/mediacore/logging/Logger;
    //   323: new 65	java/lang/StringBuilder
    //   326: dup
    //   327: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   330: getstatic 85	com/adobe/mediacore/VideoEngineTimeline:LOG_TAG	Ljava/lang/String;
    //   333: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   336: ldc_w 853
    //   339: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   342: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   345: new 65	java/lang/StringBuilder
    //   348: dup
    //   349: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   352: ldc_w 861
    //   355: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   358: aload_1
    //   359: invokevirtual 232	com/adobe/mediacore/VideoEngineTimeline$Period:getVirtualTime	()J
    //   362: invokestatic 864	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   365: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   368: ldc -10
    //   370: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   373: aload 10
    //   375: invokevirtual 232	com/adobe/mediacore/VideoEngineTimeline$Period:getVirtualTime	()J
    //   378: aload 10
    //   380: invokevirtual 856	com/adobe/mediacore/VideoEngineTimeline$Period:getDuration	()J
    //   383: ladd
    //   384: invokestatic 864	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   387: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   390: ldc_w 866
    //   393: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   396: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   399: invokeinterface 144 3 0
    //   404: iload 4
    //   406: ifeq +553 -> 959
    //   409: aload_0
    //   410: getfield 103	com/adobe/mediacore/VideoEngineTimeline:_adBreakPlacements	Ljava/util/List;
    //   413: astore 12
    //   415: aload 12
    //   417: monitorenter
    //   418: aload_0
    //   419: getfield 103	com/adobe/mediacore/VideoEngineTimeline:_adBreakPlacements	Ljava/util/List;
    //   422: invokeinterface 273 1 0
    //   427: astore 13
    //   429: aconst_null
    //   430: astore_1
    //   431: aload 13
    //   433: invokeinterface 279 1 0
    //   438: ifeq +90 -> 528
    //   441: aload 13
    //   443: invokeinterface 283 1 0
    //   448: checkcast 234	com/adobe/mediacore/timeline/advertising/AdBreakPlacement
    //   451: astore 10
    //   453: aload 11
    //   455: invokevirtual 753	com/adobe/mediacore/timeline/advertising/AdBreak:getTime	()J
    //   458: lstore 6
    //   460: aload 10
    //   462: invokevirtual 289	com/adobe/mediacore/timeline/advertising/AdBreakPlacement:getAdBreak	()Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    //   465: invokevirtual 753	com/adobe/mediacore/timeline/advertising/AdBreak:getTime	()J
    //   468: lstore 8
    //   470: lload 6
    //   472: lload 8
    //   474: lcmp
    //   475: ifne +531 -> 1006
    //   478: aload 10
    //   480: astore_1
    //   481: goto -50 -> 431
    //   484: astore_1
    //   485: iconst_0
    //   486: istore 4
    //   488: getstatic 93	com/adobe/mediacore/VideoEngineTimeline:_logger	Lcom/adobe/mediacore/logging/Logger;
    //   491: new 65	java/lang/StringBuilder
    //   494: dup
    //   495: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   498: getstatic 85	com/adobe/mediacore/VideoEngineTimeline:LOG_TAG	Ljava/lang/String;
    //   501: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   504: ldc_w 853
    //   507: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   510: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   513: ldc_w 868
    //   516: invokeinterface 382 3 0
    //   521: aload_1
    //   522: invokevirtual 871	com/adobe/ave/VideoEngineException:printStackTrace	()V
    //   525: goto -121 -> 404
    //   528: aload_1
    //   529: ifnull +70 -> 599
    //   532: getstatic 93	com/adobe/mediacore/VideoEngineTimeline:_logger	Lcom/adobe/mediacore/logging/Logger;
    //   535: new 65	java/lang/StringBuilder
    //   538: dup
    //   539: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   542: getstatic 85	com/adobe/mediacore/VideoEngineTimeline:LOG_TAG	Ljava/lang/String;
    //   545: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   548: ldc_w 873
    //   551: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   554: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   557: new 65	java/lang/StringBuilder
    //   560: dup
    //   561: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   564: ldc_w 875
    //   567: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   570: aload_1
    //   571: invokevirtual 289	com/adobe/mediacore/timeline/advertising/AdBreakPlacement:getAdBreak	()Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    //   574: invokevirtual 627	com/adobe/mediacore/timeline/advertising/AdBreak:toString	()Ljava/lang/String;
    //   577: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   580: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   583: invokeinterface 382 3 0
    //   588: aload_0
    //   589: getfield 103	com/adobe/mediacore/VideoEngineTimeline:_adBreakPlacements	Ljava/util/List;
    //   592: aload_1
    //   593: invokeinterface 878 2 0
    //   598: pop
    //   599: aload_0
    //   600: getfield 103	com/adobe/mediacore/VideoEngineTimeline:_adBreakPlacements	Ljava/util/List;
    //   603: invokeinterface 273 1 0
    //   608: astore 10
    //   610: aload 10
    //   612: invokeinterface 279 1 0
    //   617: ifeq +161 -> 778
    //   620: aload 10
    //   622: invokeinterface 283 1 0
    //   627: checkcast 234	com/adobe/mediacore/timeline/advertising/AdBreakPlacement
    //   630: astore 11
    //   632: aload 11
    //   634: ifnull +11 -> 645
    //   637: aload 11
    //   639: invokevirtual 289	com/adobe/mediacore/timeline/advertising/AdBreakPlacement:getAdBreak	()Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    //   642: ifnonnull +45 -> 687
    //   645: getstatic 93	com/adobe/mediacore/VideoEngineTimeline:_logger	Lcom/adobe/mediacore/logging/Logger;
    //   648: new 65	java/lang/StringBuilder
    //   651: dup
    //   652: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   655: getstatic 85	com/adobe/mediacore/VideoEngineTimeline:LOG_TAG	Ljava/lang/String;
    //   658: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   661: ldc_w 873
    //   664: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   667: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   670: ldc_w 389
    //   673: invokeinterface 392 3 0
    //   678: goto -68 -> 610
    //   681: astore_1
    //   682: aload 12
    //   684: monitorexit
    //   685: aload_1
    //   686: athrow
    //   687: aload 11
    //   689: invokevirtual 289	com/adobe/mediacore/timeline/advertising/AdBreakPlacement:getAdBreak	()Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    //   692: invokevirtual 395	com/adobe/mediacore/timeline/advertising/AdBreak:adsIterator	()Ljava/util/Iterator;
    //   695: astore 13
    //   697: aload 13
    //   699: invokeinterface 279 1 0
    //   704: ifeq +297 -> 1001
    //   707: aload 13
    //   709: invokeinterface 283 1 0
    //   714: checkcast 183	com/adobe/mediacore/timeline/advertising/Ad
    //   717: astore_1
    //   718: aload_1
    //   719: invokevirtual 299	com/adobe/mediacore/timeline/advertising/Ad:isCustomAdMarker	()Z
    //   722: ifne -25 -> 697
    //   725: aload_1
    //   726: ifnull -116 -> 610
    //   729: aload_0
    //   730: aload 11
    //   732: aload_1
    //   733: invokespecial 397	com/adobe/mediacore/VideoEngineTimeline:adjusAdBreakPlacementPosition	(Lcom/adobe/mediacore/timeline/advertising/AdBreakPlacement;Lcom/adobe/mediacore/timeline/advertising/Ad;)Z
    //   736: pop
    //   737: goto -127 -> 610
    //   740: astore_1
    //   741: getstatic 93	com/adobe/mediacore/VideoEngineTimeline:_logger	Lcom/adobe/mediacore/logging/Logger;
    //   744: new 65	java/lang/StringBuilder
    //   747: dup
    //   748: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   751: getstatic 85	com/adobe/mediacore/VideoEngineTimeline:LOG_TAG	Ljava/lang/String;
    //   754: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   757: ldc_w 873
    //   760: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   763: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   766: ldc_w 412
    //   769: aload_1
    //   770: invokeinterface 415 4 0
    //   775: goto -165 -> 610
    //   778: aload_0
    //   779: getfield 136	com/adobe/mediacore/VideoEngineTimeline:_videoEngineDispatcher	Lcom/adobe/mediacore/VideoEngineDispatcher;
    //   782: new 433	com/adobe/mediacore/MediaPlayerEvent
    //   785: dup
    //   786: getstatic 439	com/adobe/mediacore/MediaPlayerEvent$Type:TIMELINE_UPDATED	Lcom/adobe/mediacore/MediaPlayerEvent$Type;
    //   789: invokespecial 442	com/adobe/mediacore/MediaPlayerEvent:<init>	(Lcom/adobe/mediacore/MediaPlayerEvent$Type;)V
    //   792: invokevirtual 431	com/adobe/mediacore/VideoEngineDispatcher:dispatch	(Lcom/adobe/mediacore/MediaPlayerEvent;)V
    //   795: aload 12
    //   797: monitorexit
    //   798: aload_0
    //   799: getfield 158	com/adobe/mediacore/VideoEngineTimeline:_videoEngineAdapter	Lcom/adobe/mediacore/VideoEngineAdapter;
    //   802: invokevirtual 363	com/adobe/mediacore/VideoEngineAdapter:getPlaybackMetrics	()Lcom/adobe/mediacore/qos/metrics/PlaybackMetrics;
    //   805: invokevirtual 368	com/adobe/mediacore/qos/metrics/PlaybackMetrics:update	()V
    //   808: getstatic 93	com/adobe/mediacore/VideoEngineTimeline:_logger	Lcom/adobe/mediacore/logging/Logger;
    //   811: new 65	java/lang/StringBuilder
    //   814: dup
    //   815: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   818: getstatic 85	com/adobe/mediacore/VideoEngineTimeline:LOG_TAG	Ljava/lang/String;
    //   821: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   824: ldc_w 853
    //   827: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   830: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   833: new 65	java/lang/StringBuilder
    //   836: dup
    //   837: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   840: ldc_w 372
    //   843: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   846: aload_0
    //   847: getfield 158	com/adobe/mediacore/VideoEngineTimeline:_videoEngineAdapter	Lcom/adobe/mediacore/VideoEngineAdapter;
    //   850: invokevirtual 363	com/adobe/mediacore/VideoEngineAdapter:getPlaybackMetrics	()Lcom/adobe/mediacore/qos/metrics/PlaybackMetrics;
    //   853: invokevirtual 376	com/adobe/mediacore/qos/metrics/PlaybackMetrics:getSeekableRange	()Lcom/adobe/mediacore/utils/TimeRange;
    //   856: invokevirtual 379	com/adobe/mediacore/utils/TimeRange:toString	()Ljava/lang/String;
    //   859: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   862: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   865: invokeinterface 382 3 0
    //   870: getstatic 93	com/adobe/mediacore/VideoEngineTimeline:_logger	Lcom/adobe/mediacore/logging/Logger;
    //   873: new 65	java/lang/StringBuilder
    //   876: dup
    //   877: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   880: getstatic 85	com/adobe/mediacore/VideoEngineTimeline:LOG_TAG	Ljava/lang/String;
    //   883: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   886: ldc_w 853
    //   889: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   892: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   895: new 65	java/lang/StringBuilder
    //   898: dup
    //   899: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   902: ldc_w 384
    //   905: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   908: aload_0
    //   909: getfield 158	com/adobe/mediacore/VideoEngineTimeline:_videoEngineAdapter	Lcom/adobe/mediacore/VideoEngineAdapter;
    //   912: invokevirtual 363	com/adobe/mediacore/VideoEngineAdapter:getPlaybackMetrics	()Lcom/adobe/mediacore/qos/metrics/PlaybackMetrics;
    //   915: invokevirtual 387	com/adobe/mediacore/qos/metrics/PlaybackMetrics:getPlaybackRange	()Lcom/adobe/mediacore/utils/TimeRange;
    //   918: invokevirtual 379	com/adobe/mediacore/utils/TimeRange:toString	()Ljava/lang/String;
    //   921: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   924: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   927: invokeinterface 382 3 0
    //   932: aload_0
    //   933: getfield 158	com/adobe/mediacore/VideoEngineTimeline:_videoEngineAdapter	Lcom/adobe/mediacore/VideoEngineAdapter;
    //   936: invokevirtual 404	com/adobe/mediacore/VideoEngineAdapter:getRawTimeline	()Lcom/adobe/ave/Timeline;
    //   939: invokestatic 837	com/adobe/mediacore/VideoEngineTimeline:printTimeline	(Lcom/adobe/ave/Timeline;)V
    //   942: aload_0
    //   943: getfield 136	com/adobe/mediacore/VideoEngineTimeline:_videoEngineDispatcher	Lcom/adobe/mediacore/VideoEngineDispatcher;
    //   946: new 433	com/adobe/mediacore/MediaPlayerEvent
    //   949: dup
    //   950: getstatic 850	com/adobe/mediacore/MediaPlayerEvent$Type:ADBREAK_REMOVAL_COMPLETED	Lcom/adobe/mediacore/MediaPlayerEvent$Type;
    //   953: invokespecial 442	com/adobe/mediacore/MediaPlayerEvent:<init>	(Lcom/adobe/mediacore/MediaPlayerEvent$Type;)V
    //   956: invokevirtual 431	com/adobe/mediacore/VideoEngineDispatcher:dispatch	(Lcom/adobe/mediacore/MediaPlayerEvent;)V
    //   959: return
    //   960: astore_1
    //   961: getstatic 93	com/adobe/mediacore/VideoEngineTimeline:_logger	Lcom/adobe/mediacore/logging/Logger;
    //   964: new 65	java/lang/StringBuilder
    //   967: dup
    //   968: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   971: getstatic 85	com/adobe/mediacore/VideoEngineTimeline:LOG_TAG	Ljava/lang/String;
    //   974: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   977: ldc_w 853
    //   980: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   983: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   986: ldc_w 843
    //   989: invokeinterface 382 3 0
    //   994: goto -52 -> 942
    //   997: astore_1
    //   998: goto -510 -> 488
    //   1001: aconst_null
    //   1002: astore_1
    //   1003: goto -278 -> 725
    //   1006: goto -525 -> 481
    //   1009: iconst_m1
    //   1010: istore_2
    //   1011: goto -923 -> 88
    //   1014: aconst_null
    //   1015: astore_1
    //   1016: goto -937 -> 79
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1019	0	this	VideoEngineTimeline
    //   0	1019	1	paramTimelineOperation	TimelineOperation
    //   87	924	2	i	int
    //   1	276	3	j	int
    //   284	203	4	bool1	boolean
    //   143	148	5	bool2	boolean
    //   458	13	6	l1	long
    //   468	5	8	l2	long
    //   49	572	10	localObject1	Object
    //   42	689	11	localObject2	Object
    //   427	281	13	localIterator	Iterator
    // Exception table:
    //   from	to	target	type
    //   145	282	484	com/adobe/ave/VideoEngineException
    //   299	320	484	com/adobe/ave/VideoEngineException
    //   418	429	681	finally
    //   431	470	681	finally
    //   532	599	681	finally
    //   599	610	681	finally
    //   610	632	681	finally
    //   637	645	681	finally
    //   645	678	681	finally
    //   682	685	681	finally
    //   687	697	681	finally
    //   697	725	681	finally
    //   729	737	681	finally
    //   741	775	681	finally
    //   778	798	681	finally
    //   687	697	740	com/adobe/ave/VideoEngineException
    //   697	725	740	com/adobe/ave/VideoEngineException
    //   729	737	740	com/adobe/ave/VideoEngineException
    //   932	942	960	com/adobe/ave/VideoEngineException
    //   320	404	997	com/adobe/ave/VideoEngineException
  }
  
  private void removeContent(TimelineOperation paramTimelineOperation)
  {
    long l1 = paramTimelineOperation.getPlacement().getTime();
    long l2 = paramTimelineOperation.getPlacement().getDuration() + l1;
    if (!isWithinBounds(l1, l2)) {
      _logger.w(LOG_TAG + "#removeContent", "Invalid TimeRange [" + l1 + ", " + l2 + "], 'begin' or 'end' value is out of bounds of stream");
    }
    if (!removeContentByLocalTime(paramTimelineOperation.getPlacement().getTime(), paramTimelineOperation.getPlacement().getTime() + paramTimelineOperation.getPlacement().getDuration()))
    {
      paramTimelineOperation = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.GENERIC_WARNING, "Failed to remove content from timeline");
      _videoEngineDispatcher.dispatch(OperationFailedEvent.createEvent(paramTimelineOperation));
      return;
    }
    _videoEngineAdapter.getPlaybackMetrics().update();
    _videoEngineDispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.ADBREAK_REMOVAL_COMPLETED));
  }
  
  private boolean removeContent(int paramInt, boolean paramBoolean)
  {
    try
    {
      Period localPeriod = getPeriod(paramInt);
      if (localPeriod == null)
      {
        _logger.w(LOG_TAG, "Unable to remove content with id [" + paramInt + "]");
        return false;
      }
      long l3 = localPeriod.getLocalStartTime();
      long l2 = localPeriod.getLocalEndTime();
      long l1 = l2;
      if (l3 == l2) {
        l1 = l2 + 1L;
      }
      _videoEngineAdapter.getRawTimeline().eraseByLocalTime(localPeriod.getPeriodIndex(), l3, l1, paramBoolean);
      _logger.i(LOG_TAG + "#removeContent", "Removed content [" + paramInt + "] from timeline.");
      return true;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      _logger.w(LOG_TAG + "#removeContent", "Exception raised while removing content. {" + localVideoEngineException.getErrorCode() + "," + localVideoEngineException.getDetailMessage() + "}");
    }
    return false;
  }
  
  private boolean removeContentByLocalTime(long paramLong1, long paramLong2)
  {
    try
    {
      Timeline localTimeline = _videoEngineAdapter.getRawTimeline();
      int i = lastPeriodIndex;
      localTimeline.eraseByLocalTime(i, paramLong1, paramLong2, false);
      _logger.i(LOG_TAG + "#removeContentByLocalTime", "Removed content [" + paramLong1 + ", " + paramLong2 + "] from timeline. Period index: " + i);
      return true;
    }
    catch (VideoEngineException localVideoEngineException) {}
    return false;
  }
  
  private boolean removeContentByVirtualTime(long paramLong1, long paramLong2)
  {
    try
    {
      _videoEngineAdapter.getRawTimeline().eraseByVirtualTime(paramLong1, paramLong2);
      return true;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      _logger.d(LOG_TAG + "#removeByVirtualTime", "Removing AdBreak from timeline failed");
      localVideoEngineException.printStackTrace();
    }
    return false;
  }
  
  private boolean removeOldAdBreaks(long paramLong)
  {
    boolean bool2;
    if ((_adBreaksPlacementToRemove.size() <= 0) || (_videoEngineAdapter.getBufferControlParameters() == null)) {
      bool2 = false;
    }
    long l1;
    Iterator localIterator;
    boolean bool1;
    do
    {
      return bool2;
      l1 = _videoEngineAdapter.getBufferControlParameters().getPlayBufferTime();
      localIterator = _adBreaksPlacementToRemove.entrySet().iterator();
      bool1 = false;
      bool2 = bool1;
    } while (!localIterator.hasNext());
    ??? = (Map.Entry)localIterator.next();
    AdBreakPlacement localAdBreakPlacement = (AdBreakPlacement)((Map.Entry)???).getKey();
    long l2 = paramLong - ((Long)((Map.Entry)???).getValue()).longValue();
    if (l2 >= l1) {
      _logger.i(LOG_TAG + "#removeOldAdBreaks", "Removing ad break from ad timeline after [" + l2 + "] ms of waiting. [" + localAdBreakPlacement + "].");
    }
    for (;;)
    {
      synchronized (_adBreakPlacements)
      {
        _adBreakPlacements.remove(localAdBreakPlacement);
        localIterator.remove();
        bool1 = true;
      }
    }
  }
  
  private long retrieveTotalDuration(List paramList)
  {
    paramList = paramList.iterator();
    for (long l = 0L; paramList.hasNext(); l = ((Ad)paramList.next()).getDuration() + l) {}
    return l;
  }
  
  private TimeMapping seekableTimeEquivalentOfTime(TimeMapping paramTimeMapping)
  {
    TimeRange[] arrayOfTimeRange = getNonSeekableRanges();
    Object localObject = paramTimeMapping;
    int i;
    if (arrayOfTimeRange != null) {
      i = 0;
    }
    for (;;)
    {
      localObject = paramTimeMapping;
      if (i < arrayOfTimeRange.length)
      {
        localObject = arrayOfTimeRange[i];
        if (((TimeRange)localObject).contains(paramTimeMapping.getTime()))
        {
          _logger.i(LOG_TAG + "#seekableTimeEquivalentOfTime", "[Warning] >> desired postion " + String.valueOf(paramTimeMapping) + " falls into nonSeekable range [" + ((TimeRange)localObject).getBegin() + ", " + ((TimeRange)localObject).getEnd() + "].");
          paramTimeMapping = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.INVALID_SEEK_WARNING, "Attempt to seek into nonSeekableRanges.");
          if (_videoEngineDispatcher != null) {
            _videoEngineDispatcher.dispatch(OperationFailedEvent.createEvent(paramTimeMapping));
          }
          localObject = TimeMapping.create(-1, ((TimeRange)localObject).getEnd());
        }
      }
      else
      {
        return (TimeMapping)localObject;
      }
      i += 1;
    }
  }
  
  private boolean updateAdBreakPlacement(List paramList1, List arg2, AdBreakPlacement paramAdBreakPlacement)
  {
    if ((???.isEmpty()) || (paramAdBreakPlacement == null)) {
      return false;
    }
    for (;;)
    {
      synchronized (_adBreakPlacements)
      {
        if (paramList1.isEmpty()) {
          break;
        }
        Iterator localIterator = paramList1.iterator();
        if (!localIterator.hasNext()) {
          break;
        }
        Ad localAd = (Ad)localIterator.next();
        try
        {
          if (getPeriod(localAd.getId()) != null) {
            continue;
          }
          _logger.i(LOG_TAG + "#updateAdBreakPlacement", "Readjusting ad break : Ad " + localAd.getId() + " does not exist on AVE timeline.");
          if (paramList1.remove(localAd)) {
            _logger.i(LOG_TAG + "#updateAdBreakPlacement", "Readjusting ad break : Ad " + localAd.getId() + " removed from AdBreakPlacement");
          }
        }
        catch (VideoEngineException localVideoEngineException)
        {
          localVideoEngineException.printStackTrace();
        }
      }
      _logger.i(LOG_TAG + "#updateAdBreakPlacement", "Readjusting ad break : Ad " + localVideoEngineException.getId() + " could not be removed from AdBreakPlacement");
    }
    if (paramList1.isEmpty())
    {
      _logger.d(LOG_TAG + "#updateAdBreakPlacement", "Removing ad break from ad timeline : " + paramAdBreakPlacement.getAdBreak().toString());
      _adBreakPlacements.remove(paramAdBreakPlacement);
      paramList1 = _adBreakPlacements.iterator();
    }
    for (;;)
    {
      if (!paramList1.hasNext()) {
        break label653;
      }
      paramAdBreakPlacement = (AdBreakPlacement)paramList1.next();
      if ((paramAdBreakPlacement == null) || (paramAdBreakPlacement.getAdBreak() == null))
      {
        _logger.w(LOG_TAG + "#updateAdBreakPlacement", "Unable to retrieve valid Ad Break.");
        continue;
        _logger.i(LOG_TAG + "#updateAdBreakPlacement", "Readjusting ad break : " + paramAdBreakPlacement.getAdBreak().toString());
        int i = _adBreakPlacements.indexOf(paramAdBreakPlacement);
        long l1 = getVirtualTimeFor((Ad)paramList1.get(0)).longValue();
        long l2 = retrieveTotalDuration(paramList1);
        paramList1 = AdBreak.createAdBreak(paramList1, l1, 0L, paramAdBreakPlacement.getAdBreak().getTag());
        paramList1.setIsWatched(paramAdBreakPlacement.getAdBreak().isWatched());
        paramList1 = new AdBreakPlacement(paramList1, new PlacementInformation(paramAdBreakPlacement.getPlacement().getType(), l1, l2));
        _adBreakPlacements.add(i, paramList1);
        break;
      }
      try
      {
        adjusAdBreakPlacementPosition(paramAdBreakPlacement, paramAdBreakPlacement.getAdBreak().getFirstAd());
      }
      catch (VideoEngineException paramAdBreakPlacement)
      {
        _logger.w(LOG_TAG + "#updateAdBreakPlacement", "A VideoEngineException occured while accessing the timeline", paramAdBreakPlacement);
      }
    }
    label653:
    return true;
  }
  
  public TimeMapping adjustSeekPosition(TimeMapping paramTimeMapping, long paramLong, AdPolicyMode paramAdPolicyMode)
  {
    paramTimeMapping = seekableTimeEquivalentOfTime(paramTimeMapping);
    _mediaPlayerClient.getAdPolicyProxy().registerSeekOrTrickPlayToTime(paramTimeMapping, paramLong, paramAdPolicyMode);
    return paramTimeMapping;
  }
  
  public void clear()
  {
    synchronized (_adBreakPlacements)
    {
      _adBreakPlacements.clear();
      _contentLoader.releaseHandles();
      _videoEngineDispatcher.removeEventListener(MediaPlayerEvent.Type.AD_BREAK_MANIFEST_LOAD_COMPLETE, _onAdBreakCompleteLoadListener);
      _handler = null;
      _executor = null;
      return;
    }
  }
  
  public boolean containsMarkerForTime(long paramLong)
  {
    return (_contentMarkerCache != null) && (_contentMarkerCache.containsMarkerFor(paramLong));
  }
  
  public long convertToLocalTime(long paramLong)
  {
    return _videoEngineAdapter.convertToLocalTime(paramLong);
  }
  
  public void execute(TimelineOperation paramTimelineOperation)
  {
    if ((paramTimelineOperation instanceof AdBreakPlacement)) {
      place(paramTimelineOperation);
    }
    do
    {
      return;
      if ((paramTimelineOperation instanceof AdBreakRemoval))
      {
        remove(paramTimelineOperation);
        return;
      }
    } while (!(paramTimelineOperation instanceof ContentRemoval));
    removeContent(paramTimelineOperation);
  }
  
  public AdBreak getAdBreakForTime(long paramLong1, long paramLong2)
  {
    if (_adBreakPlacements != null)
    {
      Iterator localIterator = _adBreakPlacements.iterator();
      long l2;
      for (long l1 = 0L; localIterator.hasNext(); l1 += l2)
      {
        AdBreak localAdBreak = ((AdBreakPlacement)localIterator.next()).getAdBreak();
        long l3 = localAdBreak.getLocalTime();
        l2 = localAdBreak.getDuration();
        l3 += l1;
        if ((localAdBreak != null) && (localAdBreak.getType() != AdBreak.Type.POST_ROLL) && (l3 - paramLong2 <= paramLong1) && (paramLong1 < l3 + l2 + paramLong2))
        {
          _logger.i(LOG_TAG + "#getAdItemByTime", "Local time: " + l3 + " ; inside adbreak: " + localAdBreak + " with placementinfo: " + l2);
          return localAdBreak;
        }
      }
    }
    return null;
  }
  
  public AdBreak getAdBreakFromId(int paramInt)
  {
    if (_adBreakPlacements != null)
    {
      AdBreak localAdBreak;
      Iterator localIterator2;
      do
      {
        Iterator localIterator1 = _adBreakPlacements.iterator();
        while (!localIterator2.hasNext())
        {
          if (!localIterator1.hasNext()) {
            break;
          }
          localAdBreak = ((AdBreakPlacement)localIterator1.next()).getAdBreak();
          localIterator2 = localAdBreak.adsIterator();
        }
      } while (((Ad)localIterator2.next()).getId() != paramInt);
      return localAdBreak;
    }
    return null;
  }
  
  public List getAdBreakPlacements()
  {
    return _adBreakPlacements;
  }
  
  public Ad getAdForTime(long paramLong, boolean paramBoolean)
  {
    if (_adBreakPlacements != null)
    {
      Iterator localIterator = _adBreakPlacements.iterator();
      long l2;
      for (long l1 = 0L; localIterator.hasNext(); l1 += l2)
      {
        Object localObject1 = (AdBreakPlacement)localIterator.next();
        Object localObject2 = ((AdBreakPlacement)localObject1).getAdBreak();
        long l3 = ((AdBreak)localObject2).getLocalTime();
        l2 = ((AdBreak)localObject2).getDuration();
        l3 += l1;
        if ((localObject2 != null) && (((AdBreak)localObject2).getType() != AdBreak.Type.POST_ROLL) && (l3 - 2000L <= paramLong) && (paramLong < l3 + l2 + 2000L))
        {
          _logger.i(LOG_TAG + "#getAdItemByTime", "Local time: " + l3 + " ; inside adbreak: " + localObject2 + " with placementinfo: " + ((AdBreakPlacement)localObject1).getPlacement());
          localObject1 = ((AdBreak)localObject2).adsIterator();
          while (((Iterator)localObject1).hasNext())
          {
            localObject2 = (Ad)((Iterator)localObject1).next();
            if (((Ad)localObject2).isCustomAdMarker())
            {
              _logger.i(LOG_TAG + "#getAdItemByTime return VPAID Ad ", "URL: " + ((Ad)localObject2).getPrimaryAsset().getMediaResource().getUrl());
              return (Ad)localObject2;
            }
          }
        }
      }
    }
    return null;
  }
  
  public AdSignalingMode getAdSignalingMode()
  {
    AdSignalingMode localAdSignalingMode = AdSignalingMode.DEFAULT;
    if (_mediaPlayerClient != null) {
      localAdSignalingMode = _mediaPlayerClient.getAdSignalingMode();
    }
    return localAdSignalingMode;
  }
  
  public AdBreak getLastAdBreak()
  {
    if (_adBreakPlacements != null)
    {
      Iterator localIterator = _adBreakPlacements.iterator();
      while (localIterator.hasNext())
      {
        AdBreak localAdBreak = ((AdBreakPlacement)localIterator.next()).getAdBreak();
        if (localAdBreak.getType().equals(AdBreak.Type.POST_ROLL)) {
          return localAdBreak;
        }
      }
    }
    return null;
  }
  
  public AdBreak getLastSkippedVPAIDAdBreak(long paramLong1, long paramLong2)
  {
    Object localObject1;
    if (_adBreakPlacements != null)
    {
      Iterator localIterator = _adBreakPlacements.iterator();
      for (localObject1 = null;; localObject1 = ((AdBreakPlacement)localObject2).getAdBreak()) {
        do
        {
          localObject2 = localObject1;
          if (!localIterator.hasNext()) {
            break;
          }
          localObject2 = (AdBreakPlacement)localIterator.next();
        } while ((((AdBreakPlacement)localObject2).getAdBreak().getTime() <= paramLong1) || (((AdBreakPlacement)localObject2).getAdBreak().getTime() >= paramLong2));
      }
    }
    Object localObject2 = null;
    if (localObject2 != null)
    {
      localObject1 = ((AdBreak)localObject2).adsIterator();
      while (((Iterator)localObject1).hasNext()) {
        if (!((Ad)((Iterator)localObject1).next()).isCustomAdMarker()) {
          return null;
        }
      }
    }
    return (AdBreak)localObject2;
  }
  
  public PlacementInformation getPlacementFor(AdBreak paramAdBreak)
  {
    synchronized (_adBreakPlacements)
    {
      Iterator localIterator = _adBreakPlacements.iterator();
      while (localIterator.hasNext())
      {
        AdBreakPlacement localAdBreakPlacement = (AdBreakPlacement)localIterator.next();
        if (localAdBreakPlacement.getAdBreak().equals(paramAdBreak))
        {
          paramAdBreak = localAdBreakPlacement.getPlacement();
          return paramAdBreak;
        }
      }
      return null;
    }
  }
  
  public Timeline getRawTimeline()
  {
    try
    {
      Timeline localTimeline = _videoEngineAdapter.getRawTimeline();
      return localTimeline;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      _logger.e(LOG_TAG, "Unable to retrieve timeline.");
    }
    return null;
  }
  
  public void place(TimelineOperation paramTimelineOperation)
  {
    if (_processingAdBreakPlacement != null) {
      throw new IllegalStateException("You need to wait for previous place command to finish before issuing a new one. You can use AdBreakPlacementCompletedListener or AdBreakPlacementFailedListener for this.");
    }
    if ((paramTimelineOperation instanceof AdBreakPlacement))
    {
      _processingAdBreakPlacement = ((AdBreakPlacement)paramTimelineOperation);
      _acceptedAds = new ArrayList();
      if (!processCustomMarkers()) {
        loadAds();
      }
      return;
    }
    throw new IllegalArgumentException("Place operation must receive only AdBreakPlacementOperation as a parameter.");
  }
  
  protected boolean placeContentMarker(TimeMapping paramTimeMapping, int paramInt, long paramLong)
  {
    if (_contentMarkerCache == null) {
      _contentMarkerCache = new VideoEngineContentMarkerCache(_videoEngineDispatcher, _mainContentId);
    }
    _contentMarkerCache.addMarker(paramTimeMapping, paramInt, paramLong);
    return true;
  }
  
  public void remove(TimelineOperation paramTimelineOperation)
  {
    if (!(paramTimelineOperation instanceof AdBreakRemoval)) {
      throw new IllegalArgumentException("In order to execute remove videoEngineTimeline must receive a  AdBreakRemoval as a TimelineOperation.");
    }
    if (((AdBreakRemoval)paramTimelineOperation).getAdBreak().getReplaceDuration() > 0L)
    {
      removeByLocalTime(paramTimelineOperation);
      return;
    }
    removeByVirtualTime(paramTimelineOperation);
  }
  
  public void removeAdsOnSourceTimeline()
  {
    generateInsertedAds();
    _logger.i(LOG_TAG + "#removeAdsOnSourceTimeline", "Remove ads after entering trickplay mode");
    int i = 0;
    long l4 = 0L;
    long l2 = 0L;
    int j = -1;
    if (i < _insertedAds.size())
    {
      InsertedAd localInsertedAd = (InsertedAd)_insertedAds.get(i);
      long l1 = l4;
      long l3 = l2;
      int k = j;
      if (localInsertedAd != null)
      {
        if (j == localInsertedAd.getIndex()) {
          break label303;
        }
        if (j != -1)
        {
          _logger.i(LOG_TAG + "#removeAdsOnSourceTimeline", "Remove ad: [virtual begin, virtual end] = [" + String.valueOf(l2) + ", " + String.valueOf(l2 + l4) + "].");
          if (!removeContentByVirtualTime(l2, l2 + l4)) {
            _logger.e(LOG_TAG + "#removeAdsOnSourceTimeline", "Could not remove the content. From=" + l2 + " duration=" + l4);
          }
        }
        k = localInsertedAd.getIndex();
        l3 = getVirtualTimeFor(localInsertedAd.getAd()).longValue();
        l1 = localInsertedAd.getAdHandle().getDuration();
      }
      for (;;)
      {
        i += 1;
        l4 = l1;
        l2 = l3;
        j = k;
        break;
        label303:
        l1 = l4 + localInsertedAd.getAdHandle().getDuration();
        l3 = l2;
        k = j;
      }
    }
    if ((_insertedAds.size() > 0) && (l4 != 0L))
    {
      _logger.i(LOG_TAG + "#removeAdsOnSourceTimeline", "Remove ad: [virtual begin, virtual end] = [" + String.valueOf(l2) + ", " + String.valueOf(l2 + l4) + "].");
      if (!removeContentByVirtualTime(l2, l2 + l4)) {
        _logger.e(LOG_TAG + "#removeAdsOnSourceTimeline", "Could not remove the content. From=" + l2 + " duration=" + l4);
      }
    }
  }
  
  public void removeVPAIDAdBreak(AdBreak paramAdBreak)
  {
    Iterator localIterator = _adBreakPlacements.iterator();
    int i = 0;
    for (;;)
    {
      if ((!localIterator.hasNext()) || (((AdBreakPlacement)localIterator.next()).getAdBreak().compareTo(paramAdBreak) == 0))
      {
        if (i < _adBreakPlacements.size())
        {
          _adBreakPlacements.remove(i);
          if (_videoEngineDispatcher != null) {
            _videoEngineDispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.TIMELINE_UPDATED));
          }
        }
        return;
      }
      i += 1;
    }
  }
  
  public void restoreAdsOnSourceTimeline()
  {
    _logger.i(LOG_TAG + "#restoreAdsOnSourceTimeline", "Restore ads after exiting trickplay");
    int i = 0;
    while (i < _insertedAds.size())
    {
      InsertedAd localInsertedAd = (InsertedAd)_insertedAds.get(i);
      if ((localInsertedAd != null) && (localInsertedAd.getAd() != null))
      {
        _logger.i(LOG_TAG + "#restoreAdsOnSourceTimeline", "Attemp to restore ad on the timeline: " + localInsertedAd.getAd().toString());
        if (placeContent(localInsertedAd.getTimeMapping(), localInsertedAd.getAdHandle().getHandle(), localInsertedAd.getAd().getId(), localInsertedAd.getReplaceDuration()) == -1) {
          _logger.e(LOG_TAG + "#restoreAdsOnSourceTimeline", "Failed to restore ad on the timeline");
        }
      }
      i += 1;
    }
    _insertedAds = null;
  }
  
  public void setInitialTimeMapping(TimeMapping paramTimeMapping)
  {
    _initialTimeMapping = paramTimeMapping;
  }
  
  public void setMediaPlayerClient(MediaPlayerClient paramMediaPlayerClient)
  {
    _mediaPlayerClient = paramMediaPlayerClient;
  }
  
  public boolean shouldTriggerSubscribedTagEvent(long paramLong)
  {
    if (_adBreakPlacements != null)
    {
      boolean bool = isLive();
      AdSignalingMode localAdSignalingMode = getAdSignalingMode();
      Iterator localIterator = _adBreakPlacements.iterator();
      while (localIterator.hasNext())
      {
        AdBreakPlacement localAdBreakPlacement = (AdBreakPlacement)localIterator.next();
        if (((bool) || (localAdSignalingMode == AdSignalingMode.MANIFEST_CUES)) && (localAdBreakPlacement != null) && (localAdBreakPlacement.getTime() <= paramLong) && (paramLong < localAdBreakPlacement.getTime() + localAdBreakPlacement.getDuration()) && (localAdBreakPlacement.getAdBreak().getRestoreId() != null))
        {
          _logger.i(LOG_TAG + "#shouldTriggerSubscribedTagEvent", "Local time: " + paramLong + " ; inside moved ad break: " + localAdBreakPlacement.getAdBreak() + " with placementinfo: " + localAdBreakPlacement.getPlacement());
          return false;
        }
      }
    }
    return true;
  }
  
  public void update(long paramLong)
  {
    _logger.i(LOG_TAG + "#update", "Syncing AdTimeline with AVE timeline.");
    boolean bool1;
    AdBreakPlacement localAdBreakPlacement;
    synchronized (_adBreakPlacements)
    {
      bool1 = removeOldAdBreaks(paramLong);
      Iterator localIterator1 = _adBreakPlacements.iterator();
      if (!localIterator1.hasNext()) {
        break label491;
      }
      localAdBreakPlacement = (AdBreakPlacement)localIterator1.next();
      if ((localAdBreakPlacement == null) || (localAdBreakPlacement.getAdBreak() == null)) {
        _logger.e(LOG_TAG + "#update", "Unable to retrieve valid Ad Break.");
      }
    }
    Object localObject4 = localAdBreakPlacement.getAdBreak().adsIterator();
    Object localObject2;
    label179:
    int i;
    for (;;)
    {
      if (((Iterator)localObject4).hasNext())
      {
        localObject2 = (Ad)((Iterator)localObject4).next();
        if (!((Ad)localObject2).isCustomAdMarker())
        {
          if (localObject2 != null) {
            ((Ad)localObject2).getId();
          }
          Iterator localIterator2 = localAdBreakPlacement.getAdBreak().adsIterator();
          localObject4 = null;
          while (localIterator2.hasNext())
          {
            Ad localAd = (Ad)localIterator2.next();
            if (!localAd.isCustomAdMarker()) {
              localObject4 = localAd;
            }
          }
          if (localObject4 != null)
          {
            i = ((Ad)localObject4).getId();
            break label572;
          }
        }
      }
    }
    for (;;)
    {
      label254:
      _logger.e(LOG_TAG + "#update", "Unable to retrieve valid Ad from Ad Break: " + localAdBreakPlacement);
      break;
      label491:
      label555:
      label572:
      do
      {
        if (!bool1) {}
        for (;;)
        {
          try
          {
            boolean bool2 = adjusAdBreakPlacementPosition(localAdBreakPlacement, (Ad)localObject2);
            if (bool2)
            {
              bool1 = true;
              if (i == -1) {
                break label555;
              }
            }
          }
          catch (VideoEngineException localVideoEngineException1) {}
          try
          {
            localObject2 = getPeriod(i);
            if ((localObject2 == null) && (!_adBreaksPlacementToRemove.containsKey(localAdBreakPlacement)))
            {
              _logger.i(LOG_TAG + "#update", "Marking ad break for removal, from the ad timeline, after a delay period. Last commercial ID [" + i + "] is no longer found in the AVE timeline. [" + localAdBreakPlacement + "].");
              _adBreaksPlacementToRemove.put(localAdBreakPlacement, Long.valueOf(paramLong));
            }
          }
          catch (VideoEngineException localVideoEngineException2)
          {
            for (;;) {}
          }
          bool1 = false;
          continue;
          _logger.e(LOG_TAG + "#update", "Unable to retrieve period information from the AVE timeline.");
          continue;
          if (bool1)
          {
            _logger.i(LOG_TAG + "#update", "Ad timeline has updated.");
            _videoEngineDispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.TIMELINE_UPDATED));
          }
          return;
          localObject3 = null;
        }
        i = -1;
        break label572;
        Object localObject3 = null;
        break label179;
        if (localObject3 == null) {
          break label254;
        }
      } while (localObject4 != null);
    }
  }
  
  public void updateTimelineMarkers(long paramLong)
  {
    if (_contentMarkerCache == null) {
      return;
    }
    _contentMarkerCache.dispatchEvents(paramLong);
  }
  
  public boolean willAccept(TimelineOperation paramTimelineOperation)
  {
    if (paramTimelineOperation == null) {
      throw new IllegalArgumentException("The timelineOperation parameter passed in must be not null.");
    }
    if (!(paramTimelineOperation instanceof AdBreakPlacement)) {
      return true;
    }
    if (_adBreakPlacements.isEmpty()) {
      return true;
    }
    long l1 = paramTimelineOperation.getPlacement().getTime();
    Iterator localIterator = _adBreakPlacements.iterator();
    while (localIterator.hasNext())
    {
      AdBreakPlacement localAdBreakPlacement = (AdBreakPlacement)localIterator.next();
      long l2 = localAdBreakPlacement.getTime();
      if (localAdBreakPlacement.getAdBreak().getReplaceDuration() == 0L)
      {
        PlacementInformation.Type localType = paramTimelineOperation.getPlacement().getType();
        if ((localAdBreakPlacement.getTime() == l1) && (localType != PlacementInformation.Type.PRE_ROLL) && (localType != PlacementInformation.Type.POST_ROLL)) {
          return false;
        }
      }
      else
      {
        long l3 = localAdBreakPlacement.getAdBreak().getReplaceDuration();
        if ((l2 <= l1) && (l1 < l3 + l2)) {
          return false;
        }
      }
    }
    return true;
  }
  
  private final class InsertedAd
  {
    private Ad _ad;
    private AdHandle _handle;
    private int _index;
    private long _replaceDuration;
    private VideoEngineTimeline.TimeMapping _timeMapping;
    
    public InsertedAd(int paramInt, VideoEngineTimeline.TimeMapping paramTimeMapping, AdHandle paramAdHandle, Ad paramAd, long paramLong)
    {
      _index = paramInt;
      _timeMapping = paramTimeMapping;
      _handle = paramAdHandle;
      _ad = paramAd;
      _replaceDuration = paramLong;
    }
    
    public Ad getAd()
    {
      return _ad;
    }
    
    public AdHandle getAdHandle()
    {
      return _handle;
    }
    
    public int getIndex()
    {
      return _index;
    }
    
    public long getReplaceDuration()
    {
      return _replaceDuration;
    }
    
    public VideoEngineTimeline.TimeMapping getTimeMapping()
    {
      return _timeMapping;
    }
  }
  
  private final class Period
  {
    private final int periodIndex;
    private final PeriodInfo periodInfo;
    
    public Period(int paramInt, PeriodInfo paramPeriodInfo)
    {
      periodIndex = paramInt;
      periodInfo = paramPeriodInfo;
    }
    
    public long getDuration()
    {
      return periodInfo.duration;
    }
    
    public long getLocalEndTime()
    {
      return getLocalStartTime() + getDuration();
    }
    
    public long getLocalStartTime()
    {
      return periodInfo.localStartTime;
    }
    
    public int getPeriodIndex()
    {
      return periodIndex;
    }
    
    public long getVirtualTime()
    {
      return periodInfo.virtualStartTime;
    }
  }
  
  public static class TimeMapping
  {
    public static final int INVALID_PERIOD = -1;
    public static final long INVALID_POSITION = -3L;
    public static final long LIVE_POINT = -2L;
    final int _period;
    final long _time;
    
    private TimeMapping(int paramInt, long paramLong)
    {
      _period = paramInt;
      _time = paramLong;
    }
    
    public static TimeMapping create(int paramInt, long paramLong)
    {
      return new TimeMapping(paramInt, paramLong);
    }
    
    public static TimeMapping createInvalid()
    {
      return new TimeMapping(-1, -3L);
    }
    
    public static TimeMapping createLivePoint()
    {
      return new TimeMapping(-1, -2L);
    }
    
    public int getPeriod()
    {
      return _period;
    }
    
    public long getTime()
    {
      return _time;
    }
    
    public boolean isInvalid()
    {
      return (_period == -1) && (_time == -3L);
    }
    
    public String toString()
    {
      return "TimeMapping { _period=" + _period + ", _time=" + _time + "}";
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoEngineTimeline
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */