package com.adobe.mobile;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

final class RequestBuilder
{
  private static final String PRIVACY_MODE_KEY = "a.privacy.mode";
  private static final String VAR_ESCAPE_PREFIX = "&&";
  
  protected static void buildAndSendRequest(Map paramMap1, Map paramMap2, long paramLong)
  {
    if (!WearableFunctionBridge.shouldSendHit()) {}
    while (!MobileConfig.getInstance().mobileUsingAnalytics()) {
      return;
    }
    label94:
    Iterator localIterator;
    if (paramMap1 != null)
    {
      paramMap1 = new HashMap(paramMap1);
      paramMap1.putAll(StaticMethods.getDefaultData());
      long l = StaticMethods.getTimeSinceLaunch();
      if (l > 0L) {
        paramMap1.put("a.TimeSinceLaunch", String.valueOf(l));
      }
      if (MobileConfig.getInstance().getPrivacyStatus() == MobilePrivacyStatus.MOBILE_PRIVACY_STATUS_UNKNOWN) {
        paramMap1.put("a.privacy.mode", "unknown");
      }
      if (paramMap2 == null) {
        break label259;
      }
      paramMap2 = new HashMap(paramMap2);
      if (MobileConfig.getInstance().getVisitorIdServiceEnabled()) {
        paramMap2.putAll(VisitorIDService.sharedInstance().getAnalyticsParameters());
      }
      if (StaticMethods.getAID() != null) {
        paramMap2.put("aid", StaticMethods.getAID());
      }
      if (StaticMethods.getVisitorID() != null) {
        paramMap2.put("vid", StaticMethods.getVisitorID());
      }
      paramMap2.put("ce", MobileConfig.getInstance().getCharacterSet());
      if (MobileConfig.getInstance().getOfflineTrackingEnabled()) {
        paramMap2.put("ts", Long.toString(paramLong));
      }
      paramMap2.put("t", StaticMethods.getTimestampString());
      localIterator = paramMap1.entrySet().iterator();
    }
    for (;;)
    {
      if (!localIterator.hasNext()) {
        break label312;
      }
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      String str = (String)localEntry.getKey();
      if (str == null)
      {
        localIterator.remove();
        continue;
        paramMap1 = new HashMap();
        break;
        label259:
        paramMap2 = new HashMap();
        break label94;
      }
      if (str.startsWith("&&"))
      {
        paramMap2.put(str.substring("&&".length()), localEntry.getValue());
        localIterator.remove();
      }
    }
    label312:
    Messages.checkForInAppMessage(new HashMap(paramMap2), new HashMap(paramMap1), new HashMap(Lifecycle.getContextDataLowercase()));
    paramMap2.put("c", StaticMethods.translateContextData(paramMap1));
    paramMap1 = new StringBuilder(2048);
    paramMap1.append("ndh=1");
    StaticMethods.serializeToQueryString(paramMap2, paramMap1);
    StaticMethods.logDebugFormat("Analytics - Attempting to send request parameters(%s)", new Object[] { paramMap1 });
    AnalyticsWorker.sharedInstance().queue(paramMap1.toString(), paramLong);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.RequestBuilder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */