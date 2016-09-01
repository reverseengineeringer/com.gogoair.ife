package com.auditude.ads.loader;

import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.util.AuditudeUtil.LocaltimeTagResult;
import com.auditude.ads.util.MD5;
import com.auditude.ads.util.ObjectUtil;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.URLUtil;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class AdRequest
{
  private static final String IMPRESSION_FORMAT = "15";
  private static final String OUTPUT_FORMAT = "1.4";
  private String[] aamSegments;
  private String aamUuid;
  private HashMap data;
  private String domain;
  private Object mediaId;
  private int timeout;
  private boolean useSSL = false;
  private int zoneId;
  
  public AdRequest(Object paramObject, int paramInt1, String paramString, HashMap paramHashMap, int paramInt2)
  {
    zoneId = paramInt1;
    domain = paramString;
    mediaId = paramObject;
    data = paramHashMap;
    timeout = paramInt2;
    if (timeout < 0) {}
  }
  
  private String getGeoString()
  {
    Object localObject = AuditudeEnv.getInstance().getAdSettings();
    String str = ObjectUtil.convertToString(((AdSettings)localObject).getCustomParamValue("auditudeParamZipCode"), null);
    localObject = ObjectUtil.convertToString(((AdSettings)localObject).getCustomParamValue("auditudeParamCountryCode"), null);
    if ((StringUtil.isNullOrEmpty(str)) && (StringUtil.isNullOrEmpty((String)localObject))) {
      return null;
    }
    return ";" + (String)localObject + ";;;" + str + ";;";
  }
  
  private String getGroupId()
  {
    return "1000005";
  }
  
  private String getTimelineString()
  {
    HashMap localHashMap = data;
    if ((localHashMap == null) || (!localHashMap.containsKey("auditudeTimeline"))) {
      return null;
    }
    return (String)localHashMap.get("auditudeTimeline");
  }
  
  public final String getAdRequestUrl()
  {
    if ((domain == null) || (mediaId == null) || (zoneId <= 0)) {
      return null;
    }
    Object localObject2 = new StringBuilder("http");
    Object localObject1;
    StringBuilder localStringBuilder;
    label149:
    label177:
    int i;
    if (useSSL)
    {
      localObject1 = "s";
      localStringBuilder = new StringBuilder((String)localObject1 + "://");
      localObject2 = "";
      AdSettings localAdSettings = AuditudeEnv.getInstance().getAdSettings();
      localObject1 = localObject2;
      if (localAdSettings.getProperty("adRequestDomain") != null)
      {
        localObject1 = localObject2;
        if (StringUtil.isNotNullOrEmpty(localAdSettings.getProperty("adRequestDomain").toString())) {
          localObject1 = localAdSettings.getProperty("adRequestDomain").toString();
        }
      }
      if (!StringUtil.isNotNullOrEmpty((String)localObject1)) {
        break label375;
      }
      localStringBuilder.append(localObject1 + "/adserver?");
      if (!(mediaId instanceof Iterable)) {
        break label497;
      }
      if (!(mediaId instanceof Iterable)) {
        break label424;
      }
      localObject1 = (Iterable)mediaId;
      localObject1 = ((Iterable)localObject1).iterator();
      i = 0;
      label186:
      if (((Iterator)localObject1).hasNext()) {
        break label429;
      }
    }
    for (;;)
    {
      localStringBuilder.append("&z=" + zoneId);
      localStringBuilder.append("&l=" + new AuditudeUtil.LocaltimeTagResult().getResult());
      localStringBuilder.append("&of=1.4");
      localStringBuilder.append("&tm=15");
      localStringBuilder.append("&g=" + getGroupId());
      localObject1 = getGeoString();
      if (StringUtil.isNotNullOrEmpty((String)localObject1)) {
        localStringBuilder.append("&geo=" + URLUtil.urlEncode((String)localObject1));
      }
      localObject1 = getTimelineString();
      if (StringUtil.isNotNullOrEmpty((String)localObject1)) {
        localStringBuilder.append("&tl=" + (String)localObject1);
      }
      return localStringBuilder.toString();
      localObject1 = "";
      break;
      label375:
      if (!URLUtil.isIPAddress(domain)) {
        localStringBuilder.append("ad.");
      }
      localStringBuilder.append(domain + "/adserver?");
      break label149;
      label424:
      localObject1 = null;
      break label177;
      label429:
      localObject2 = ((Iterator)localObject1).next();
      if ((localObject2 == null) || (StringUtil.isNullOrEmpty((String)localObject2))) {
        break label186;
      }
      if (i > 0) {
        localStringBuilder.append("&");
      }
      localStringBuilder.append("u=" + MD5.GetMd5String((String)localObject2));
      i += 1;
      break label186;
      label497:
      if (mediaId.getClass() == String.class) {
        localStringBuilder.append("u=" + MD5.GetMd5String(mediaId.toString()));
      }
    }
  }
  
  public final String getDomain()
  {
    return domain;
  }
  
  public final String getKeyValueString()
  {
    Object localObject1 = data;
    if ((localObject1 == null) || (!((HashMap)localObject1).containsKey("userData"))) {
      return null;
    }
    localStringBuilder = new StringBuilder("");
    localObject1 = ((HashMap)localObject1).get("userData");
    if (localObject1 == null) {
      return localStringBuilder.toString();
    }
    Object localObject2;
    if (localObject1.getClass() == String.class)
    {
      localObject2 = ((String)localObject1).split(";");
      if ((localObject2 != null) && (localObject2.length > 0))
      {
        int j = localObject2.length;
        i = 0;
        if (i < j) {
          break label216;
        }
      }
    }
    if ((localObject1 instanceof Map)) {}
    for (;;)
    {
      try
      {
        localObject1 = ((Map)localObject1).entrySet().iterator();
        boolean bool = ((Iterator)localObject1).hasNext();
        if (bool) {
          continue;
        }
      }
      catch (RuntimeException localRuntimeException)
      {
        label216:
        Object localObject3;
        int k;
        continue;
        localStringBuilder.append("aud_aam_segs=" + aamSegments[i] + "\n");
        i += 1;
        continue;
      }
      if ((aamSegments != null) && (aamSegments.length > 0))
      {
        i = 0;
        if (i < aamSegments.length) {
          continue;
        }
      }
      if ((aamUuid != null) && (aamUuid.length() > 0)) {
        localStringBuilder.append("aud_aam_uuid=" + aamUuid + "\n");
      }
      return localStringBuilder.toString();
      localObject3 = localObject2[i];
      k = ((String)localObject3).indexOf("=");
      if (k <= 0)
      {
        i += 1;
        break;
      }
      localStringBuilder.append(URLUtil.urlEncode(((String)localObject3).substring(0, k)) + "=" + URLUtil.urlEncode(((String)localObject3).substring(k + 1)) + "\n");
      continue;
      localObject2 = (Map.Entry)((Iterator)localObject1).next();
      localStringBuilder.append(URLUtil.urlEncode(((Map.Entry)localObject2).getKey().toString()) + "=" + URLUtil.urlEncode(((Map.Entry)localObject2).getValue().toString()) + "\n");
      ((Iterator)localObject1).remove();
    }
  }
  
  public final Object getMediaId()
  {
    return mediaId;
  }
  
  public final boolean getUseSSL()
  {
    return useSSL;
  }
  
  public final int getZoneId()
  {
    return zoneId;
  }
  
  public final void setAamSegments(String[] paramArrayOfString)
  {
    aamSegments = paramArrayOfString;
  }
  
  public final void setAamUuid(String paramString)
  {
    aamUuid = paramString;
  }
  
  public final void setUseSSL(boolean paramBoolean)
  {
    useSSL = paramBoolean;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.loader.AdRequest
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */