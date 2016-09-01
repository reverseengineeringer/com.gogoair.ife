package com.adobe.mediacore;

import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;
import java.util.List;

class AdPolicyProxy$2
  implements AdBreakPlacementFailedListener
{
  AdPolicyProxy$2(AdPolicyProxy paramAdPolicyProxy) {}
  
  public void onFailed(AdBreakPlacement paramAdBreakPlacement)
  {
    AdPolicyProxy.access$100(this$0).e(AdPolicyProxy.access$000() + "#AdPolicyProxy::AdBreakPlacementFailedListener", "Ad break placement failed");
    if ((paramAdBreakPlacement != null) && (AdPolicyProxy.access$200(this$0) != null) && (AdPolicyProxy.access$200(this$0).contains(paramAdBreakPlacement)))
    {
      AdPolicyProxy.access$200(this$0).remove(paramAdBreakPlacement);
      if (AdPolicyProxy.access$300(this$0, AdPolicyProxy.access$200(this$0)).booleanValue())
      {
        if (AdPolicyProxy.access$400(this$0) != null) {
          AdPolicyProxy.access$400(this$0).dispatch(SeekEvent.createSeekAdjustCompleted(paramAdBreakPlacement.getTime()));
        }
        AdPolicyProxy.access$600(this$0);
      }
    }
    else
    {
      return;
    }
    AdPolicyProxy.access$522(this$0, paramAdBreakPlacement.getDuration());
    AdPolicyProxy.access$100(this$0).i(AdPolicyProxy.access$000() + "AdPolicyProxy::onAdBreakComplete", "Place next Ad Break Placement that's skipped");
    paramAdBreakPlacement = (AdBreakPlacement)AdPolicyProxy.access$200(this$0).get(0);
    AdPolicyProxy.access$700(this$0).addToQueue(paramAdBreakPlacement);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdPolicyProxy.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */