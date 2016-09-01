package com.adobe.mobile;

import android.app.Activity;
import android.content.Context;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.FutureTask;

public final class Config
{
  public static void collectLifecycleData()
  {
    if (StaticMethods.isWearableApp())
    {
      StaticMethods.logWarningFormat("Analytics - Method collectLifecycleData is not available for Wearable", new Object[0]);
      return;
    }
    StaticMethods.getAnalyticsExecutor().execute(new Config.7());
  }
  
  public static void collectLifecycleData(Activity paramActivity)
  {
    if (StaticMethods.isWearableApp())
    {
      StaticMethods.logWarningFormat("Analytics - Method collectLifecycleData is not available for Wearable", new Object[0]);
      return;
    }
    StaticMethods.getAnalyticsExecutor().execute(new Config.8(paramActivity));
  }
  
  public static void collectLifecycleData(Activity paramActivity, Map paramMap)
  {
    if (StaticMethods.isWearableApp())
    {
      StaticMethods.logWarningFormat("Analytics - Method collectLifecycleData is not available for Wearable", new Object[0]);
      return;
    }
    StaticMethods.getAnalyticsExecutor().execute(new Config.9(paramActivity, paramMap));
  }
  
  public static ApplicationType getApplicationType()
  {
    return StaticMethods.getApplicaionType();
  }
  
  public static Boolean getDebugLogging()
  {
    return Boolean.valueOf(StaticMethods.getDebugLogging());
  }
  
  public static BigDecimal getLifetimeValue()
  {
    Object localObject = new FutureTask(new Config.6());
    StaticMethods.getAnalyticsExecutor().execute((Runnable)localObject);
    try
    {
      localObject = (BigDecimal)((FutureTask)localObject).get();
      return (BigDecimal)localObject;
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("Analytics - Unable to get lifetime value (%s)", new Object[] { localException.getMessage() });
    }
    return null;
  }
  
  public static MobilePrivacyStatus getPrivacyStatus()
  {
    Object localObject = new FutureTask(new Config.2());
    StaticMethods.getSharedExecutor().execute((Runnable)localObject);
    try
    {
      localObject = (MobilePrivacyStatus)((FutureTask)localObject).get();
      return (MobilePrivacyStatus)localObject;
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("Analytics - Unable to get PrivacyStatus (%s)", new Object[] { localException.getMessage() });
    }
    return null;
  }
  
  public static String getUserIdentifier()
  {
    Object localObject = new FutureTask(new Config.4());
    StaticMethods.getAnalyticsExecutor().execute((Runnable)localObject);
    try
    {
      localObject = (String)((FutureTask)localObject).get();
      return (String)localObject;
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("Analytics - Unable to get UserIdentifier (%s)", new Object[] { localException.getMessage() });
    }
    return null;
  }
  
  public static String getVersion()
  {
    return "4.5.3-AN";
  }
  
  public static void overrideConfigStream(InputStream paramInputStream)
  {
    MobileConfig.setUserDefinedConfigPath(paramInputStream);
  }
  
  public static void pauseCollectingLifecycleData()
  {
    if (StaticMethods.isWearableApp())
    {
      StaticMethods.logWarningFormat("Analytics - Method pauseCollectingLifecycleData is not available for Wearable", new Object[0]);
      return;
    }
    MessageAlert.clearCurrentDialog();
    StaticMethods.getAnalyticsExecutor().execute(new Config.10());
  }
  
  public static void setApplicationType(ApplicationType paramApplicationType)
  {
    StaticMethods.setApplicationType(paramApplicationType);
  }
  
  public static void setContext(Context paramContext)
  {
    setContext(paramContext, ApplicationType.APPLICATION_TYPE_HANDHELD);
  }
  
  public static void setContext(Context paramContext, ApplicationType paramApplicationType)
  {
    StaticMethods.setSharedContext(paramContext);
    setApplicationType(paramApplicationType);
    if (paramApplicationType == ApplicationType.APPLICATION_TYPE_WEARABLE) {
      StaticMethods.getAnalyticsExecutor().execute(new Config.1());
    }
  }
  
  public static void setDebugLogging(Boolean paramBoolean)
  {
    StaticMethods.setDebugLogging(paramBoolean.booleanValue());
  }
  
  public static void setLargeIconResourceId(int paramInt)
  {
    if (StaticMethods.isWearableApp())
    {
      StaticMethods.logWarningFormat("Analytics - Method setLargeIconResourceId is not available for Wearable", new Object[0]);
      return;
    }
    StaticMethods.getMessagesExecutor().execute(new Config.12(paramInt));
  }
  
  public static void setPrivacyStatus(MobilePrivacyStatus paramMobilePrivacyStatus)
  {
    StaticMethods.getSharedExecutor().execute(new Config.3(paramMobilePrivacyStatus));
  }
  
  public static void setSmallIconResourceId(int paramInt)
  {
    if (StaticMethods.isWearableApp())
    {
      StaticMethods.logWarningFormat("Analytics - Method setSmallIconResourceId is not available for Wearable", new Object[0]);
      return;
    }
    StaticMethods.getMessagesExecutor().execute(new Config.11(paramInt));
  }
  
  public static void setUserIdentifier(String paramString)
  {
    StaticMethods.getAnalyticsExecutor().execute(new Config.5(paramString));
  }
  
  public static enum ApplicationType
  {
    APPLICATION_TYPE_HANDHELD(0),  APPLICATION_TYPE_WEARABLE(1);
    
    private final int value;
    
    private ApplicationType(int paramInt1)
    {
      value = paramInt1;
    }
    
    protected int getValue()
    {
      return value;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Config
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */