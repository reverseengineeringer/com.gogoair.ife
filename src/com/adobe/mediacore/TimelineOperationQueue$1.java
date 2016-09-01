package com.adobe.mediacore;

class TimelineOperationQueue$1
  implements Runnable
{
  TimelineOperationQueue$1(TimelineOperationQueue paramTimelineOperationQueue) {}
  
  public void run()
  {
    if ((TimelineOperationQueue.access$000(this$0) != null) && (TimelineOperationQueue.access$100(this$0) != null))
    {
      TimelineOperationQueue.access$000(this$0).execute(TimelineOperationQueue.access$100(this$0));
      return;
    }
    TimelineOperationQueue.access$102(this$0, null);
    TimelineOperationQueue.access$200(this$0);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.TimelineOperationQueue.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */