package com.adobe.mediacore;

import android.os.Handler;
import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdAsset;
import com.adobe.mediacore.timeline.advertising.AdClick;
import com.adobe.mediacore.timeline.advertising.ContentTracker;

class CustomAdPlaybackManager$2
  implements MediaPlayer.CustomAdEventListener
{
  CustomAdPlaybackManager$2(CustomAdPlaybackManager paramCustomAdPlaybackManager) {}
  
  public void onAdClickThru(String paramString, boolean paramBoolean)
  {
    if (paramString.isEmpty()) {}
    for (paramString = CustomAdPlaybackManager.access$900(this$0).getPrimaryAsset().getAdClick();; paramString = new AdClick("", "", paramString))
    {
      if (paramBoolean) {
        CustomAdPlaybackManager.access$100(this$0).dispatch(AdClickEvent.createAdClickEvent(CustomAdPlaybackManager.access$300(this$0), CustomAdPlaybackManager.access$900(this$0), paramString));
      }
      if (CustomAdPlaybackManager.access$900(this$0).getContentTracker() != null) {
        CustomAdPlaybackManager.access$900(this$0).getContentTracker().onAdClick(CustomAdPlaybackManager.access$900(this$0));
      }
      return;
    }
  }
  
  public void onAdDurationChange() {}
  
  public void onAdError(String paramString)
  {
    onAdStopped();
  }
  
  public void onAdExpandedChange() {}
  
  public void onAdImpression() {}
  
  public void onAdInteraction() {}
  
  public void onAdLinearChange() {}
  
  public void onAdPaused() {}
  
  public void onAdPlaying()
  {
    CustomAdPlaybackManager.access$1102(this$0, true);
  }
  
  public void onAdProgress(float paramFloat1, float paramFloat2)
  {
    if ((paramFloat1 <= 0.0F) || (paramFloat2 <= 0.0F)) {}
    int i;
    do
    {
      return;
      i = (int)((paramFloat1 - paramFloat2) / paramFloat1 * 100.0F);
    } while (i <= CustomAdPlaybackManager.access$1300(this$0));
    CustomAdPlaybackManager.access$1302(this$0, i);
    CustomAdPlaybackManager.access$100(this$0).dispatch(AdPlaybackEvent.createProgressEvent(CustomAdPlaybackManager.access$300(this$0), CustomAdPlaybackManager.access$900(this$0), i));
  }
  
  public void onAdSizeChange() {}
  
  public void onAdSkippableStateChange() {}
  
  public void onAdSkipped()
  {
    onAdStopped();
  }
  
  public void onAdStarted()
  {
    CustomAdPlaybackManager.access$1000(this$0).post(new CustomAdPlaybackManager.2.1(this));
  }
  
  public void onAdStopped()
  {
    CustomAdPlaybackManager.access$1102(this$0, false);
    CustomAdPlaybackManager.access$408(this$0);
    CustomAdPlaybackManager.access$1000(this$0).post(new CustomAdPlaybackManager.2.2(this));
  }
  
  public void onAdUserAcceptInvitation() {}
  
  public void onAdUserClose() {}
  
  public void onAdUserMinimize() {}
  
  public void onAdVideoComplete() {}
  
  public void onAdVideoFirstQuartile() {}
  
  public void onAdVideoMidpoint() {}
  
  public void onAdVideoStart() {}
  
  public void onAdVideoThirdQuartile() {}
  
  public void onAdVolumeChange() {}
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.CustomAdPlaybackManager.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */