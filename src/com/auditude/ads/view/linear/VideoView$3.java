package com.auditude.ads.view.linear;

import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.widget.MediaController;

class VideoView$3
  implements MediaPlayer.OnCompletionListener
{
  VideoView$3(VideoView paramVideoView) {}
  
  public void onCompletion(MediaPlayer paramMediaPlayer)
  {
    VideoView.access$4(this$0, 5);
    VideoView.access$12(this$0, 5);
    if (VideoView.access$7(this$0) != null) {
      VideoView.access$7(this$0).hide();
    }
    if (VideoView.access$13(this$0) != null) {
      VideoView.access$13(this$0).onCompletion(VideoView.access$6(this$0));
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.linear.VideoView.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */