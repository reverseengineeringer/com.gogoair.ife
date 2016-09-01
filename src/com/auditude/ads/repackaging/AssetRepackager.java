package com.auditude.ads.repackaging;

import com.auditude.ads.model.Asset;
import com.auditude.ads.model.BaseElement;
import com.auditude.ads.model.media.MediaFile;
import com.auditude.ads.model.tracking.TrackingUrl;
import com.auditude.creativerepackaging.AuditudeParameters;
import com.auditude.creativerepackaging.CreativeRepackagingService;
import com.auditude.creativerepackaging.CreativeRepackagingService.CreativeRepackagingServiceListener;
import com.auditude.creativerepackaging.RepackagingParameters;
import java.net.URL;
import java.util.ArrayList;

public class AssetRepackager
  implements CreativeRepackagingService.CreativeRepackagingServiceListener
{
  private static final String EMPTY_EXTERNAL_AD_ID = "0";
  private static final String PLATFORM_HOST = "theplatform.com";
  private static final String PLATFORM_HOST_CREATIVEURL_QUERY_PARAM = "creativeurl";
  private Asset asset;
  private String domain;
  private AssetRepackagingCompletionListener listener;
  private String requiredFormat;
  private int zoneId;
  
  public AssetRepackager(AssetRepackagingCompletionListener paramAssetRepackagingCompletionListener, Asset paramAsset, String paramString1, String paramString2, int paramInt)
  {
    asset = paramAsset;
    requiredFormat = paramString1;
    domain = paramString2;
    zoneId = paramInt;
    listener = paramAssetRepackagingCompletionListener;
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
      listener.onRepackagingComplete(asset, false);
    }
  }
  
  public void onURLAvaliable(String paramString1, String paramString2)
  {
    MediaFile localMediaFile2 = asset.getBestMediaFile();
    MediaFile localMediaFile1 = localMediaFile2;
    if (localMediaFile2 == null)
    {
      localMediaFile1 = localMediaFile2;
      if (asset.getMediaFiles().size() > 0) {
        localMediaFile1 = asset.getMediaFile();
      }
    }
    if (localMediaFile1 != null)
    {
      source = paramString1;
      mimeType = requiredFormat;
    }
    paramString1 = new TrackingUrl(paramString2, "creativeview");
    asset.addTrackingUrlForType(paramString1, "creativeview");
    if (listener != null) {
      listener.onRepackagingComplete(asset, true);
    }
  }
  
  public void repackage()
  {
    AuditudeParameters localAuditudeParameters = new AuditudeParameters();
    localAuditudeParameters.setZoneId(zoneId);
    localAuditudeParameters.setAdId(asset.getParent().getID());
    RepackagingParameters localRepackagingParameters;
    if (asset.isNetworkAd())
    {
      localAuditudeParameters.setExternalAdId(asset.getNetworkAdId());
      localAuditudeParameters.setDomain(domain);
      localRepackagingParameters = new RepackagingParameters();
      localRepackagingParameters.setRequiredFormat(requiredFormat);
      MediaFile localMediaFile = asset.getBestMediaFile();
      if ((localMediaFile == null) || (source == null)) {
        break label143;
      }
      localRepackagingParameters.setCreativeURL(creativeUrlForSource(source));
      localRepackagingParameters.setVideoHeight(height);
      localRepackagingParameters.setVideoWidth(width);
    }
    label143:
    while (listener == null)
    {
      new CreativeRepackagingService(localAuditudeParameters, localRepackagingParameters, this);
      return;
      localAuditudeParameters.setExternalAdId("0");
      break;
    }
    listener.onRepackagingComplete(asset, false);
  }
  
  public static abstract interface AssetRepackagingCompletionListener
  {
    public abstract void onRepackagingComplete(Asset paramAsset, boolean paramBoolean);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.repackaging.AssetRepackager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */