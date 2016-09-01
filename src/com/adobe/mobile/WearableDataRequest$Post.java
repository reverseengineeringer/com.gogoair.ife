package com.adobe.mobile;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Build.VERSION;
import com.google.android.gms.wearable.DataMap;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

class WearableDataRequest$Post
  extends WearableDataRequest
{
  private static final Object _userAgentMutex = new Object();
  private static String userAgent = null;
  protected String body;
  protected String url;
  
  protected WearableDataRequest$Post(DataMap paramDataMap)
  {
    url = paramDataMap.getString("URL");
    body = paramDataMap.getString("Body");
    uuid = paramDataMap.getString("ID");
  }
  
  protected WearableDataRequest$Post(String paramString1, String paramString2, int paramInt)
  {
    super(paramInt);
    url = paramString1;
    body = paramString2;
  }
  
  protected static String getDefaultAcceptLanguage(Context paramContext)
  {
    if (paramContext == null) {}
    do
    {
      do
      {
        do
        {
          return null;
          paramContext = paramContext.getResources();
        } while (paramContext == null);
        paramContext = paramContext.getConfiguration();
      } while (paramContext == null);
      paramContext = locale;
    } while (paramContext == null);
    return paramContext.toString().replace('_', '-');
  }
  
  protected static String getDefaultUserAgent(Context paramContext)
  {
    synchronized (_userAgentMutex)
    {
      if (userAgent == null) {
        userAgent = "Mozilla/5.0 (Linux; U; Android " + Build.VERSION.RELEASE + "; " + getDefaultAcceptLanguage(paramContext) + "; " + Build.MODEL + " Build/" + Build.ID + ")";
      }
      paramContext = userAgent;
      return paramContext;
    }
  }
  
  protected DataMap getDataMap()
  {
    DataMap localDataMap = new DataMap();
    localDataMap.putString("ID", uuid);
    localDataMap.putString("Type", "POST");
    localDataMap.putString("URL", url);
    localDataMap.putString("Body", body);
    return localDataMap;
  }
  
  protected String getURL()
  {
    return url;
  }
  
  protected DataMap handle(Context paramContext)
  {
    DataMap localDataMap = new DataMap();
    HashMap localHashMap = new HashMap();
    localHashMap.put("Accept-Language", getDefaultAcceptLanguage(paramContext));
    localHashMap.put("User-Agent", getDefaultUserAgent(paramContext));
    localDataMap.putBoolean("Result", RequestHandler.sendAnalyticsRequest(url, body, localHashMap, timeOut));
    localDataMap.putString("ID", uuid);
    localDataMap.putString("Type", "POST");
    return localDataMap;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.WearableDataRequest.Post
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */