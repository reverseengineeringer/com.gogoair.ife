package com.adobe.mobile;

import java.util.HashMap;

class AnalyticsTrackTimedAction$1
  implements Runnable
{
  AnalyticsTrackTimedAction$1(AnalyticsTrackTimedAction paramAnalyticsTrackTimedAction, String paramString, HashMap paramHashMap) {}
  
  public void run()
  {
    AnalyticsTrackAction.trackAction(val$timedActionName, val$contextData);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AnalyticsTrackTimedAction.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */