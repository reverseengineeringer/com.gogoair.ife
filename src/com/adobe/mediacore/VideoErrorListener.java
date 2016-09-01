package com.adobe.mediacore;

abstract interface VideoErrorListener
  extends MediaPlayer.EventListener
{
  public abstract void onError(MediaPlayerNotification.Error paramError);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoErrorListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */