package com.adobe.mediacore;

import com.adobe.ave.PeriodInfo;

final class VideoEngineTimeline$Period
{
  private final int periodIndex;
  private final PeriodInfo periodInfo;
  
  public VideoEngineTimeline$Period(VideoEngineTimeline paramVideoEngineTimeline, int paramInt, PeriodInfo paramPeriodInfo)
  {
    periodIndex = paramInt;
    periodInfo = paramPeriodInfo;
  }
  
  public long getDuration()
  {
    return periodInfo.duration;
  }
  
  public long getLocalEndTime()
  {
    return getLocalStartTime() + getDuration();
  }
  
  public long getLocalStartTime()
  {
    return periodInfo.localStartTime;
  }
  
  public int getPeriodIndex()
  {
    return periodIndex;
  }
  
  public long getVirtualTime()
  {
    return periodInfo.virtualStartTime;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoEngineTimeline.Period
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */