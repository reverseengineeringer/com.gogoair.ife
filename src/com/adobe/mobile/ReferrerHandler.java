package com.adobe.mobile;

import android.content.Intent;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import java.util.HashMap;
import java.util.concurrent.ExecutorService;

final class ReferrerHandler
{
  static final String[] REFERRER_FIELDS = { "utm_source", "utm_medium", "utm_term", "utm_content", "utm_campaign", "trackingcode" };
  private static boolean _referrerProcessed = true;
  
  protected static boolean getReferrerProcessed()
  {
    return _referrerProcessed;
  }
  
  public static void processIntent(Intent paramIntent)
  {
    if (paramIntent == null)
    {
      StaticMethods.logWarningFormat("Analytics - Unable to process referrer due to an invalid intent parameter", new Object[0]);
      return;
    }
    if (!paramIntent.getAction().equals("com.android.vending.INSTALL_REFERRER"))
    {
      StaticMethods.logDebugFormat("Analytics - Ignoring referrer due to the intent's action not being handled by analytics", new Object[0]);
      return;
    }
    for (;;)
    {
      int i;
      try
      {
        Object localObject = paramIntent.getExtras();
        if (localObject != null) {
          ((Bundle)localObject).containsKey(null);
        }
        localObject = paramIntent.getStringExtra("referrer");
        StaticMethods.logDebugFormat("Analytics - Received referrer information(%s)", new Object[] { localObject });
        if ((localObject == null) || (((String)localObject).length() == 0))
        {
          StaticMethods.logDebugFormat("Analytics - Ignoring referrer due to the intent's referrer string being empty", new Object[0]);
          return;
        }
        paramIntent = new HashMap();
        localObject = ((String)localObject).split("&");
        int j = localObject.length;
        i = 0;
        String[] arrayOfString;
        if (i < j)
        {
          arrayOfString = localObject[i].split("=");
          if (arrayOfString.length == 2) {
            paramIntent.put(arrayOfString[0], arrayOfString[1]);
          }
          i += 1;
          continue;
        }
        if (Lifecycle.lifecycleHasRun)
        {
          if ((!paramIntent.containsKey("utm_source")) || (!paramIntent.containsKey("utm_campaign"))) {
            break;
          }
          StaticMethods.getAnalyticsExecutor().execute(new ReferrerHandler.1(paramIntent));
          AnalyticsWorker.sharedInstance().kickWithReferrerData(paramIntent);
          return;
        }
        try
        {
          localObject = StaticMethods.getSharedPreferencesEditor();
          arrayOfString = REFERRER_FIELDS;
          j = arrayOfString.length;
          i = 0;
          if (i < j)
          {
            String str = arrayOfString[i];
            if ((!paramIntent.containsKey(str)) || (paramIntent.get(str) == null)) {
              break label301;
            }
            ((SharedPreferences.Editor)localObject).putString(str, paramIntent.get(str).toString());
            break label301;
          }
          ((SharedPreferences.Editor)localObject).commit();
        }
        catch (StaticMethods.NullContextException paramIntent)
        {
          StaticMethods.logErrorFormat("Analytics - Error persisting referrer data (%s)", new Object[] { paramIntent.getMessage() });
          continue;
        }
        _referrerProcessed = true;
        return;
      }
      catch (Exception paramIntent)
      {
        return;
      }
      label301:
      i += 1;
    }
  }
  
  protected static void setReferrerProcessed(boolean paramBoolean)
  {
    _referrerProcessed = paramBoolean;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.ReferrerHandler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */