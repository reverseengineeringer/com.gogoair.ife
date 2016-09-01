package com.adobe.mobile;

class MobileConfig$2
  implements Runnable
{
  MobileConfig$2(MobileConfig paramMobileConfig) {}
  
  public void run()
  {
    StaticMethods.logDebugFormat("Analytics - Privacy status set to opt out, attempting to clear queue of all hits.", new Object[0]);
    AnalyticsWorker.sharedInstance().clearTrackingQueue();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MobileConfig.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */