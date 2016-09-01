package com.auditude.ads.view.linear;

import android.content.Context;
import com.auditude.ads.model.IAsset;
import com.auditude.ads.session.IPlaybackSession;
import com.auditude.ads.view.AdPlaybackSession;
import com.auditude.ads.view.AdPlaybackSession.OnAdPlaybackSessionEventListener;
import com.auditude.ads.view.AdPlaybackSession.PlaybackConstants;
import com.auditude.ads.view.AdView;
import com.auditude.ads.view.AdViewEvent.AdViewEventType;
import com.auditude.ads.view.ILinearAdView;
import com.auditude.ads.view.IViewController;
import com.auditude.ads.view.model.AdViewSource;
import com.auditude.ads.view.model.IAdViewSource;
import java.util.HashMap;

public class ExternalVideoView
  extends AdView
  implements AdPlaybackSession.OnAdPlaybackSessionEventListener, ILinearAdView
{
  private static final String DURATION = "duration";
  private static final String POSITION = "position";
  private int duration = 0;
  private int position = 0;
  
  public ExternalVideoView(Context paramContext)
  {
    super(paramContext);
  }
  
  public int getDuration()
  {
    return duration;
  }
  
  public IPlaybackSession getPlaybackSession()
  {
    return super.getPlaybackSession();
  }
  
  public int getPosition()
  {
    return position;
  }
  
  public void hide(IAdViewSource paramIAdViewSource)
  {
    super.hide(paramIAdViewSource);
  }
  
  public void initialize(IViewController paramIViewController)
  {
    super.initialize(paramIViewController);
  }
  
  public void onAdPlaybackSessionEvent(AdPlaybackSession.PlaybackConstants paramPlaybackConstants, AdViewSource paramAdViewSource, AdView paramAdView, HashMap paramHashMap)
  {
    if (paramAdViewSource != null)
    {
      paramAdViewSource = paramAdViewSource.getAsset();
      if (paramAdViewSource != null) {
        break label19;
      }
    }
    label19:
    do
    {
      return;
      paramAdViewSource = null;
      break;
      switch (paramPlaybackConstants)
      {
      case COMPLETE: 
      case ERROR: 
      case SKIP: 
      default: 
        return;
      case CLICK: 
        notifyAdEvent(AdViewEvent.AdViewEventType.AD_START);
        return;
      case PAUSE: 
        notifyAdEvent(AdViewEvent.AdViewEventType.AD_COMPLETE);
        return;
      case NOTIFY: 
        notifyAdEvent(AdViewEvent.AdViewEventType.AD_STOP);
        return;
      case PROGRESS: 
        notifyAdEvent(AdViewEvent.AdViewEventType.AD_ERROR);
        return;
      case RESUME: 
        notifyAdEvent(AdViewEvent.AdViewEventType.AD_CLICK);
        return;
      }
    } while (paramHashMap == null);
    if (paramHashMap.containsKey("position")) {
      position = Integer.parseInt(paramHashMap.get("position").toString());
    }
    if (paramHashMap.containsKey("duration")) {
      duration = Integer.parseInt(paramHashMap.get("duration").toString());
    }
    notifyAdEvent(AdViewEvent.AdViewEventType.AD_PROGRESS);
  }
  
  public final void pause() {}
  
  public void reset()
  {
    super.reset();
  }
  
  public final void resume() {}
  
  public void setPlaybackSession(IPlaybackSession paramIPlaybackSession)
  {
    ((AdPlaybackSession)paramIPlaybackSession).setOnAdPlaybackSessionEventListener(this);
    super.setPlaybackSession(paramIPlaybackSession);
  }
  
  public boolean shouldAddToStage()
  {
    return false;
  }
  
  public boolean shouldNotifyAdBeginOnLoad()
  {
    return true;
  }
  
  public void show(IAdViewSource paramIAdViewSource)
  {
    super.show(paramIAdViewSource);
    duration = paramIAdViewSource.getAsset().getDurationInMillis();
    notifyAdEvent(AdViewEvent.AdViewEventType.AD_LOAD);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.linear.ExternalVideoView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */