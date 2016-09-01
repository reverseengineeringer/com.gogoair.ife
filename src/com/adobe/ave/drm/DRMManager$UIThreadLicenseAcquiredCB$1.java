package com.adobe.ave.drm;

class DRMManager$UIThreadLicenseAcquiredCB$1
  implements Runnable
{
  DRMManager$UIThreadLicenseAcquiredCB$1(DRMManager.UIThreadLicenseAcquiredCB paramUIThreadLicenseAcquiredCB, DRMLicense paramDRMLicense) {}
  
  public void run()
  {
    this$1.cb.LicenseAcquired(val$license);
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMManager.UIThreadLicenseAcquiredCB.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */