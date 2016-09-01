package com.adobe.mediacore;

import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.SurfaceView;

class MediaPlayerView$VideoEngineViewCallback
{
  private boolean _hasSurface = false;
  private SurfaceHolder _viewHolder;
  private SurfaceHolder.Callback _viewHolderCallback = new MediaPlayerView.VideoEngineViewCallback.1(this);
  
  public MediaPlayerView$VideoEngineViewCallback(MediaPlayerView paramMediaPlayerView, SurfaceView paramSurfaceView)
  {
    if ((paramSurfaceView != null) && (_viewHolder == null))
    {
      _viewHolder = paramSurfaceView.getHolder();
      if (_viewHolder != null) {
        _viewHolder.addCallback(_viewHolderCallback);
      }
    }
  }
  
  private void release()
  {
    if (_viewHolder != null)
    {
      _viewHolder.removeCallback(_viewHolderCallback);
      _viewHolder = null;
    }
  }
  
  public boolean hasSurface()
  {
    return _hasSurface;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayerView.VideoEngineViewCallback
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */