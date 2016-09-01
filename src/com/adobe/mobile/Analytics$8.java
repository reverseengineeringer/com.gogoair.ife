package com.adobe.mobile;

import java.util.Map;

final class Analytics$8
  implements Runnable
{
  Analytics$8(String paramString, Map paramMap) {}
  
  public void run()
  {
    AnalyticsTrackTimedAction.sharedInstance().trackTimedActionUpdate(val$action, val$cdata);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Analytics.8
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */