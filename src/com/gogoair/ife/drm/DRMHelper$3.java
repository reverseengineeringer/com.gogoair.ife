package com.gogoair.ife.drm;

import com.adobe.ave.drm.DRMOperationErrorCallback;
import com.gogoair.ife.utils.GVLogger;

final class DRMHelper$3
  implements DRMOperationErrorCallback
{
  DRMHelper$3(DRMHelper.DRMLicenseAcquisitionListener paramDRMLicenseAcquisitionListener) {}
  
  public void OperationError(long paramLong1, long paramLong2, Exception paramException)
  {
    GVLogger.getDefaultLogger().e("[DRMPLAYER]::DRMHelper", "Acquiring license. ERROR");
    if (val$listener != null) {
      val$listener.onError("Error while loading license: " + paramLong1 + " 0x" + Long.toHexString(paramLong2) + " " + paramException, paramLong1);
    }
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.drm.DRMHelper.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */