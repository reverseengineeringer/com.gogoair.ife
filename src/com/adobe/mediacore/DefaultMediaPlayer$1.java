package com.adobe.mediacore;

import com.adobe.mediacore.qos.metrics.PlaybackMetrics;

class DefaultMediaPlayer$1
  implements SeekAdjustCompletedListener
{
  DefaultMediaPlayer$1(DefaultMediaPlayer paramDefaultMediaPlayer) {}
  
  public void onAdjustCompleted(long paramLong)
  {
    if (DefaultMediaPlayer.access$000(this$0) != null) {
      DefaultMediaPlayer.access$100(this$0).removeEventListener(MediaPlayerEvent.Type.SEEK_ADJUST_COMPLETED, DefaultMediaPlayer.access$000(this$0));
    }
    DefaultMediaPlayer.access$200(this$0).seek(VideoEngineTimeline.TimeMapping.create(-1, paramLong));
    if (((MediaPlayer.PlayerState.PAUSED != this$0.getStatus()) || (DefaultMediaPlayer.access$300(this$0).getCustomAdView().isActive())) && (MediaPlayer.PlayerState.SUSPENDED != this$0.getStatus())) {
      DefaultMediaPlayer.access$200(this$0).play();
    }
    if ((DefaultMediaPlayer.access$400(this$0).isLive()) && (DefaultMediaPlayer.access$500(this$0) != null)) {
      DefaultMediaPlayer.access$500(this$0).update(DefaultMediaPlayer.access$600(this$0).getTime(), DefaultMediaPlayer.access$600(this$0).getPlaybackRange());
    }
    if (!DefaultMediaPlayer.access$700(this$0)) {
      DefaultMediaPlayer.access$800(this$0);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultMediaPlayer.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */