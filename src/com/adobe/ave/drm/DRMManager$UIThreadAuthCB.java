package com.adobe.ave.drm;

import android.os.Handler;

class DRMManager$UIThreadAuthCB
  implements DRMAuthenticationCompleteCallback
{
  DRMAuthenticationCompleteCallback cb;
  
  public DRMManager$UIThreadAuthCB(DRMManager paramDRMManager, DRMAuthenticationCompleteCallback paramDRMAuthenticationCompleteCallback)
  {
    cb = paramDRMAuthenticationCompleteCallback;
  }
  
  public void AuthenticationComplete(byte[] paramArrayOfByte)
  {
    DRMManager.access$000(this$0).post(new DRMManager.UIThreadAuthCB.1(this, paramArrayOfByte));
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMManager.UIThreadAuthCB
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */