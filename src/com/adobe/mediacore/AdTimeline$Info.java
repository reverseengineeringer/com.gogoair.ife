package com.adobe.mediacore;

import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdBreak;

public class AdTimeline$Info
{
  private final Ad _ad;
  private final AdBreak _adBreak;
  
  private AdTimeline$Info(AdBreak paramAdBreak, Ad paramAd)
  {
    _adBreak = paramAdBreak;
    _ad = paramAd;
  }
  
  public static Info createInfo(AdBreak paramAdBreak, Ad paramAd)
  {
    if ((paramAdBreak != null) && (paramAd != null)) {
      return new Info(paramAdBreak, paramAd);
    }
    return null;
  }
  
  public boolean equals(Info paramInfo)
  {
    return (paramInfo != null) && (_adBreak == paramInfo.getAdBreak()) && (_ad == paramInfo.getAd());
  }
  
  public Ad getAd()
  {
    return _ad;
  }
  
  public AdBreak getAdBreak()
  {
    return _adBreak;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdTimeline.Info
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */