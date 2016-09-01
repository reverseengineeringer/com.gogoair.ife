package com.auditude.ads.view.linear;

import android.content.Context;
import android.content.Intent;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnBufferingUpdateListener;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.media.MediaPlayer.OnVideoSizeChangedListener;
import android.net.Uri;
import android.util.AttributeSet;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.SurfaceView;
import android.view.View;
import android.view.View.MeasureSpec;
import android.widget.MediaController;
import android.widget.MediaController.MediaPlayerControl;
import java.io.IOException;
import java.util.Map;

public class VideoView
  extends SurfaceView
  implements MediaController.MediaPlayerControl
{
  private static final int STATE_ERROR = -1;
  private static final int STATE_IDLE = 0;
  private static final int STATE_PAUSED = 4;
  private static final int STATE_PLAYBACK_COMPLETED = 5;
  private static final int STATE_PLAYING = 3;
  private static final int STATE_PREPARED = 2;
  private static final int STATE_PREPARING = 1;
  private String TAG = "VideoView";
  private MediaPlayer.OnBufferingUpdateListener mBufferingUpdateListener = new VideoView.5(this);
  private boolean mCanPause;
  private boolean mCanSeekBack;
  private boolean mCanSeekForward;
  private MediaPlayer.OnCompletionListener mCompletionListener = new VideoView.3(this);
  private int mCurrentBufferPercentage;
  private int mCurrentState = 0;
  private int mDuration;
  private MediaPlayer.OnErrorListener mErrorListener = new VideoView.4(this);
  private MediaController mMediaController;
  private MediaPlayer mMediaPlayer = null;
  private MediaPlayer.OnCompletionListener mOnCompletionListener;
  private MediaPlayer.OnErrorListener mOnErrorListener;
  private MediaPlayer.OnPreparedListener mOnPreparedListener;
  MediaPlayer.OnPreparedListener mPreparedListener = new VideoView.2(this);
  SurfaceHolder.Callback mSHCallback = new VideoView.6(this);
  private int mSeekWhenPrepared;
  MediaPlayer.OnVideoSizeChangedListener mSizeChangedListener = new VideoView.1(this);
  private int mSurfaceHeight;
  private SurfaceHolder mSurfaceHolder = null;
  private int mSurfaceWidth;
  private int mTargetState = 0;
  private Uri mUri;
  private int mVideoHeight;
  private int mVideoWidth;
  
  public VideoView(Context paramContext)
  {
    super(paramContext);
    initVideoView();
  }
  
  public VideoView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
    initVideoView();
  }
  
  public VideoView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    initVideoView();
  }
  
  private void attachMediaController()
  {
    if ((mMediaPlayer != null) && (mMediaController != null))
    {
      mMediaController.setMediaPlayer(this);
      if (!(getParent() instanceof View)) {
        break label60;
      }
    }
    label60:
    for (Object localObject = (View)getParent();; localObject = this)
    {
      mMediaController.setAnchorView((View)localObject);
      mMediaController.setEnabled(isInPlaybackState());
      return;
    }
  }
  
  private void initVideoView()
  {
    mVideoWidth = 0;
    mVideoHeight = 0;
    getHolder().addCallback(mSHCallback);
    getHolder().setType(3);
    setFocusable(true);
    setFocusableInTouchMode(true);
    requestFocus();
    mCurrentState = 0;
    mTargetState = 0;
    setZOrderOnTop(true);
    setZOrderMediaOverlay(true);
  }
  
  private boolean isInPlaybackState()
  {
    return (mMediaPlayer != null) && (mCurrentState != -1) && (mCurrentState != 0) && (mCurrentState != 1);
  }
  
  private void openVideo()
  {
    if ((mUri == null) || (mSurfaceHolder == null)) {
      return;
    }
    new Intent("com.android.music.musicservicecommand").putExtra("command", "pause");
    release(false);
    try
    {
      mMediaPlayer = new MediaPlayer();
      mMediaPlayer.setOnPreparedListener(mPreparedListener);
      mMediaPlayer.setOnVideoSizeChangedListener(mSizeChangedListener);
      mDuration = -1;
      mMediaPlayer.setOnCompletionListener(mCompletionListener);
      mMediaPlayer.setOnErrorListener(mErrorListener);
      mMediaPlayer.setOnBufferingUpdateListener(mBufferingUpdateListener);
      mCurrentBufferPercentage = 0;
      mMediaPlayer.setDataSource(getContext(), mUri);
      mMediaPlayer.setDisplay(mSurfaceHolder);
      mMediaPlayer.setAudioStreamType(3);
      mMediaPlayer.setScreenOnWhilePlaying(true);
      mMediaPlayer.prepareAsync();
      mCurrentState = 1;
      attachMediaController();
      return;
    }
    catch (IOException localIOException)
    {
      Log.w(TAG, "Unable to open content: " + mUri, localIOException);
      mCurrentState = -1;
      mTargetState = -1;
      mErrorListener.onError(mMediaPlayer, 1, 0);
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      Log.w(TAG, "Unable to open content: " + mUri, localIllegalArgumentException);
      mCurrentState = -1;
      mTargetState = -1;
      mErrorListener.onError(mMediaPlayer, 1, 0);
    }
  }
  
  private void release(boolean paramBoolean)
  {
    if (mMediaPlayer != null)
    {
      mMediaPlayer.reset();
      mMediaPlayer.release();
      mMediaPlayer = null;
      mCurrentState = 0;
      if (paramBoolean) {
        mTargetState = 0;
      }
    }
  }
  
  private void toggleMediaControlsVisiblity()
  {
    if (mMediaController.isShowing())
    {
      mMediaController.hide();
      return;
    }
    mMediaController.show();
  }
  
  public boolean canPause()
  {
    return mCanPause;
  }
  
  public boolean canSeekBackward()
  {
    return mCanSeekBack;
  }
  
  public boolean canSeekForward()
  {
    return mCanSeekForward;
  }
  
  public int getAudioSessionId()
  {
    return 0;
  }
  
  public int getBufferPercentage()
  {
    if (mMediaPlayer != null) {
      return mCurrentBufferPercentage;
    }
    return 0;
  }
  
  public int getCurrentPosition()
  {
    if (isInPlaybackState()) {
      return mMediaPlayer.getCurrentPosition();
    }
    return 0;
  }
  
  public int getDuration()
  {
    if (isInPlaybackState())
    {
      if (mDuration > 0) {
        return mDuration;
      }
      mDuration = mMediaPlayer.getDuration();
      return mDuration;
    }
    mDuration = -1;
    return mDuration;
  }
  
  public boolean isPlaying()
  {
    return (isInPlaybackState()) && (mMediaPlayer.isPlaying());
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    int i;
    if ((paramInt != 4) && (paramInt != 24) && (paramInt != 25) && (paramInt != 82) && (paramInt != 5) && (paramInt != 6))
    {
      i = 1;
      if ((!isInPlaybackState()) || (i == 0) || (mMediaController == null)) {
        break label140;
      }
      if ((paramInt != 79) && (paramInt != 85)) {
        break label107;
      }
      if (!mMediaPlayer.isPlaying()) {
        break label94;
      }
      pause();
      mMediaController.show();
    }
    label94:
    label107:
    do
    {
      return true;
      i = 0;
      break;
      start();
      mMediaController.hide();
      return true;
      if (paramInt != 86) {
        break label136;
      }
    } while (!mMediaPlayer.isPlaying());
    pause();
    mMediaController.show();
    return true;
    label136:
    toggleMediaControlsVisiblity();
    label140:
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i = getDefaultSize(mVideoWidth, paramInt1);
    int j = getDefaultSize(mVideoHeight, paramInt2);
    paramInt1 = j;
    paramInt2 = i;
    if (mVideoWidth > 0)
    {
      paramInt1 = j;
      paramInt2 = i;
      if (mVideoHeight > 0)
      {
        if (mVideoWidth * j <= mVideoHeight * i) {
          break label80;
        }
        paramInt1 = mVideoHeight * i / mVideoWidth;
        paramInt2 = i;
      }
    }
    for (;;)
    {
      setMeasuredDimension(paramInt2, paramInt1);
      return;
      label80:
      paramInt1 = j;
      paramInt2 = i;
      if (mVideoWidth * j < mVideoHeight * i)
      {
        paramInt2 = mVideoWidth * j / mVideoHeight;
        paramInt1 = j;
      }
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if ((isInPlaybackState()) && (mMediaController != null)) {
      toggleMediaControlsVisiblity();
    }
    return false;
  }
  
  public boolean onTrackballEvent(MotionEvent paramMotionEvent)
  {
    if ((isInPlaybackState()) && (mMediaController != null)) {
      toggleMediaControlsVisiblity();
    }
    return false;
  }
  
  public void pause()
  {
    if ((isInPlaybackState()) && (mMediaPlayer.isPlaying()))
    {
      mMediaPlayer.pause();
      mCurrentState = 4;
    }
    mTargetState = 4;
  }
  
  public int resolveAdjustedSize(int paramInt1, int paramInt2)
  {
    int i = View.MeasureSpec.getMode(paramInt2);
    paramInt2 = View.MeasureSpec.getSize(paramInt2);
    switch (i)
    {
    case 0: 
    default: 
      return paramInt1;
    case -2147483648: 
      return Math.min(paramInt1, paramInt2);
    }
    return paramInt2;
  }
  
  public void resume()
  {
    openVideo();
  }
  
  public void seekTo(int paramInt)
  {
    if (isInPlaybackState())
    {
      mMediaPlayer.seekTo(paramInt);
      mSeekWhenPrepared = 0;
      return;
    }
    mSeekWhenPrepared = paramInt;
  }
  
  public void setMediaController(MediaController paramMediaController)
  {
    if (mMediaController != null) {
      mMediaController.hide();
    }
    mMediaController = paramMediaController;
    attachMediaController();
  }
  
  public void setOnCompletionListener(MediaPlayer.OnCompletionListener paramOnCompletionListener)
  {
    mOnCompletionListener = paramOnCompletionListener;
  }
  
  public void setOnErrorListener(MediaPlayer.OnErrorListener paramOnErrorListener)
  {
    mOnErrorListener = paramOnErrorListener;
  }
  
  public void setOnPreparedListener(MediaPlayer.OnPreparedListener paramOnPreparedListener)
  {
    mOnPreparedListener = paramOnPreparedListener;
  }
  
  public void setVideoPath(String paramString)
  {
    setVideoURI(Uri.parse(paramString));
  }
  
  public void setVideoURI(Uri paramUri)
  {
    setVideoURI(paramUri, null);
  }
  
  public void setVideoURI(Uri paramUri, Map paramMap)
  {
    mUri = paramUri;
    mSeekWhenPrepared = 0;
    openVideo();
    requestLayout();
    invalidate();
  }
  
  public void start()
  {
    if (isInPlaybackState())
    {
      mMediaPlayer.start();
      mCurrentState = 3;
    }
    mTargetState = 3;
  }
  
  public void stopPlayback()
  {
    if (mMediaPlayer != null)
    {
      mMediaPlayer.stop();
      mMediaPlayer.release();
      mMediaPlayer = null;
      mCurrentState = 0;
      mTargetState = 0;
    }
  }
  
  public void suspend()
  {
    release(false);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.linear.VideoView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */