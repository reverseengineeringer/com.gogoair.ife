package com.adobe.mobile;

import java.util.Map;

final class Analytics$4
  implements Runnable
{
  Analytics$4(String paramString1, String paramString2, String paramString3, Analytics.BEACON_PROXIMITY paramBEACON_PROXIMITY, Map paramMap) {}
  
  public void run()
  {
    AnalyticsTrackBeacon.trackBeacon(val$uuid, val$major, val$minor, val$proximity, val$cdata);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Analytics.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */