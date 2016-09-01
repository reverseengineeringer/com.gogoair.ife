package com.adobe.ave.drm;

import android.os.Handler;

class DRMManager$UIThreadErrorCB
  implements DRMOperationErrorWithErrorObjectCallback
{
  DRMOperationErrorCallback cb;
  DRMError drmError;
  
  public DRMManager$UIThreadErrorCB(DRMManager paramDRMManager, DRMOperationErrorCallback paramDRMOperationErrorCallback)
  {
    cb = paramDRMOperationErrorCallback;
  }
  
  public void OperationError(long paramLong1, long paramLong2, Exception paramException)
  {
    DRMManager.access$000(this$0).post(new DRMManager.UIThreadErrorCB.2(this, paramLong1, paramLong2, paramException));
  }
  
  public void OperationError(DRMError paramDRMError)
  {
    drmError = paramDRMError;
    DRMManager.access$000(this$0).post(new DRMManager.UIThreadErrorCB.1(this));
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMManager.UIThreadErrorCB
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */