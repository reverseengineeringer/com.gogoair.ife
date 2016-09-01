package com.adobe.mediacore;

public abstract interface MediaPlayer$CustomAdEventListener
  extends MediaPlayer.EventListener
{
  public abstract void onAdClickThru(String paramString, boolean paramBoolean);
  
  public abstract void onAdDurationChange();
  
  public abstract void onAdError(String paramString);
  
  public abstract void onAdExpandedChange();
  
  public abstract void onAdImpression();
  
  public abstract void onAdInteraction();
  
  public abstract void onAdLinearChange();
  
  public abstract void onAdPaused();
  
  public abstract void onAdPlaying();
  
  public abstract void onAdProgress(float paramFloat1, float paramFloat2);
  
  public abstract void onAdSizeChange();
  
  public abstract void onAdSkippableStateChange();
  
  public abstract void onAdSkipped();
  
  public abstract void onAdStarted();
  
  public abstract void onAdStopped();
  
  public abstract void onAdUserAcceptInvitation();
  
  public abstract void onAdUserClose();
  
  public abstract void onAdUserMinimize();
  
  public abstract void onAdVideoComplete();
  
  public abstract void onAdVideoFirstQuartile();
  
  public abstract void onAdVideoMidpoint();
  
  public abstract void onAdVideoStart();
  
  public abstract void onAdVideoThirdQuartile();
  
  public abstract void onAdVolumeChange();
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayer.CustomAdEventListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */