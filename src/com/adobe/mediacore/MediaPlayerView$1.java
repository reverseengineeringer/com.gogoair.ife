package com.adobe.mediacore;

class MediaPlayerView$1
  implements MediaPlayer.CustomAdEventListener
{
  MediaPlayerView$1(MediaPlayerView paramMediaPlayerView) {}
  
  public void onAdClickThru(String paramString, boolean paramBoolean) {}
  
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
  
  public void onAdPlaying() {}
  
  public void onAdProgress(float paramFloat1, float paramFloat2) {}
  
  public void onAdSizeChange() {}
  
  public void onAdSkippableStateChange() {}
  
  public void onAdSkipped()
  {
    onAdStopped();
  }
  
  public void onAdStarted()
  {
    MediaPlayerView.access$602(this$0, true);
  }
  
  public void onAdStopped()
  {
    MediaPlayerView.access$602(this$0, false);
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
 * Qualified Name:     com.adobe.mediacore.MediaPlayerView.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */