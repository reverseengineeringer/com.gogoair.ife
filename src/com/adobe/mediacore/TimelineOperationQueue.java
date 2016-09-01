package com.adobe.mediacore;

import android.os.Handler;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.timeline.NopTimelineOperation;
import com.adobe.mediacore.timeline.TimelineOperation;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;
import com.adobe.mediacore.timeline.advertising.PlacementInformation;
import java.util.Collections;
import java.util.List;
import java.util.PriorityQueue;
import java.util.Queue;

class TimelineOperationQueue
{
  private static final String LOG_TAG = "[PSDK]::" + TimelineOperationQueue.class.getSimpleName();
  private Runnable _executor;
  private Handler _handler;
  private final Logger _logger = Log.getLogger(LOG_TAG);
  private final AdBreakPlacementCompletedListener _onAdBreakPlacementCompletedListener = new TimelineOperationQueue.2(this);
  private final AdBreakPlacementFailedListener _onAdBreakPlacementFailedListener = new TimelineOperationQueue.3(this);
  private final AdBreakRemovalCompletedListener _onAdBreakRemovalCompletedListener = new TimelineOperationQueue.4(this);
  private final Queue _operationsToBeExecuted = new PriorityQueue();
  private TimelineOperation _pendingOperation = null;
  private final VideoEngineDispatcher _videoEngineDispatcher;
  private final VideoEngineTimeline _videoEngineTimeline;
  
  public TimelineOperationQueue(VideoEngineTimeline paramVideoEngineTimeline, VideoEngineDispatcher paramVideoEngineDispatcher)
  {
    _videoEngineTimeline = paramVideoEngineTimeline;
    _videoEngineDispatcher = paramVideoEngineDispatcher;
    initialise();
  }
  
  private void clearOperation()
  {
    _pendingOperation = null;
  }
  
  private void clearOperationsQueue()
  {
    _operationsToBeExecuted.clear();
  }
  
  private void initialise()
  {
    _handler = new Handler();
    _executor = new TimelineOperationQueue.1(this);
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.ADBREAK_PLACEMENT_COMPLETED, _onAdBreakPlacementCompletedListener);
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.ADBREAK_PLACEMENT_FAILED, _onAdBreakPlacementFailedListener);
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.ADBREAK_REMOVAL_COMPLETED, _onAdBreakRemovalCompletedListener);
  }
  
  private void process()
  {
    if (_pendingOperation != null) {
      return;
    }
    int k = 0;
    int i = 0;
    TimelineOperation localTimelineOperation = (TimelineOperation)_operationsToBeExecuted.poll();
    int m = k;
    int j = i;
    if (localTimelineOperation != null)
    {
      j = i;
      if ((localTimelineOperation instanceof AdBreakPlacement))
      {
        j = i;
        if (((AdBreakPlacement)localTimelineOperation).getAdBreak().getRestoreId() == null)
        {
          if (_videoEngineTimeline.willAccept(localTimelineOperation)) {
            break label297;
          }
          i = 1;
          label76:
          j = i;
        }
      }
      if (localTimelineOperation.isValid()) {
        break label302;
      }
      i = 1;
      label88:
      if ((j != 0) || (i != 0)) {
        if (j == 0) {
          break label307;
        }
      }
    }
    label297:
    label302:
    label307:
    for (Object localObject = "Proposed ad break is conflicting with previously placed ad breaks.";; localObject = "Proposed ad break is invalid - replace duration [" + String.valueOf(((AdBreakPlacement)localTimelineOperation).getAdBreak().getInitialReplaceDuration()) + "] is smaller than the actual duration of ad break [" + String.valueOf(((AdBreakPlacement)localTimelineOperation).getAdBreak().getDuration()) + "].")
    {
      _logger.w(LOG_TAG + "#process", (String)localObject + "[" + localTimelineOperation.toString() + "].");
      _videoEngineDispatcher.dispatch(new OpportunityHandledEvent(MediaPlayerEvent.Type.OPPORTUNITY_FAILED, localTimelineOperation.getPlacement().getTime()));
      localObject = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.AD_RESOLVER_FAIL, (String)localObject);
      MetadataNode localMetadataNode = new MetadataNode();
      localMetadataNode.setValue("AD_BREAK", ((AdBreakPlacement)localTimelineOperation).toString());
      ((MediaPlayerNotification.Warning)localObject).setMetadata(localMetadataNode);
      _videoEngineDispatcher.dispatch(OperationFailedEvent.createEvent((MediaPlayerNotification.Warning)localObject));
      m = i;
      if (localTimelineOperation != null)
      {
        k = m;
        i = j;
        if (m != 0) {
          break;
        }
        k = m;
        i = j;
        if (j != 0) {
          break;
        }
      }
      if (localTimelineOperation != null) {
        break label372;
      }
      _videoEngineDispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.CONTENT_PLACEMENT_COMPLETE));
      return;
      i = 0;
      break label76;
      i = 0;
      break label88;
    }
    label372:
    if ((localTimelineOperation instanceof NopTimelineOperation))
    {
      process();
      return;
    }
    _pendingOperation = localTimelineOperation;
    _handler.post(_executor);
  }
  
  public void addAllToQueue(List paramList)
  {
    try
    {
      Collections.sort(paramList);
      _operationsToBeExecuted.addAll(paramList);
      process();
      return;
    }
    finally
    {
      paramList = finally;
      throw paramList;
    }
  }
  
  public void addToQueue(TimelineOperation paramTimelineOperation)
  {
    try
    {
      _operationsToBeExecuted.add(paramTimelineOperation);
      process();
      return;
    }
    finally
    {
      paramTimelineOperation = finally;
      throw paramTimelineOperation;
    }
  }
  
  public void clear()
  {
    clearOperation();
    clearOperationsQueue();
  }
  
  public void dispose()
  {
    _handler = null;
    _executor = null;
    _videoEngineDispatcher.removeEventListener(MediaPlayerEvent.Type.ADBREAK_PLACEMENT_COMPLETED, _onAdBreakPlacementCompletedListener);
    _videoEngineDispatcher.removeEventListener(MediaPlayerEvent.Type.ADBREAK_PLACEMENT_FAILED, _onAdBreakPlacementFailedListener);
    _videoEngineDispatcher.removeEventListener(MediaPlayerEvent.Type.ADBREAK_REMOVAL_COMPLETED, _onAdBreakRemovalCompletedListener);
  }
  
  public boolean isEmpty()
  {
    return (_operationsToBeExecuted.size() <= 0) && (_pendingOperation == null);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.TimelineOperationQueue
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */