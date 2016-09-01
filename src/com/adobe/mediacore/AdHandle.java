package com.adobe.mediacore;

final class AdHandle
{
  private final long _duration;
  private final int _handle;
  
  public AdHandle(int paramInt, long paramLong)
  {
    _handle = paramInt;
    _duration = paramLong;
  }
  
  public long getDuration()
  {
    return _duration;
  }
  
  public int getHandle()
  {
    return _handle;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdHandle
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */