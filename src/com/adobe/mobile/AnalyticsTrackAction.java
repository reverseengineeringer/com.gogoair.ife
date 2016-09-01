package com.adobe.mobile;

import java.util.HashMap;
import java.util.Map;

final class AnalyticsTrackAction
{
  protected static void trackAction(String paramString, Map paramMap)
  {
    if (paramMap != null)
    {
      paramMap = new HashMap(paramMap);
      if (paramString == null) {
        break label98;
      }
    }
    for (;;)
    {
      paramMap.put("a.action", paramString);
      HashMap localHashMap = new HashMap();
      localHashMap.put("pe", "lnk_o");
      localHashMap.put("pev2", "AMACTION:" + paramString);
      localHashMap.put("pageName", StaticMethods.getApplicationID());
      RequestBuilder.buildAndSendRequest(paramMap, localHashMap, StaticMethods.getTimeSince1970());
      return;
      paramMap = new HashMap();
      break;
      label98:
      paramString = "";
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AnalyticsTrackAction
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */