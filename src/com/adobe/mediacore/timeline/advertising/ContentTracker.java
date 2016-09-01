package com.adobe.mediacore.timeline.advertising;

public abstract interface ContentTracker
{
  public abstract void onAdBreakComplete(AdBreak paramAdBreak);
  
  public abstract void onAdBreakStart(AdBreak paramAdBreak);
  
  public abstract void onAdClick(Ad paramAd);
  
  public abstract void onAdComplete(Ad paramAd);
  
  public abstract void onAdError(Ad paramAd);
  
  public abstract void onAdProgress(Ad paramAd, int paramInt);
  
  public abstract void onAdStart(Ad paramAd);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.ContentTracker
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */