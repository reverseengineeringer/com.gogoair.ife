package com.auditude.ads.util;

import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;

public class AuditudeUtil
{
  public static Size AuditudePluginSize = new Size(0, 0);
  private static HashMap URL_TAGS = new HashMap();
  private static String assetUri;
  private static int contentPlayhead = 0;
  private static Boolean isInitialized = Boolean.valueOf(false);
  
  public static String getUrlWithState(String paramString, HashMap paramHashMap)
  {
    Object localObject = paramString;
    if (!StringUtil.isNullOrEmpty(paramString))
    {
      localObject = paramString;
      if (paramHashMap != null)
      {
        localObject = paramString;
        if (paramHashMap.size() > 0)
        {
          boolean bool2 = paramString.matches("https?://.*.auditude.com/adserver/.*");
          localObject = AuditudeEnv.getInstance().getAdSettings();
          bool1 = bool2;
          if (((AdSettings)localObject).getProperty("adRequestDomain") != null)
          {
            bool1 = bool2;
            if (StringUtil.isNotNullOrEmpty(((AdSettings)localObject).getProperty("adRequestDomain").toString()))
            {
              localObject = ((AdSettings)localObject).getProperty("adRequestDomain").toString();
              localObject = "https?://" + (String)localObject + "/adserver/.*";
              if ((bool2) || (paramString.matches((String)localObject))) {
                break label196;
              }
            }
          }
        }
      }
    }
    label196:
    for (boolean bool1 = false;; bool1 = true)
    {
      localObject = paramString;
      if (bool1)
      {
        int i = paramString.lastIndexOf("/");
        localObject = paramString;
        if (i > 0) {
          localObject = paramString.substring(0, i) + "/" + StringUtil.ConvertToString(paramHashMap, ";", "=") + paramString.substring(i);
        }
      }
      return (String)localObject;
    }
  }
  
  private static void initialize()
  {
    if (isInitialized.booleanValue()) {
      return;
    }
    URL_TAGS.put("[timestamp]", new TimestampTagResult());
    URL_TAGS.put("[random]", new RandomTagResult());
    URL_TAGS.put("[CACHEBUSTING]", new CacheBustingTagResult());
    URL_TAGS.put("%5BCACHEBUSTING%5D", new CacheBustingTagResult());
    URL_TAGS.put("[page_url]", new PageUrlTagResult());
    URL_TAGS.put("[width]", new WidthTagResult());
    URL_TAGS.put("[height]", new HeightTagResult());
    URL_TAGS.put("[localtime]", new LocaltimeTagResult());
    URL_TAGS.put("[CONTENTPLAYHEAD]", new ContentPlayhead());
    URL_TAGS.put("[ASSETURI]", new AssetURI());
    isInitialized = Boolean.valueOf(true);
  }
  
  public static void setAssetURI(String paramString)
  {
    assetUri = paramString;
  }
  
  public static void setContentPlayhead(int paramInt)
  {
    contentPlayhead = paramInt;
  }
  
  public static String substituteCustomPublisherTags(String paramString, HashMap paramHashMap)
  {
    Object localObject = paramString;
    if (!StringUtil.isNullOrEmpty(paramString))
    {
      if (paramHashMap == null) {
        localObject = paramString;
      }
    }
    else {
      return (String)localObject;
    }
    paramHashMap = paramHashMap.entrySet().iterator();
    for (;;)
    {
      localObject = paramString;
      if (!paramHashMap.hasNext()) {
        break;
      }
      localObject = (Map.Entry)paramHashMap.next();
      paramString = paramString.replaceAll("\\[" + (String)((Map.Entry)localObject).getKey() + "\\]", (String)((Map.Entry)localObject).getValue());
    }
  }
  
  public static String substituteTags(String paramString)
  {
    String str;
    if (StringUtil.isNullOrEmpty(paramString))
    {
      str = paramString;
      return str;
    }
    initialize();
    Iterator localIterator = URL_TAGS.keySet().iterator();
    for (;;)
    {
      str = paramString;
      if (!localIterator.hasNext()) {
        break;
      }
      str = (String)localIterator.next();
      paramString = paramString.replace(str, ((ITagResult)URL_TAGS.get(str)).getResult());
    }
  }
  
  public static class AssetURI
    implements AuditudeUtil.ITagResult
  {
    public String getResult()
    {
      if ((AuditudeUtil.assetUri != null) && (AuditudeUtil.assetUri.length() > 0)) {
        return AuditudeUtil.assetUri;
      }
      return "[ASSETURI]";
    }
  }
  
  public static class CacheBustingTagResult
    implements AuditudeUtil.ITagResult
  {
    public String getResult()
    {
      return String.valueOf(new Random().nextInt(89999999) + 10000000);
    }
  }
  
  public static class ContentPlayhead
    implements AuditudeUtil.ITagResult
  {
    public String getResult()
    {
      if (AuditudeUtil.contentPlayhead >= 0) {
        return StringUtil.convertToHHMMSS(Math.round(AuditudeUtil.contentPlayhead / 1000));
      }
      return "[CONTENTPLAYHEAD]";
    }
  }
  
  public static class HeightTagResult
    implements AuditudeUtil.ITagResult
  {
    public String getResult()
    {
      if (AuditudeUtil.AuditudePluginSize != null) {
        return String.valueOf(AuditudePluginSizeheight);
      }
      return "0";
    }
  }
  
  public static abstract interface ITagResult
  {
    public abstract String getResult();
  }
  
  public static class LocaltimeTagResult
    implements AuditudeUtil.ITagResult
  {
    public String getResult()
    {
      Object localObject = Calendar.getInstance();
      ((Calendar)localObject).setTime(new Date());
      String str5 = Integer.toString(((Calendar)localObject).get(1));
      String str1 = Integer.toString(((Calendar)localObject).get(2) + 1);
      String str2;
      label58:
      String str3;
      label77:
      String str4;
      if (str1.length() >= 2)
      {
        str2 = Integer.toString(((Calendar)localObject).get(5));
        if (str2.length() < 2) {
          break label188;
        }
        str3 = Integer.toString(((Calendar)localObject).get(11));
        if (str3.length() < 2) {
          break label211;
        }
        str4 = Integer.toString(((Calendar)localObject).get(12));
        label97:
        if (str4.length() < 2) {
          break label234;
        }
      }
      for (localObject = Integer.toString(((Calendar)localObject).get(13));; localObject = '0' + (String)localObject) {
        if (((String)localObject).length() >= 2)
        {
          return str5 + str1 + str2 + str3 + str4 + (String)localObject;
          str1 = '0' + str1;
          break;
          label188:
          str2 = '0' + str2;
          break label58;
          label211:
          str3 = '0' + str3;
          break label77;
          label234:
          str4 = '0' + str4;
          break label97;
        }
      }
    }
  }
  
  public static class PageUrlTagResult
    implements AuditudeUtil.ITagResult
  {
    public String getResult()
    {
      try
      {
        String str = BrowserUtil.getPageUrl();
        return str;
      }
      catch (RuntimeException localRuntimeException) {}
      return "";
    }
  }
  
  public static class RandomTagResult
    implements AuditudeUtil.ITagResult
  {
    public String getResult()
    {
      return String.valueOf(new Random().nextInt(1000000));
    }
  }
  
  public static class TimestampTagResult
    implements AuditudeUtil.ITagResult
  {
    public String getResult()
    {
      return String.valueOf(new Date().getTime() / 1000L);
    }
  }
  
  public static class WidthTagResult
    implements AuditudeUtil.ITagResult
  {
    public String getResult()
    {
      if (AuditudeUtil.AuditudePluginSize != null) {
        return String.valueOf(AuditudePluginSizewidth);
      }
      return "0";
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.AuditudeUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */