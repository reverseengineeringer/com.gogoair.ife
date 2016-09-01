package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.session.NotificationHistory;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

final class VideoEngineDispatcher
{
  private final List _adBreakManifestLoadCompleteListeners = new CopyOnWriteArrayList();
  private final List _adBreakPlacementCompletedListeners = new CopyOnWriteArrayList();
  private final List _adBreakPlacementFailedListeners = new CopyOnWriteArrayList();
  private final List _adBreakRemovalCompletedListeners = new CopyOnWriteArrayList();
  private final List _adManifestLoadCompleteListeners = new CopyOnWriteArrayList();
  private final List _adManifestLoadFailedListeners = new CopyOnWriteArrayList();
  private final List _adPlaybackEventListeners = new CopyOnWriteArrayList();
  private final List _audioTrackFailedListeners = new CopyOnWriteArrayList();
  private final List _blackoutsEventListeners = new CopyOnWriteArrayList();
  private final List _bufferingCompletedListeners = new CopyOnWriteArrayList();
  private final List _bufferingFullListeners = new CopyOnWriteArrayList();
  private final List _bufferingStartedListeners = new CopyOnWriteArrayList();
  private final List _clickListeners = new CopyOnWriteArrayList();
  private final List _contentChangedListeners = new CopyOnWriteArrayList();
  private final List _contentMarkerListeners = new CopyOnWriteArrayList();
  private final List _contentPlacementCompleteListeners = new CopyOnWriteArrayList();
  private final List _customAdEventListeners = new CopyOnWriteArrayList();
  private final List _drmEventListeners = new CopyOnWriteArrayList();
  private final List _drmMetadataListeners = new CopyOnWriteArrayList();
  private final List _errorListeners = new CopyOnWriteArrayList();
  private final List _itemCreatedListeners = new CopyOnWriteArrayList();
  private final List _itemReadyListeners = new CopyOnWriteArrayList();
  private final List _itemUpdatedListeners = new CopyOnWriteArrayList();
  private final List _loadInfoListeners = new CopyOnWriteArrayList();
  private NotificationHistory _notificationHistory;
  private final List _opportunityFailedListeners = new CopyOnWriteArrayList();
  private final List _opportunityHandledListeners = new CopyOnWriteArrayList();
  private final List _pauseAtPeriodEndListeners = new CopyOnWriteArrayList();
  private final List _playbackEventListeners = new CopyOnWriteArrayList();
  private final List _postRollEndListeners = new CopyOnWriteArrayList();
  private final List _profileChangedListeners = new CopyOnWriteArrayList();
  private final List _qosEventListeners = new CopyOnWriteArrayList();
  private final List _resourceLoadedListeners = new CopyOnWriteArrayList();
  private final List _seekAdjustCompletedListeners = new CopyOnWriteArrayList();
  private final List _seekCompletedListeners = new CopyOnWriteArrayList();
  private final List _seekStartedListeners = new CopyOnWriteArrayList();
  private final List _stateChangedListeners = new CopyOnWriteArrayList();
  
  public void addEventListener(MediaPlayer.Event paramEvent, MediaPlayer.EventListener paramEventListener)
  {
    switch (1.$SwitchMap$com$adobe$mediacore$MediaPlayer$Event[paramEvent.ordinal()])
    {
    default: 
      throw new IllegalArgumentException("Unsupported event type.[" + paramEvent + "]");
    case 1: 
      _qosEventListeners.add((MediaPlayer.QOSEventListener)paramEventListener);
      return;
    case 2: 
      _drmEventListeners.add((MediaPlayer.DRMEventListener)paramEventListener);
      return;
    case 3: 
      _adPlaybackEventListeners.add((MediaPlayer.AdPlaybackEventListener)paramEventListener);
      return;
    case 4: 
      _playbackEventListeners.add((MediaPlayer.PlaybackEventListener)paramEventListener);
      return;
    case 5: 
      _blackoutsEventListeners.add((MediaPlayer.BlackoutsEventListener)paramEventListener);
      return;
    }
    _customAdEventListeners.add((MediaPlayer.CustomAdEventListener)paramEventListener);
  }
  
  public void addEventListener(MediaPlayerEvent.Type paramType, MediaPlayer.EventListener paramEventListener)
  {
    switch (1.$SwitchMap$com$adobe$mediacore$MediaPlayerEvent$Type[paramType.ordinal()])
    {
    default: 
      throw new IllegalArgumentException("Unsupported event type.[" + paramType + "]");
    case 1: 
      _resourceLoadedListeners.add((ResourceLoadedListener)paramEventListener);
      return;
    case 2: 
      _itemCreatedListeners.add((ItemCreatedListener)paramEventListener);
      return;
    case 3: 
      _itemUpdatedListeners.add((ItemUpdatedListener)paramEventListener);
      return;
    case 4: 
      _itemReadyListeners.add((ItemReadyListener)paramEventListener);
      return;
    case 5: 
      _adBreakPlacementCompletedListeners.add((AdBreakPlacementCompletedListener)paramEventListener);
      return;
    case 6: 
      _adBreakPlacementFailedListeners.add((AdBreakPlacementFailedListener)paramEventListener);
      return;
    case 7: 
      _adBreakRemovalCompletedListeners.add((AdBreakRemovalCompletedListener)paramEventListener);
      return;
    case 8: 
      _contentPlacementCompleteListeners.add((ContentPlacementCompletedListener)paramEventListener);
      return;
    case 9: 
      _adManifestLoadCompleteListeners.add((AdManifestLoadCompleteListener)paramEventListener);
      return;
    case 10: 
      _adManifestLoadFailedListeners.add((AdManifestLoadFailedListener)paramEventListener);
      return;
    case 11: 
      _adBreakManifestLoadCompleteListeners.add((AdBreakManifestLoadCompleteListener)paramEventListener);
      return;
    case 12: 
      _contentChangedListeners.add((ContentChangedListener)paramEventListener);
      return;
    case 13: 
      _contentMarkerListeners.add((ContentMarkerListener)paramEventListener);
      return;
    case 14: 
      _profileChangedListeners.add((ProfileChangedListener)paramEventListener);
      return;
    case 15: 
      _seekStartedListeners.add((SeekStartedListener)paramEventListener);
      return;
    case 16: 
      _seekCompletedListeners.add((SeekCompletedListener)paramEventListener);
      return;
    case 17: 
      _seekAdjustCompletedListeners.add((SeekAdjustCompletedListener)paramEventListener);
      return;
    case 18: 
      _bufferingStartedListeners.add((BufferingStartedListener)paramEventListener);
      return;
    case 19: 
      _bufferingCompletedListeners.add((BufferingCompletedListener)paramEventListener);
      return;
    case 20: 
      _bufferingFullListeners.add((BufferingFullListener)paramEventListener);
      return;
    case 21: 
      _audioTrackFailedListeners.add((AudioTrackFailedListener)paramEventListener);
      return;
    case 22: 
      _loadInfoListeners.add((LoadInfoListener)paramEventListener);
      return;
    case 23: 
      _drmMetadataListeners.add((DRMMetadataListener)paramEventListener);
      return;
    case 24: 
      _stateChangedListeners.add((VideoStateChangedListener)paramEventListener);
      return;
    case 25: 
      _errorListeners.add((VideoErrorListener)paramEventListener);
      return;
    case 26: 
      _clickListeners.add((ViewClickListener)paramEventListener);
      return;
    case 27: 
      _opportunityHandledListeners.add((OpportunityHandledListener)paramEventListener);
      return;
    case 28: 
      _opportunityFailedListeners.add((OpportunityHandledListener)paramEventListener);
      return;
    case 29: 
      _pauseAtPeriodEndListeners.add((PauseAtPeriodEndListener)paramEventListener);
      return;
    }
    _postRollEndListeners.add((PostRollEndListener)paramEventListener);
  }
  
  public void clear()
  {
    _resourceLoadedListeners.clear();
    _itemCreatedListeners.clear();
    _itemUpdatedListeners.clear();
    _itemReadyListeners.clear();
    _adBreakPlacementCompletedListeners.clear();
    _adBreakPlacementFailedListeners.clear();
    _contentPlacementCompleteListeners.clear();
    _adManifestLoadCompleteListeners.clear();
    _adManifestLoadFailedListeners.clear();
    _adBreakManifestLoadCompleteListeners.clear();
    _contentChangedListeners.clear();
    _contentMarkerListeners.clear();
    _profileChangedListeners.clear();
    _seekStartedListeners.clear();
    _seekCompletedListeners.clear();
    _seekAdjustCompletedListeners.clear();
    _bufferingStartedListeners.clear();
    _bufferingCompletedListeners.clear();
    _bufferingFullListeners.clear();
    _loadInfoListeners.clear();
    _drmMetadataListeners.clear();
    _stateChangedListeners.clear();
    _errorListeners.clear();
    _audioTrackFailedListeners.clear();
    _clickListeners.clear();
    _opportunityHandledListeners.clear();
    _opportunityFailedListeners.clear();
    _adBreakRemovalCompletedListeners.clear();
    _qosEventListeners.clear();
    _drmEventListeners.clear();
    _adPlaybackEventListeners.clear();
    _playbackEventListeners.clear();
    _blackoutsEventListeners.clear();
    _customAdEventListeners.clear();
  }
  
  public void createNotificationHistory()
  {
    if (_notificationHistory == null) {
      _notificationHistory = new NotificationHistory();
    }
  }
  
  public void destroyNotificationHistory()
  {
    _notificationHistory = null;
  }
  
  public void dispatch(MediaPlayerEvent paramMediaPlayerEvent)
  {
    Object localObject;
    if (_notificationHistory != null)
    {
      localObject = paramMediaPlayerEvent.getNotification();
      if (localObject != null) {
        _notificationHistory.addNotification((MediaPlayerNotification)localObject);
      }
    }
    switch (1.$SwitchMap$com$adobe$mediacore$MediaPlayerEvent$Type[paramMediaPlayerEvent.getType().ordinal()])
    {
    default: 
      throw new IllegalArgumentException("Unsupported event type.[" + paramMediaPlayerEvent.getType() + "]");
    case 1: 
      paramMediaPlayerEvent = _resourceLoadedListeners.iterator();
    }
    Iterator localIterator;
    while (paramMediaPlayerEvent.hasNext())
    {
      ((ResourceLoadedListener)paramMediaPlayerEvent.next()).onLoaded();
      continue;
      paramMediaPlayerEvent = _itemCreatedListeners.iterator();
      while (paramMediaPlayerEvent.hasNext())
      {
        ((ItemCreatedListener)paramMediaPlayerEvent.next()).onCreated();
        continue;
        paramMediaPlayerEvent = _itemUpdatedListeners.iterator();
        while (paramMediaPlayerEvent.hasNext())
        {
          ((ItemUpdatedListener)paramMediaPlayerEvent.next()).onUpdated();
          continue;
          paramMediaPlayerEvent = _playbackEventListeners.iterator();
          while (paramMediaPlayerEvent.hasNext())
          {
            ((MediaPlayer.PlaybackEventListener)paramMediaPlayerEvent.next()).onReplaceMediaPlayerItem();
            continue;
            paramMediaPlayerEvent = _itemReadyListeners.iterator();
            while (paramMediaPlayerEvent.hasNext())
            {
              ((ItemReadyListener)paramMediaPlayerEvent.next()).onReady();
              continue;
              paramMediaPlayerEvent = (AdBreakPlacementEvent)paramMediaPlayerEvent;
              localObject = _adBreakPlacementCompletedListeners.iterator();
              while (((Iterator)localObject).hasNext())
              {
                ((AdBreakPlacementCompletedListener)((Iterator)localObject).next()).onCompleted(paramMediaPlayerEvent.getProposedAdBreak(), paramMediaPlayerEvent.getAcceptedAdBreak());
                continue;
                paramMediaPlayerEvent = (AdBreakPlacementEvent)paramMediaPlayerEvent;
                localObject = _adBreakPlacementFailedListeners.iterator();
                while (((Iterator)localObject).hasNext())
                {
                  ((AdBreakPlacementFailedListener)((Iterator)localObject).next()).onFailed(paramMediaPlayerEvent.getProposedAdBreak());
                  continue;
                  paramMediaPlayerEvent = _adBreakRemovalCompletedListeners.iterator();
                  while (paramMediaPlayerEvent.hasNext())
                  {
                    ((AdBreakRemovalCompletedListener)paramMediaPlayerEvent.next()).onCompleted();
                    continue;
                    paramMediaPlayerEvent = _contentPlacementCompleteListeners.iterator();
                    while (paramMediaPlayerEvent.hasNext())
                    {
                      ((ContentPlacementCompletedListener)paramMediaPlayerEvent.next()).onCompleted();
                      continue;
                      paramMediaPlayerEvent = (AdManifestLoadEvent)paramMediaPlayerEvent;
                      localObject = _adManifestLoadCompleteListeners.iterator();
                      while (((Iterator)localObject).hasNext())
                      {
                        ((AdManifestLoadCompleteListener)((Iterator)localObject).next()).onCompleted(paramMediaPlayerEvent.getContentId(), paramMediaPlayerEvent.getHandle(), paramMediaPlayerEvent.getDuration());
                        continue;
                        paramMediaPlayerEvent = (AdManifestLoadEvent)paramMediaPlayerEvent;
                        localObject = _adManifestLoadFailedListeners.iterator();
                        while (((Iterator)localObject).hasNext())
                        {
                          ((AdManifestLoadFailedListener)((Iterator)localObject).next()).onError(paramMediaPlayerEvent.getContentId());
                          continue;
                          paramMediaPlayerEvent = _adBreakManifestLoadCompleteListeners.iterator();
                          while (paramMediaPlayerEvent.hasNext())
                          {
                            ((AdBreakManifestLoadCompleteListener)paramMediaPlayerEvent.next()).onComplete();
                            continue;
                            paramMediaPlayerEvent = (ContentChangedEvent)paramMediaPlayerEvent;
                            localObject = _contentChangedListeners.iterator();
                            while (((Iterator)localObject).hasNext())
                            {
                              ((ContentChangedListener)((Iterator)localObject).next()).onChanged(paramMediaPlayerEvent.getContentId(), paramMediaPlayerEvent.getPosition());
                              continue;
                              paramMediaPlayerEvent = (ContentMarkerEvent)paramMediaPlayerEvent;
                              localObject = _contentMarkerListeners.iterator();
                              while (((Iterator)localObject).hasNext())
                              {
                                ((ContentMarkerListener)((Iterator)localObject).next()).onContentMarker(paramMediaPlayerEvent.getContentId(), paramMediaPlayerEvent.getPosition());
                                continue;
                                paramMediaPlayerEvent = (ProfileChangedEvent)paramMediaPlayerEvent;
                                localObject = _profileChangedListeners.iterator();
                                while (((Iterator)localObject).hasNext()) {
                                  ((ProfileChangedListener)((Iterator)localObject).next()).onChanged(paramMediaPlayerEvent.getProfile(), paramMediaPlayerEvent.getPosition());
                                }
                                localObject = _playbackEventListeners.iterator();
                                while (((Iterator)localObject).hasNext())
                                {
                                  ((MediaPlayer.PlaybackEventListener)((Iterator)localObject).next()).onProfileChanged(paramMediaPlayerEvent.getProfile(), paramMediaPlayerEvent.getPosition());
                                  continue;
                                  paramMediaPlayerEvent = (SeekEvent)paramMediaPlayerEvent;
                                  localObject = _seekStartedListeners.iterator();
                                  while (((Iterator)localObject).hasNext()) {
                                    ((SeekStartedListener)((Iterator)localObject).next()).onStarted(paramMediaPlayerEvent.getPosition());
                                  }
                                  paramMediaPlayerEvent = _qosEventListeners.iterator();
                                  while (paramMediaPlayerEvent.hasNext())
                                  {
                                    ((MediaPlayer.QOSEventListener)paramMediaPlayerEvent.next()).onSeekStart();
                                    continue;
                                    paramMediaPlayerEvent = (SeekEvent)paramMediaPlayerEvent;
                                    localObject = _seekCompletedListeners.iterator();
                                    while (((Iterator)localObject).hasNext()) {
                                      ((SeekCompletedListener)((Iterator)localObject).next()).onCompleted(paramMediaPlayerEvent.getPosition());
                                    }
                                    localObject = _qosEventListeners.iterator();
                                    while (((Iterator)localObject).hasNext())
                                    {
                                      ((MediaPlayer.QOSEventListener)((Iterator)localObject).next()).onSeekComplete(paramMediaPlayerEvent.getPosition());
                                      continue;
                                      paramMediaPlayerEvent = (SeekEvent)paramMediaPlayerEvent;
                                      localObject = _seekAdjustCompletedListeners.iterator();
                                      while (((Iterator)localObject).hasNext())
                                      {
                                        ((SeekAdjustCompletedListener)((Iterator)localObject).next()).onAdjustCompleted(paramMediaPlayerEvent.getPosition());
                                        continue;
                                        paramMediaPlayerEvent = _bufferingStartedListeners.iterator();
                                        while (paramMediaPlayerEvent.hasNext()) {
                                          ((BufferingStartedListener)paramMediaPlayerEvent.next()).onStarted();
                                        }
                                        paramMediaPlayerEvent = _qosEventListeners.iterator();
                                        while (paramMediaPlayerEvent.hasNext())
                                        {
                                          ((MediaPlayer.QOSEventListener)paramMediaPlayerEvent.next()).onBufferStart();
                                          continue;
                                          paramMediaPlayerEvent = _bufferingCompletedListeners.iterator();
                                          while (paramMediaPlayerEvent.hasNext()) {
                                            ((BufferingCompletedListener)paramMediaPlayerEvent.next()).onCompleted();
                                          }
                                          paramMediaPlayerEvent = _qosEventListeners.iterator();
                                          while (paramMediaPlayerEvent.hasNext())
                                          {
                                            ((MediaPlayer.QOSEventListener)paramMediaPlayerEvent.next()).onBufferComplete();
                                            continue;
                                            paramMediaPlayerEvent = _bufferingFullListeners.iterator();
                                            while (paramMediaPlayerEvent.hasNext())
                                            {
                                              ((BufferingFullListener)paramMediaPlayerEvent.next()).onFull();
                                              continue;
                                              localObject = (AudioTrackEvent)paramMediaPlayerEvent;
                                              localIterator = _audioTrackFailedListeners.iterator();
                                              while (localIterator.hasNext())
                                              {
                                                ((AudioTrackFailedListener)localIterator.next()).onFailed(((AudioTrackEvent)localObject).getAudioTrack(), (MediaPlayerNotification.Error)paramMediaPlayerEvent.getNotification());
                                                continue;
                                                paramMediaPlayerEvent = (LoadInfoEvent)paramMediaPlayerEvent;
                                                localObject = _loadInfoListeners.iterator();
                                                while (((Iterator)localObject).hasNext()) {
                                                  ((LoadInfoListener)((Iterator)localObject).next()).onInfo(paramMediaPlayerEvent.getLoadInfo());
                                                }
                                                localObject = _qosEventListeners.iterator();
                                                while (((Iterator)localObject).hasNext())
                                                {
                                                  ((MediaPlayer.QOSEventListener)((Iterator)localObject).next()).onLoadInfo(paramMediaPlayerEvent.getLoadInfo());
                                                  continue;
                                                  paramMediaPlayerEvent = (DRMMetadataEvent)paramMediaPlayerEvent;
                                                  localObject = _drmMetadataListeners.iterator();
                                                  while (((Iterator)localObject).hasNext()) {
                                                    ((DRMMetadataListener)((Iterator)localObject).next()).onDRMMetadata(paramMediaPlayerEvent.getDrmMetadataInfo());
                                                  }
                                                  localObject = _drmEventListeners.iterator();
                                                  while (((Iterator)localObject).hasNext())
                                                  {
                                                    ((MediaPlayer.DRMEventListener)((Iterator)localObject).next()).onDRMMetadata(paramMediaPlayerEvent.getDrmMetadataInfo());
                                                    continue;
                                                    paramMediaPlayerEvent = (ErrorEvent)paramMediaPlayerEvent;
                                                    localObject = _errorListeners.iterator();
                                                    while (((Iterator)localObject).hasNext())
                                                    {
                                                      ((VideoErrorListener)((Iterator)localObject).next()).onError((MediaPlayerNotification.Error)paramMediaPlayerEvent.getNotification());
                                                      continue;
                                                      paramMediaPlayerEvent = (OperationFailedEvent)paramMediaPlayerEvent;
                                                      localObject = _qosEventListeners.iterator();
                                                      while (((Iterator)localObject).hasNext())
                                                      {
                                                        ((MediaPlayer.QOSEventListener)((Iterator)localObject).next()).onOperationFailed((MediaPlayerNotification.Warning)paramMediaPlayerEvent.getNotification());
                                                        continue;
                                                        paramMediaPlayerEvent = _playbackEventListeners.iterator();
                                                        while (paramMediaPlayerEvent.hasNext())
                                                        {
                                                          ((MediaPlayer.PlaybackEventListener)paramMediaPlayerEvent.next()).onPrepared();
                                                          continue;
                                                          paramMediaPlayerEvent = _playbackEventListeners.iterator();
                                                          while (paramMediaPlayerEvent.hasNext())
                                                          {
                                                            ((MediaPlayer.PlaybackEventListener)paramMediaPlayerEvent.next()).onUpdated();
                                                            continue;
                                                            paramMediaPlayerEvent = _playbackEventListeners.iterator();
                                                            while (paramMediaPlayerEvent.hasNext())
                                                            {
                                                              ((MediaPlayer.PlaybackEventListener)paramMediaPlayerEvent.next()).onTimelineUpdated();
                                                              continue;
                                                              paramMediaPlayerEvent = _playbackEventListeners.iterator();
                                                              while (paramMediaPlayerEvent.hasNext())
                                                              {
                                                                ((MediaPlayer.PlaybackEventListener)paramMediaPlayerEvent.next()).onPlayStart();
                                                                continue;
                                                                paramMediaPlayerEvent = _playbackEventListeners.iterator();
                                                                while (paramMediaPlayerEvent.hasNext())
                                                                {
                                                                  ((MediaPlayer.PlaybackEventListener)paramMediaPlayerEvent.next()).onPlayComplete();
                                                                  continue;
                                                                  paramMediaPlayerEvent = _postRollEndListeners.iterator();
                                                                  while (paramMediaPlayerEvent.hasNext())
                                                                  {
                                                                    ((PostRollEndListener)paramMediaPlayerEvent.next()).onComplete();
                                                                    continue;
                                                                    paramMediaPlayerEvent = (StateChangedEvent)paramMediaPlayerEvent;
                                                                    localObject = _playbackEventListeners.iterator();
                                                                    while (((Iterator)localObject).hasNext())
                                                                    {
                                                                      ((MediaPlayer.PlaybackEventListener)((Iterator)localObject).next()).onStateChanged(paramMediaPlayerEvent.getCurrentState(), paramMediaPlayerEvent.getNotification());
                                                                      continue;
                                                                      paramMediaPlayerEvent = (VideoStateChangedEvent)paramMediaPlayerEvent;
                                                                      localObject = _stateChangedListeners.iterator();
                                                                      while (((Iterator)localObject).hasNext())
                                                                      {
                                                                        ((VideoStateChangedListener)((Iterator)localObject).next()).onStateChanged(paramMediaPlayerEvent.getPlayerState(), paramMediaPlayerEvent.getNotification());
                                                                        continue;
                                                                        paramMediaPlayerEvent = (VideoSizeChangedEvent)paramMediaPlayerEvent;
                                                                        localObject = _playbackEventListeners.iterator();
                                                                        while (((Iterator)localObject).hasNext())
                                                                        {
                                                                          ((MediaPlayer.PlaybackEventListener)((Iterator)localObject).next()).onSizeAvailable(paramMediaPlayerEvent.getHeight(), paramMediaPlayerEvent.getWidth());
                                                                          continue;
                                                                          paramMediaPlayerEvent = (TimedMetadataAddedEvent)paramMediaPlayerEvent;
                                                                          localObject = _playbackEventListeners.iterator();
                                                                          while (((Iterator)localObject).hasNext())
                                                                          {
                                                                            ((MediaPlayer.PlaybackEventListener)((Iterator)localObject).next()).onTimedMetadata(paramMediaPlayerEvent.getTimedMetadata());
                                                                            continue;
                                                                            paramMediaPlayerEvent = (TimedMetadataAddedEvent)paramMediaPlayerEvent;
                                                                            localObject = _blackoutsEventListeners.iterator();
                                                                            while (((Iterator)localObject).hasNext())
                                                                            {
                                                                              ((MediaPlayer.BlackoutsEventListener)((Iterator)localObject).next()).onTimedMetadataInBackgroundItem(paramMediaPlayerEvent.getTimedMetadata());
                                                                              continue;
                                                                              paramMediaPlayerEvent = (AdBreakPlaybackEvent)paramMediaPlayerEvent;
                                                                              localObject = _adPlaybackEventListeners.iterator();
                                                                              while (((Iterator)localObject).hasNext())
                                                                              {
                                                                                ((MediaPlayer.AdPlaybackEventListener)((Iterator)localObject).next()).onAdBreakStart(paramMediaPlayerEvent.getAdBreak());
                                                                                continue;
                                                                                paramMediaPlayerEvent = (AdBreakPlaybackEvent)paramMediaPlayerEvent;
                                                                                localObject = _adPlaybackEventListeners.iterator();
                                                                                while (((Iterator)localObject).hasNext())
                                                                                {
                                                                                  ((MediaPlayer.AdPlaybackEventListener)((Iterator)localObject).next()).onAdBreakComplete(paramMediaPlayerEvent.getAdBreak());
                                                                                  continue;
                                                                                  paramMediaPlayerEvent = (AdBreakPlaybackEvent)paramMediaPlayerEvent;
                                                                                  localObject = _adPlaybackEventListeners.iterator();
                                                                                  while (((Iterator)localObject).hasNext())
                                                                                  {
                                                                                    ((MediaPlayer.AdPlaybackEventListener)((Iterator)localObject).next()).onAdBreakSkipped(paramMediaPlayerEvent.getAdBreak());
                                                                                    continue;
                                                                                    paramMediaPlayerEvent = (AdPlaybackEvent)paramMediaPlayerEvent;
                                                                                    localObject = _adPlaybackEventListeners.iterator();
                                                                                    while (((Iterator)localObject).hasNext())
                                                                                    {
                                                                                      ((MediaPlayer.AdPlaybackEventListener)((Iterator)localObject).next()).onAdStart(paramMediaPlayerEvent.getAdBreak(), paramMediaPlayerEvent.getAd());
                                                                                      continue;
                                                                                      paramMediaPlayerEvent = (AdPlaybackEvent)paramMediaPlayerEvent;
                                                                                      localObject = _adPlaybackEventListeners.iterator();
                                                                                      while (((Iterator)localObject).hasNext())
                                                                                      {
                                                                                        ((MediaPlayer.AdPlaybackEventListener)((Iterator)localObject).next()).onAdProgress(paramMediaPlayerEvent.getAdBreak(), paramMediaPlayerEvent.getAd(), paramMediaPlayerEvent.getProgress());
                                                                                        continue;
                                                                                        paramMediaPlayerEvent = (AdPlaybackEvent)paramMediaPlayerEvent;
                                                                                        localObject = _adPlaybackEventListeners.iterator();
                                                                                        while (((Iterator)localObject).hasNext())
                                                                                        {
                                                                                          ((MediaPlayer.AdPlaybackEventListener)((Iterator)localObject).next()).onAdComplete(paramMediaPlayerEvent.getAdBreak(), paramMediaPlayerEvent.getAd());
                                                                                          continue;
                                                                                          paramMediaPlayerEvent = (AdClickEvent)paramMediaPlayerEvent;
                                                                                          localObject = _adPlaybackEventListeners.iterator();
                                                                                          while (((Iterator)localObject).hasNext())
                                                                                          {
                                                                                            ((MediaPlayer.AdPlaybackEventListener)((Iterator)localObject).next()).onAdClick(paramMediaPlayerEvent.getAdBreak(), paramMediaPlayerEvent.getAd(), paramMediaPlayerEvent.getAdClick());
                                                                                            continue;
                                                                                            paramMediaPlayerEvent = _clickListeners.iterator();
                                                                                            while (paramMediaPlayerEvent.hasNext())
                                                                                            {
                                                                                              ((ViewClickListener)paramMediaPlayerEvent.next()).onClick();
                                                                                              continue;
                                                                                              localObject = _opportunityHandledListeners.iterator();
                                                                                              while (((Iterator)localObject).hasNext())
                                                                                              {
                                                                                                ((OpportunityHandledListener)((Iterator)localObject).next()).onOpportunityHandled(((OpportunityHandledEvent)paramMediaPlayerEvent).getTime());
                                                                                                continue;
                                                                                                localObject = _opportunityHandledListeners.iterator();
                                                                                                while (((Iterator)localObject).hasNext())
                                                                                                {
                                                                                                  ((OpportunityHandledListener)((Iterator)localObject).next()).onOpportunityHandled(((OpportunityHandledEvent)paramMediaPlayerEvent).getTime());
                                                                                                  continue;
                                                                                                  paramMediaPlayerEvent = (PlaybackRateEvent)paramMediaPlayerEvent;
                                                                                                  localObject = _playbackEventListeners.iterator();
                                                                                                  while (((Iterator)localObject).hasNext())
                                                                                                  {
                                                                                                    ((MediaPlayer.PlaybackEventListener)((Iterator)localObject).next()).onRateSelected(paramMediaPlayerEvent.getRate());
                                                                                                    continue;
                                                                                                    paramMediaPlayerEvent = (PlaybackRateEvent)paramMediaPlayerEvent;
                                                                                                    localObject = _playbackEventListeners.iterator();
                                                                                                    while (((Iterator)localObject).hasNext())
                                                                                                    {
                                                                                                      ((MediaPlayer.PlaybackEventListener)((Iterator)localObject).next()).onRatePlaying(paramMediaPlayerEvent.getRate());
                                                                                                      continue;
                                                                                                      paramMediaPlayerEvent = _blackoutsEventListeners.iterator();
                                                                                                      for (;;)
                                                                                                      {
                                                                                                        if (paramMediaPlayerEvent.hasNext())
                                                                                                        {
                                                                                                          ((MediaPlayer.BlackoutsEventListener)paramMediaPlayerEvent.next()).onBackgroundManifestFailed();
                                                                                                          continue;
                                                                                                          paramMediaPlayerEvent = (PauseAtPeriodEndEvent)paramMediaPlayerEvent;
                                                                                                          localObject = _pauseAtPeriodEndListeners.iterator();
                                                                                                          while (((Iterator)localObject).hasNext())
                                                                                                          {
                                                                                                            ((PauseAtPeriodEndListener)((Iterator)localObject).next()).onPauseAtPeriodEnd(paramMediaPlayerEvent.getAdId());
                                                                                                            continue;
                                                                                                            paramMediaPlayerEvent = (CustomAdEvent)paramMediaPlayerEvent;
                                                                                                            switch (paramMediaPlayerEvent.getEventType())
                                                                                                            {
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
    }
    for (;;)
    {
      return;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdStarted();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdPlaying();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdPaused();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdStopped();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdSkipped();
      }
      continue;
      localObject = paramMediaPlayerEvent.getAdData().getValue("adClickThruUrl");
      localIterator = _customAdEventListeners.iterator();
      while (localIterator.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)localIterator.next()).onAdClickThru((String)localObject, paramMediaPlayerEvent.getAdData().containsKey("adClickThruHandle"));
      }
      continue;
      paramMediaPlayerEvent = paramMediaPlayerEvent.getAdData().getValue("error");
      localObject = _customAdEventListeners.iterator();
      while (((Iterator)localObject).hasNext()) {
        ((MediaPlayer.CustomAdEventListener)((Iterator)localObject).next()).onAdError(paramMediaPlayerEvent);
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdVideoFirstQuartile();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdDurationChange();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdExpandedChange();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdImpression();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdInteraction();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdLinearChange();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdSizeChange();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdSkippableStateChange();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdVideoThirdQuartile();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdUserAcceptInvitation();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdUserMinimize();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdUserClose();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdVideoComplete();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdVideoMidpoint();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdVideoStart();
      }
      continue;
      paramMediaPlayerEvent = _customAdEventListeners.iterator();
      while (paramMediaPlayerEvent.hasNext()) {
        ((MediaPlayer.CustomAdEventListener)paramMediaPlayerEvent.next()).onAdVolumeChange();
      }
      continue;
      paramMediaPlayerEvent = paramMediaPlayerEvent.getAdData();
      localObject = _customAdEventListeners.iterator();
      while (((Iterator)localObject).hasNext()) {
        ((MediaPlayer.CustomAdEventListener)((Iterator)localObject).next()).onAdProgress(Float.parseFloat(paramMediaPlayerEvent.getValue("duration")), Float.parseFloat(paramMediaPlayerEvent.getValue("remaining")));
      }
    }
  }
  
  public NotificationHistory getNotificationHistory()
  {
    return _notificationHistory;
  }
  
  public void removeEventListener(MediaPlayer.Event paramEvent, MediaPlayer.EventListener paramEventListener)
  {
    switch (1.$SwitchMap$com$adobe$mediacore$MediaPlayer$Event[paramEvent.ordinal()])
    {
    default: 
      return;
    case 1: 
      _qosEventListeners.remove((MediaPlayer.QOSEventListener)paramEventListener);
      return;
    case 2: 
      _drmEventListeners.remove((MediaPlayer.DRMEventListener)paramEventListener);
      return;
    case 3: 
      _adPlaybackEventListeners.remove((MediaPlayer.AdPlaybackEventListener)paramEventListener);
      return;
    case 4: 
      _playbackEventListeners.remove((MediaPlayer.PlaybackEventListener)paramEventListener);
      return;
    case 5: 
      _playbackEventListeners.remove((MediaPlayer.BlackoutsEventListener)paramEventListener);
      return;
    }
    _playbackEventListeners.remove((MediaPlayer.CustomAdEventListener)paramEventListener);
  }
  
  public void removeEventListener(MediaPlayerEvent.Type paramType, MediaPlayer.EventListener paramEventListener)
  {
    switch (1.$SwitchMap$com$adobe$mediacore$MediaPlayerEvent$Type[paramType.ordinal()])
    {
    default: 
      throw new IllegalArgumentException("Unsupported event type.[" + paramType + "]");
    case 1: 
      _resourceLoadedListeners.remove((ResourceLoadedListener)paramEventListener);
      return;
    case 2: 
      _itemCreatedListeners.remove((ItemCreatedListener)paramEventListener);
      return;
    case 3: 
      _itemUpdatedListeners.remove((ItemUpdatedListener)paramEventListener);
      return;
    case 4: 
      _itemReadyListeners.remove((ItemReadyListener)paramEventListener);
      return;
    case 5: 
      _adBreakPlacementCompletedListeners.remove((AdBreakPlacementCompletedListener)paramEventListener);
      return;
    case 6: 
      _adBreakPlacementFailedListeners.remove((AdBreakPlacementFailedListener)paramEventListener);
      return;
    case 7: 
      _adBreakRemovalCompletedListeners.remove((AdBreakRemovalCompletedListener)paramEventListener);
      return;
    case 8: 
      _contentPlacementCompleteListeners.remove((ContentPlacementCompletedListener)paramEventListener);
      return;
    case 9: 
      _adManifestLoadCompleteListeners.remove((AdManifestLoadCompleteListener)paramEventListener);
      return;
    case 10: 
      _adManifestLoadFailedListeners.remove((AdManifestLoadFailedListener)paramEventListener);
      return;
    case 11: 
      _adBreakManifestLoadCompleteListeners.remove((AdBreakManifestLoadCompleteListener)paramEventListener);
      return;
    case 12: 
      _contentChangedListeners.remove((ContentChangedListener)paramEventListener);
      return;
    case 13: 
      _contentMarkerListeners.remove((ContentMarkerListener)paramEventListener);
      return;
    case 14: 
      _profileChangedListeners.remove((ProfileChangedListener)paramEventListener);
      return;
    case 15: 
      _seekStartedListeners.remove((SeekStartedListener)paramEventListener);
      return;
    case 16: 
      _seekCompletedListeners.remove((SeekCompletedListener)paramEventListener);
      return;
    case 17: 
      _seekAdjustCompletedListeners.remove((SeekAdjustCompletedListener)paramEventListener);
      return;
    case 18: 
      _bufferingStartedListeners.remove((BufferingStartedListener)paramEventListener);
      return;
    case 19: 
      _bufferingCompletedListeners.remove((BufferingCompletedListener)paramEventListener);
      return;
    case 20: 
      _bufferingFullListeners.remove((BufferingFullListener)paramEventListener);
      return;
    case 21: 
      _audioTrackFailedListeners.remove((AudioTrackFailedListener)paramEventListener);
      return;
    case 22: 
      _loadInfoListeners.remove((LoadInfoListener)paramEventListener);
      return;
    case 23: 
      _drmMetadataListeners.remove((DRMMetadataListener)paramEventListener);
      return;
    case 24: 
      _stateChangedListeners.remove((VideoStateChangedListener)paramEventListener);
      return;
    case 25: 
      _errorListeners.remove((VideoErrorListener)paramEventListener);
      return;
    case 26: 
      _clickListeners.remove((ViewClickListener)paramEventListener);
      return;
    case 27: 
      _opportunityHandledListeners.remove((OpportunityHandledListener)paramEventListener);
      return;
    case 28: 
      _opportunityFailedListeners.remove((OpportunityHandledListener)paramEventListener);
      return;
    case 29: 
      _pauseAtPeriodEndListeners.remove((PauseAtPeriodEndListener)paramEventListener);
      return;
    }
    _postRollEndListeners.remove((PostRollEndListener)paramEventListener);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoEngineDispatcher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */