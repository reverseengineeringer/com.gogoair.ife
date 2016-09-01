package com.adobe.mediacore.timeline;

public abstract interface TimelineHold
{
  public abstract void addReference(long paramLong);
  
  public abstract long getHoldTime();
  
  public abstract boolean isReleased();
  
  public abstract void releaseReference(long paramLong);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.TimelineHold
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */