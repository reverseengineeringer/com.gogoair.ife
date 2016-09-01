package com.adobe.mediacore;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.SurfaceView;
import android.view.ViewGroup;
import android.view.ViewPropertyAnimator;
import android.view.animation.Animation;
import com.adobe.ave.PlayState;
import com.adobe.ave.VideoEngineView;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;

public final class MediaPlayerView
  extends ViewGroup
{
  private static final String LOG_TAG = "[PSDK]::" + MediaPlayerView.class.getSimpleName();
  private static Logger _logger = Log.getLogger(LOG_TAG);
  private MediaPlayer.CustomAdEventListener _customAdEventListener = new MediaPlayerView.1(this);
  private boolean _customAdPlaying;
  private BroadcastReceiver _mReceiver;
  private MediaPlayer.PlaybackEventListener _playbackEventListener = new MediaPlayerView.2(this);
  private VideoEngineAdapter _videoEngineAdapter;
  private VideoEngineDispatcher _videoEngineDispatcher;
  private VideoEngineView _videoEngineView;
  private VideoEngineViewCallback _videoEngineViewCallback;
  private MediaPlayer.PlayerState currentPlayerState;
  private MediaPlayer.PlayerState oldPlayerState;
  
  MediaPlayerView(Context paramContext, VideoEngineAdapter paramVideoEngineAdapter, VideoEngineDispatcher paramVideoEngineDispatcher)
  {
    super(paramContext);
    if (paramVideoEngineAdapter == null) {
      throw new IllegalArgumentException("Video engine adapter parameter must not be null.");
    }
    if (paramVideoEngineDispatcher == null) {
      throw new IllegalArgumentException("Video engine adapter parameter must not be null.");
    }
    _videoEngineAdapter = paramVideoEngineAdapter;
    _videoEngineDispatcher = paramVideoEngineDispatcher;
    initialize(paramContext);
  }
  
  private void initialiseVideoEngineViewCallback(Context paramContext)
  {
    _videoEngineView = new VideoEngineView(paramContext);
    _videoEngineViewCallback = new VideoEngineViewCallback(_videoEngineView);
    addView(_videoEngineView);
  }
  
  private void initialize(Context paramContext)
  {
    initialiseVideoEngineViewCallback(paramContext);
    _videoEngineDispatcher.addEventListener(MediaPlayer.Event.PLAYBACK, _playbackEventListener);
    _videoEngineDispatcher.addEventListener(MediaPlayer.Event.CUSTOM_AD, _customAdEventListener);
    IntentFilter localIntentFilter = new IntentFilter("android.intent.action.SCREEN_ON");
    localIntentFilter.addAction("android.intent.action.SCREEN_OFF");
    _mReceiver = new ScreenReceiver();
    paramContext.registerReceiver(_mReceiver, localIntentFilter);
  }
  
  private void releaseVideoEngineViewCallback()
  {
    if (_videoEngineViewCallback != null)
    {
      _videoEngineViewCallback.release();
      _videoEngineViewCallback = null;
    }
  }
  
  private void restorePlayer()
  {
    if ((_videoEngineViewCallback == null) || (!_videoEngineViewCallback.hasSurface()))
    {
      _logger.w(LOG_TAG + "#restorePlayer", "Unable to restore player. View surface is not created.");
      return;
    }
    _videoEngineAdapter.restorePlayer(oldPlayerState, _customAdPlaying);
  }
  
  private void suspendPlayer()
  {
    if ((_videoEngineAdapter != null) && (_videoEngineAdapter.getPlayerState() == PlayState.SUSPENDED))
    {
      _logger.w(LOG_TAG + "#suspendPlayer", "The player is already suspended.");
      return;
    }
    oldPlayerState = currentPlayerState;
    _videoEngineAdapter.suspendPlayer();
  }
  
  public ViewPropertyAnimator animate()
  {
    if (_videoEngineView != null) {
      return _videoEngineView.animate();
    }
    return super.animate();
  }
  
  public void buildDrawingCache()
  {
    if (_videoEngineView != null) {
      _videoEngineView.buildDrawingCache();
    }
  }
  
  public void buildDrawingCache(boolean paramBoolean)
  {
    if (_videoEngineView != null) {
      _videoEngineView.buildDrawingCache(paramBoolean);
    }
  }
  
  public void clearAnimation()
  {
    if (_videoEngineView != null) {
      _videoEngineView.clearAnimation();
    }
  }
  
  public void destroyDrawingCache()
  {
    if (_videoEngineView != null) {
      _videoEngineView.destroyDrawingCache();
    }
  }
  
  void detachView()
  {
    _logger.i(LOG_TAG + "#detachView", "Detaching view.");
    releaseVideoEngineViewCallback();
    if (_videoEngineDispatcher != null)
    {
      _videoEngineDispatcher.removeEventListener(MediaPlayer.Event.PLAYBACK, _playbackEventListener);
      _videoEngineDispatcher.removeEventListener(MediaPlayer.Event.CUSTOM_AD, _customAdEventListener);
      _videoEngineDispatcher = null;
      _playbackEventListener = null;
    }
    _videoEngineView.getContext().unregisterReceiver(_mReceiver);
    _videoEngineView = null;
  }
  
  public Animation getAnimation()
  {
    if (_videoEngineView != null) {
      return _videoEngineView.getAnimation();
    }
    return super.getAnimation();
  }
  
  public Drawable getBackground()
  {
    if (_videoEngineView != null) {
      return _videoEngineView.getBackground();
    }
    return super.getBackground();
  }
  
  public Bitmap getDrawingCache()
  {
    if (_videoEngineView != null) {
      return _videoEngineView.getDrawingCache();
    }
    return super.getDrawingCache();
  }
  
  public Bitmap getDrawingCache(boolean paramBoolean)
  {
    if (_videoEngineView != null) {
      return _videoEngineView.getDrawingCache(paramBoolean);
    }
    return super.getDrawingCache(paramBoolean);
  }
  
  public int getDrawingCacheBackgroundColor()
  {
    if (_videoEngineView != null) {
      return _videoEngineView.getDrawingCacheBackgroundColor();
    }
    return super.getDrawingCacheBackgroundColor();
  }
  
  public int getDrawingCacheQuality()
  {
    if (_videoEngineView != null) {
      return _videoEngineView.getDrawingCacheQuality();
    }
    return super.getDrawingCacheQuality();
  }
  
  public long getDrawingTime()
  {
    if (_videoEngineView != null) {
      return _videoEngineView.getDrawingTime();
    }
    return super.getDrawingTime();
  }
  
  public boolean getKeepScreenOn()
  {
    if (_videoEngineView != null) {
      return _videoEngineView.getKeepScreenOn();
    }
    return super.getKeepScreenOn();
  }
  
  VideoEngineView getVideoEngineView()
  {
    return _videoEngineView;
  }
  
  public void invalidate()
  {
    if (_videoEngineView != null) {
      _videoEngineView.invalidate();
    }
  }
  
  public void invalidate(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (_videoEngineView != null) {
      _videoEngineView.invalidate(paramInt1, paramInt2, paramInt3, paramInt4);
    }
  }
  
  public void invalidate(Rect paramRect)
  {
    if (_videoEngineView != null) {
      _videoEngineView.invalidate(paramRect);
    }
  }
  
  public void invalidateDrawable(Drawable paramDrawable)
  {
    if (_videoEngineView != null) {
      _videoEngineView.invalidateDrawable(paramDrawable);
    }
  }
  
  public boolean isDrawingCacheEnabled()
  {
    if (_videoEngineView != null) {
      return _videoEngineView.isDrawingCacheEnabled();
    }
    return super.isDrawingCacheEnabled();
  }
  
  public void notifyClick()
  {
    _videoEngineDispatcher.dispatch(AdClickEvent.createAdClickEvent());
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    _videoEngineView.layout(0, 0, super.getWidth(), super.getHeight());
  }
  
  public void refreshDrawableState()
  {
    if (_videoEngineView != null) {
      _videoEngineView.refreshDrawableState();
    }
  }
  
  void resetView()
  {
    updateView(_videoEngineView.getContext());
  }
  
  public void setAnimation(Animation paramAnimation)
  {
    if (_videoEngineView != null) {
      _videoEngineView.setAnimation(paramAnimation);
    }
  }
  
  public void setBackgroundColor(int paramInt)
  {
    if (_videoEngineView != null) {
      _videoEngineView.setBackgroundColor(paramInt);
    }
  }
  
  public void setBackgroundDrawable(Drawable paramDrawable)
  {
    if (_videoEngineView != null) {
      _videoEngineView.setBackgroundDrawable(paramDrawable);
    }
  }
  
  public void setBackgroundResource(int paramInt)
  {
    if (_videoEngineView != null) {
      _videoEngineView.setBackgroundResource(paramInt);
    }
  }
  
  public void setDrawingCacheBackgroundColor(int paramInt)
  {
    if (_videoEngineView != null) {
      _videoEngineView.setDrawingCacheBackgroundColor(paramInt);
    }
  }
  
  public void setDrawingCacheEnabled(boolean paramBoolean)
  {
    if (_videoEngineView != null) {
      _videoEngineView.setDrawingCacheEnabled(paramBoolean);
    }
  }
  
  public void setDrawingCacheQuality(int paramInt)
  {
    if (_videoEngineView != null) {
      _videoEngineView.setDrawingCacheQuality(paramInt);
    }
  }
  
  public void setKeepScreenOn(boolean paramBoolean)
  {
    if (_videoEngineView != null) {
      _videoEngineView.setKeepScreenOn(paramBoolean);
    }
  }
  
  public void setWillNotCacheDrawing(boolean paramBoolean)
  {
    if (_videoEngineView != null) {
      _videoEngineView.setWillNotCacheDrawing(paramBoolean);
    }
  }
  
  public void setWillNotDraw(boolean paramBoolean)
  {
    if (_videoEngineView != null) {
      _videoEngineView.setWillNotDraw(paramBoolean);
    }
  }
  
  public void startAnimation(Animation paramAnimation)
  {
    if (_videoEngineView != null) {
      _videoEngineView.startAnimation(paramAnimation);
    }
  }
  
  void updateVideoEngine(Context paramContext, VideoEngineAdapter paramVideoEngineAdapter)
  {
    _videoEngineAdapter = paramVideoEngineAdapter;
    updateView(paramContext);
  }
  
  void updateView(Context paramContext)
  {
    releaseVideoEngineViewCallback();
    removeView(_videoEngineView);
    _videoEngineView = null;
    initialiseVideoEngineViewCallback(paramContext);
    _videoEngineAdapter.setView(_videoEngineView);
  }
  
  public boolean willNotCacheDrawing()
  {
    if (_videoEngineView != null) {
      return _videoEngineView.willNotCacheDrawing();
    }
    return super.willNotCacheDrawing();
  }
  
  public boolean willNotDraw()
  {
    if (_videoEngineView != null) {
      return _videoEngineView.willNotDraw();
    }
    return super.willNotDraw();
  }
  
  class ScreenReceiver
    extends BroadcastReceiver
  {
    ScreenReceiver() {}
    
    public void onReceive(Context paramContext, Intent paramIntent)
    {
      if (paramIntent.getAction().equals("android.intent.action.SCREEN_OFF"))
      {
        MediaPlayerView._logger.i(MediaPlayerView.LOG_TAG + "::ScreenReceiver#onReceive", "Device screen was turned off.");
        MediaPlayerView.this.suspendPlayer();
      }
      while (!paramIntent.getAction().equals("android.intent.action.SCREEN_ON")) {
        return;
      }
      MediaPlayerView._logger.i(MediaPlayerView.LOG_TAG + "::ScreenReceiver#onReceive", "Device screen was turned on.");
      MediaPlayerView.this.restorePlayer();
    }
  }
  
  private class VideoEngineViewCallback
  {
    private boolean _hasSurface = false;
    private SurfaceHolder _viewHolder;
    private SurfaceHolder.Callback _viewHolderCallback = new MediaPlayerView.VideoEngineViewCallback.1(this);
    
    public VideoEngineViewCallback(SurfaceView paramSurfaceView)
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
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayerView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */