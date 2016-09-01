package com.auditude.ads.network;

import com.auditude.ads.core.APIBridge;
import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.event.AdPluginEvent;
import com.auditude.ads.event.PlayerErrorEvent;
import com.auditude.ads.exception.AssetException;
import com.auditude.ads.model.Ad;
import com.auditude.ads.util.AuditudeUtil;
import com.auditude.ads.util.event.Event;
import com.auditude.ads.util.event.EventDispatcher;
import java.util.HashMap;

public abstract class NetworkAdLoader
  extends EventDispatcher
  implements INetworkAdLoader
{
  public static final String COMPLETE = "complete";
  public static final String ERROR = "error";
  private Ad ad;
  private HashMap customParams;
  private Object result;
  private Object source;
  
  public abstract void cancel();
  
  public final Ad getAd()
  {
    return ad;
  }
  
  public final Object getResult()
  {
    return result;
  }
  
  public final Object getSource()
  {
    if ((source instanceof String))
    {
      String str2 = AuditudeUtil.substituteTags((String)source);
      String str1 = str2;
      if (customParams != null) {
        str1 = AuditudeUtil.substituteCustomPublisherTags(str2, customParams);
      }
      return AuditudeUtil.substituteCustomPublisherTags(str1, AuditudeEnv.getInstance().getAdSettings().getPassThroughParams());
    }
    return source;
  }
  
  public void load() {}
  
  protected final void logError(int paramInt, String paramString)
  {
    paramString = new AssetException(paramInt, paramString);
    if (ad != null) {
      adId = ad.getID();
    }
    AuditudeEnv.getInstance().getAPI().dispatchEvent("playerError", new PlayerErrorEvent(this, paramString));
  }
  
  protected final void notifyComplete()
  {
    dispatchEvent("complete", new Event(this));
  }
  
  protected final void notifyError(AdPluginEvent paramAdPluginEvent)
  {
    dispatchEvent("error", paramAdPluginEvent);
  }
  
  public final void setAd(Ad paramAd)
  {
    ad = paramAd;
  }
  
  public final void setCustomParams(HashMap paramHashMap)
  {
    customParams = paramHashMap;
  }
  
  public final void setResult(Object paramObject)
  {
    result = paramObject;
  }
  
  public final void setSource(Object paramObject)
  {
    source = paramObject;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.NetworkAdLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */