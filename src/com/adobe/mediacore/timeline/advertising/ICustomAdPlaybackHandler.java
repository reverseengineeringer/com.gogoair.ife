package com.adobe.mediacore.timeline.advertising;

public abstract interface ICustomAdPlaybackHandler
{
  public abstract boolean canHandleAd(Ad paramAd);
  
  public abstract void configure();
  
  public abstract void dispose();
  
  public abstract void initAd(Ad paramAd);
  
  public abstract void pauseAd(Ad paramAd);
  
  public abstract void resumeAd(Ad paramAd);
  
  public abstract void startAd(Ad paramAd);
  
  public abstract void stopAd(Ad paramAd);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.ICustomAdPlaybackHandler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */