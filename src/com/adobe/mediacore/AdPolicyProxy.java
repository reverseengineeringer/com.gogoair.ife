package com.adobe.mediacore;

import com.adobe.ave.Timeline;
import com.adobe.ave.VideoEngineException;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.AdBreakAsWatched;
import com.adobe.mediacore.metadata.DefaultMetadataKeys;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.timeline.TimelineOperation;
import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdAsset;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;
import com.adobe.mediacore.timeline.advertising.AdBreakPolicy;
import com.adobe.mediacore.timeline.advertising.AdBreakRemoval;
import com.adobe.mediacore.timeline.advertising.AdPolicyInfo;
import com.adobe.mediacore.timeline.advertising.AdPolicyMode;
import com.adobe.mediacore.timeline.advertising.AdPolicySelector;
import com.adobe.mediacore.timeline.advertising.PlacementInformation;
import com.adobe.mediacore.timeline.advertising.PlacementInformation.Type;
import com.adobe.mediacore.utils.TimeRange;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public final class AdPolicyProxy
{
  private static final String LOG_TAG = "[PSDK]::" + AdPolicyProxy.class.getSimpleName();
  private AdPolicySelector _adPolicySelector;
  private long _cachedSeekPosition;
  private VideoEngineTimeline.TimeMapping _desiredSeekPosition;
  private AdBreakPlacement _firstPendingAdBreakPlacement;
  private final Logger _logger = Log.getLogger(LOG_TAG);
  private MediaPlayerItem _mediaPlayerItem;
  private HashMap _oldAdBreakPlacements;
  private final AdBreakPlacementCompletedListener _onAdBreakPlacementCompletedListener = new AdPolicyProxy.1(this);
  private final AdBreakPlacementFailedListener _onAdBreakPlacementFailedListener = new AdPolicyProxy.2(this);
  private List _pendingAdBreakPlacements;
  private AdPolicyMode _seekOrTrickPlay;
  private TimelineOperationQueue _timelineOperationQueue;
  private List _toPlaceAdBreakPlacements;
  private VideoEngineAdapter _videoEngineAdapter;
  private VideoEngineDispatcher _videoEngineDispatcher;
  private VideoEngineTimeline _videoEngineTimeline;
  
  public AdPolicyProxy(VideoEngineAdapter paramVideoEngineAdapter, VideoEngineDispatcher paramVideoEngineDispatcher, VideoEngineTimeline paramVideoEngineTimeline, TimelineOperationQueue paramTimelineOperationQueue, MediaPlayerItem paramMediaPlayerItem, AdPolicySelector paramAdPolicySelector)
  {
    _videoEngineAdapter = paramVideoEngineAdapter;
    _videoEngineDispatcher = paramVideoEngineDispatcher;
    _videoEngineTimeline = paramVideoEngineTimeline;
    _timelineOperationQueue = paramTimelineOperationQueue;
    _mediaPlayerItem = paramMediaPlayerItem;
    _adPolicySelector = paramAdPolicySelector;
  }
  
  private Ad getAd(AdBreakPlacement paramAdBreakPlacement)
  {
    if ((paramAdBreakPlacement != null) && (paramAdBreakPlacement.getAdBreak() != null) && (paramAdBreakPlacement.getAdBreak().adsIterator() != null) && (paramAdBreakPlacement.getAdBreak().adsIterator().hasNext())) {
      return (Ad)paramAdBreakPlacement.getAdBreak().adsIterator().next();
    }
    return null;
  }
  
  private List getPendingAdBreakPlacements(VideoEngineTimeline.TimeMapping paramTimeMapping, long paramLong)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = _videoEngineTimeline.getAdBreakPlacements().iterator();
    while (localIterator.hasNext())
    {
      AdBreakPlacement localAdBreakPlacement = (AdBreakPlacement)localIterator.next();
      if (localAdBreakPlacement != null)
      {
        long l1 = localAdBreakPlacement.getTime();
        long l2 = localAdBreakPlacement.getDuration() + l1;
        if (paramTimeMapping.getTime() > paramLong)
        {
          if ((l1 >= paramLong) && (l2 <= paramTimeMapping.getTime())) {
            localArrayList.add(localAdBreakPlacement);
          }
        }
        else if ((l1 >= paramTimeMapping.getTime()) && (l2 < paramLong)) {
          localArrayList.add(localAdBreakPlacement);
        }
      }
    }
    if (!listIsEmpty(localArrayList).booleanValue())
    {
      _logger.i(LOG_TAG + "#AdPolicyProxy::getPendingAdBreakPlacements", "Found " + localArrayList.size() + " skipped over ad breaks");
      return localArrayList;
    }
    _logger.i(LOG_TAG + "#AdPolicyProxy::getPendingAdBreakPlacements", "Found 0 skipped over ad breaks");
    return null;
  }
  
  private AdBreakPlacement getSeekIntoAdBreakPlacement(VideoEngineTimeline.TimeMapping paramTimeMapping)
  {
    Object localObject = _videoEngineTimeline.getAdBreakPlacements();
    if (localObject != null)
    {
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        AdBreakPlacement localAdBreakPlacement = (AdBreakPlacement)((Iterator)localObject).next();
        if (localAdBreakPlacement != null)
        {
          long l1 = localAdBreakPlacement.getTime();
          long l2 = localAdBreakPlacement.getDuration();
          if ((l1 <= paramTimeMapping.getTime()) && (l2 + l1 > paramTimeMapping.getTime())) {
            return localAdBreakPlacement;
          }
        }
      }
    }
    return null;
  }
  
  private Boolean isBreakStartsWithVPAID(AdBreakPlacement paramAdBreakPlacement)
  {
    if (paramAdBreakPlacement != null)
    {
      paramAdBreakPlacement = paramAdBreakPlacement.getAdBreak();
      if ((paramAdBreakPlacement != null) && (paramAdBreakPlacement.getFirstAd().isCustomAdMarker()))
      {
        paramAdBreakPlacement = paramAdBreakPlacement.adsIterator();
        while (paramAdBreakPlacement.hasNext()) {
          if (!((Ad)paramAdBreakPlacement.next()).isCustomAdMarker()) {
            return Boolean.valueOf(true);
          }
        }
      }
    }
    return Boolean.valueOf(false);
  }
  
  private Boolean isCustomAdMarkerAdBreakPlacement(AdBreakPlacement paramAdBreakPlacement)
  {
    if (paramAdBreakPlacement != null)
    {
      paramAdBreakPlacement = getAd(paramAdBreakPlacement);
      if ((paramAdBreakPlacement != null) && (paramAdBreakPlacement.isCustomAdMarker())) {
        return Boolean.valueOf(true);
      }
    }
    return Boolean.valueOf(false);
  }
  
  private Boolean listIsEmpty(List paramList)
  {
    if (paramList == null) {
      return Boolean.valueOf(true);
    }
    if ((paramList != null) && (paramList.isEmpty())) {
      return Boolean.valueOf(true);
    }
    return Boolean.valueOf(false);
  }
  
  private long modifyAdBreakPlacements(List paramList, VideoEngineTimeline.TimeMapping paramTimeMapping, boolean paramBoolean)
  {
    if (_toPlaceAdBreakPlacements != null) {
      _toPlaceAdBreakPlacements = null;
    }
    _oldAdBreakPlacements = new HashMap();
    long l1 = 0L;
    long l3 = paramTimeMapping.getTime();
    long l4 = _videoEngineAdapter.convertToLocalTime(l3);
    long l2 = l1;
    Object localObject1;
    AdBreakPlacement localAdBreakPlacement;
    Object localObject2;
    if (paramList != null)
    {
      paramTimeMapping = null;
      Iterator localIterator = paramList.iterator();
      localObject1 = null;
      paramList = paramTimeMapping;
      paramTimeMapping = (VideoEngineTimeline.TimeMapping)localObject1;
      for (;;)
      {
        if (localIterator.hasNext())
        {
          localAdBreakPlacement = (AdBreakPlacement)localIterator.next();
          localObject1 = getAdBreakPolicyFor(localAdBreakPlacement.getAdBreak());
          if (localObject1 != AdBreakPolicy.SKIP) {
            if (localObject1 == AdBreakPolicy.REMOVE)
            {
              _logger.i(LOG_TAG + "#AdPolicyProxy::modifyAdBreakPlacements", "Removing the Ad break due to REMOVE policy");
              localObject1 = new AdBreakRemoval(localAdBreakPlacement);
              _timelineOperationQueue.addToQueue((TimelineOperation)localObject1);
              l1 += localAdBreakPlacement.getDuration();
            }
            else
            {
              l2 = localAdBreakPlacement.getDuration();
              localObject1 = paramTimeMapping;
              if (paramTimeMapping == null) {
                localObject1 = new PlacementInformation(PlacementInformation.Type.MID_ROLL, l4, 0L);
              }
              if (localAdBreakPlacement.getAdBreak().size() > 0L)
              {
                if (!isBreakStartsWithVPAID(localAdBreakPlacement).booleanValue()) {
                  break label538;
                }
                paramTimeMapping = localAdBreakPlacement.getAdBreak().adsIterator();
                while (paramTimeMapping.hasNext())
                {
                  localObject2 = (Ad)paramTimeMapping.next();
                  if (!((Ad)localObject2).isCustomAdMarker()) {
                    paramTimeMapping = Integer.toString(((Ad)localObject2).getId());
                  }
                }
              }
            }
          }
        }
      }
    }
    for (;;)
    {
      label285:
      if (paramTimeMapping != null) {
        localAdBreakPlacement.getAdBreak().setRestoreId(paramTimeMapping);
      }
      localObject2 = localAdBreakPlacement.getPlacement();
      if ((localObject2 != null) && (_videoEngineAdapter != null))
      {
        localObject2 = new PlacementInformation(((PlacementInformation)localObject2).getType(), _videoEngineAdapter.convertToLocalTime(((PlacementInformation)localObject2).getTime()), ((PlacementInformation)localObject2).getDuration());
        _oldAdBreakPlacements.put(paramTimeMapping, new AdBreakPlacement(localAdBreakPlacement.getAdBreak(), (PlacementInformation)localObject2));
      }
      _logger.i(LOG_TAG + "#AdPolicyProxy::modifyAdBreakPlacements", "Adding ad break removal operation to queue");
      paramTimeMapping = new AdBreakRemoval(localAdBreakPlacement);
      if (paramList == null) {
        paramList = new ArrayList();
      }
      for (;;)
      {
        _timelineOperationQueue.addToQueue(paramTimeMapping);
        _logger.i(LOG_TAG + "#AdPolicyProxy::modifyAdBreakPlacements", "Adding ad break placement operation to queue");
        paramTimeMapping = new AdBreakPlacement(localAdBreakPlacement.getAdBreak(), (PlacementInformation)localObject1);
        if (_toPlaceAdBreakPlacements == null) {
          _toPlaceAdBreakPlacements = new ArrayList();
        }
        _toPlaceAdBreakPlacements.add(paramTimeMapping);
        if (_firstPendingAdBreakPlacement == null) {
          _firstPendingAdBreakPlacement = paramTimeMapping;
        }
        l1 += l2;
        paramTimeMapping = (VideoEngineTimeline.TimeMapping)localObject1;
        break;
        label538:
        paramTimeMapping = Integer.toString(localAdBreakPlacement.getAdBreak().getFirstAd().getId());
        break label285;
        l2 = l1;
        if (!listIsEmpty(_toPlaceAdBreakPlacements).booleanValue())
        {
          _timelineOperationQueue.addToQueue((TimelineOperation)_toPlaceAdBreakPlacements.get(0));
          l2 = l1;
        }
        if ((!paramBoolean) && (_mediaPlayerItem != null) && (!_mediaPlayerItem.isLive())) {
          return l3 - l2;
        }
        return l3;
      }
      paramTimeMapping = null;
    }
  }
  
  private final void removeAdBreakPlacementListeners()
  {
    if (_videoEngineDispatcher != null)
    {
      if (_onAdBreakPlacementCompletedListener != null) {
        _videoEngineDispatcher.removeEventListener(MediaPlayerEvent.Type.ADBREAK_PLACEMENT_COMPLETED, _onAdBreakPlacementCompletedListener);
      }
      if (_onAdBreakPlacementFailedListener != null) {
        _videoEngineDispatcher.removeEventListener(MediaPlayerEvent.Type.ADBREAK_PLACEMENT_FAILED, _onAdBreakPlacementFailedListener);
      }
    }
  }
  
  private List selectAdBreaksToPlayForSeek(List paramList, long paramLong1, long paramLong2)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (!listIsEmpty(paramList).booleanValue())
    {
      paramList = new AdPolicyInfo(paramList, null, paramLong1, paramLong2, 1.0F, _seekOrTrickPlay);
      localObject1 = localObject2;
      if (_adPolicySelector != null) {
        localObject1 = _adPolicySelector.selectAdBreaksToPlay(paramList);
      }
    }
    return (List)localObject1;
  }
  
  private Boolean shouldPlayUpcomingAdBreak(AdBreakPlacement paramAdBreakPlacement)
  {
    boolean bool = false;
    List localList = createAdBreakPlacementList(paramAdBreakPlacement);
    if ((paramAdBreakPlacement.getAdBreak() != null) && (paramAdBreakPlacement.getPlacement() != null))
    {
      paramAdBreakPlacement = new AdPolicyInfo(localList, null, _videoEngineAdapter.getCurrentTime(), _desiredSeekPosition.getTime(), 1.0F, _seekOrTrickPlay);
      paramAdBreakPlacement = _adPolicySelector.selectPolicyForAdBreak(paramAdBreakPlacement);
      if ((paramAdBreakPlacement == AdBreakPolicy.PLAY) || (paramAdBreakPlacement == AdBreakPolicy.REMOVE_AFTER_PLAY)) {
        bool = true;
      }
      return Boolean.valueOf(bool);
    }
    return Boolean.valueOf(false);
  }
  
  private long startTimeForSeekIntoAd(AdBreakPlacement paramAdBreakPlacement, long paramLong, VideoEngineTimeline.TimeMapping paramTimeMapping)
  {
    Object localObject = paramAdBreakPlacement.getAdBreak().adsIterator();
    long l1 = paramAdBreakPlacement.getTime();
    Ad localAd;
    for (long l2 = 0L;; l2 = localAd.getDuration() + l2)
    {
      long l3 = l1;
      if (((Iterator)localObject).hasNext())
      {
        localAd = (Ad)((Iterator)localObject).next();
        if (!TimeRange.createRange(l1 + l2, localAd.getDuration()).contains(paramTimeMapping.getTime())) {
          continue;
        }
        localObject = new AdPolicyInfo(createAdBreakPlacementList(paramAdBreakPlacement), localAd, paramLong, _desiredSeekPosition.getTime(), 1.0F, _seekOrTrickPlay);
        l3 = l1;
        if (_adPolicySelector != null)
        {
          localObject = _adPolicySelector.selectPolicyForSeekIntoAd((AdPolicyInfo)localObject);
          switch (localObject)
          {
          default: 
            paramLong = l1;
          }
        }
      }
      for (;;)
      {
        l3 = paramLong;
        return l3;
        paramLong = paramTimeMapping.getTime();
        continue;
        paramLong = l1 + l2;
        continue;
        paramLong = paramAdBreakPlacement.getTime() + paramAdBreakPlacement.getDuration();
        continue;
        paramLong = localAd.getDuration() + l2 + l1;
        continue;
        paramLong = l1;
      }
    }
  }
  
  public AdBreakPlacement createAdBreakPlacement(AdBreak paramAdBreak, PlacementInformation paramPlacementInformation)
  {
    Object localObject2 = null;
    _logger.i(LOG_TAG + "#AdPolicyProxy::createAdBreakPlacement", "AdBreak: " + paramAdBreak.getFirstAd().getId());
    Object localObject1 = localObject2;
    if (paramAdBreak != null)
    {
      if (paramPlacementInformation == null) {
        break label83;
      }
      localObject1 = new AdBreakPlacement(paramAdBreak, paramPlacementInformation);
    }
    label83:
    do
    {
      return (AdBreakPlacement)localObject1;
      paramPlacementInformation = _videoEngineTimeline.getPlacementFor(paramAdBreak);
      localObject1 = localObject2;
    } while (paramPlacementInformation == null);
    return new AdBreakPlacement(paramAdBreak, paramPlacementInformation);
  }
  
  public List createAdBreakPlacementList(AdBreakPlacement paramAdBreakPlacement)
  {
    _logger.i(LOG_TAG + "#AdPolicyProxy::createAdBreakPlacementList", "AdBreakPlacement: " + paramAdBreakPlacement);
    if (paramAdBreakPlacement != null)
    {
      ArrayList localArrayList = new ArrayList();
      localArrayList.add(paramAdBreakPlacement);
      return localArrayList;
    }
    return null;
  }
  
  public AdBreakPolicy getAdBreakPolicyFor(AdBreak paramAdBreak)
  {
    Object localObject3 = null;
    _logger.i(LOG_TAG + "#AdPolicyProxy::getgetAdBreakPolicyFor", "Selecting the policy for upcoming Ad Break");
    Object localObject1 = localObject3;
    if (paramAdBreak != null) {
      if (paramAdBreak.getRestoreId() == null) {
        break label201;
      }
    }
    label201:
    for (localObject1 = (AdBreakPlacement)_oldAdBreakPlacements.get(paramAdBreak.getRestoreId());; localObject1 = null)
    {
      Object localObject2 = localObject1;
      if (localObject1 == null) {
        localObject2 = createAdBreakPlacement(paramAdBreak, null);
      }
      paramAdBreak = createAdBreakPlacementList((AdBreakPlacement)localObject2);
      localObject1 = localObject3;
      if (localObject2 != null)
      {
        localObject1 = localObject3;
        if (((AdBreakPlacement)localObject2).getAdBreak() != null)
        {
          localObject1 = localObject3;
          if (((AdBreakPlacement)localObject2).getPlacement() != null)
          {
            localObject1 = localObject3;
            if (_adPolicySelector != null)
            {
              localObject1 = localObject3;
              if (_videoEngineAdapter != null)
              {
                _logger.i(LOG_TAG + "#AdPolicyProxy::getgetAdBreakPolicyFor", "Get AdBreakPolicy.");
                paramAdBreak = new AdPolicyInfo(paramAdBreak, null, _videoEngineAdapter.getCurrentTime(), 0L, 1.0F, AdPolicyMode.PLAY);
                localObject1 = _adPolicySelector.selectPolicyForAdBreak(paramAdBreak);
              }
            }
          }
        }
      }
      return (AdBreakPolicy)localObject1;
    }
  }
  
  public void placeTimelineLineOperation(TimelineOperation paramTimelineOperation)
  {
    if (paramTimelineOperation != null) {
      _timelineOperationQueue.addToQueue(paramTimelineOperation);
    }
  }
  
  public void registerSeekOrTrickPlayToTime(VideoEngineTimeline.TimeMapping paramTimeMapping, long paramLong, AdPolicyMode paramAdPolicyMode)
  {
    _seekOrTrickPlay = paramAdPolicyMode;
    _desiredSeekPosition = paramTimeMapping;
    _pendingAdBreakPlacements = new ArrayList();
    long l = paramTimeMapping.getTime();
    _logger.i(LOG_TAG + "#AdPolicyProxy::registerSeekOrTrickPlayToTime", "begin=" + paramLong + " end=" + paramTimeMapping.getTime());
    if (paramTimeMapping.getTime() < paramLong) {}
    for (boolean bool = true;; bool = false)
    {
      paramAdPolicyMode = getSeekIntoAdBreakPlacement(paramTimeMapping);
      Object localObject1 = getPendingAdBreakPlacements(_desiredSeekPosition, paramLong);
      for (paramTimeMapping = paramAdPolicyMode;; paramTimeMapping = null)
      {
        try
        {
          if (isCustomAdMarkerAdBreakPlacement(paramAdPolicyMode).booleanValue())
          {
            paramTimeMapping = getAd(paramAdPolicyMode);
            localObject2 = _videoEngineAdapter.getRawTimeline();
            if ((localObject2 == null) || (!paramTimeMapping.getPrimaryAsset().getMediaResource().getMetadata().getValue(DefaultMetadataKeys.METADATA_KEY_ADJUST_SEEK_ENABLED.getValue()).equals("true"))) {
              continue;
            }
            VideoEngineTimeline.TimeMapping.create(firstPeriodIndex, paramAdPolicyMode.getTime());
            paramTimeMapping = paramAdPolicyMode;
          }
        }
        catch (VideoEngineException paramTimeMapping)
        {
          for (;;)
          {
            Object localObject2;
            paramTimeMapping = paramAdPolicyMode;
          }
          if (localObject1 == null) {
            break label369;
          }
          paramAdPolicyMode = ((List)localObject1).iterator();
          while (paramAdPolicyMode.hasNext())
          {
            localObject1 = (AdBreakPlacement)paramAdPolicyMode.next();
            if ((((AdBreakPlacement)localObject1).getAdBreak().size() > 0L) && (isBreakStartsWithVPAID((AdBreakPlacement)localObject1).booleanValue())) {
              _pendingAdBreakPlacements.add(localObject1);
            }
          }
          _logger.i(LOG_TAG + "#AdPolicyProxy::registerSeekOrTrickPlayToTime", "Pending ad breaks after cleanup: " + _pendingAdBreakPlacements.size());
          if (paramTimeMapping == null) {
            break label538;
          }
        }
        if (localObject1 == null) {
          break;
        }
        paramAdPolicyMode = ((List)localObject1).iterator();
        while (paramAdPolicyMode.hasNext())
        {
          localObject2 = (AdBreakPlacement)paramAdPolicyMode.next();
          if ((((AdBreakPlacement)localObject2).getAdBreak().size() > 0L) && (!isCustomAdMarkerAdBreakPlacement((AdBreakPlacement)localObject2).booleanValue())) {
            _pendingAdBreakPlacements.add(localObject2);
          }
        }
      }
      label369:
      if (_pendingAdBreakPlacements.size() == 0)
      {
        _logger.i(LOG_TAG + "#AdPolicyProxy::registerSeekOrTrickPlayToTime", "Seek into ad break without other ad breaks skipped over");
        if (shouldPlayUpcomingAdBreak(paramTimeMapping).booleanValue()) {}
        for (paramLong = startTimeForSeekIntoAd(paramTimeMapping, paramLong, _desiredSeekPosition);; paramLong = paramTimeMapping.getDuration() + l)
        {
          _cachedSeekPosition = paramLong;
          if (_videoEngineDispatcher != null) {
            _videoEngineDispatcher.dispatch(SeekEvent.createSeekAdjustCompleted(_cachedSeekPosition));
          }
          return;
        }
      }
      label538:
      if ((paramTimeMapping != null) && (!listIsEmpty(_pendingAdBreakPlacements).booleanValue()))
      {
        _logger.i(LOG_TAG + "#AdPolicyProxy::registerSeekOrTrickPlayToTime", "Seek into ad break with other ad breaks skipped over");
        if (_desiredSeekPosition.getTime() > paramLong)
        {
          _pendingAdBreakPlacements.add(paramTimeMapping);
          label613:
          _desiredSeekPosition = VideoEngineTimeline.TimeMapping.create(_desiredSeekPosition.getPeriod(), paramTimeMapping.getTime() + paramTimeMapping.getDuration());
        }
      }
      for (;;)
      {
        _pendingAdBreakPlacements = selectAdBreaksToPlayForSeek(_pendingAdBreakPlacements, paramLong, _desiredSeekPosition.getTime());
        _logger.i(LOG_TAG + "#AdPolicyProxy::registerSeekOrTrickPlayToTime", "Seek into content currentTime=" + paramLong + ", desiredPosition" + _desiredSeekPosition.toString() + ", selectAdBreaksToPlayForSeek empty: " + listIsEmpty(_pendingAdBreakPlacements));
        if (!listIsEmpty(_pendingAdBreakPlacements).booleanValue())
        {
          if (_oldAdBreakPlacements != null) {
            _oldAdBreakPlacements.clear();
          }
          if (_onAdBreakPlacementCompletedListener != null) {
            _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.ADBREAK_PLACEMENT_COMPLETED, _onAdBreakPlacementCompletedListener);
          }
          if (_onAdBreakPlacementFailedListener != null) {
            _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.ADBREAK_PLACEMENT_FAILED, _onAdBreakPlacementFailedListener);
          }
          _cachedSeekPosition = modifyAdBreakPlacements(_pendingAdBreakPlacements, _desiredSeekPosition, bool);
          if ((paramTimeMapping != null) && (bool)) {
            _cachedSeekPosition += 1L;
          }
          if ((_oldAdBreakPlacements != null) && (!_oldAdBreakPlacements.isEmpty())) {
            break;
          }
          _videoEngineDispatcher.dispatch(SeekEvent.createSeekAdjustCompleted(_cachedSeekPosition));
          return;
          l = paramTimeMapping.getTime() + paramTimeMapping.getDuration();
          break label613;
        }
        _cachedSeekPosition = l;
        if (_videoEngineDispatcher == null) {
          break;
        }
        _videoEngineDispatcher.dispatch(SeekEvent.createSeekAdjustCompleted(_cachedSeekPosition));
        return;
      }
    }
  }
  
  public void removeOldAdBreakPlacementForAdBreak(AdBreak paramAdBreak)
  {
    if ((paramAdBreak != null) && (_oldAdBreakPlacements != null)) {
      _oldAdBreakPlacements.remove(paramAdBreak.getRestoreId());
    }
  }
  
  public void restoreAdBreak(AdBreak paramAdBreak)
  {
    AdBreakPlacement localAdBreakPlacement = (AdBreakPlacement)_oldAdBreakPlacements.get(paramAdBreak.getRestoreId());
    if (localAdBreakPlacement != null)
    {
      _logger.i(LOG_TAG + "AdPolicyProxy::restoreAdBreakPlacement", "Restore ad break");
      _oldAdBreakPlacements.remove(paramAdBreak.getRestoreId());
      localAdBreakPlacement.getAdBreak().setRestoreId(null);
      localAdBreakPlacement.getAdBreak().setIsWatched(paramAdBreak.isWatched());
      _timelineOperationQueue.addToQueue(localAdBreakPlacement);
    }
  }
  
  public void seekThroughAdBreak(AdBreak paramAdBreak)
  {
    try
    {
      paramAdBreak = VideoEngineTimeline.TimeMapping.create(-1, paramAdBreak.getTime() + paramAdBreak.getDuration());
      _videoEngineAdapter.seek(paramAdBreak);
      return;
    }
    catch (Exception paramAdBreak)
    {
      _logger.w(LOG_TAG + "#seekThroughAdBreak", "Exception raised while trying to seek through AdBreak ", paramAdBreak);
    }
  }
  
  public void setAdBreakAsWatched(AdBreak paramAdBreak, AdBreakAsWatched paramAdBreakAsWatched)
  {
    AdBreakAsWatched localAdBreakAsWatched = AdBreakAsWatched.AD_BREAK_AS_WATCHED_ON_BEGIN;
    Object localObject = localAdBreakAsWatched;
    if (_adPolicySelector != null)
    {
      List localList = createAdBreakPlacementList(createAdBreakPlacement(paramAdBreak, null));
      localObject = localAdBreakAsWatched;
      if (_videoEngineAdapter != null)
      {
        localObject = new AdPolicyInfo(localList, null, _videoEngineAdapter.getCurrentTime(), 0L, 1.0F, AdPolicyMode.PLAY);
        localObject = _adPolicySelector.selectWatchedPolicyForAdBreak((AdPolicyInfo)localObject);
      }
    }
    if ((((AdBreakAsWatched)localObject).getValue().equalsIgnoreCase(paramAdBreakAsWatched.getValue())) && (!paramAdBreak.isWatched().booleanValue())) {
      paramAdBreak.setIsWatched(Boolean.valueOf(true));
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdPolicyProxy
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */