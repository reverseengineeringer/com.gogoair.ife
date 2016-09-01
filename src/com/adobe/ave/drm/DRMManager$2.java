package com.adobe.ave.drm;

class DRMManager$2
  implements DRMLicenseAcquiredCallback
{
  DRMManager$2(DRMManager paramDRMManager, DRMOperationCompleteCallback paramDRMOperationCompleteCallback) {}
  
  public void LicenseAcquired(DRMLicense paramDRMLicense)
  {
    val$complete.OperationComplete();
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMManager.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */