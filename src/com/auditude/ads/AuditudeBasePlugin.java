package com.auditude.ads;

import android.content.Context;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import com.auditude.ads.event.AdPluginErrorEvent;
import com.auditude.ads.event.AdPluginEvent;
import com.auditude.ads.event.AuditudePluginEventListener;
import com.auditude.ads.loader.IPluginLoader;
import com.auditude.ads.loader.IPluginLoader.PluginLoaderListener;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class AuditudeBasePlugin
  extends FrameLayout
  implements IPluginLoader.PluginLoaderListener
{
  private static final int DEFAULT_TIMEOUT = 5;
  public static final String LOAD_TIME = "loadTime";
  public static final String PLUGIN_INSTANCE = "pluginInstance";
  private static final String USE_SSL = "useSSL";
  private HashMap adProperties = new HashMap();
  private IAuditudeAdUnit adUnit;
  private IPluginLoader adUnitLoader = getLoader();
  private boolean auditudeHandlesChapterBreaks = true;
  private int bitRate = 0;
  private float leftVolume = 1.0F;
  private AuditudePluginEventListener listener;
  private float rightVolume = 1.0F;
  private boolean useSSL = false;
  private String version = "adunit-1.0";
  private int zoneId;
  
  public AuditudeBasePlugin(Context paramContext)
  {
    super(paramContext);
    load();
  }
  
  public static boolean isNullOrEmpty(String paramString)
  {
    return (paramString == null) || (paramString.equals(""));
  }
  
  private void onPluginLoadComplete(Object paramObject)
  {
    if ((paramObject instanceof IAuditudeAdUnit))
    {
      adUnit = ((IAuditudeAdUnit)paramObject);
      if (adUnit != null) {
        addView((ViewGroup)adUnit, new FrameLayout.LayoutParams(-1, -1));
      }
      adUnit.setVolume(leftVolume, rightVolume);
      adUnit.setBitRate(bitRate);
      adUnit.setPublisherVersion(version);
      adUnit.setAuditudeHandlesChapterBreaks(auditudeHandlesChapterBreaks);
      adUnit.setPluginEventListener(listener);
      if (adProperties != null) {
        paramObject = adProperties.entrySet().iterator();
      }
    }
    for (;;)
    {
      if (!((Iterator)paramObject).hasNext())
      {
        return;
        paramObject = null;
        break;
      }
      Map.Entry localEntry = (Map.Entry)((Iterator)paramObject).next();
      adUnit.setProperty(((String)localEntry.getKey()).toString(), localEntry.getValue());
    }
  }
  
  public void cancel()
  {
    if (adUnit != null) {
      adUnit.cancel();
    }
  }
  
  public void dispose()
  {
    if (adUnit != null)
    {
      adUnit.cancel();
      adUnit = null;
    }
    adUnitLoader.cancel();
    adUnitLoader = null;
  }
  
  protected IPluginLoader getLoader()
  {
    return null;
  }
  
  public Object getProperty(String paramString)
  {
    if (adUnit != null) {
      return adUnit.getProperty(paramString);
    }
    if ((adProperties != null) && (!isNullOrEmpty(paramString))) {
      return adProperties.get(paramString);
    }
    return null;
  }
  
  public boolean hasBreak()
  {
    return hasBreak(-1);
  }
  
  public boolean hasBreak(int paramInt)
  {
    if (adUnit != null) {
      adUnit.hasBreak(paramInt);
    }
    return false;
  }
  
  public void init(String paramString, Object paramObject)
  {
    init(paramString, paramObject, null);
  }
  
  public void init(String paramString, Object paramObject, HashMap paramHashMap)
  {
    init(paramString, paramObject, paramHashMap, 5);
  }
  
  public void init(String paramString, Object paramObject, HashMap paramHashMap, int paramInt)
  {
    if (adUnit == null)
    {
      paramString = new RuntimeException("AdUnit library not found");
      if (listener != null) {
        listener.onAdPluginErrorEvent(new AdPluginErrorEvent("initFailed", paramString));
      }
      return;
    }
    adUnit.init(paramString, paramObject, zoneId, paramHashMap, paramInt);
  }
  
  public void load()
  {
    if (adUnit != null) {
      return;
    }
    adUnitLoader.setPluginLoaderListener(this);
    adUnitLoader.load();
  }
  
  public void loadComplete(Object paramObject)
  {
    onPluginLoadComplete(paramObject);
  }
  
  public void loadFailed(Throwable paramThrowable) {}
  
  public void notify(String paramString)
  {
    notify(paramString, null);
  }
  
  public void notify(String paramString, HashMap paramHashMap)
  {
    if (adUnit != null) {
      adUnit.notify(paramString, paramHashMap);
    }
    while ((!"breakBegin".equals(paramString)) || (listener == null)) {
      return;
    }
    listener.onAdPluginEvent(new AdPluginEvent("breakEnd"));
  }
  
  public void setAuditudeHandlesChapterBreaks(boolean paramBoolean)
  {
    auditudeHandlesChapterBreaks = paramBoolean;
    if (adUnit != null) {
      adUnit.setAuditudeHandlesChapterBreaks(paramBoolean);
    }
  }
  
  public void setBitRate(int paramInt)
  {
    bitRate = paramInt;
    if (adUnit != null) {
      adUnit.setBitRate(bitRate);
    }
  }
  
  public void setPluginEventListener(AuditudePluginEventListener paramAuditudePluginEventListener)
  {
    listener = paramAuditudePluginEventListener;
    if (adUnit != null) {
      adUnit.setPluginEventListener(paramAuditudePluginEventListener);
    }
  }
  
  public void setProperty(String paramString, Object paramObject)
  {
    if (adUnit != null) {
      adUnit.setProperty(paramString, paramObject);
    }
    while ((adProperties == null) || (isNullOrEmpty(paramString))) {
      return;
    }
    adProperties.put(paramString, paramObject);
  }
  
  public void setSize(double paramDouble1, double paramDouble2) {}
  
  public void setUseSSL(boolean paramBoolean)
  {
    useSSL = paramBoolean;
    setProperty("useSSL", Boolean.valueOf(useSSL));
  }
  
  public void setVersion(String paramString)
  {
    version = paramString;
  }
  
  public void setVolume(float paramFloat1, float paramFloat2)
  {
    leftVolume = paramFloat1;
    rightVolume = paramFloat2;
    if (adUnit != null) {
      adUnit.setVolume(paramFloat1, paramFloat2);
    }
  }
  
  public void setZoneId(int paramInt)
  {
    zoneId = paramInt;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.AuditudeBasePlugin
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */