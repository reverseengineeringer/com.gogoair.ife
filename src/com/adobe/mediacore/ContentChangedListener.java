package com.adobe.mediacore;

abstract interface ContentChangedListener
  extends MediaPlayer.EventListener
{
  public abstract void onChanged(int paramInt, long paramLong);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.ContentChangedListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */