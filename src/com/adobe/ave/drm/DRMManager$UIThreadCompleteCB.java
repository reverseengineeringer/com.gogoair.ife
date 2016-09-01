package com.adobe.ave.drm;

import android.os.Handler;

class DRMManager$UIThreadCompleteCB
  implements DRMOperationCompleteCallback
{
  DRMOperationCompleteCallback cb;
  
  public DRMManager$UIThreadCompleteCB(DRMManager paramDRMManager, DRMOperationCompleteCallback paramDRMOperationCompleteCallback)
  {
    cb = paramDRMOperationCompleteCallback;
  }
  
  public void OperationComplete()
  {
    DRMManager.access$000(this$0).post(new DRMManager.UIThreadCompleteCB.1(this));
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMManager.UIThreadCompleteCB
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */