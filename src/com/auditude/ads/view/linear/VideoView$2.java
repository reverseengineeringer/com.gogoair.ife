package com.auditude.ads.view.linear;

import android.media.MediaPlayer;
import android.media.MediaPlayer.OnPreparedListener;
import android.view.SurfaceHolder;
import android.widget.MediaController;

class VideoView$2
  implements MediaPlayer.OnPreparedListener
{
  VideoView$2(VideoView paramVideoView) {}
  
  public void onPrepared(MediaPlayer paramMediaPlayer)
  {
    VideoView.access$4(this$0, 2);
    if (VideoView.access$5(this$0) != null) {
      VideoView.access$5(this$0).onPrepared(VideoView.access$6(this$0));
    }
    if (VideoView.access$7(this$0) != null) {
      VideoView.access$7(this$0).setEnabled(true);
    }
    VideoView.access$0(this$0, paramMediaPlayer.getVideoWidth());
    VideoView.access$1(this$0, paramMediaPlayer.getVideoHeight());
    int i = VideoView.access$8(this$0);
    if (i != 0) {
      this$0.seekTo(i);
    }
    if ((VideoView.access$2(this$0) != 0) && (VideoView.access$3(this$0) != 0))
    {
      this$0.getHolder().setFixedSize(VideoView.access$2(this$0), VideoView.access$3(this$0));
      if ((VideoView.access$9(this$0) == VideoView.access$2(this$0)) && (VideoView.access$10(this$0) == VideoView.access$3(this$0)))
      {
        if (VideoView.access$11(this$0) != 3) {
          break label235;
        }
        this$0.start();
        if (VideoView.access$7(this$0) != null) {
          VideoView.access$7(this$0).show();
        }
      }
    }
    for (;;)
    {
      this$0.setZOrderOnTop(true);
      this$0.setZOrderMediaOverlay(true);
      return;
      label235:
      if ((!this$0.isPlaying()) && ((i != 0) || (this$0.getCurrentPosition() > 0)) && (VideoView.access$7(this$0) != null))
      {
        VideoView.access$7(this$0).show(0);
        continue;
        if (VideoView.access$11(this$0) == 3) {
          this$0.start();
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.linear.VideoView.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */