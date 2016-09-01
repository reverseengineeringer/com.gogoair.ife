package com.adobe.mediacore;

import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.qos.metrics.PlaybackMetrics;

class DefaultMediaPlayer$8
  implements BufferingFullListener
{
  DefaultMediaPlayer$8(DefaultMediaPlayer paramDefaultMediaPlayer) {}
  
  public void onFull()
  {
    if (DefaultMediaPlayer.access$1800(this$0) == MediaPlayer.PlayerState.ERROR) {
      DefaultMediaPlayer.access$1700(this$0).w(DefaultMediaPlayer.access$1500() + "#onPlayerBufferFull", "Ignore event as media player is in ERROR state.");
    }
    do
    {
      return;
      DefaultMediaPlayer.access$1700(this$0).i(DefaultMediaPlayer.access$1500() + "#onPlayerBufferFull", "Buffer full: " + DefaultMediaPlayer.access$600(this$0).getBufferLength() + ".");
    } while (this$0.getStatus() != MediaPlayer.PlayerState.PAUSED);
    this$0.stopInternalTimer();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultMediaPlayer.8
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */