package com.adobe.mediacore;

import com.adobe.mediacore.timeline.advertising.Ad;

public class AdTimeline$AdInformation
{
  private final Ad _ad;
  private final int _progress;
  
  public AdTimeline$AdInformation(Ad paramAd, int paramInt)
  {
    _ad = paramAd;
    _progress = paramInt;
  }
  
  public Ad getAd()
  {
    return _ad;
  }
  
  public int getProgress()
  {
    return _progress;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdTimeline.AdInformation
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */