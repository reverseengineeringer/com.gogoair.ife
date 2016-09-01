package com.adobe.mediacore;

import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import com.adobe.mediacore.logging.Logger;

class MediaPlayerView$VideoEngineViewCallback$1
  implements SurfaceHolder.Callback
{
  MediaPlayerView$VideoEngineViewCallback$1(MediaPlayerView.VideoEngineViewCallback paramVideoEngineViewCallback) {}
  
  public void surfaceChanged(SurfaceHolder paramSurfaceHolder, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void surfaceCreated(SurfaceHolder paramSurfaceHolder)
  {
    MediaPlayerView.access$200().i(MediaPlayerView.access$100() + "#surfaceCreated", "Media player surface was created.");
    MediaPlayerView.VideoEngineViewCallback.access$302(this$1, true);
    MediaPlayerView.access$400(this$1.this$0);
  }
  
  public void surfaceDestroyed(SurfaceHolder paramSurfaceHolder)
  {
    MediaPlayerView.access$200().i(MediaPlayerView.access$100() + "#surfaceDestroyed", "Media player surface was destroyed.");
    MediaPlayerView.VideoEngineViewCallback.access$302(this$1, false);
    MediaPlayerView.access$500(this$1.this$0);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayerView.VideoEngineViewCallback.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */