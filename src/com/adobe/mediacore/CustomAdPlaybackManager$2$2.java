package com.adobe.mediacore;

import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import java.util.Iterator;

class CustomAdPlaybackManager$2$2
  implements Runnable
{
  CustomAdPlaybackManager$2$2(CustomAdPlaybackManager.2 param2) {}
  
  public void run()
  {
    CustomAdPlaybackManager.access$1200(this$1.this$0).loadUrl("about:blank");
    CustomAdPlaybackManager.access$1302(this$1.this$0, -1);
    CustomAdPlaybackManager.access$100(this$1.this$0).dispatch(AdPlaybackEvent.createCompleteEvent(CustomAdPlaybackManager.access$300(this$1.this$0), CustomAdPlaybackManager.access$900(this$1.this$0)));
    if (CustomAdPlaybackManager.access$400(this$1.this$0) < CustomAdPlaybackManager.access$300(this$1.this$0).size())
    {
      Object localObject = CustomAdPlaybackManager.access$300(this$1.this$0).adsIterator();
      int i = 0;
      while (i < CustomAdPlaybackManager.access$400(this$1.this$0))
      {
        if (((Iterator)localObject).hasNext()) {
          Ad localAd = (Ad)((Iterator)localObject).next();
        }
        i += 1;
      }
      localObject = (Ad)((Iterator)localObject).next();
      if (((Ad)localObject).getType() == MediaResource.Type.CUSTOM)
      {
        CustomAdPlaybackManager.access$800(this$1.this$0, (Ad)localObject, false);
        return;
      }
    }
    if (!CustomAdPlaybackManager.access$1400(this$1.this$0))
    {
      if (CustomAdPlaybackManager.access$400(this$1.this$0) == CustomAdPlaybackManager.access$300(this$1.this$0).size())
      {
        if (CustomAdPlaybackManager.access$1500(this$1.this$0, CustomAdPlaybackManager.access$300(this$1.this$0))) {
          CustomAdPlaybackManager.access$500(this$1.this$0).getTimeline().removeVPAIDAdBreak(CustomAdPlaybackManager.access$300(this$1.this$0));
        }
        CustomAdPlaybackManager.access$100(this$1.this$0).dispatch(AdBreakPlaybackEvent.createCompleteEvent(CustomAdPlaybackManager.access$300(this$1.this$0)));
      }
      CustomAdPlaybackManager.access$500(this$1.this$0).restorePlayer(MediaPlayer.PlayerState.PLAYING, false);
      CustomAdPlaybackManager.access$1200(this$1.this$0).setVisibility(4);
      CustomAdPlaybackManager.access$1600(this$1.this$0).play();
      return;
    }
    CustomAdPlaybackManager.access$100(this$1.this$0).dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.POST_ROLL_COMPLETE));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.CustomAdPlaybackManager.2.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */