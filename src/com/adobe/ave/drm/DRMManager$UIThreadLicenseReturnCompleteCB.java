package com.adobe.ave.drm;

import android.os.Handler;

class DRMManager$UIThreadLicenseReturnCompleteCB
  implements DRMLicenseReturnCompleteCallback
{
  DRMLicenseReturnCompleteCallback cb;
  
  public DRMManager$UIThreadLicenseReturnCompleteCB(DRMManager paramDRMManager, DRMLicenseReturnCompleteCallback paramDRMLicenseReturnCompleteCallback)
  {
    cb = paramDRMLicenseReturnCompleteCallback;
  }
  
  public void OperationComplete(long paramLong)
  {
    DRMManager.access$000(this$0).post(new DRMManager.UIThreadLicenseReturnCompleteCB.1(this, paramLong));
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMManager.UIThreadLicenseReturnCompleteCB
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */