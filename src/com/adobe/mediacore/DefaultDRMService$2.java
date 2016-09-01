package com.adobe.mediacore;

import com.adobe.ave.drm.DRMOperationCompleteCallback;

class DefaultDRMService$2
  implements DRMOperationCompleteCallback
{
  DefaultDRMService$2(DefaultDRMService paramDefaultDRMService) {}
  
  public void OperationComplete()
  {
    DefaultDRMService.access$102(this$0, true);
    if (DefaultDRMService.access$000(this$0) != null) {
      DefaultDRMService.access$000(this$0).onInitialized();
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultDRMService.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */