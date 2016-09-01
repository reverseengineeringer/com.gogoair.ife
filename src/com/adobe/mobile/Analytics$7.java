package com.adobe.mobile;

import java.util.Map;

final class Analytics$7
  implements Runnable
{
  Analytics$7(String paramString, Map paramMap) {}
  
  public void run()
  {
    AnalyticsTrackTimedAction.sharedInstance().trackTimedActionStart(val$action, val$cdata);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Analytics.7
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */