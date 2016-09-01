package com.adobe.mediacore;

abstract interface VideoStateChangedListener
  extends MediaPlayer.EventListener
{
  public abstract void onStateChanged(MediaPlayerState paramMediaPlayerState, MediaPlayerNotification paramMediaPlayerNotification);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoStateChangedListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */