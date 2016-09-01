package com.adobe.mobile;

class MobileConfig$3
  implements Runnable
{
  MobileConfig$3(MobileConfig paramMobileConfig) {}
  
  public void run()
  {
    StaticMethods.logDebugFormat("Audience Manager - Privacy status set to opt out, clearing Audience Manager information.", new Object[0]);
    AudienceManagerWorker.Reset();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MobileConfig.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */