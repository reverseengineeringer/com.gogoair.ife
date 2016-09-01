package com.adobe.ave.drm;

class DRMManager$UIThreadCompleteCB$1
  implements Runnable
{
  DRMManager$UIThreadCompleteCB$1(DRMManager.UIThreadCompleteCB paramUIThreadCompleteCB) {}
  
  public void run()
  {
    this$1.cb.OperationComplete();
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMManager.UIThreadCompleteCB.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */