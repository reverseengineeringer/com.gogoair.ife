package com.adobe.mediacore;

import com.adobe.mediacore.metadata.TimedMetadata;

public abstract interface MediaPlayer$PlaybackEventListener
  extends MediaPlayer.EventListener
{
  public abstract void onPlayComplete();
  
  public abstract void onPlayStart();
  
  public abstract void onPrepared();
  
  public abstract void onProfileChanged(long paramLong1, long paramLong2);
  
  public abstract void onRatePlaying(float paramFloat);
  
  public abstract void onRateSelected(float paramFloat);
  
  public abstract void onReplaceMediaPlayerItem();
  
  public abstract void onSizeAvailable(long paramLong1, long paramLong2);
  
  public abstract void onStateChanged(MediaPlayer.PlayerState paramPlayerState, MediaPlayerNotification paramMediaPlayerNotification);
  
  public abstract void onTimedMetadata(TimedMetadata paramTimedMetadata);
  
  public abstract void onTimelineUpdated();
  
  public abstract void onUpdated();
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayer.PlaybackEventListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */