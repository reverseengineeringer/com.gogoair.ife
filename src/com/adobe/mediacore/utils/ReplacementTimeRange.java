package com.adobe.mediacore.utils;

public class ReplacementTimeRange
  extends TimeRange
{
  private long _replacementDuration = 0L;
  
  public ReplacementTimeRange(long paramLong1, long paramLong2, long paramLong3)
  {
    super(paramLong1, paramLong2);
    _replacementDuration = paramLong3;
  }
  
  public static ReplacementTimeRange createRange(long paramLong1, long paramLong2, long paramLong3)
  {
    return new ReplacementTimeRange(paramLong1, paramLong1 + paramLong2, paramLong3);
  }
  
  public long getReplacementDuration()
  {
    return _replacementDuration;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.utils.ReplacementTimeRange
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */