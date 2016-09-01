package com.adobe.ave.drm;

class DRMManager$UIThreadLicenseReturnCompleteCB$1
  implements Runnable
{
  DRMManager$UIThreadLicenseReturnCompleteCB$1(DRMManager.UIThreadLicenseReturnCompleteCB paramUIThreadLicenseReturnCompleteCB, long paramLong) {}
  
  public void run()
  {
    this$1.cb.OperationComplete(val$numReturned);
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMManager.UIThreadLicenseReturnCompleteCB.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */