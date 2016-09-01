package com.adobe.mediacore;

import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;
import java.util.List;

class AdPolicyProxy$1
  implements AdBreakPlacementCompletedListener
{
  AdPolicyProxy$1(AdPolicyProxy paramAdPolicyProxy) {}
  
  public void onCompleted(AdBreakPlacement paramAdBreakPlacement1, AdBreakPlacement paramAdBreakPlacement2)
  {
    AdPolicyProxy.access$100(this$0).i(AdPolicyProxy.access$000() + "#AdPolicyProxy::AdBreakPlacementCompletedListener", "Ad break placement completed");
    if ((paramAdBreakPlacement1 != null) && (AdPolicyProxy.access$200(this$0) != null) && (AdPolicyProxy.access$200(this$0).contains(paramAdBreakPlacement1)))
    {
      if (paramAdBreakPlacement2 != null) {
        paramAdBreakPlacement2.getAdBreak().setRestoreId(paramAdBreakPlacement1.getAdBreak().getRestoreId());
      }
      AdPolicyProxy.access$200(this$0).remove(paramAdBreakPlacement1);
      if (AdPolicyProxy.access$300(this$0, AdPolicyProxy.access$200(this$0)).booleanValue())
      {
        if (AdPolicyProxy.access$400(this$0) != null) {
          AdPolicyProxy.access$400(this$0).dispatch(SeekEvent.createSeekAdjustCompleted(AdPolicyProxy.access$500(this$0)));
        }
        AdPolicyProxy.access$600(this$0);
      }
    }
    else
    {
      return;
    }
    AdPolicyProxy.access$100(this$0).i(AdPolicyProxy.access$000() + "AdPolicyProxy::onAdBreakComplete", "Place next Ad Break Placement that's skipped");
    paramAdBreakPlacement1 = (AdBreakPlacement)AdPolicyProxy.access$200(this$0).get(0);
    AdPolicyProxy.access$700(this$0).addToQueue(paramAdBreakPlacement1);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdPolicyProxy.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */