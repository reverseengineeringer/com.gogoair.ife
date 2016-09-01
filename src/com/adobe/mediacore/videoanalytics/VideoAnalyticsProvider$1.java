package com.adobe.mediacore.videoanalytics;

import com.adobe.mediacore.MediaPlayer.PlaybackEventListener;
import com.adobe.mediacore.MediaPlayer.PlayerState;
import com.adobe.mediacore.MediaPlayerNotification;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.TimedMetadata;

class VideoAnalyticsProvider$1
  implements MediaPlayer.PlaybackEventListener
{
  VideoAnalyticsProvider$1(VideoAnalyticsProvider paramVideoAnalyticsProvider) {}
  
  public void onPlayComplete()
  {
    if (VideoAnalyticsProvider.access$000(this$0) != null) {
      VideoAnalyticsProvider.access$000(this$0).getPlaybackEventListener().onPlayComplete();
    }
  }
  
  public void onPlayStart()
  {
    if (VideoAnalyticsProvider.access$000(this$0) != null) {
      VideoAnalyticsProvider.access$000(this$0).getPlaybackEventListener().onPlayStart();
    }
  }
  
  public void onPrepared()
  {
    if (VideoAnalyticsProvider.access$000(this$0) != null) {
      VideoAnalyticsProvider.access$000(this$0).getPlaybackEventListener().onPrepared();
    }
  }
  
  public void onProfileChanged(long paramLong1, long paramLong2)
  {
    if (VideoAnalyticsProvider.access$000(this$0) != null) {
      VideoAnalyticsProvider.access$000(this$0).getPlaybackEventListener().onProfileChanged(paramLong1, paramLong2);
    }
  }
  
  public void onRatePlaying(float paramFloat)
  {
    if (VideoAnalyticsProvider.access$000(this$0) != null) {
      VideoAnalyticsProvider.access$000(this$0).getPlaybackEventListener().onRatePlaying(paramFloat);
    }
  }
  
  public void onRateSelected(float paramFloat)
  {
    if (VideoAnalyticsProvider.access$000(this$0) != null) {
      VideoAnalyticsProvider.access$000(this$0).getPlaybackEventListener().onRateSelected(paramFloat);
    }
  }
  
  public void onReplaceMediaPlayerItem()
  {
    if (VideoAnalyticsProvider.access$000(this$0) != null) {
      VideoAnalyticsProvider.access$000(this$0).getPlaybackEventListener().onReplaceMediaPlayerItem();
    }
  }
  
  public void onSizeAvailable(long paramLong1, long paramLong2)
  {
    if (VideoAnalyticsProvider.access$000(this$0) != null) {
      VideoAnalyticsProvider.access$000(this$0).getPlaybackEventListener().onSizeAvailable(paramLong1, paramLong2);
    }
  }
  
  public void onStateChanged(MediaPlayer.PlayerState paramPlayerState, MediaPlayerNotification paramMediaPlayerNotification)
  {
    VideoAnalyticsProvider.access$200().d(VideoAnalyticsProvider.access$100() + "#onStateChanged: ", paramPlayerState.name());
    switch (VideoAnalyticsProvider.2.$SwitchMap$com$adobe$mediacore$MediaPlayer$PlayerState[paramPlayerState.ordinal()])
    {
    }
    for (;;)
    {
      if (VideoAnalyticsProvider.access$000(this$0) != null) {
        VideoAnalyticsProvider.access$000(this$0).getPlaybackEventListener().onStateChanged(paramPlayerState, paramMediaPlayerNotification);
      }
      return;
      VideoAnalyticsProvider.access$300(this$0);
    }
  }
  
  public void onTimedMetadata(TimedMetadata paramTimedMetadata)
  {
    if (VideoAnalyticsProvider.access$000(this$0) != null) {
      VideoAnalyticsProvider.access$000(this$0).getPlaybackEventListener().onTimedMetadata(paramTimedMetadata);
    }
    if ((VideoAnalyticsProvider.access$400(this$0) != null) && (paramTimedMetadata != null) && (paramTimedMetadata.getMetadata() != null) && (paramTimedMetadata.getMetadata().containsKey("PRIV"))) {}
  }
  
  public void onTimelineUpdated()
  {
    if (VideoAnalyticsProvider.access$000(this$0) != null) {
      VideoAnalyticsProvider.access$000(this$0).getPlaybackEventListener().onTimelineUpdated();
    }
  }
  
  public void onUpdated()
  {
    if (VideoAnalyticsProvider.access$000(this$0) != null) {
      VideoAnalyticsProvider.access$000(this$0).getPlaybackEventListener().onUpdated();
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.videoanalytics.VideoAnalyticsProvider.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */