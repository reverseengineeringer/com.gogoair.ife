package com.auditude.ads;

import com.auditude.ads.core.APIBridge;
import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.event.AdClickThroughEvent;
import com.auditude.ads.event.AdPluginErrorEvent;
import com.auditude.ads.event.AdPluginEvent;
import com.auditude.ads.event.AdProgressEvent;
import com.auditude.ads.event.AuditudePluginEventListener;
import com.auditude.ads.event.LinearAdEvent;
import com.auditude.ads.event.NonLinearAdEvent;
import com.auditude.ads.event.OnPageEvent;
import com.auditude.ads.event.PlayerErrorEvent;
import com.auditude.ads.exception.AssetException;
import com.auditude.ads.loader.AdRequest;
import com.auditude.ads.reporting.ReportingHelper;
import com.auditude.ads.response.AdResponse;
import com.auditude.ads.response.AdResponse.AdResponseListener;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.event.IEventListener;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

public class AuditudeAdUnitDelegate
  implements AdResponse.AdResponseListener, IEventListener
{
  private static final int MIN_INIT_REQUEST_INTERVAL = 1000;
  private AdRequest adRequest;
  private AdResponse adResponse;
  private AdResponse.AdResponseListener adResponseListener;
  private AdSettings adSettings;
  private APIBridge apiBridge;
  private long creationTime = 0L;
  private Throwable error;
  private AuditudePluginEventListener listener;
  private ReportingHelper reporting;
  
  public AuditudeAdUnitDelegate()
  {
    AuditudeEnv.setEnvironment(new AuditudeEnv());
    apiBridge = new APIBridge();
    reporting = new ReportingHelper(apiBridge);
    adSettings = new AdSettings();
    apiBridge.addEventListener("apiEvent", this, 100);
    AuditudeEnv.getInstance().init(apiBridge, reporting, adSettings);
  }
  
  private void reset()
  {
    if (adResponse != null) {
      adResponse.cancel();
    }
  }
  
  public final void cancel()
  {
    reset();
  }
  
  public final void dispose()
  {
    cancel();
  }
  
  final APIBridge getAPIBridge()
  {
    return apiBridge;
  }
  
  public final AdResponse getAdResponse()
  {
    return adResponse;
  }
  
  final AdSettings getAdSettings()
  {
    return adSettings;
  }
  
  public final Object getProperty(String paramString)
  {
    return adSettings.getProperty(paramString);
  }
  
  public final ReportingHelper getReportingEngine()
  {
    return reporting;
  }
  
  public final void init(String paramString, Object paramObject, int paramInt1, HashMap paramHashMap, int paramInt2)
  {
    reset();
    if (StringUtil.isNullOrEmpty(paramString))
    {
      apiBridge.dispatchEvent("apiEvent", new AdPluginErrorEvent("initFailed", new RuntimeException("invalid domain")));
      return;
    }
    if (paramObject == null)
    {
      apiBridge.dispatchEvent("apiEvent", new AdPluginErrorEvent("initFailed", new RuntimeException("invalid media id")));
      return;
    }
    if (paramInt1 <= 0)
    {
      apiBridge.dispatchEvent("apiEvent", new AdPluginErrorEvent("initFailed", new RuntimeException("invalid zone")));
      return;
    }
    adSettings.setDomain(paramString);
    adSettings.setZoneId(paramInt1);
    adSettings.setCustomParams(paramHashMap);
    if (adRequest != null) {
      adRequest = null;
    }
    adRequest = new AdRequest(paramObject, paramInt1, paramString, paramHashMap, paramInt2);
    paramObject = adRequest;
    if (adSettings.hasProperty("useSSL")) {}
    long l;
    for (paramString = adSettings.getProperty("useSSL").toString();; paramString = "false")
    {
      ((AdRequest)paramObject).setUseSSL(Boolean.getBoolean(paramString));
      l = new Date().getTime();
      if (l - creationTime >= 1000L) {
        break;
      }
      error = new RuntimeException("Ad Requested too soon. Requests must be at least 1000ms apart.");
      onRequestFailed(error);
      return;
    }
    creationTime = l;
    adResponse = new AdResponse(adSettings);
    adResponse.setAdResponseListener(this);
    adResponse.loadAdRequest(adRequest, paramInt2);
  }
  
  final void logError(int paramInt, String paramString)
  {
    paramString = new AssetException(paramInt, paramString);
    AuditudeEnv.getInstance().getAPI().dispatchEvent("playerError", new PlayerErrorEvent(null, paramString));
  }
  
  public final void notify(String paramString)
  {
    notify(paramString, null);
  }
  
  public final void notify(String paramString, HashMap paramHashMap)
  {
    if ("breakBegin".equalsIgnoreCase(paramString)) {
      apiBridge.breakEnd(null);
    }
  }
  
  public void onEvent(String paramString, Object paramObject)
  {
    if ((listener == null) || (paramString == null) || (!paramString.equalsIgnoreCase("apiEvent")) || (!(paramObject instanceof AdPluginEvent))) {
      return;
    }
    if ((paramObject instanceof AdPluginErrorEvent))
    {
      listener.onAdPluginErrorEvent((AdPluginErrorEvent)paramObject);
      return;
    }
    if ((paramObject instanceof LinearAdEvent))
    {
      listener.onLinearAdEvent((LinearAdEvent)paramObject);
      return;
    }
    if ((paramObject instanceof NonLinearAdEvent))
    {
      listener.onNonLinearAdEvent((NonLinearAdEvent)paramObject);
      return;
    }
    if ((paramObject instanceof OnPageEvent))
    {
      listener.onOnPageAdEvent((OnPageEvent)paramObject);
      return;
    }
    if ((paramObject instanceof AdProgressEvent))
    {
      listener.onAdProgressEvent((AdProgressEvent)paramObject);
      return;
    }
    if ((paramObject instanceof AdClickThroughEvent))
    {
      listener.onAdClickEvent((AdClickThroughEvent)paramObject);
      return;
    }
    if ((paramObject instanceof AdPluginErrorEvent))
    {
      listener.onAdPluginErrorEvent((AdPluginErrorEvent)paramObject);
      return;
    }
    listener.onAdPluginEvent((AdPluginEvent)paramObject);
  }
  
  public void onRequestComplete(ArrayList paramArrayList)
  {
    if (adResponseListener != null) {
      adResponseListener.onRequestComplete(paramArrayList);
    }
    reporting.init();
    HashMap localHashMap1 = new HashMap();
    ArrayList localArrayList;
    if (adResponse != null)
    {
      reporting.setSubmissions(adResponse.getSubmissions());
      localHashMap1.put("breaks", adResponse.GetBreakData());
      localArrayList = new ArrayList();
      paramArrayList = paramArrayList.iterator();
    }
    for (;;)
    {
      if (!paramArrayList.hasNext())
      {
        localHashMap1.put("errors", localArrayList);
        apiBridge.dispatchEvent("apiEvent", new AdPluginEvent("initComplete", localHashMap1));
        return;
      }
      AssetException localAssetException = (AssetException)paramArrayList.next();
      if (localAssetException != null)
      {
        HashMap localHashMap2 = new HashMap();
        localHashMap2.put("AdId", adId);
        localHashMap2.put("InternalErrorId", Integer.valueOf(id));
        localHashMap2.put("Description", localAssetException.getMessage());
        localArrayList.add(localHashMap2);
      }
    }
  }
  
  public void onRequestFailed(Throwable paramThrowable)
  {
    if (adResponseListener != null) {
      adResponseListener.onRequestFailed(paramThrowable);
    }
    reporting.init();
    if (adResponse != null) {
      reporting.setSubmissions(adResponse.getSubmissions());
    }
    apiBridge.dispatchEvent("apiEvent", new AdPluginErrorEvent("initFailed", paramThrowable));
    if ((paramThrowable instanceof SocketTimeoutException)) {
      logError(1100, "");
    }
    for (;;)
    {
      adResponse = null;
      return;
      logError(1101, "");
    }
  }
  
  public void setAdResponseListener(AdResponse.AdResponseListener paramAdResponseListener)
  {
    adResponseListener = paramAdResponseListener;
  }
  
  public final void setAuditudeHandlesChapterBreaks(boolean paramBoolean)
  {
    adSettings.setProperty("auditudeHandlesChapterBreaks", Boolean.valueOf(paramBoolean));
  }
  
  public final void setBitRate(int paramInt)
  {
    adSettings.setBitRate(paramInt);
  }
  
  public void setPluginEventListener(AuditudePluginEventListener paramAuditudePluginEventListener)
  {
    listener = paramAuditudePluginEventListener;
  }
  
  public final void setProperty(String paramString, Object paramObject)
  {
    adSettings.setProperty(paramString, paramObject);
  }
  
  public final void setPublisherVersion(String paramString)
  {
    adSettings.setPublisherVersion(paramString);
  }
  
  public final void setSize(double paramDouble1, double paramDouble2)
  {
    adSettings.setWidth(paramDouble1);
    adSettings.setHeight(paramDouble2);
  }
  
  public void setSize(int paramInt1, int paramInt2) {}
  
  public final void setVolume(float paramFloat1, float paramFloat2)
  {
    adSettings.setVolume(paramFloat1, paramFloat2);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.AuditudeAdUnitDelegate
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */