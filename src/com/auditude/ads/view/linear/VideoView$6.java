package com.auditude.ads.view.linear;

import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.widget.MediaController;

class VideoView$6
  implements SurfaceHolder.Callback
{
  VideoView$6(VideoView paramVideoView) {}
  
  public void surfaceChanged(SurfaceHolder paramSurfaceHolder, int paramInt1, int paramInt2, int paramInt3)
  {
    int i = 1;
    VideoView.access$17(this$0, paramInt2);
    VideoView.access$18(this$0, paramInt3);
    if (VideoView.access$11(this$0) == 3)
    {
      paramInt1 = 1;
      if ((VideoView.access$2(this$0) != paramInt2) || (VideoView.access$3(this$0) != paramInt3)) {
        break label114;
      }
    }
    label114:
    for (paramInt2 = i;; paramInt2 = 0)
    {
      if ((VideoView.access$6(this$0) != null) && (paramInt1 != 0) && (paramInt2 != 0))
      {
        if (VideoView.access$8(this$0) != 0) {
          this$0.seekTo(VideoView.access$8(this$0));
        }
        this$0.start();
      }
      return;
      paramInt1 = 0;
      break;
    }
  }
  
  public void surfaceCreated(SurfaceHolder paramSurfaceHolder)
  {
    VideoView.access$19(this$0, paramSurfaceHolder);
    VideoView.access$20(this$0);
  }
  
  public void surfaceDestroyed(SurfaceHolder paramSurfaceHolder)
  {
    VideoView.access$19(this$0, null);
    if (VideoView.access$7(this$0) != null) {
      VideoView.access$7(this$0).hide();
    }
    VideoView.access$21(this$0, true);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.linear.VideoView.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */