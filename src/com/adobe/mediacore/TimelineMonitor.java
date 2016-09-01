package com.adobe.mediacore;

import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.AdBreakAsWatched;
import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdAsset;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;
import com.adobe.mediacore.timeline.advertising.AdBreakPolicy;
import com.adobe.mediacore.timeline.advertising.AdBreakRemoval;
import com.adobe.mediacore.timeline.advertising.AdClick;
import com.adobe.mediacore.timeline.advertising.AdPolicyMode;
import com.adobe.mediacore.timeline.advertising.ContentTracker;
import com.adobe.mediacore.timeline.advertising.PlacementInformation;
import com.adobe.mediacore.utils.StringUtils;
import java.util.Iterator;
import java.util.Vector;

class TimelineMonitor
{
  private static final int INVALID_TIME = -1;
  private static final String LOG_TAG = "[PSDK]::" + TimelineMonitor.class.getSimpleName();
  MediaPlayer.AdPlaybackEventListener _adPlaybackEventListener = new TimelineMonitor.3(this);
  private AdPolicyProxy _adPolicyProxy;
  private final AdTimeline _adTimeline;
  private long _contentId = 0L;
  private long _contentStartTime = 0L;
  private AdTimeline.Info _currentInfo = null;
  private boolean _customAdBreakPlaying = false;
  private Vector _deleteOnAdBreakExit;
  private Vector _detectedAdBreaks;
  private AdTimeline.AdInformation _lastAdInfo;
  private long _lastProcessedTime = -1L;
  private AdBreak _lastSkippedAdBreak;
  private final Logger _logger = Log.getLogger(LOG_TAG);
  private ContentChangedListener _onContentChangedListener = new TimelineMonitor.1(this);
  private ContentMarkerListener _onContentMarkerListener = new TimelineMonitor.2(this);
  private Ad _pendingAd = null;
  private AdBreak _pendingAdBreak = null;
  private Vector _setAdBreakForRestore;
  private boolean _skipAdBreaks;
  private long _skippedDuration;
  private VideoEngineDispatcher _videoEngineDispatcher;
  
  public TimelineMonitor(VideoEngineDispatcher paramVideoEngineDispatcher, AdTimeline paramAdTimeline)
  {
    _videoEngineDispatcher = paramVideoEngineDispatcher;
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.CONTENT_CHANGED, _onContentChangedListener);
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.CONTENT_MARKER, _onContentMarkerListener);
    _videoEngineDispatcher.addEventListener(MediaPlayer.Event.AD_PLAYBACK, _adPlaybackEventListener);
    _adTimeline = paramAdTimeline;
    _skipAdBreaks = false;
    _lastSkippedAdBreak = null;
    _skippedDuration = 0L;
  }
  
  private void contentChanged(int paramInt, long paramLong)
  {
    _logger.i(LOG_TAG + "#contentChanged", "Content changed to [" + paramInt + "] at time [" + paramLong + "]");
    _contentStartTime = paramLong;
    _contentId = paramInt;
    try
    {
      _lastAdInfo = null;
      _lastProcessedTime = -1L;
      update(paramInt, paramLong);
      return;
    }
    finally {}
  }
  
  private void deleteAdBreak(AdBreak paramAdBreak, boolean paramBoolean)
  {
    _logger.i(LOG_TAG + "#deleteAdBreak", "Deleting Ad Break: " + paramAdBreak.getFirstAd().getId());
    if (!paramBoolean) {
      _adPolicyProxy.seekThroughAdBreak(paramAdBreak);
    }
    if (_setAdBreakForRestore.contains(paramAdBreak))
    {
      _setAdBreakForRestore.remove(paramAdBreak);
      _adPolicyProxy.removeOldAdBreakPlacementForAdBreak(paramAdBreak);
    }
    paramAdBreak = _adPolicyProxy.createAdBreakPlacement(paramAdBreak, null);
    if (paramAdBreak != null)
    {
      paramAdBreak = new AdBreakRemoval(paramAdBreak);
      if (paramAdBreak != null) {
        _adPolicyProxy.placeTimelineLineOperation(paramAdBreak);
      }
    }
  }
  
  private boolean isUpdateNeeded(AdTimeline.Info paramInfo)
  {
    if (_currentInfo == null) {
      if (paramInfo == null) {}
    }
    while (!_currentInfo.equals(paramInfo))
    {
      return true;
      return false;
    }
    return false;
  }
  
  private void notifyOnSkippedAdBreaks(long paramLong)
  {
    Iterator localIterator = _adTimeline.timelineMarkers();
    while (localIterator.hasNext())
    {
      Object localObject = (AdBreakPlacement)localIterator.next();
      PlacementInformation localPlacementInformation = ((AdBreakPlacement)localObject).getPlacement();
      localObject = ((AdBreakPlacement)localObject).getAdBreak();
      if ((paramLong >= localPlacementInformation.getTime()) && (paramLong <= localPlacementInformation.getTime() + ((AdBreak)localObject).getDuration()) && (localObject != _lastSkippedAdBreak))
      {
        _logger.i(LOG_TAG + "#update", "Ad break skipped.");
        _videoEngineDispatcher.dispatch(AdBreakPlaybackEvent.createSkippedEvent((AdBreak)localObject));
        _lastSkippedAdBreak = ((AdBreak)localObject);
        _skippedDuration += ((AdBreak)localObject).getDuration();
      }
    }
  }
  
  private void onAdBreakComplete(AdBreak paramAdBreak)
  {
    _logger.i(LOG_TAG + "#onAdBreakComplete", "Ad Break Completed: " + paramAdBreak.getFirstAd().getId());
    _adPolicyProxy.setAdBreakAsWatched(paramAdBreak, AdBreakAsWatched.AD_BREAK_AS_WATCHED_ON_END);
    if ((paramAdBreak != null) && (paramAdBreak.getLastAd() != null) && (paramAdBreak.getLastAd().getContentTracker() != null)) {
      paramAdBreak.getLastAd().getContentTracker().onAdBreakComplete(paramAdBreak);
    }
    if ((!_deleteOnAdBreakExit.contains(paramAdBreak)) && (_setAdBreakForRestore.contains(paramAdBreak)))
    {
      localAdBreakPlacement = _adPolicyProxy.createAdBreakPlacement(paramAdBreak, null);
      _adPolicyProxy.placeTimelineLineOperation(new AdBreakRemoval(localAdBreakPlacement));
      _setAdBreakForRestore.remove(paramAdBreak);
      _adPolicyProxy.restoreAdBreak(paramAdBreak);
    }
    while (!_deleteOnAdBreakExit.contains(paramAdBreak))
    {
      AdBreakPlacement localAdBreakPlacement;
      return;
    }
    _deleteOnAdBreakExit.remove(paramAdBreak);
    deleteAdBreak(paramAdBreak, true);
  }
  
  private void onAdBreakDetected(AdBreak paramAdBreak)
  {
    if (_adPolicyProxy != null)
    {
      AdBreakPolicy localAdBreakPolicy = _adPolicyProxy.getAdBreakPolicyFor(paramAdBreak);
      if (paramAdBreak.getRestoreId() != null) {
        _setAdBreakForRestore.add(paramAdBreak);
      }
      if (localAdBreakPolicy != null) {}
      switch (localAdBreakPolicy)
      {
      case ???: 
      default: 
        return;
      case ???: 
        skipAdBreak(paramAdBreak);
        return;
      case ???: 
        deleteAdBreak(paramAdBreak, false);
        return;
      }
      _deleteOnAdBreakExit.add(paramAdBreak);
      return;
    }
    _logger.w(LOG_TAG + "#onAdBreakDetected", "No ad policy proxy available.");
  }
  
  private void onAdBreakStart(AdBreak paramAdBreak)
  {
    _logger.i(LOG_TAG + "#onAdBreakStart", "Ad Break started: " + paramAdBreak.getFirstAd().getId());
    if (_detectedAdBreaks.indexOf(paramAdBreak) == -1)
    {
      _detectedAdBreaks.add(paramAdBreak);
      onAdBreakDetected(paramAdBreak);
    }
    if ((paramAdBreak != null) && (paramAdBreak.getLastAd() != null) && (paramAdBreak.getLastAd().getContentTracker() != null)) {
      paramAdBreak.getLastAd().getContentTracker().onAdBreakStart(paramAdBreak);
    }
    _adPolicyProxy.setAdBreakAsWatched(paramAdBreak, AdBreakAsWatched.AD_BREAK_AS_WATCHED_ON_BEGIN);
  }
  
  private void skipAdBreak(AdBreak paramAdBreak)
  {
    _adPolicyProxy.seekThroughAdBreak(paramAdBreak);
  }
  
  private void update(long paramLong1, long paramLong2)
  {
    for (;;)
    {
      try
      {
        paramLong1 = _lastProcessedTime;
        if (paramLong1 == paramLong2) {
          return;
        }
        _lastProcessedTime = paramLong2;
        if (_skipAdBreaks)
        {
          notifyOnSkippedAdBreaks(paramLong2);
          continue;
        }
        localInfo = _adTimeline.getInfoForContentId(_contentId);
      }
      finally {}
      AdTimeline.Info localInfo;
      if (isUpdateNeeded(localInfo)) {
        updateCurrentAdInfo(localInfo);
      } else if (_pendingAd == null) {
        updateAdProgress(localInfo, paramLong2);
      }
    }
  }
  
  private void updateAdProgress(AdTimeline.Info paramInfo, long paramLong)
  {
    AdBreak localAdBreak;
    AdTimeline.AdInformation localAdInformation;
    if (paramInfo != null)
    {
      localAdBreak = paramInfo.getAdBreak();
      paramInfo = paramInfo.getAd();
      if ((localAdBreak != null) && (paramInfo != null))
      {
        long l = paramLong - _contentStartTime;
        localAdInformation = new AdTimeline.AdInformation(paramInfo, (int)(100L * l / paramInfo.getDuration()));
        _logger.i(LOG_TAG + "#updateAdProgress", "Updating ad progress for contentId [" + _contentId + "] ad duration: " + localAdInformation.getAd().getDuration() + ", ad start time: " + _contentStartTime + ", current time: " + paramLong + ", time difference: " + l + ", progress: " + localAdInformation.getProgress() + "%");
        if ((localAdInformation.getProgress() >= 0) && (localAdInformation.getProgress() <= 100)) {
          break label232;
        }
        _logger.w(LOG_TAG + "#updateAdProgress", "Ad progress value is not valid.");
      }
    }
    return;
    try
    {
      label232:
      if ((_lastAdInfo != null) && (_lastAdInfo.getAd().equals(localAdInformation.getAd())) && (localAdInformation.getProgress() <= _lastAdInfo.getProgress())) {
        return;
      }
    }
    finally {}
    _lastAdInfo = localAdInformation;
    if (paramInfo.getContentTracker() != null) {
      paramInfo.getContentTracker().onAdProgress(localAdInformation.getAd(), localAdInformation.getProgress());
    }
    _videoEngineDispatcher.dispatch(AdPlaybackEvent.createProgressEvent(localAdBreak, localAdInformation.getAd(), localAdInformation.getProgress()));
  }
  
  public VideoEngineTimeline.TimeMapping adjustSeekPosition(VideoEngineTimeline.TimeMapping paramTimeMapping, long paramLong, AdPolicyMode paramAdPolicyMode)
  {
    return _adTimeline.getAdjustedPosition(paramTimeMapping, paramLong, paramAdPolicyMode);
  }
  
  public void clear()
  {
    _currentInfo = null;
    _contentId = 0L;
    _contentStartTime = 0L;
    _lastProcessedTime = -1L;
    _lastAdInfo = null;
    _videoEngineDispatcher.removeEventListener(MediaPlayerEvent.Type.CONTENT_CHANGED, _onContentChangedListener);
    _videoEngineDispatcher.removeEventListener(MediaPlayerEvent.Type.CONTENT_MARKER, _onContentMarkerListener);
  }
  
  public void enableAdBreaks()
  {
    _skipAdBreaks = false;
    _skippedDuration = 0L;
  }
  
  public void initialize(AdPolicyProxy paramAdPolicyProxy)
  {
    _adPolicyProxy = paramAdPolicyProxy;
    _detectedAdBreaks = new Vector();
    _deleteOnAdBreakExit = new Vector();
    _setAdBreakForRestore = new Vector();
  }
  
  public boolean isPlayingAdBreak()
  {
    return _currentInfo != null;
  }
  
  public void processAdClick()
  {
    AdTimeline.Info localInfo = _adTimeline.getInfoForContentId(_contentId);
    if (localInfo != null)
    {
      Ad localAd = localInfo.getAd();
      if (localAd != null)
      {
        AdClick localAdClick = localAd.getPrimaryAsset().getAdClick();
        if ((localAdClick != null) && (!StringUtils.isEmpty(localAdClick.getUrl())))
        {
          if (localAd.getContentTracker() != null) {
            localAd.getContentTracker().onAdClick(localAd);
          }
          _videoEngineDispatcher.dispatch(AdClickEvent.createAdClickEvent(localInfo.getAdBreak(), localInfo.getAd(), localAdClick));
        }
      }
    }
  }
  
  public void skipAdBreaks()
  {
    _skippedDuration = 0L;
    _skipAdBreaks = true;
  }
  
  public long skippedDuration()
  {
    return _skippedDuration;
  }
  
  public boolean skippingAdBreaks()
  {
    return _skipAdBreaks;
  }
  
  public void update(long paramLong)
  {
    update(_contentId, paramLong);
  }
  
  public void updateCurrentAdInfo(AdTimeline.Info paramInfo)
  {
    Object localObject = null;
    for (;;)
    {
      AdBreak localAdBreak1;
      try
      {
        _logger.i(LOG_TAG + "#updateCurrentAdInfo", "Updating current ad info.");
        if (_currentInfo == null) {
          break label500;
        }
        AdBreak localAdBreak2 = _currentInfo.getAdBreak();
        Ad localAd = _currentInfo.getAd();
        if ((paramInfo == null) || (!localAd.equals(paramInfo.getAd())))
        {
          _logger.i(LOG_TAG + "#updateCurrentAdInfo", "Ad complete.");
          _videoEngineDispatcher.dispatch(AdPlaybackEvent.createCompleteEvent(localAdBreak2, localAd));
          if (localAd.getContentTracker() != null) {
            localAd.getContentTracker().onAdComplete(localAd);
          }
        }
        if (paramInfo != null)
        {
          localObject = localAd;
          localAdBreak1 = localAdBreak2;
          if (localAdBreak2.equals(paramInfo.getAdBreak())) {}
        }
        else
        {
          localObject = localAd;
          localAdBreak1 = localAdBreak2;
          if (localAdBreak2.getLastAd().equals(localAd))
          {
            _logger.i(LOG_TAG + "#updateCurrentAdInfo", "Ad break complete.");
            _pendingAdBreak = null;
            _pendingAd = null;
            _videoEngineDispatcher.dispatch(AdBreakPlaybackEvent.createCompleteEvent(localAdBreak2));
            onAdBreakComplete(localAdBreak2);
            localAdBreak1 = localAdBreak2;
            localObject = localAd;
          }
        }
        _currentInfo = paramInfo;
        if (paramInfo != null)
        {
          if (!paramInfo.getAdBreak().equals(localAdBreak1))
          {
            if (paramInfo.getAdBreak().getFirstAd().getType() == MediaResource.Type.CUSTOM) {
              continue;
            }
            _logger.i(LOG_TAG + "#updateCurrentAdInfo", "Ad break start.");
            _videoEngineDispatcher.dispatch(AdBreakPlaybackEvent.createStartEvent(paramInfo.getAdBreak()));
            onAdBreakStart(paramInfo.getAdBreak());
          }
          if (!paramInfo.getAd().equals((Ad)localObject))
          {
            localObject = paramInfo.getAdBreak().getPrevAd(paramInfo.getAd());
            if ((_pendingAdBreak == null) && ((localObject == null) || (((Ad)localObject).getType() != MediaResource.Type.CUSTOM))) {
              break label419;
            }
            _pendingAd = paramInfo.getAd();
          }
        }
        return;
        _pendingAdBreak = paramInfo.getAdBreak();
        continue;
        _logger.i(LOG_TAG + "#updateCurrentAdInfo", "Ad start.");
      }
      finally {}
      label419:
      _videoEngineDispatcher.dispatch(AdPlaybackEvent.createStartEvent(paramInfo.getAdBreak(), paramInfo.getAd()));
      if (paramInfo.getAd().getContentTracker() != null)
      {
        paramInfo.getAd().getContentTracker().onAdStart(paramInfo.getAd());
        continue;
        label500:
        localAdBreak1 = null;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.TimelineMonitor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */