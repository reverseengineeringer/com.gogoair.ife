package com.adobe.mediacore;

import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdClick;

public abstract interface MediaPlayer$AdPlaybackEventListener
  extends MediaPlayer.EventListener
{
  public abstract void onAdBreakComplete(AdBreak paramAdBreak);
  
  public abstract void onAdBreakSkipped(AdBreak paramAdBreak);
  
  public abstract void onAdBreakStart(AdBreak paramAdBreak);
  
  public abstract void onAdClick(AdBreak paramAdBreak, Ad paramAd, AdClick paramAdClick);
  
  public abstract void onAdComplete(AdBreak paramAdBreak, Ad paramAd);
  
  public abstract void onAdProgress(AdBreak paramAdBreak, Ad paramAd, int paramInt);
  
  public abstract void onAdStart(AdBreak paramAdBreak, Ad paramAd);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayer.AdPlaybackEventListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */