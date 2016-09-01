package com.adobe.mediacore.utils;

public class TimeRange
  implements Comparable
{
  private final long _begin;
  private final long _end;
  
  public TimeRange(long paramLong1, long paramLong2)
  {
    _begin = paramLong1;
    _end = paramLong2;
  }
  
  public static long adjustTime(long paramLong1, long paramLong2, long paramLong3)
  {
    return Math.max(paramLong2, Math.min(paramLong3, paramLong1));
  }
  
  public static TimeRange createRange(long paramLong1, long paramLong2)
  {
    return new TimeRange(paramLong1, paramLong1 + paramLong2);
  }
  
  public int compareTo(TimeRange paramTimeRange)
  {
    return (int)(_begin - paramTimeRange.getBegin());
  }
  
  public boolean contains(long paramLong)
  {
    return (_begin <= paramLong) && (paramLong <= _end);
  }
  
  public long getBegin()
  {
    return _begin;
  }
  
  public long getDuration()
  {
    return _end - _begin;
  }
  
  public long getEnd()
  {
    return _end;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(getClass().getName()).append("Object {");
    localStringBuilder.append(" begin=").append(_begin);
    localStringBuilder.append(" ,end=").append(_end);
    localStringBuilder.append(" }");
    return localStringBuilder.toString();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.utils.TimeRange
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */