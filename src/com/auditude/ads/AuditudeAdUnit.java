package com.auditude.ads;

import android.content.Context;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import com.auditude.ads.event.AuditudePluginEventListener;
import com.auditude.ads.response.AdResponse.AdResponseListener;
import com.auditude.ads.session.AdExperienceController;
import java.util.ArrayList;
import java.util.HashMap;

public class AuditudeAdUnit
  extends FrameLayout
  implements IAuditudeAdUnit, AdResponse.AdResponseListener
{
  private static final int DEFAULT_TIMEOUT = 8;
  private AuditudeAdUnitDelegate adUnit;
  private AdExperienceController experienceController;
  
  public AuditudeAdUnit(Context paramContext)
  {
    super(paramContext);
    setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
    adUnit = new AuditudeAdUnitDelegate();
    adUnit.setAdResponseListener(this);
    setProperty("applicationContext", paramContext);
  }
  
  private void reset()
  {
    if (experienceController != null)
    {
      experienceController.dispose();
      experienceController = null;
    }
  }
  
  public final void cancel()
  {
    reset();
    adUnit.cancel();
  }
  
  public final void dispose()
  {
    adUnit.dispose();
  }
  
  public final Object getProperty(String paramString)
  {
    return adUnit.getProperty(paramString);
  }
  
  public final boolean hasBreak()
  {
    return hasBreak(-1);
  }
  
  public final boolean hasBreak(int paramInt)
  {
    if (experienceController != null) {
      return experienceController.HasBreak(paramInt);
    }
    return false;
  }
  
  public final void init(String paramString, Object paramObject, int paramInt)
  {
    init(paramString, paramObject, paramInt, null);
  }
  
  public final void init(String paramString, Object paramObject, int paramInt, HashMap paramHashMap)
  {
    init(paramString, paramObject, paramInt, paramHashMap, 8);
  }
  
  public final void init(String paramString, Object paramObject, int paramInt1, HashMap paramHashMap, int paramInt2)
  {
    reset();
    adUnit.init(paramString, paramObject, paramInt1, paramHashMap, paramInt2);
  }
  
  protected final void logError(int paramInt, String paramString)
  {
    adUnit.logError(paramInt, paramString);
  }
  
  public final void notify(String paramString)
  {
    notify(paramString, null);
  }
  
  public final void notify(String paramString, HashMap paramHashMap)
  {
    if (experienceController != null)
    {
      experienceController.notify(paramString, paramHashMap);
      return;
    }
    adUnit.notify(paramString, paramHashMap);
  }
  
  public void onRequestComplete(ArrayList paramArrayList)
  {
    experienceController = new AdExperienceController(adUnit.getAdResponse(), adUnit.getAPIBridge(), adUnit.getAdSettings(), this);
  }
  
  public void onRequestFailed(Throwable paramThrowable) {}
  
  public final void setAuditudeHandlesChapterBreaks(boolean paramBoolean)
  {
    adUnit.setAuditudeHandlesChapterBreaks(paramBoolean);
  }
  
  public final void setBitRate(int paramInt)
  {
    adUnit.setBitRate(paramInt);
  }
  
  public void setPluginEventListener(AuditudePluginEventListener paramAuditudePluginEventListener)
  {
    adUnit.setPluginEventListener(paramAuditudePluginEventListener);
  }
  
  public final void setProperty(String paramString, Object paramObject)
  {
    adUnit.setProperty(paramString, paramObject);
  }
  
  public final void setPublisherVersion(String paramString)
  {
    adUnit.setPublisherVersion(paramString);
  }
  
  public final void setSize(double paramDouble1, double paramDouble2)
  {
    adUnit.setSize(paramDouble1, paramDouble2);
  }
  
  public void setSize(int paramInt1, int paramInt2) {}
  
  public final void setVolume(float paramFloat1, float paramFloat2)
  {
    adUnit.setVolume(paramFloat1, paramFloat2);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.AuditudeAdUnit
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */