package com.adobe.mobile;

class MobileConfig$1
  implements Runnable
{
  MobileConfig$1(MobileConfig paramMobileConfig) {}
  
  public void run()
  {
    StaticMethods.logDebugFormat("Analytics - Privacy status set to opt in, attempting to send all hits in queue.", new Object[0]);
    AnalyticsWorker.sharedInstance().kick(false);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MobileConfig.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */