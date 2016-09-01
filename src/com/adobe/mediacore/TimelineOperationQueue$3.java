package com.adobe.mediacore;

import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;

class TimelineOperationQueue$3
  implements AdBreakPlacementFailedListener
{
  TimelineOperationQueue$3(TimelineOperationQueue paramTimelineOperationQueue) {}
  
  public void onFailed(AdBreakPlacement paramAdBreakPlacement)
  {
    TimelineOperationQueue.access$500(this$0).w(TimelineOperationQueue.access$400() + "#adProviderError", "Proposed ad break was refused as we fail to place any of the contained ads.[" + paramAdBreakPlacement.toString() + "]");
    TimelineOperationQueue.access$300(this$0).dispatch(new OpportunityHandledEvent(MediaPlayerEvent.Type.OPPORTUNITY_FAILED, paramAdBreakPlacement.getTime()));
    TimelineOperationQueue.access$102(this$0, null);
    TimelineOperationQueue.access$200(this$0);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.TimelineOperationQueue.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */