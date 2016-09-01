package com.adobe.mobile;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;

public final class Media
{
  private static final String NO_ANALYTICS_MESSAGE = "Analytics - ADBMobile is not configured correctly to use Analytics.";
  
  public static MediaSettings adSettingsWith(String paramString1, double paramDouble1, String paramString2, String paramString3, String paramString4, double paramDouble2, String paramString5)
  {
    return MediaSettings.adSettingsWith(paramString1, paramDouble1, paramString2, paramString3, paramString4, paramDouble2, paramString5);
  }
  
  public static void click(String paramString, double paramDouble)
  {
    StaticMethods.getMediaExecutor().execute(new Media.6(paramString, paramDouble));
  }
  
  public static void close(String paramString)
  {
    StaticMethods.getMediaExecutor().execute(new Media.2(paramString));
  }
  
  public static void complete(String paramString, double paramDouble)
  {
    StaticMethods.getMediaExecutor().execute(new Media.4(paramString, paramDouble));
  }
  
  public static void open(MediaSettings paramMediaSettings, MediaCallback paramMediaCallback)
  {
    StaticMethods.getMediaExecutor().execute(new Media.1(paramMediaSettings, paramMediaCallback));
  }
  
  public static void play(String paramString, double paramDouble)
  {
    StaticMethods.getMediaExecutor().execute(new Media.3(paramString, paramDouble));
  }
  
  public static MediaSettings settingsWith(String paramString1, double paramDouble, String paramString2, String paramString3)
  {
    return MediaSettings.settingsWith(paramString1, paramDouble, paramString2, paramString3);
  }
  
  public static void stop(String paramString, double paramDouble)
  {
    StaticMethods.getMediaExecutor().execute(new Media.5(paramString, paramDouble));
  }
  
  public static void track(String paramString, Map paramMap)
  {
    MediaAnalytics.sharedInstance().setTrackCalledOnItem(paramString);
    if (paramMap != null) {}
    for (paramMap = new HashMap(paramMap);; paramMap = null)
    {
      StaticMethods.getMediaExecutor().execute(new Media.7(paramString, paramMap));
      return;
    }
  }
  
  public static abstract interface MediaCallback
  {
    public abstract void call(Object paramObject);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Media
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */