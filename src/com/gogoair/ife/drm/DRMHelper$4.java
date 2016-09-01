package com.gogoair.ife.drm;

import com.adobe.ave.drm.DRMLicense;
import com.adobe.ave.drm.DRMLicenseAcquiredCallback;
import com.gogoair.ife.utils.GVLogger;

final class DRMHelper$4
  implements DRMLicenseAcquiredCallback
{
  DRMHelper$4(DRMHelper.DRMLicenseAcquisitionListener paramDRMLicenseAcquisitionListener) {}
  
  public void LicenseAcquired(DRMLicense paramDRMLicense)
  {
    GVLogger.getDefaultLogger().i("[DRMPLAYER]::DRMHelper", "license acquired.");
    if (val$listener != null) {
      val$listener.onAcquired(paramDRMLicense);
    }
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.drm.DRMHelper.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */