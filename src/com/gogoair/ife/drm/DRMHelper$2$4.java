package com.gogoair.ife.drm;

import com.adobe.ave.drm.DRMOperationCompleteCallback;
import com.gogoair.ife.utils.GVLogger;

class DRMHelper$2$4
  implements DRMOperationCompleteCallback
{
  DRMHelper$2$4(DRMHelper.2 param2, byte[] paramArrayOfByte) {}
  
  public void OperationComplete()
  {
    GVLogger.getDefaultLogger().i("[DRMPLAYER]::DRMHelper", "authentication token set");
    this$0.val$authenticationListener.onAuthenticationComplete(val$customAuthenticationTokenBytes);
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.drm.DRMHelper.2.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */