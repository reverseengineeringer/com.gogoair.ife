package com.auditude.ads.view;

import com.auditude.ads.session.IPlaybackSession;
import com.auditude.ads.view.model.IAdViewSource;
import java.util.HashMap;

public abstract interface IAdView
  extends IAuditudeView
{
  public abstract void dispose();
  
  public abstract int getDuration();
  
  public abstract float getLeftVolume();
  
  public abstract IPlaybackSession getPlaybackSession();
  
  public abstract int getPosition();
  
  public abstract float getRightVolume();
  
  public abstract IAdViewSource getSource();
  
  public abstract void hide(IAdViewSource paramIAdViewSource);
  
  public abstract void notifyAdEvent(AdViewEvent.AdViewEventType paramAdViewEventType, HashMap paramHashMap);
  
  public abstract void reset();
  
  public abstract void setPlaybackSession(IPlaybackSession paramIPlaybackSession);
  
  public abstract void setVolume(float paramFloat1, float paramFloat2);
  
  public abstract boolean shouldNotifyAdBeginOnLoad();
  
  public abstract void show(IAdViewSource paramIAdViewSource);
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.IAdView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */