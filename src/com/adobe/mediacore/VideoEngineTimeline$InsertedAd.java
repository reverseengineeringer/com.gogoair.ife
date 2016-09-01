package com.adobe.mediacore;

import com.adobe.mediacore.timeline.advertising.Ad;

final class VideoEngineTimeline$InsertedAd
{
  private Ad _ad;
  private AdHandle _handle;
  private int _index;
  private long _replaceDuration;
  private VideoEngineTimeline.TimeMapping _timeMapping;
  
  public VideoEngineTimeline$InsertedAd(VideoEngineTimeline paramVideoEngineTimeline, int paramInt, VideoEngineTimeline.TimeMapping paramTimeMapping, AdHandle paramAdHandle, Ad paramAd, long paramLong)
  {
    _index = paramInt;
    _timeMapping = paramTimeMapping;
    _handle = paramAdHandle;
    _ad = paramAd;
    _replaceDuration = paramLong;
  }
  
  public Ad getAd()
  {
    return _ad;
  }
  
  public AdHandle getAdHandle()
  {
    return _handle;
  }
  
  public int getIndex()
  {
    return _index;
  }
  
  public long getReplaceDuration()
  {
    return _replaceDuration;
  }
  
  public VideoEngineTimeline.TimeMapping getTimeMapping()
  {
    return _timeMapping;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoEngineTimeline.InsertedAd
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */