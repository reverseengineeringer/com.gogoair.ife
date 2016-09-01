package com.adobe.mobile;

final class Analytics$9
  implements Runnable
{
  Analytics$9(String paramString, Analytics.TimedActionBlock paramTimedActionBlock) {}
  
  public void run()
  {
    AnalyticsTrackTimedAction.sharedInstance().trackTimedActionEnd(val$action, val$logic);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Analytics.9
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */