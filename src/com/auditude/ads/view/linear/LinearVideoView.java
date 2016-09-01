package com.auditude.ads.view.linear;

import android.content.Context;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.os.Handler;
import android.widget.FrameLayout.LayoutParams;
import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.model.IAsset;
import com.auditude.ads.model.LinearAsset;
import com.auditude.ads.model.media.MediaFile;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.log.ILogger;
import com.auditude.ads.util.log.Log;
import com.auditude.ads.view.AdView;
import com.auditude.ads.view.AdViewEvent.AdViewEventType;
import com.auditude.ads.view.ILinearAdView;
import com.auditude.ads.view.IViewController;
import com.auditude.ads.view.model.IAdViewSource;

public class LinearVideoView
  extends AdView
  implements MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener, MediaPlayer.OnPreparedListener, ILinearAdView
{
  private static final String CATEGORY = "LinearVideoView";
  private static final int UPDATE_FREQUENCY = 500;
  private boolean isVideoReadyToBePlayed = false;
  private MediaPlayer player;
  private final Handler positionHandler = new Handler();
  private final Runnable updatePositionRunnable = new LinearVideoView.1(this);
  private VideoView videoView;
  
  public LinearVideoView(Context paramContext)
  {
    super(paramContext);
    setBackgroundColor(-16777216);
    videoView = new VideoView(paramContext);
    addView(videoView, new FrameLayout.LayoutParams(-1, -1, 17));
    videoView.setOnErrorListener(this);
    videoView.setOnPreparedListener(this);
    videoView.setOnCompletionListener(this);
  }
  
  private void close()
  {
    try
    {
      positionHandler.removeCallbacks(updatePositionRunnable);
      stopVideoPlayback();
      isVideoReadyToBePlayed = false;
      player = null;
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  private void notifyError()
  {
    notifyError(null);
  }
  
  private void notifyError(String paramString)
  {
    Log.getLogger("LinearVideoView").info("--> LinearVideoView onError" + paramString);
    notifyAdEvent(AdViewEvent.AdViewEventType.AD_ERROR);
  }
  
  private void startVideoPlayback()
  {
    try
    {
      notifyAdEvent(AdViewEvent.AdViewEventType.AD_START);
      Log.getLogger("LinearVideoView").info("--> LinearVideoView startVideoPlayback");
      if (player != null) {
        player.setVolume(getController().getLeftVolume(), getController().getRightVolume());
      }
      videoView.start();
      videoView.invalidate();
      updatePosition();
      return;
    }
    catch (Exception localException)
    {
      notifyAdEvent(AdViewEvent.AdViewEventType.AD_ERROR);
    }
  }
  
  private void stopVideoPlayback()
  {
    if (player != null)
    {
      Log.getLogger("LinearVideoView").info("--> LinearVideoView stopVideoPlayback");
      videoView.stopPlayback();
    }
  }
  
  private void updatePosition()
  {
    positionHandler.removeCallbacks(updatePositionRunnable);
    notifyAdEvent(AdViewEvent.AdViewEventType.AD_PROGRESS);
    videoView.invalidate();
    positionHandler.postDelayed(updatePositionRunnable, 500L);
  }
  
  public void dispose()
  {
    close();
    if (videoView != null)
    {
      if (indexOfChild(videoView) >= 0) {
        removeView(videoView);
      }
      player = null;
    }
    super.dispose();
  }
  
  public int getDuration()
  {
    return videoView.getDuration();
  }
  
  public int getPosition()
  {
    return videoView.getCurrentPosition();
  }
  
  public void hide(IAdViewSource paramIAdViewSource)
  {
    close();
    super.hide(paramIAdViewSource);
  }
  
  public void initialize(IViewController paramIViewController)
  {
    super.initialize(paramIViewController);
  }
  
  public void onCompletion(MediaPlayer paramMediaPlayer)
  {
    Log.getLogger("LinearVideoView").info("--> LinearVideoView onCompletion");
    notifyAdEvent(AdViewEvent.AdViewEventType.AD_COMPLETE);
  }
  
  public boolean onError(MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2)
  {
    switch (paramInt1)
    {
    default: 
      notifyError("Unknown error");
      return false;
    case 1: 
      notifyError("Unable to play media");
      return false;
    case 100: 
      notifyError("Server failed");
      return false;
    }
    notifyError("Invalid media");
    return false;
  }
  
  public void onPrepared(MediaPlayer paramMediaPlayer)
  {
    Log.getLogger("LinearVideoView").info("--> LinearVideoView OnPrepared");
    isVideoReadyToBePlayed = true;
    player = paramMediaPlayer;
    if (isVideoReadyToBePlayed) {
      startVideoPlayback();
    }
  }
  
  public final void pause()
  {
    try
    {
      videoView.pause();
      return;
    }
    catch (IllegalStateException localIllegalStateException) {}
  }
  
  public void reset()
  {
    super.reset();
    close();
  }
  
  protected void resize(int paramInt1, int paramInt2)
  {
    super.resize(paramInt1, paramInt2);
  }
  
  public final void resume()
  {
    try
    {
      videoView.start();
      return;
    }
    catch (IllegalStateException localIllegalStateException) {}
  }
  
  public void setVolume(float paramFloat1, float paramFloat2)
  {
    if (player != null) {
      player.setVolume(paramFloat1, paramFloat2);
    }
  }
  
  public void show(IAdViewSource paramIAdViewSource)
  {
    super.show(paramIAdViewSource);
    AdSettings localAdSettings = AuditudeEnv.getInstance().getAdSettings();
    boolean bool = false;
    if (localAdSettings.getProperty("repackageCreativeEnabled") != null) {
      bool = Boolean.valueOf(localAdSettings.getProperty("repackageCreativeEnabled").toString()).booleanValue();
    }
    String str = "";
    if (localAdSettings.getProperty("repackageCreativeFormat") != null) {
      str = localAdSettings.getProperty("repackageCreativeFormat").toString();
    }
    if ((StringUtil.isNotNullOrEmpty(str)) && (bool))
    {
      if ((getAsset() == null) || (!(paramIAdViewSource.getAsset() instanceof LinearAsset))) {
        break label171;
      }
      paramIAdViewSource = getAssetgetBestMediaFilesource;
    }
    for (;;)
    {
      if (paramIAdViewSource == null)
      {
        notifyError();
        return;
        if (getAsset() != null) {
          paramIAdViewSource = getAsset().getUrl();
        }
      }
      else
      {
        try
        {
          videoView.setVideoPath(paramIAdViewSource);
          return;
        }
        catch (IllegalArgumentException paramIAdViewSource)
        {
          paramIAdViewSource.printStackTrace();
          return;
        }
        catch (SecurityException paramIAdViewSource)
        {
          paramIAdViewSource.printStackTrace();
          return;
        }
        catch (IllegalStateException paramIAdViewSource)
        {
          paramIAdViewSource.printStackTrace();
          return;
        }
      }
      label171:
      paramIAdViewSource = null;
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.linear.LinearVideoView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */