package com.adobe.mediacore;

import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.AdSignalingMode;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.metadata.TimedMetadata;
import com.adobe.mediacore.timeline.PlacementOpportunity;
import com.adobe.mediacore.timeline.TimelineOperation;
import com.adobe.mediacore.timeline.advertising.AdPolicySelector;
import com.adobe.mediacore.timeline.advertising.AdProvider;
import com.adobe.mediacore.timeline.advertising.AdProvider.OnCompleteListener;
import com.adobe.mediacore.timeline.advertising.ContentResolver;
import com.adobe.mediacore.timeline.advertising.ContentResolver.OnTimeUpdateListener;
import com.adobe.mediacore.timeline.advertising.PlacementInformation;
import com.adobe.mediacore.utils.TimeRange;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Queue;

class MediaPlayerClient
{
  private static final String LOG_TAG = "[PSDK]::" + MediaPlayerClient.class.getSimpleName();
  private final AdClientFactory _adClientFactory;
  private AdPolicyProxy _adPolicyProxy;
  private AdPolicySelector _adPolicySelector;
  private final AdProviderListener _adProviderListener;
  private final AdSignalingMode _adSignalingMode;
  private TimelineMonitor _adTimelineMonitor;
  private List _contentResolvers;
  private final VideoEngineDispatcher _dispatcher;
  private final Logger _logger = Log.getLogger(LOG_TAG);
  private final MediaPlayerItem _mediaPlayerItem;
  private MediaPlayer.AdPlaybackEventListener _onAdPlaybackEventListener = new MediaPlayerClient.2(this);
  private OpportunityHandledListener _onOpportunityCompletedListener = new MediaPlayerClient.1(this);
  private PlacementOpportunityDetector _placementOpportunityDetector;
  protected List _processedTimedMetadatas = new ArrayList();
  private PlacementOpportunity _processingPlacementOpportunity;
  private long _processingTime = -1L;
  private final Queue _queuedOpportunities;
  private int _reservations = 0;
  private final TimelineOperationQueue _timelineOperationQueue;
  private final VideoEngineAdapter _videoEngineAdapter;
  private final VideoEngineTimeline _videoEngineTimeline;
  private final VideoEngineTimelineProxy _videoEngineTimelineProxy;
  
  public MediaPlayerClient(VideoEngineDispatcher paramVideoEngineDispatcher, MediaPlayerItem paramMediaPlayerItem, VideoEngineAdapter paramVideoEngineAdapter, AdClientFactory paramAdClientFactory, AdSignalingMode paramAdSignalingMode)
  {
    _dispatcher = paramVideoEngineDispatcher;
    _videoEngineAdapter = paramVideoEngineAdapter;
    _videoEngineTimeline = _videoEngineAdapter.getTimeline();
    _videoEngineTimeline.setMediaPlayerClient(this);
    _timelineOperationQueue = new TimelineOperationQueue(_videoEngineAdapter.getTimeline(), paramVideoEngineDispatcher);
    _videoEngineTimelineProxy = _videoEngineAdapter.createVideoEngineTimelineProxy();
    _adProviderListener = new AdProviderListener();
    _mediaPlayerItem = paramMediaPlayerItem;
    _queuedOpportunities = new ArrayDeque();
    _adClientFactory = paramAdClientFactory;
    _adSignalingMode = paramAdSignalingMode;
    _dispatcher.addEventListener(MediaPlayerEvent.Type.OPPORTUNITY_COMPLETED, _onOpportunityCompletedListener);
    _dispatcher.addEventListener(MediaPlayerEvent.Type.OPPORTUNITY_FAILED, _onOpportunityCompletedListener);
    _dispatcher.addEventListener(MediaPlayer.Event.AD_PLAYBACK, _onAdPlaybackEventListener);
  }
  
  private boolean isValid(PlacementOpportunity paramPlacementOpportunity)
  {
    if ((paramPlacementOpportunity == null) || (paramPlacementOpportunity.getPlacementInformation() == null))
    {
      _logger.w(LOG_TAG + "#isOpportunity", "PlacementOpportunity received is invalid.");
      return false;
    }
    long l1 = paramPlacementOpportunity.getPlacementInformation().getTime();
    Iterator localIterator = _queuedOpportunities.iterator();
    while (localIterator.hasNext())
    {
      PlacementOpportunity localPlacementOpportunity = (PlacementOpportunity)localIterator.next();
      long l2 = localPlacementOpportunity.getPlacementInformation().getTime();
      long l3 = localPlacementOpportunity.getPlacementInformation().getDuration();
      if ((l2 <= l1) && (l1 < l3 + l2))
      {
        _logger.w(LOG_TAG + "#isOpportunity", "PlacementOpportunity is overlapping an existing one [" + paramPlacementOpportunity.toString() + "] with [" + localPlacementOpportunity.toString() + "]");
        return false;
      }
    }
    return true;
  }
  
  private ContentResolver lookupContentResolver(PlacementOpportunity paramPlacementOpportunity)
  {
    Object localObject1 = null;
    Iterator localIterator = null;
    if (paramPlacementOpportunity == null) {
      localObject2 = localIterator;
    }
    do
    {
      do
      {
        do
        {
          return (ContentResolver)localObject2;
          localObject2 = localIterator;
        } while (_contentResolvers == null);
        localObject2 = localIterator;
      } while (_contentResolvers.isEmpty());
      localIterator = _contentResolvers.iterator();
      localObject2 = localObject1;
    } while (!localIterator.hasNext());
    Object localObject2 = (ContentResolver)localIterator.next();
    if (((ContentResolver)localObject2).canResolve(paramPlacementOpportunity)) {
      localObject1 = localObject2;
    }
    for (;;)
    {
      break;
    }
  }
  
  private void notifyAdResolvingCompletion()
  {
    _dispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.CONTENT_PLACEMENT_COMPLETE));
  }
  
  private void processQueuedOpportunities()
  {
    if (_processingPlacementOpportunity != null) {}
    long l;
    for (;;)
    {
      return;
      synchronized (_queuedOpportunities)
      {
        _processingPlacementOpportunity = ((PlacementOpportunity)_queuedOpportunities.poll());
        if (lookupContentResolver(_processingPlacementOpportunity) != null)
        {
          _logger.i(LOG_TAG + "#processQueuedOpportunities", "Processing " + _processingPlacementOpportunity.toString());
          l = _processingPlacementOpportunity.getPlacementInformation().getTime();
          if (_videoEngineTimelineProxy.containsHoldFor(l)) {
            break label325;
          }
          _logger.i(LOG_TAG + "#processQueuedOpportunities", "Trying to place HOLD at " + l);
          ??? = _videoEngineTimelineProxy.getHoldAt(l);
          if (??? == null)
          {
            _logger.i(LOG_TAG + "#processQueuedOpportunities", "Unable to place HOLD at " + l + ". Ignoring timedMetadata");
            removeTimedMetadata(l);
            _processingPlacementOpportunity = null;
            processQueuedOpportunities();
            return;
          }
        }
      }
    }
    _logger.i(LOG_TAG + "#processQueuedOpportunities", "Adding reference for opportunity for  HOLD at " + l);
    _videoEngineTimelineProxy.addHoldReference((TimelineHold)???);
    label325:
    lookupContentResolver(_processingPlacementOpportunity).resolveAds(_processingPlacementOpportunity.getMetadata(), _processingPlacementOpportunity);
  }
  
  private void removeTimedMetadata(long paramLong)
  {
    synchronized (_processedTimedMetadatas)
    {
      ArrayList localArrayList = new ArrayList();
      Iterator localIterator = _processedTimedMetadatas.iterator();
      while (localIterator.hasNext())
      {
        TimedMetadata localTimedMetadata = (TimedMetadata)localIterator.next();
        if (localTimedMetadata.getTime() == paramLong) {
          localArrayList.add(localTimedMetadata);
        }
      }
    }
    _processedTimedMetadatas.removeAll(localCollection);
  }
  
  private void resolveOpportunity(PlacementOpportunity paramPlacementOpportunity)
  {
    if (paramPlacementOpportunity == null) {
      throw new IllegalArgumentException("PlacementOpportunity parameter can not be null.");
    }
    synchronized (_queuedOpportunities)
    {
      if (isValid(paramPlacementOpportunity))
      {
        _queuedOpportunities.add(paramPlacementOpportunity);
        processQueuedOpportunities();
      }
      return;
    }
  }
  
  public void beginResolveAds(PlacementInformation paramPlacementInformation)
  {
    if ((_contentResolvers == null) || (_contentResolvers.size() == 0))
    {
      registerPlacement(0);
      notifyAdResolvingCompletion();
      return;
    }
    _logger.i(LOG_TAG + "#beginResolveAds", "Ad resolving and placementInformation process is starting.");
    Object localObject1 = _mediaPlayerItem.getResource().getMetadata();
    paramPlacementInformation = new PlacementOpportunity("", paramPlacementInformation, (Metadata)localObject1);
    try
    {
      localObject2 = lookupContentResolver(paramPlacementInformation);
      if (localObject2 != null)
      {
        ((ContentResolver)localObject2).resolveAds((Metadata)localObject1, paramPlacementInformation);
        return;
      }
    }
    catch (IllegalArgumentException paramPlacementInformation)
    {
      localObject1 = "Ad resolving and placementInformation process cancelled due argument exception [" + paramPlacementInformation.toString() + "].";
      _logger.w(LOG_TAG + "#beginResolveAds", (String)localObject1);
      localObject1 = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.PLAYBACK_OPERATION_FAIL, "Ad resolving and placementInformation process cancelled due argument exception.");
      Object localObject2 = new MetadataNode();
      ((Metadata)localObject2).setValue("DESCRIPTION", paramPlacementInformation.getMessage());
      ((MediaPlayerNotification.Warning)localObject1).setMetadata((Metadata)localObject2);
      _dispatcher.dispatch(OperationFailedEvent.createEvent((MediaPlayerNotification.Warning)localObject1));
      notifyAdResolvingCompletion();
      return;
    }
    unregisterPlacement();
  }
  
  public boolean doneInitialResolving()
  {
    return _reservations == 0;
  }
  
  public AdPolicyProxy getAdPolicyProxy()
  {
    return _adPolicyProxy;
  }
  
  public AdSignalingMode getAdSignalingMode()
  {
    return _adSignalingMode;
  }
  
  public void initialize(VideoEngineTimeline.TimeMapping paramTimeMapping, TimelineMonitor paramTimelineMonitor)
  {
    _adTimelineMonitor = paramTimelineMonitor;
    if ((_adClientFactory instanceof AdvertisingFactory))
    {
      _adPolicySelector = ((AdvertisingFactory)_adClientFactory).createAdPolicySelector(_mediaPlayerItem);
      if (_adPolicySelector == null) {
        _adPolicySelector = new DefaultAdPolicySelector(_mediaPlayerItem);
      }
      _contentResolvers = ((AdvertisingFactory)_adClientFactory).createContentResolvers(_mediaPlayerItem);
      _adPolicyProxy = new AdPolicyProxy(_videoEngineAdapter, _dispatcher, _videoEngineTimeline, _timelineOperationQueue, _mediaPlayerItem, _adPolicySelector);
      _adTimelineMonitor.initialize(_adPolicyProxy);
    }
    _placementOpportunityDetector = _adClientFactory.createOpportunityDetector(_mediaPlayerItem);
    if (_placementOpportunityDetector != null) {
      _processingTime = paramTimeMapping.getTime();
    }
    if ((_contentResolvers != null) && (_contentResolvers.size() > 0) && (_adProviderListener != null))
    {
      paramTimelineMonitor = _contentResolvers.iterator();
      while (paramTimelineMonitor.hasNext()) {
        ((ContentResolver)paramTimelineMonitor.next()).registerOnCompleteListener(_adProviderListener);
      }
    }
    _videoEngineTimeline.setInitialTimeMapping(paramTimeMapping);
  }
  
  public void registerPlacement(int paramInt)
  {
    _reservations = paramInt;
  }
  
  public void setPlayheadTime(long paramLong1, long paramLong2)
  {
    if ((_contentResolvers != null) && (_contentResolvers.size() > 0))
    {
      Iterator localIterator = _contentResolvers.iterator();
      while (localIterator.hasNext())
      {
        ContentResolver localContentResolver = (ContentResolver)localIterator.next();
        if ((localContentResolver instanceof ContentResolver.OnTimeUpdateListener)) {
          ((ContentResolver.OnTimeUpdateListener)localContentResolver).onTimeUpdate(paramLong1, paramLong2);
        }
      }
    }
  }
  
  public void unload()
  {
    _timelineOperationQueue.dispose();
    _timelineOperationQueue.clear();
    _dispatcher.removeEventListener(MediaPlayerEvent.Type.OPPORTUNITY_COMPLETED, _onOpportunityCompletedListener);
    _dispatcher.removeEventListener(MediaPlayerEvent.Type.OPPORTUNITY_FAILED, _onOpportunityCompletedListener);
    _dispatcher.removeEventListener(MediaPlayer.Event.AD_PLAYBACK, _onAdPlaybackEventListener);
    if ((_contentResolvers != null) && (_contentResolvers.size() > 0))
    {
      Iterator localIterator = _contentResolvers.iterator();
      while (localIterator.hasNext()) {
        ((ContentResolver)localIterator.next()).unregisterOnCompleteListener(_adProviderListener);
      }
    }
  }
  
  public void unregisterPlacement()
  {
    _reservations -= 1;
  }
  
  public void update(long paramLong, TimeRange paramTimeRange)
  {
    if (_placementOpportunityDetector == null) {
      _logger.i(LOG_TAG + "#update", "Update ignored as there is no registered detector to process it");
    }
    do
    {
      for (;;)
      {
        return;
        _processingTime = paramLong;
        Object localObject2 = _mediaPlayerItem.getTimedMetadata();
        ArrayList localArrayList = new ArrayList();
        for (;;)
        {
          TimedMetadata localTimedMetadata;
          synchronized (_processedTimedMetadatas)
          {
            localObject2 = ((List)localObject2).iterator();
            if (!((Iterator)localObject2).hasNext()) {
              break;
            }
            localTimedMetadata = (TimedMetadata)((Iterator)localObject2).next();
            if (!paramTimeRange.contains(localTimedMetadata.getTime()))
            {
              _logger.i(LOG_TAG + "#update", "Removing old timed metadata.[ opportunity: " + localTimedMetadata + ", playback range: " + paramTimeRange + "].");
              _processedTimedMetadatas.remove(localTimedMetadata);
            }
          }
          if (!_processedTimedMetadatas.contains(localTimedMetadata)) {
            if (localTimedMetadata.getTime() < _processingTime)
            {
              _logger.i(LOG_TAG + "#update", "Ad placement opportunity skipped since its position is in the past (previous to the play head).[ opportunity: " + localTimedMetadata + ", processing time: " + String.valueOf(paramLong) + "].");
            }
            else
            {
              localArrayList.add(localTimedMetadata);
              _processedTimedMetadatas.add(localTimedMetadata);
              _processingTime = localTimedMetadata.getTime();
            }
          }
        }
        paramTimeRange = _placementOpportunityDetector.process(localArrayList, _mediaPlayerItem.getResource().getMetadata());
        if (paramTimeRange.size() <= 0) {
          break;
        }
        paramTimeRange = paramTimeRange.iterator();
        while (paramTimeRange.hasNext())
        {
          ??? = (PlacementOpportunity)paramTimeRange.next();
          _logger.i(LOG_TAG + "#update", "Resolving opportunity " + ((PlacementOpportunity)???).toString() + ", processing time=" + String.valueOf(paramLong) + "].");
          resolveOpportunity((PlacementOpportunity)???);
        }
      }
    } while ((_processingPlacementOpportunity != null) || (_queuedOpportunities.size() != 0));
    notifyAdResolvingCompletion();
  }
  
  private class AdProviderListener
    implements AdProvider.OnCompleteListener
  {
    public AdProviderListener()
    {
      if (_timelineOperationQueue == null) {
        throw new IllegalArgumentException("The TimelineOperationQueue must be not null.");
      }
    }
    
    public void onComplete(AdProvider paramAdProvider, List paramList)
    {
      unregisterPlacement();
      if (paramList.size() > 0)
      {
        paramAdProvider = paramList.iterator();
        while (paramAdProvider.hasNext())
        {
          TimelineOperation localTimelineOperation = (TimelineOperation)paramAdProvider.next();
          _logger.i(MediaPlayerClient.LOG_TAG + "#ContentResolver.OnCompleteListener::onComplete", "Adding reference for timelineOperation for HOLD at " + localTimelineOperation.getPlacement().getTime());
          _videoEngineTimelineProxy.addHoldReference(localTimelineOperation.getPlacement().getTime());
        }
        _timelineOperationQueue.addAllToQueue(paramList);
      }
      for (;;)
      {
        if (_processingPlacementOpportunity != null)
        {
          long l = _processingPlacementOpportunity.getPlacementInformation().getTime();
          _logger.i(MediaPlayerClient.LOG_TAG + "#ContentResolver.OnCompleteListener::onComplete", "Release reference for timelineOperation for HOLD at " + l);
          _videoEngineTimelineProxy.releaseHoldReference(l);
        }
        MediaPlayerClient.access$502(MediaPlayerClient.this, null);
        MediaPlayerClient.this.processQueuedOpportunities();
        return;
        if (doneInitialResolving()) {
          MediaPlayerClient.this.notifyAdResolvingCompletion();
        }
      }
    }
    
    public void onError(AdProvider paramAdProvider, MediaPlayerNotification.Error paramError)
    {
      unregisterPlacement();
      MediaPlayerNotification.Warning localWarning = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.AD_RESOLVER_FAIL, "Ad resolving operation has failed.");
      if (_processingPlacementOpportunity != null) {
        _videoEngineTimelineProxy.releaseHoldReference(_processingPlacementOpportunity.getPlacementInformation().getTime());
      }
      MediaPlayerClient.access$502(MediaPlayerClient.this, null);
      MediaPlayerClient.this.processQueuedOpportunities();
      localWarning.setInnerNotification(paramError);
      onWarning(paramAdProvider, localWarning);
      MediaPlayerClient.this.notifyAdResolvingCompletion();
    }
    
    public void onWarning(AdProvider paramAdProvider, MediaPlayerNotification.Warning paramWarning)
    {
      if (_dispatcher != null) {
        _dispatcher.dispatch(OperationFailedEvent.createEvent(paramWarning));
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayerClient
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */