package com.auditude.ads;

import com.auditude.ads.event.AuditudePluginEventListener;
import java.util.HashMap;

public abstract interface IAuditudeAdUnit
{
  public abstract void cancel();
  
  public abstract Object getProperty(String paramString);
  
  public abstract boolean hasBreak();
  
  public abstract boolean hasBreak(int paramInt);
  
  public abstract void init(String paramString, Object paramObject, int paramInt);
  
  public abstract void init(String paramString, Object paramObject, int paramInt, HashMap paramHashMap);
  
  public abstract void init(String paramString, Object paramObject, int paramInt1, HashMap paramHashMap, int paramInt2);
  
  public abstract void notify(String paramString);
  
  public abstract void notify(String paramString, HashMap paramHashMap);
  
  public abstract void setAuditudeHandlesChapterBreaks(boolean paramBoolean);
  
  public abstract void setBitRate(int paramInt);
  
  public abstract void setPluginEventListener(AuditudePluginEventListener paramAuditudePluginEventListener);
  
  public abstract void setProperty(String paramString, Object paramObject);
  
  public abstract void setPublisherVersion(String paramString);
  
  public abstract void setSize(int paramInt1, int paramInt2);
  
  public abstract void setVolume(float paramFloat1, float paramFloat2);
}

/* Location:
 * Qualified Name:     com.auditude.ads.IAuditudeAdUnit
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */