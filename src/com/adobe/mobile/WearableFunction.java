package com.adobe.mobile;

import android.content.Context;
import android.content.SharedPreferences;
import java.util.Map;

final class WearableFunction
{
  private static boolean sendHitFlag = false;
  
  protected static boolean isHandheldAppStarted()
  {
    boolean bool = false;
    try
    {
      long l = StaticMethods.getSharedPreferences().getLong("ADMS_Handheld_App_InstallDate", 0L);
      if (l != 0L) {
        bool = true;
      }
      return bool;
    }
    catch (StaticMethods.NullContextException localNullContextException)
    {
      StaticMethods.logWarningFormat("Wearable - Error getting install date of handheld app", new Object[0]);
    }
    return false;
  }
  
  protected static byte[] retrieveData(String paramString1, Map paramMap, int paramInt, String paramString2)
  {
    if (StaticMethods.isWearableApp()) {}
    try
    {
      paramMap = StaticMethods.getSharedContext().getApplicationContext();
      paramString1 = (WearableDataResponse.GetResponse)new WearableDataConnection(paramMap).send(WearableDataRequest.createGetRequest(paramString1, paramInt));
      if (paramString1 == null) {
        return null;
      }
    }
    catch (StaticMethods.NullContextException paramMap)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("Analytics - Error registering network receiver (%s)", new Object[] { paramMap.getMessage() });
        paramMap = null;
      }
    }
    return paramString1.getResult();
  }
  
  protected static boolean sendAnalyticsRequest(String paramString1, String paramString2, Map paramMap, int paramInt)
  {
    if (StaticMethods.isWearableApp())
    {
      paramMap = null;
      try
      {
        Context localContext = StaticMethods.getSharedContext().getApplicationContext();
        paramMap = localContext;
      }
      catch (StaticMethods.NullContextException localNullContextException)
      {
        for (;;)
        {
          StaticMethods.logErrorFormat("Analytics - Error registering network receiver (%s)", new Object[] { localNullContextException.getMessage() });
        }
      }
      paramString1 = new WearableDataConnection(paramMap).send(WearableDataRequest.createPostRequest(paramString1, paramString2, paramInt));
      return (paramString1 != null) && (paramString1.isSuccess());
    }
    return true;
  }
  
  protected static void sendGenericRequest(String paramString1, Map paramMap, int paramInt, String paramString2)
  {
    retrieveData(paramString1, paramMap, paramInt, paramString2);
  }
  
  protected static boolean shouldSendHit()
  {
    if (sendHitFlag) {
      return true;
    }
    if (Config.getApplicationType() != Config.ApplicationType.APPLICATION_TYPE_WEARABLE)
    {
      sendHitFlag = true;
      return true;
    }
    if (isHandheldAppStarted())
    {
      sendHitFlag = true;
      return true;
    }
    StaticMethods.logWarningFormat("Analytics - Failed to send the Wearable request, containing app should get launched before Wearable app.", new Object[0]);
    return false;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.WearableFunction
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */