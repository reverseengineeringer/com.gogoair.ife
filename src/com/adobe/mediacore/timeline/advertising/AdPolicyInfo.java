package com.adobe.mediacore.timeline.advertising;

import java.util.List;

public final class AdPolicyInfo
{
  private Ad _ad = null;
  private List _adBreakPlacements = null;
  private long _currentTime = 0L;
  private AdPolicyMode _mode = AdPolicyMode.PLAY;
  private float _rate = 1.0F;
  private long _seekToTime = 0L;
  
  public AdPolicyInfo(List paramList, Ad paramAd, long paramLong1, long paramLong2, float paramFloat, AdPolicyMode paramAdPolicyMode)
  {
    _adBreakPlacements = paramList;
    _ad = paramAd;
    _currentTime = paramLong1;
    _seekToTime = paramLong2;
    _rate = paramFloat;
    _mode = paramAdPolicyMode;
  }
  
  public Ad getAd()
  {
    return _ad;
  }
  
  public List getAdBreakPlacements()
  {
    return _adBreakPlacements;
  }
  
  public long getCurrentTime()
  {
    return _currentTime;
  }
  
  public AdPolicyMode getMode()
  {
    return _mode;
  }
  
  public float getRate()
  {
    return _rate;
  }
  
  public long getSeekToTime()
  {
    return _seekToTime;
  }
  
  public void setAd(Ad paramAd)
  {
    _ad = paramAd;
  }
  
  public void setAdBreakPlacements(List paramList)
  {
    _adBreakPlacements = paramList;
  }
  
  public void setCurrentTime(long paramLong)
  {
    _currentTime = paramLong;
  }
  
  public void setMode(AdPolicyMode paramAdPolicyMode)
  {
    _mode = paramAdPolicyMode;
  }
  
  public void setRate(float paramFloat)
  {
    _rate = paramFloat;
  }
  
  public void setSeekToTime(long paramLong)
  {
    _seekToTime = paramLong;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.AdPolicyInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */