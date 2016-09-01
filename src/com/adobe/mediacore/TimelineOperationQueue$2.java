package com.adobe.mediacore;

import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;

class TimelineOperationQueue$2
  implements AdBreakPlacementCompletedListener
{
  TimelineOperationQueue$2(TimelineOperationQueue paramTimelineOperationQueue) {}
  
  public void onCompleted(AdBreakPlacement paramAdBreakPlacement1, AdBreakPlacement paramAdBreakPlacement2)
  {
    long l;
    if ((paramAdBreakPlacement1 != null) && (paramAdBreakPlacement1.getAdBreak() != null))
    {
      if (paramAdBreakPlacement1.getAdBreak().getRestoreId() == null) {
        break label54;
      }
      l = paramAdBreakPlacement1.getAdBreak().getLocalTime();
      paramAdBreakPlacement2.getAdBreak().setLocalTime(l);
    }
    for (;;)
    {
      TimelineOperationQueue.access$102(this$0, null);
      TimelineOperationQueue.access$200(this$0);
      return;
      label54:
      l = TimelineOperationQueue.access$000(this$0).convertToLocalTime(paramAdBreakPlacement2.getTime());
      paramAdBreakPlacement2.getAdBreak().setLocalTime(l);
      TimelineOperationQueue.access$300(this$0).dispatch(new OpportunityHandledEvent(MediaPlayerEvent.Type.OPPORTUNITY_COMPLETED, paramAdBreakPlacement1.getTime()));
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.TimelineOperationQueue.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */