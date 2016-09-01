package com.adobe.mobile;

import java.util.HashMap;
import java.util.Map;

final class AnalyticsTrackInternal
{
  protected static void trackInternal(String paramString, Map paramMap)
  {
    trackInternal(paramString, paramMap, StaticMethods.getTimeSince1970());
  }
  
  protected static void trackInternal(String paramString, Map paramMap, long paramLong)
  {
    Object localObject;
    label20:
    StringBuilder localStringBuilder;
    if (paramMap != null)
    {
      paramMap = new HashMap(paramMap);
      if (paramString == null) {
        break label113;
      }
      localObject = paramString;
      paramMap.put("a.internalaction", localObject);
      localObject = new HashMap();
      ((HashMap)localObject).put("pe", "lnk_o");
      localStringBuilder = new StringBuilder().append("ADBINTERNAL:");
      if (paramString == null) {
        break label120;
      }
    }
    for (;;)
    {
      ((HashMap)localObject).put("pev2", paramString);
      ((HashMap)localObject).put("pageName", StaticMethods.getApplicationID());
      RequestBuilder.buildAndSendRequest(paramMap, (Map)localObject, paramLong);
      return;
      paramMap = new HashMap();
      break;
      label113:
      localObject = "None";
      break label20;
      label120:
      paramString = "None";
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AnalyticsTrackInternal
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */