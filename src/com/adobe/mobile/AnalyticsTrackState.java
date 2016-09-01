package com.adobe.mobile;

import java.util.HashMap;
import java.util.Map;

final class AnalyticsTrackState
{
  protected static void trackState(String paramString, Map paramMap)
  {
    HashMap localHashMap = new HashMap();
    if ((paramString != null) && (paramString.length() > 0)) {}
    for (;;)
    {
      localHashMap.put("pageName", paramString);
      RequestBuilder.buildAndSendRequest(paramMap, localHashMap, StaticMethods.getTimeSince1970());
      return;
      paramString = StaticMethods.getApplicationID();
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AnalyticsTrackState
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */