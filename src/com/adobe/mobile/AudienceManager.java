package com.adobe.mobile;

import java.util.HashMap;
import java.util.Map;

public final class AudienceManager
{
  public static String getDpid()
  {
    return AudienceManagerWorker.GetDpid();
  }
  
  public static String getDpuuid()
  {
    return AudienceManagerWorker.GetDpuuid();
  }
  
  public static HashMap getVisitorProfile()
  {
    return AudienceManagerWorker.GetVisitorProfile();
  }
  
  public static void reset() {}
  
  public static void setDpidAndDpuuid(String paramString1, String paramString2)
  {
    AudienceManagerWorker.SetDpidAndDpuuid(paramString1, paramString2);
  }
  
  public static void signalWithData(Map paramMap, AudienceManagerCallback paramAudienceManagerCallback)
  {
    if (StaticMethods.isWearableApp())
    {
      StaticMethods.logWarningFormat("Audience Manager - Method signalWithData is not available for Wearable", new Object[0]);
      return;
    }
    AudienceManagerWorker.SubmitSignal(paramMap, paramAudienceManagerCallback);
  }
  
  public static abstract interface AudienceManagerCallback
  {
    public abstract void call(Object paramObject);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AudienceManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */