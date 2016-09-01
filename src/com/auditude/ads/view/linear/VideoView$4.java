package com.auditude.ads.view.linear;

import android.media.MediaPlayer;
import android.media.MediaPlayer.OnErrorListener;
import android.util.Log;
import android.widget.MediaController;

class VideoView$4
  implements MediaPlayer.OnErrorListener
{
  VideoView$4(VideoView paramVideoView) {}
  
  public boolean onError(MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2)
  {
    Log.d(VideoView.access$14(this$0), "Error: " + paramInt1 + "," + paramInt2);
    VideoView.access$4(this$0, -1);
    VideoView.access$12(this$0, -1);
    if (VideoView.access$7(this$0) != null) {
      VideoView.access$7(this$0).hide();
    }
    if ((VideoView.access$15(this$0) != null) && (VideoView.access$15(this$0).onError(VideoView.access$6(this$0), paramInt1, paramInt2))) {
      return true;
    }
    this$0.getWindowToken();
    return true;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.linear.VideoView.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */