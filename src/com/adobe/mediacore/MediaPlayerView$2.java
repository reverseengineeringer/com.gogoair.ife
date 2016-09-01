package com.adobe.mediacore;

import com.adobe.mediacore.metadata.TimedMetadata;

class MediaPlayerView$2
  implements MediaPlayer.PlaybackEventListener
{
  MediaPlayerView$2(MediaPlayerView paramMediaPlayerView) {}
  
  public void onPlayComplete() {}
  
  public void onPlayStart() {}
  
  public void onPrepared() {}
  
  public void onProfileChanged(long paramLong1, long paramLong2) {}
  
  public void onRatePlaying(float paramFloat) {}
  
  public void onRateSelected(float paramFloat) {}
  
  public void onReplaceMediaPlayerItem() {}
  
  public void onSizeAvailable(long paramLong1, long paramLong2) {}
  
  public void onStateChanged(MediaPlayer.PlayerState paramPlayerState, MediaPlayerNotification paramMediaPlayerNotification)
  {
    MediaPlayerView.access$702(this$0, paramPlayerState);
  }
  
  public void onTimedMetadata(TimedMetadata paramTimedMetadata) {}
  
  public void onTimelineUpdated() {}
  
  public void onUpdated() {}
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayerView.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */