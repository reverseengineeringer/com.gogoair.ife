package com.adobe.mediacore;

import android.os.Handler;
import com.adobe.mediacore.qos.metrics.PlaybackMetrics;

class DefaultMediaPlayer$2
  implements Runnable
{
  DefaultMediaPlayer$2(DefaultMediaPlayer paramDefaultMediaPlayer) {}
  
  public void run()
  {
    if (DefaultMediaPlayer.access$200(this$0) != null)
    {
      DefaultMediaPlayer.access$600(this$0).update();
      long l = this$0.getCurrentTime();
      if (DefaultMediaPlayer.access$900(this$0) != null) {
        DefaultMediaPlayer.access$900(this$0).update(l);
      }
      if (DefaultMediaPlayer.access$1000(this$0) != null) {
        DefaultMediaPlayer.access$1000(this$0).update(l);
      }
      if (DefaultMediaPlayer.access$1100(this$0) != null) {
        DefaultMediaPlayer.access$1100(this$0).update(l);
      }
      if (DefaultMediaPlayer.access$300(this$0) != null) {
        DefaultMediaPlayer.access$300(this$0).setCurrentTime(l);
      }
      if (DefaultMediaPlayer.access$500(this$0) != null) {
        DefaultMediaPlayer.access$500(this$0).setPlayheadTime(this$0.getLocalTime(), l);
      }
    }
    if (!DefaultMediaPlayer.access$1200(this$0)) {
      DefaultMediaPlayer.access$1400(this$0).postDelayed(DefaultMediaPlayer.access$1300(this$0), 250L);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultMediaPlayer.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */