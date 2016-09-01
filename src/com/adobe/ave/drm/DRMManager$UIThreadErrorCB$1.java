package com.adobe.ave.drm;

class DRMManager$UIThreadErrorCB$1
  implements Runnable
{
  DRMManager$UIThreadErrorCB$1(DRMManager.UIThreadErrorCB paramUIThreadErrorCB) {}
  
  public void run()
  {
    if ((this$1.cb instanceof DRMOperationErrorWithErrorObjectCallback))
    {
      ((DRMOperationErrorWithErrorObjectCallback)this$1.cb).OperationError(this$1.drmError);
      return;
    }
    this$1.cb.OperationError(this$1.drmError.getMajorError(), this$1.drmError.getMinorError(), null);
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMManager.UIThreadErrorCB.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */