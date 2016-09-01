package com.adobe.ave;

public class PeriodInfo
{
  public long duration;
  public int firstCuePointIndex;
  public int firstSubscribedTagIndex;
  public int lastCuePointIndex;
  public int lastSubscribedTagIndex;
  public long localStartTime;
  public boolean supportsTrickPlay;
  public long targetDuration;
  public int userData;
  public long virtualStartTime;
  
  private PeriodInfo(int paramInt1, long paramLong1, long paramLong2, long paramLong3, int paramInt2, int paramInt3, int paramInt4, int paramInt5, boolean paramBoolean, long paramLong4)
  {
    userData = paramInt1;
    localStartTime = paramLong1;
    virtualStartTime = paramLong2;
    duration = paramLong3;
    firstCuePointIndex = paramInt2;
    lastCuePointIndex = paramInt3;
    supportsTrickPlay = paramBoolean;
    firstSubscribedTagIndex = paramInt4;
    lastSubscribedTagIndex = paramInt5;
    targetDuration = paramLong4;
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.PeriodInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */