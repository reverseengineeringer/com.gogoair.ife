package com.auditude.ads.view.linear;

import android.media.MediaPlayer;
import android.media.MediaPlayer.OnVideoSizeChangedListener;
import android.view.SurfaceHolder;

class VideoView$1
  implements MediaPlayer.OnVideoSizeChangedListener
{
  VideoView$1(VideoView paramVideoView) {}
  
  public void onVideoSizeChanged(MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2)
  {
    VideoView.access$0(this$0, paramMediaPlayer.getVideoWidth());
    VideoView.access$1(this$0, paramMediaPlayer.getVideoHeight());
    if ((VideoView.access$2(this$0) != 0) && (VideoView.access$3(this$0) != 0)) {
      this$0.getHolder().setFixedSize(VideoView.access$2(this$0), VideoView.access$3(this$0));
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.linear.VideoView.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */