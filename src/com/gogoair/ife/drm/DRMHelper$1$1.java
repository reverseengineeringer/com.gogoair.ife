package com.gogoair.ife.drm;

import com.adobe.ave.drm.DRMError;
import com.adobe.ave.drm.DRMOperationErrorWithErrorObjectCallback;
import com.gogoair.ife.utils.GVLogger;

class DRMHelper$1$1
  implements DRMOperationErrorWithErrorObjectCallback
{
  DRMHelper$1$1(DRMHelper.1 param1) {}
  
  public void OperationError(long paramLong1, long paramLong2, Exception paramException)
  {
    GVLogger.getDefaultLogger().i("[DRMPLAYER]::DRMHelper", "Error loading DRM metadata: " + paramLong1 + " 0x" + Long.toHexString(paramLong2));
    this$0.val$loadMetadataListener.onLoadMetadataUrlError();
  }
  
  public void OperationError(DRMError paramDRMError)
  {
    GVLogger.getDefaultLogger().i("[DRMPLAYER]::DRMHelper", "Error loading DRM metadata: " + paramDRMError.getMajorError() + " 0x" + Long.toHexString(paramDRMError.getMinorError()));
    this$0.val$loadMetadataListener.onLoadMetadataUrlError();
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.drm.DRMHelper.1.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */