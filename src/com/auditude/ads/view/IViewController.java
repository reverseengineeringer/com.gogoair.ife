package com.auditude.ads.view;

import com.auditude.ads.util.event.IEventListener;
import java.util.HashMap;

public abstract interface IViewController
{
  public abstract void addPropertyChangeListener(IEventListener paramIEventListener);
  
  public abstract int getBitRate();
  
  public abstract int getHeight();
  
  public abstract boolean getIsInBreak();
  
  public abstract float getLeftVolume();
  
  public abstract Object getProperty(String paramString);
  
  public abstract float getRightVolume();
  
  public abstract int getWidth();
  
  public abstract boolean hasProperty(String paramString);
  
  public abstract void notifyAdViewEvent(AdViewEvent.AdViewEventType paramAdViewEventType, IAdView paramIAdView, HashMap paramHashMap);
  
  public abstract void pauseMainMedia();
  
  public abstract void removePropertyChangeListener(IEventListener paramIEventListener);
  
  public abstract void resumeMainMedia();
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.IViewController
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */