package com.adobe.mediacore;

abstract interface SeekAdjustCompletedListener
  extends MediaPlayer.EventListener
{
  public abstract void onAdjustCompleted(long paramLong);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.SeekAdjustCompletedListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */