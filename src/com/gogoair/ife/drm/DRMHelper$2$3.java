package com.gogoair.ife.drm;

import com.adobe.ave.drm.DRMOperationErrorCallback;
import com.gogoair.ife.utils.GVLogger;

class DRMHelper$2$3
  implements DRMOperationErrorCallback
{
  DRMHelper$2$3(DRMHelper.2 param2) {}
  
  public void OperationError(long paramLong1, long paramLong2, Exception paramException)
  {
    GVLogger.getDefaultLogger().e("[DRMPLAYER]::DRMHelper", "error setting authentication token: " + paramLong1 + " 0x" + Long.toHexString(paramLong2));
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.drm.DRMHelper.2.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */