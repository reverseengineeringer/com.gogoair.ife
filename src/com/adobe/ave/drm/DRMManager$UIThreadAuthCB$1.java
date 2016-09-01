package com.adobe.ave.drm;

class DRMManager$UIThreadAuthCB$1
  implements Runnable
{
  DRMManager$UIThreadAuthCB$1(DRMManager.UIThreadAuthCB paramUIThreadAuthCB, byte[] paramArrayOfByte) {}
  
  public void run()
  {
    this$1.cb.AuthenticationComplete(val$authenticationToken);
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMManager.UIThreadAuthCB.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */