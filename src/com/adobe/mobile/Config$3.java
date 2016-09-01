package com.adobe.mobile;

final class Config$3
  implements Runnable
{
  Config$3(MobilePrivacyStatus paramMobilePrivacyStatus) {}
  
  public void run()
  {
    MobileConfig.getInstance().setPrivacyStatus(val$status);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Config.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */