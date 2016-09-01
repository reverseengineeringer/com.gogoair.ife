package com.auditude.ads.view;

import com.auditude.ads.core.APIBridge;
import com.auditude.ads.core.AdSettings;
import com.auditude.ads.util.ObjectUtil;
import com.auditude.ads.util.event.EventDispatcher;
import com.auditude.ads.util.event.IEventListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.HashMap;

public class ViewController
  extends EventDispatcher
  implements IViewController, PropertyChangeListener
{
  public static final String PROPERTY_CHANGE = "propertyChange";
  private APIBridge api;
  private boolean isInBreak = false;
  private AdSettings settings;
  
  public ViewController(APIBridge paramAPIBridge, AdSettings paramAdSettings)
  {
    api = paramAPIBridge;
    settings = paramAdSettings;
    settings.addPropertyChangeListener(this);
  }
  
  public void addPropertyChangeListener(IEventListener paramIEventListener)
  {
    if (paramIEventListener != null) {
      addEventListener("propertyChange", paramIEventListener);
    }
  }
  
  public final void dispose()
  {
    if (settings != null) {
      settings = null;
    }
  }
  
  public final int getBitRate()
  {
    return ((Integer)settings.getProperty("bitrate")).intValue();
  }
  
  public final int getHeight()
  {
    return ObjectUtil.convertToInt(settings.getProperty("height"), 0);
  }
  
  public final boolean getIsInBreak()
  {
    return isInBreak;
  }
  
  public final float getLeftVolume()
  {
    return ObjectUtil.convertToFloat(settings.getProperty("leftVolume"), 0.0F);
  }
  
  public final Object getProperty(String paramString)
  {
    return settings.getProperty(paramString);
  }
  
  public final float getRightVolume()
  {
    return ObjectUtil.convertToFloat(settings.getProperty("rightVolume"), 0.0F);
  }
  
  public final int getWidth()
  {
    return ObjectUtil.convertToInt(settings.getProperty("width"), 0);
  }
  
  public final boolean hasProperty(String paramString)
  {
    return settings.hasProperty(paramString);
  }
  
  public final void init() {}
  
  public final void notifyAdViewEvent(AdViewEvent.AdViewEventType paramAdViewEventType, IAdView paramIAdView, HashMap paramHashMap)
  {
    paramAdViewEventType = new AdViewEvent(this, paramAdViewEventType, paramIAdView.getSource(), paramIAdView, paramHashMap);
    api.dispatchEvent("adViewEvent", paramAdViewEventType);
  }
  
  public final void pauseMainMedia()
  {
    api.pauseMainMedia(null);
  }
  
  public void propertyChange(PropertyChangeEvent paramPropertyChangeEvent)
  {
    dispatchEvent("propertyChange", paramPropertyChangeEvent);
  }
  
  public void removePropertyChangeListener(IEventListener paramIEventListener)
  {
    removeEventListener("propertyChange", paramIEventListener);
  }
  
  public final void resumeMainMedia()
  {
    api.resumeMainMedia(null);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.ViewController
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */