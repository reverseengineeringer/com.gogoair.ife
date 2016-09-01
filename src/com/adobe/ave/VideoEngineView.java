package com.adobe.ave;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.Build.VERSION;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.SurfaceView;

public class VideoEngineView
  extends SurfaceView
  implements SurfaceHolder.Callback
{
  static final String TAG = "VideoEngineView(j)";
  SurfaceHolder mHolder;
  private Canvas mLockedCanvas;
  private long m_nativeInstance = 0L;
  private Surface m_surface = null;
  
  public VideoEngineView(Context paramContext)
  {
    super(paramContext);
    if (Build.VERSION.SDK_INT >= 17) {}
    try
    {
      super.setSecure(true);
      mHolder = getHolder();
      if (useOverlay())
      {
        mHolder.setFormat(842094169);
        mHolder.addCallback(this);
        return;
      }
    }
    catch (Exception paramContext)
    {
      for (;;)
      {
        Log.e("VideoEngineView(j)", "Exception caught while calling setSecure");
        continue;
        mHolder.setFormat(4);
      }
    }
  }
  
  private Surface getSurface()
  {
    return m_surface;
  }
  
  private void lockCanvas(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (!useOverlay())
    {
      Rect localRect = new Rect(paramInt1, paramInt2, paramInt3, paramInt4);
      mLockedCanvas = mHolder.lockCanvas(localRect);
    }
  }
  
  private native void nativeDrawBitmapToCanvas(long paramLong, Canvas paramCanvas);
  
  private native void nativeSurfaceChanged(long paramLong, int paramInt1, int paramInt2);
  
  private native void nativeSurfaceCreated(long paramLong, int paramInt1, int paramInt2);
  
  private native void nativeSurfaceDestroyed(long paramLong);
  
  private void unlockCanvas()
  {
    if (!useOverlay()) {
      mHolder.unlockCanvasAndPost(mLockedCanvas);
    }
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    if (m_nativeInstance != 0L) {
      nativeDrawBitmapToCanvas(m_nativeInstance, paramCanvas);
    }
  }
  
  public void setNativeInstance(long paramLong)
  {
    m_nativeInstance = paramLong;
  }
  
  public void setWillNotDraw(boolean paramBoolean) {}
  
  public void setWillNotDrawCaption(boolean paramBoolean)
  {
    super.setWillNotDraw(paramBoolean);
  }
  
  public void surfaceChanged(SurfaceHolder paramSurfaceHolder, int paramInt1, int paramInt2, int paramInt3)
  {
    if (m_nativeInstance != 0L) {
      nativeSurfaceChanged(m_nativeInstance, getWidth(), getHeight());
    }
  }
  
  public void surfaceCreated(SurfaceHolder paramSurfaceHolder)
  {
    for (;;)
    {
      synchronized (mHolder)
      {
        if (useOverlay())
        {
          m_surface = paramSurfaceHolder.getSurface();
          if (m_nativeInstance != 0L) {
            nativeSurfaceCreated(m_nativeInstance, getWidth(), getHeight());
          }
          return;
        }
        paramSurfaceHolder = mHolder.lockCanvas();
        if (paramSurfaceHolder == null) {
          return;
        }
      }
      paramSurfaceHolder.drawColor(-1);
      mHolder.unlockCanvasAndPost(paramSurfaceHolder);
    }
  }
  
  public void surfaceDestroyed(SurfaceHolder paramSurfaceHolder)
  {
    if (m_nativeInstance != 0L) {
      nativeSurfaceDestroyed(m_nativeInstance);
    }
    if (useOverlay()) {
      m_surface.release();
    }
  }
  
  protected boolean useOverlay()
  {
    return Build.VERSION.SDK_INT >= 14;
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.VideoEngineView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */