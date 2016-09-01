package com.adobe.mediacore;

public final class BufferControlParameters
{
  private long _initialBufferTime;
  private long _playBufferTime;
  
  public static BufferControlParameters createDual(long paramLong1, long paramLong2)
  {
    if ((paramLong1 <= 0L) || (paramLong2 <= 0L)) {
      throw new IllegalArgumentException("The initial buffer time and the play buffer time must be bigger than zero.");
    }
    if (paramLong1 > paramLong2) {
      throw new IllegalArgumentException("The initial buffer time can't be bigger than the play buffer time.");
    }
    BufferControlParameters localBufferControlParameters = new BufferControlParameters();
    _initialBufferTime = paramLong1;
    _playBufferTime = paramLong2;
    return localBufferControlParameters;
  }
  
  public static BufferControlParameters createSimple(long paramLong)
  {
    if (paramLong <= 0L) {
      throw new IllegalArgumentException("The buffer time must be bigger than zero.");
    }
    BufferControlParameters localBufferControlParameters = new BufferControlParameters();
    _initialBufferTime = paramLong;
    _playBufferTime = paramLong;
    return localBufferControlParameters;
  }
  
  public long getInitialBufferTime()
  {
    return _initialBufferTime;
  }
  
  public long getPlayBufferTime()
  {
    return _playBufferTime;
  }
  
  public String toString()
  {
    return "BufferControlParameters { _initialBufferTime=" + _initialBufferTime + ", _playBufferTime=" + _playBufferTime + "}";
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.BufferControlParameters
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */