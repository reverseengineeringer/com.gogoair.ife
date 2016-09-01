package com.adobe.mediacore;

import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdClick;
import com.adobe.mediacore.timeline.advertising.ContentTracker;

class TimelineMonitor$3
  implements MediaPlayer.AdPlaybackEventListener
{
  TimelineMonitor$3(TimelineMonitor paramTimelineMonitor) {}
  
  public void onAdBreakComplete(AdBreak paramAdBreak)
  {
    if (paramAdBreak.getLastAd().getType() == MediaResource.Type.CUSTOM)
    {
      TimelineMonitor.access$202(this$0, null);
      TimelineMonitor.access$502(this$0, null);
      TimelineMonitor.access$700(this$0, paramAdBreak);
    }
  }
  
  public void onAdBreakSkipped(AdBreak paramAdBreak) {}
  
  public void onAdBreakStart(AdBreak paramAdBreak)
  {
    if (paramAdBreak.getFirstAd().getType() == MediaResource.Type.CUSTOM)
    {
      TimelineMonitor.access$100(this$0, paramAdBreak);
      if ((TimelineMonitor.access$200(this$0) != null) && (TimelineMonitor.access$200(this$0).equals(paramAdBreak))) {
        TimelineMonitor.access$202(this$0, null);
      }
    }
  }
  
  public void onAdClick(AdBreak paramAdBreak, Ad paramAd, AdClick paramAdClick) {}
  
  public void onAdComplete(AdBreak paramAdBreak, Ad paramAd)
  {
    if ((paramAd.getType() == MediaResource.Type.CUSTOM) && (paramAd.getContentTracker() != null))
    {
      TimelineMonitor.access$400(this$0).i(TimelineMonitor.access$300() + "#CustomAdReporting", "Ad complete. " + paramAd.getId());
      paramAd.getContentTracker().onAdComplete(paramAd);
      if (TimelineMonitor.access$500(this$0) != null)
      {
        TimelineMonitor.access$600(this$0).dispatch(AdPlaybackEvent.createStartEvent(paramAdBreak, TimelineMonitor.access$500(this$0)));
        if (TimelineMonitor.access$500(this$0).getContentTracker() != null) {
          TimelineMonitor.access$500(this$0).getContentTracker().onAdStart(TimelineMonitor.access$500(this$0));
        }
        TimelineMonitor.access$502(this$0, null);
      }
    }
  }
  
  public void onAdProgress(AdBreak paramAdBreak, Ad paramAd, int paramInt)
  {
    if ((paramAd.getType() == MediaResource.Type.CUSTOM) && (paramAd.getContentTracker() != null))
    {
      TimelineMonitor.access$400(this$0).i(TimelineMonitor.access$300() + "#CustomAdReporting", "Ad progress. " + paramAd.getId());
      paramAd.getContentTracker().onAdProgress(paramAd, paramInt);
    }
  }
  
  public void onAdStart(AdBreak paramAdBreak, Ad paramAd)
  {
    if ((paramAd.getType() == MediaResource.Type.CUSTOM) && (paramAd.getContentTracker() != null))
    {
      TimelineMonitor.access$400(this$0).i(TimelineMonitor.access$300() + "#CustomAdReporting", "Ad start. " + paramAd.getId());
      paramAd.getContentTracker().onAdStart(paramAd);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.TimelineMonitor.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */