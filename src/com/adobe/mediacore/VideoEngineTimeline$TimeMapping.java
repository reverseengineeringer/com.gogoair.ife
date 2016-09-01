package com.adobe.mediacore;

public class VideoEngineTimeline$TimeMapping
{
  public static final int INVALID_PERIOD = -1;
  public static final long INVALID_POSITION = -3L;
  public static final long LIVE_POINT = -2L;
  final int _period;
  final long _time;
  
  private VideoEngineTimeline$TimeMapping(int paramInt, long paramLong)
  {
    _period = paramInt;
    _time = paramLong;
  }
  
  public static TimeMapping create(int paramInt, long paramLong)
  {
    return new TimeMapping(paramInt, paramLong);
  }
  
  public static TimeMapping createInvalid()
  {
    return new TimeMapping(-1, -3L);
  }
  
  public static TimeMapping createLivePoint()
  {
    return new TimeMapping(-1, -2L);
  }
  
  public int getPeriod()
  {
    return _period;
  }
  
  public long getTime()
  {
    return _time;
  }
  
  public boolean isInvalid()
  {
    return (_period == -1) && (_time == -3L);
  }
  
  public String toString()
  {
    return "TimeMapping { _period=" + _period + ", _time=" + _time + "}";
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoEngineTimeline.TimeMapping
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */