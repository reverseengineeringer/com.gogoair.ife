package com.auditude.creativerepackaging;

import android.util.Log;
import com.auditude.ads.loader.DataLoader;
import com.auditude.ads.loader.DataLoader.DataLoaderListener;
import com.auditude.ads.util.MD5;
import com.auditude.ads.util.PingUtil;
import com.auditude.ads.util.StringUtil;
import java.net.URLEncoder;

public class CreativeRepackagingService
  implements DataLoader.DataLoaderListener, UrlNormalizingRules.UrlNormalizingRulesListener
{
  private static final String CDN_URL = "http://cdn2.auditude.com/assets/3p/v";
  private static final int ERROR_1401 = 1401;
  private static final int ERROR_1403 = 1403;
  private static final String HTTP_HEAD_EXCEPTION = "Service unavailable";
  private static final String LOG_CATEGORY = "CreativeRepackagingService";
  private static final String NULL_LISTENER = "RepackageCreativeListener must not be null";
  private static final String PARAM_MISSING = "Required parameters missing";
  private static final int SERVICE_VERSION = 1;
  private static final String START_TRANSCODE = "Begin to transcode video";
  private static final int TIMEOUT = 10;
  private AuditudeParameters audParams;
  private String cdnURL;
  private CreativeRepackagingServiceListener creativeRepackagingServiceListener;
  private UrlNormalizingRules urlNormalizingRules;
  private RepackagingParameters vidParams;
  
  public CreativeRepackagingService(AuditudeParameters paramAuditudeParameters, RepackagingParameters paramRepackagingParameters, CreativeRepackagingServiceListener paramCreativeRepackagingServiceListener)
  {
    audParams = paramAuditudeParameters;
    vidParams = paramRepackagingParameters;
    creativeRepackagingServiceListener = paramCreativeRepackagingServiceListener;
    urlNormalizingRules = UrlNormalizingRules.getInstance();
    init();
  }
  
  private String getErrorURL(int paramInt)
  {
    return getPlayerErrorURL() + "&errorId=" + paramInt + "&z=" + audParams.getZoneId() + "&a=" + audParams.getAdId() + "&f=" + vidParams.getRequiredFormat() + "&tp=" + audParams.getExternalAdId() + "&tv=" + 1 + "&url=" + URLEncoder.encode(vidParams.getCreativeURL()) + "&vw=" + vidParams.getVideoWidth() + "&vh=" + vidParams.getVideoHeight();
  }
  
  private String getPlayerErrorURL()
  {
    if (StringUtil.isNotNullOrEmpty(audParams.getDomain())) {
      return "http://ad." + audParams.getDomain() + "/adserver/e?type=playererror";
    }
    return "http://ad.auditude.com/adserver/e?type=playererror";
  }
  
  private String getRequiredVideoURL(String paramString1, String paramString2)
  {
    String str = urlNormalizingRules.normalize(paramString1);
    paramString1 = new StringBuffer(str).reverse();
    str = MD5.GetMd5String(str);
    return "http://cdn2.auditude.com/assets/3p/v1/" + str.substring(0, 10) + "/" + str + "_" + MD5.GetMd5String(paramString1.toString()) + "." + paramString2;
  }
  
  private void init()
  {
    if (creativeRepackagingServiceListener == null) {
      throw new NullPointerException("RepackageCreativeListener must not be null");
    }
    urlNormalizingRules.addEventListener(this);
    urlNormalizingRules.loadRules();
  }
  
  private void repackage()
  {
    if (StringUtil.isNotNullOrEmpty(validateParams()))
    {
      creativeRepackagingServiceListener.onError(validateParams());
      return;
    }
    cdnURL = getRequiredVideoURL(vidParams.getCreativeURL(), vidParams.getRequiredFormat());
    if (StringUtil.isNotNullOrEmpty(Cache.playlistFromCacheForId(vidParams.getCreativeURL())))
    {
      creativeRepackagingServiceListener.onURLAvaliable(cdnURL, getErrorURL(1403));
      return;
    }
    DataLoader localDataLoader = new DataLoader();
    localDataLoader.setDataLoaderListener(this);
    Log.d("CreativeRepackagingService", "Sending Request for repackaged url availability to: " + cdnURL);
    localDataLoader.load(cdnURL, null, 10, Boolean.valueOf(true));
  }
  
  private String validateParams()
  {
    if (StringUtil.isNullOrEmpty(audParams.getAdId())) {
      return "Required parameters missing: adId";
    }
    if (StringUtil.isNullOrEmpty(audParams.getExternalAdId())) {
      return "Required parameters missing: externalAdId";
    }
    if (StringUtil.isNullOrEmpty(vidParams.getCreativeURL())) {
      return "Required parameters missing: creativeURL";
    }
    if (StringUtil.isNullOrEmpty(vidParams.getRequiredFormat())) {
      return "Required parameters missing: requiredFormat";
    }
    return null;
  }
  
  public void onRequestComplete(String paramString)
  {
    if (paramString.equals("true"))
    {
      Log.d("CreativeRepackagingService", "Received repackaged url: " + cdnURL);
      paramString = getErrorURL(1403);
      Cache.addPlaylistToCache(paramString, vidParams.getCreativeURL());
      creativeRepackagingServiceListener.onURLAvaliable(cdnURL, paramString);
      return;
    }
    Log.d("CreativeRepackagingService", "Sending Request for repackaging to: " + getErrorURL(1401));
    PingUtil.pingUrl(getErrorURL(1401));
    creativeRepackagingServiceListener.onError("Begin to transcode video");
  }
  
  public void onRequestFailed(Throwable paramThrowable)
  {
    creativeRepackagingServiceListener.onError("Service unavailable");
  }
  
  public void onRulesLoaded(Boolean paramBoolean)
  {
    urlNormalizingRules.removeEventListener(this);
    repackage();
  }
  
  public static abstract interface CreativeRepackagingServiceListener
  {
    public abstract void onError(String paramString);
    
    public abstract void onURLAvaliable(String paramString1, String paramString2);
  }
}

/* Location:
 * Qualified Name:     com.auditude.creativerepackaging.CreativeRepackagingService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */