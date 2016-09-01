package com.adobe.mediacore;

abstract interface SeekCompletedListener
  extends MediaPlayer.EventListener
{
  public abstract void onCompleted(long paramLong);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.SeekCompletedListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */