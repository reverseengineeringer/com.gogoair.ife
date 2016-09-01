package com.adobe.mediacore;

import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.timeline.PlacementOpportunity;
import com.adobe.mediacore.timeline.TimelineOperation;
import com.adobe.mediacore.timeline.advertising.AdProvider;
import com.adobe.mediacore.timeline.advertising.AdProvider.OnCompleteListener;
import com.adobe.mediacore.timeline.advertising.PlacementInformation;
import java.util.Iterator;
import java.util.List;

class MediaPlayerClient$AdProviderListener
  implements AdProvider.OnCompleteListener
{
  public MediaPlayerClient$AdProviderListener(MediaPlayerClient paramMediaPlayerClient)
  {
    if (MediaPlayerClient.access$000(paramMediaPlayerClient) == null) {
      throw new IllegalArgumentException("The TimelineOperationQueue must be not null.");
    }
  }
  
  public void onComplete(AdProvider paramAdProvider, List paramList)
  {
    this$0.unregisterPlacement();
    if (paramList.size() > 0)
    {
      paramAdProvider = paramList.iterator();
      while (paramAdProvider.hasNext())
      {
        TimelineOperation localTimelineOperation = (TimelineOperation)paramAdProvider.next();
        MediaPlayerClient.access$200(this$0).i(MediaPlayerClient.access$100() + "#ContentResolver.OnCompleteListener::onComplete", "Adding reference for timelineOperation for HOLD at " + localTimelineOperation.getPlacement().getTime());
        MediaPlayerClient.access$300(this$0).addHoldReference(localTimelineOperation.getPlacement().getTime());
      }
      MediaPlayerClient.access$000(this$0).addAllToQueue(paramList);
    }
    for (;;)
    {
      if (MediaPlayerClient.access$500(this$0) != null)
      {
        long l = MediaPlayerClient.access$500(this$0).getPlacementInformation().getTime();
        MediaPlayerClient.access$200(this$0).i(MediaPlayerClient.access$100() + "#ContentResolver.OnCompleteListener::onComplete", "Release reference for timelineOperation for HOLD at " + l);
        MediaPlayerClient.access$300(this$0).releaseHoldReference(l);
      }
      MediaPlayerClient.access$502(this$0, null);
      MediaPlayerClient.access$600(this$0);
      return;
      if (this$0.doneInitialResolving()) {
        MediaPlayerClient.access$400(this$0);
      }
    }
  }
  
  public void onError(AdProvider paramAdProvider, MediaPlayerNotification.Error paramError)
  {
    this$0.unregisterPlacement();
    MediaPlayerNotification.Warning localWarning = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.AD_RESOLVER_FAIL, "Ad resolving operation has failed.");
    if (MediaPlayerClient.access$500(this$0) != null) {
      MediaPlayerClient.access$300(this$0).releaseHoldReference(MediaPlayerClient.access$500(this$0).getPlacementInformation().getTime());
    }
    MediaPlayerClient.access$502(this$0, null);
    MediaPlayerClient.access$600(this$0);
    localWarning.setInnerNotification(paramError);
    onWarning(paramAdProvider, localWarning);
    MediaPlayerClient.access$400(this$0);
  }
  
  public void onWarning(AdProvider paramAdProvider, MediaPlayerNotification.Warning paramWarning)
  {
    if (MediaPlayerClient.access$700(this$0) != null) {
      MediaPlayerClient.access$700(this$0).dispatch(OperationFailedEvent.createEvent(paramWarning));
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayerClient.AdProviderListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */