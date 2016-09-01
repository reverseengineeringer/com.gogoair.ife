package com.auditude.ads.network.vast.repackaging;

import com.auditude.ads.network.vast.model.VASTLinearCreative;
import com.auditude.ads.network.vast.model.VASTMediaFile;
import com.auditude.ads.network.vast.model.VASTTrackingEvent;
import com.auditude.ads.network.vast.model.VASTTrackingUrl;
import com.auditude.creativerepackaging.AuditudeParameters;
import com.auditude.creativerepackaging.CreativeRepackagingService;
import com.auditude.creativerepackaging.CreativeRepackagingService.CreativeRepackagingServiceListener;
import com.auditude.creativerepackaging.RepackagingParameters;
import java.net.URL;

public class VastAssetRepackager
  implements CreativeRepackagingService.CreativeRepackagingServiceListener
{
  private static final String PLATFORM_HOST = "theplatform.com";
  private static final String PLATFORM_HOST_CREATIVEURL_QUERY_PARAM = "creativeurl";
  private String domain = null;
  private VASTLinearCreative linearAd = null;
  private VastAssetRepackagingCompletionListener listener;
  private String requiredFormat = null;
  private String rootAdId = null;
  private int zoneId = 0;
  
  public VastAssetRepackager(VastAssetRepackagingCompletionListener paramVastAssetRepackagingCompletionListener, VASTLinearCreative paramVASTLinearCreative, String paramString, VastAssetRepackagerInfo paramVastAssetRepackagerInfo)
  {
    listener = paramVastAssetRepackagingCompletionListener;
    linearAd = paramVASTLinearCreative;
    rootAdId = paramString;
    if (paramVastAssetRepackagerInfo != null)
    {
      requiredFormat = requiredFormat;
      domain = domain;
      zoneId = zoneId;
    }
  }
  
  private String creativeUrlForSource(String paramString)
  {
    int i = 0;
    for (;;)
    {
      try
      {
        Object localObject = new URL(paramString);
        if ((((URL)localObject).getHost() != null) && (((URL)localObject).getHost().contains("theplatform.com")) && (((URL)localObject).getQuery() != null))
        {
          localObject = ((URL)localObject).getQuery().split("&");
          if (i >= localObject.length) {
            return paramString;
          }
          String[] arrayOfString = localObject[i].split("=");
          if ((arrayOfString.length < 1) || (arrayOfString[0].compareToIgnoreCase("creativeurl") != 0)) {
            break label107;
          }
          i = arrayOfString.length;
          if (i < 2) {
            return "";
          }
          return arrayOfString[1];
        }
      }
      catch (Exception localException) {}
      return paramString;
      label107:
      i += 1;
    }
  }
  
  public void onError(String paramString)
  {
    if (listener != null) {
      listener.onRepackagingComplete(linearAd, false);
    }
  }
  
  public void onURLAvaliable(String paramString1, String paramString2)
  {
    if (linearAd != null)
    {
      localObject = linearAd.getBestMediaFile();
      if (localObject != null)
      {
        url = paramString1;
        type = requiredFormat;
      }
    }
    Object localObject = linearAd.getTrackingEventByType("creativeview");
    paramString1 = (String)localObject;
    if (localObject == null)
    {
      paramString1 = new VASTTrackingEvent("creativeview");
      linearAd.addTrackingEvent(paramString1);
    }
    paramString1.addTrackingUrl(new VASTTrackingUrl(paramString2, "creativeview"));
    if (listener != null) {
      listener.onRepackagingComplete(linearAd, true);
    }
  }
  
  public void repackage()
  {
    AuditudeParameters localAuditudeParameters = new AuditudeParameters();
    localAuditudeParameters.setZoneId(zoneId);
    localAuditudeParameters.setDomain(domain);
    localAuditudeParameters.setAdId(rootAdId);
    localAuditudeParameters.setExternalAdId(linearAd.adId);
    RepackagingParameters localRepackagingParameters = new RepackagingParameters();
    localRepackagingParameters.setRequiredFormat(requiredFormat);
    VASTMediaFile localVASTMediaFile = null;
    if (linearAd != null) {
      localVASTMediaFile = linearAd.getBestMediaFile();
    }
    if ((localVASTMediaFile != null) && (url != null))
    {
      localRepackagingParameters.setCreativeURL(creativeUrlForSource(url));
      localRepackagingParameters.setVideoHeight(height);
      localRepackagingParameters.setVideoWidth(width);
    }
    while (listener == null)
    {
      new CreativeRepackagingService(localAuditudeParameters, localRepackagingParameters, this);
      return;
    }
    listener.onRepackagingComplete(linearAd, false);
  }
  
  public static abstract interface VastAssetRepackagingCompletionListener
  {
    public abstract void onRepackagingComplete(VASTLinearCreative paramVASTLinearCreative, boolean paramBoolean);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.repackaging.VastAssetRepackager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */