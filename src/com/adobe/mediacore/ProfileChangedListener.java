package com.adobe.mediacore;

abstract interface ProfileChangedListener
  extends MediaPlayer.EventListener
{
  public abstract void onChanged(long paramLong1, long paramLong2);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.ProfileChangedListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */