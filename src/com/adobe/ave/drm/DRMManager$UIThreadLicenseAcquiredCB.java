package com.adobe.ave.drm;

import android.os.Handler;

class DRMManager$UIThreadLicenseAcquiredCB
  implements DRMLicenseAcquiredCallback
{
  DRMLicenseAcquiredCallback cb;
  
  public DRMManager$UIThreadLicenseAcquiredCB(DRMManager paramDRMManager, DRMLicenseAcquiredCallback paramDRMLicenseAcquiredCallback)
  {
    cb = paramDRMLicenseAcquiredCallback;
  }
  
  public void LicenseAcquired(DRMLicense paramDRMLicense)
  {
    DRMManager.access$000(this$0).post(new DRMManager.UIThreadLicenseAcquiredCB.1(this, paramDRMLicense));
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMManager.UIThreadLicenseAcquiredCB
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */