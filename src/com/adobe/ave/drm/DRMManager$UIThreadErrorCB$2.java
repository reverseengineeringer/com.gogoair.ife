package com.adobe.ave.drm;

class DRMManager$UIThreadErrorCB$2
  implements Runnable
{
  DRMManager$UIThreadErrorCB$2(DRMManager.UIThreadErrorCB paramUIThreadErrorCB, long paramLong1, long paramLong2, Exception paramException) {}
  
  public void run()
  {
    this$1.cb.OperationError(val$majorCode, val$minorCode, val$e);
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMManager.UIThreadErrorCB.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */