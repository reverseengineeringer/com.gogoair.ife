package com.adobe.mediacore.qos;

import com.adobe.mediacore.MediaPlayer.PlaybackEventListener;
import com.adobe.mediacore.MediaPlayer.PlayerState;
import com.adobe.mediacore.MediaPlayerNotification;
import com.adobe.mediacore.metadata.TimedMetadata;
import com.adobe.mediacore.qos.metrics.PlaybackLoadMetrics;

class QOSProvider$2
  implements MediaPlayer.PlaybackEventListener
{
  QOSProvider$2(QOSProvider paramQOSProvider) {}
  
  public void onPlayComplete() {}
  
  public void onPlayStart()
  {
    QOSProvider.access$200(this$0).recordTimeToFirstFrame();
  }
  
  public void onPrepared() {}
  
  public void onProfileChanged(long paramLong1, long paramLong2) {}
  
  public void onRatePlaying(float paramFloat) {}
  
  public void onRateSelected(float paramFloat) {}
  
  public void onReplaceMediaPlayerItem() {}
  
  public void onSizeAvailable(long paramLong1, long paramLong2) {}
  
  public void onStateChanged(MediaPlayer.PlayerState paramPlayerState, MediaPlayerNotification paramMediaPlayerNotification)
  {
    switch (QOSProvider.3.$SwitchMap$com$adobe$mediacore$MediaPlayer$PlayerState[paramPlayerState.ordinal()])
    {
    default: 
      return;
    case 1: 
      QOSProvider.access$200(this$0).recordPlaybackInit();
      return;
    case 2: 
      QOSProvider.access$200(this$0).recordPlaybackLoad();
      return;
    case 3: 
      QOSProvider.access$200(this$0).recordTimeToPrepare();
      return;
    }
    QOSProvider.access$200(this$0).recordPlaybackStart();
  }
  
  public void onTimedMetadata(TimedMetadata paramTimedMetadata) {}
  
  public void onTimelineUpdated() {}
  
  public void onUpdated() {}
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.qos.QOSProvider.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */