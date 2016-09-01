package com.adobe.mediacore;

import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import java.util.Iterator;

class CustomAdPlaybackManager$3
  implements PauseAtPeriodEndListener
{
  CustomAdPlaybackManager$3(CustomAdPlaybackManager paramCustomAdPlaybackManager) {}
  
  public void onPauseAtPeriodEnd(int paramInt)
  {
    AdBreak localAdBreak = CustomAdPlaybackManager.access$500(this$0).getTimeline().getAdBreakFromId(paramInt);
    if (localAdBreak != null)
    {
      CustomAdPlaybackManager.access$700(this$0, localAdBreak);
      Iterator localIterator = localAdBreak.adsIterator();
      paramInt = 0;
      int i;
      Ad localAd;
      for (;;)
      {
        i = paramInt;
        if (paramInt >= CustomAdPlaybackManager.access$400(this$0)) {
          break;
        }
        if (localIterator.hasNext()) {
          localAd = (Ad)localIterator.next();
        }
        paramInt += 1;
      }
      do
      {
        i += 1;
        if (i >= localAdBreak.size()) {
          break;
        }
        boolean bool = localIterator.hasNext();
        localAd = null;
        if (bool) {
          localAd = (Ad)localIterator.next();
        }
      } while ((localAd == null) || (localAd.getType() != MediaResource.Type.CUSTOM));
      CustomAdPlaybackManager.access$402(this$0, i);
      CustomAdPlaybackManager.access$800(this$0, localAd, true);
      return;
    }
    if (!CustomAdPlaybackManager.access$1400(this$0))
    {
      CustomAdPlaybackManager.access$1102(this$0, false);
      CustomAdPlaybackManager.access$1600(this$0).play();
      return;
    }
    CustomAdPlaybackManager.access$100(this$0).dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.POST_ROLL_COMPLETE));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.CustomAdPlaybackManager.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */