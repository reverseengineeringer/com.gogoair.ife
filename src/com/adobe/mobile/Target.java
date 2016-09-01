package com.adobe.mobile;

import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.FutureTask;

public final class Target
{
  private static final String NO_TARGET_MESSAGE = "Target - ADBMobile is not configured correctly to use Target.";
  
  public static void clearCookies()
  {
    StaticMethods.getAnalyticsExecutor().execute(new Target.1());
  }
  
  public static TargetLocationRequest createOrderConfirmRequest(String paramString1, String paramString2, String paramString3, String paramString4, Map paramMap)
  {
    return TargetLocationRequest.createRequestWithOrderConfirm(paramString1, paramString2, paramString3, paramString4, paramMap);
  }
  
  public static TargetLocationRequest createRequest(String paramString1, String paramString2, Map paramMap)
  {
    return new TargetLocationRequest(paramString1, paramString2, paramMap);
  }
  
  public static String getPcID()
  {
    Object localObject = new FutureTask(new Target.2());
    StaticMethods.getAnalyticsExecutor().execute((Runnable)localObject);
    try
    {
      localObject = (String)((FutureTask)localObject).get();
      return (String)localObject;
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("Target - Unable to get PcID (%s)", new Object[] { localException.getMessage() });
    }
    return null;
  }
  
  public static String getSessionID()
  {
    Object localObject = new FutureTask(new Target.3());
    StaticMethods.getAnalyticsExecutor().execute((Runnable)localObject);
    try
    {
      localObject = (String)((FutureTask)localObject).get();
      return (String)localObject;
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("Target - Unable to get SessionID (%s)", new Object[] { localException.getMessage() });
    }
    return null;
  }
  
  public static void loadRequest(TargetLocationRequest paramTargetLocationRequest, TargetCallback paramTargetCallback)
  {
    if (StaticMethods.isWearableApp())
    {
      StaticMethods.logWarningFormat("Target - Method loadRequest is not available for Wearable", new Object[0]);
      return;
    }
    TargetWorker.loadRequest(paramTargetLocationRequest, paramTargetCallback);
  }
  
  public static abstract interface TargetCallback
  {
    public abstract void call(Object paramObject);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Target
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */