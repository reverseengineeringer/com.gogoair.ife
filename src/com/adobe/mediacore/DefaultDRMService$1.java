package com.adobe.mediacore;

import com.adobe.ave.drm.DRMOperationErrorCallback;

class DefaultDRMService$1
  implements DRMOperationErrorCallback
{
  DefaultDRMService$1(DefaultDRMService paramDefaultDRMService) {}
  
  public void OperationError(long paramLong1, long paramLong2, Exception paramException)
  {
    if (DefaultDRMService.access$000(this$0) != null) {
      DefaultDRMService.access$000(this$0).onError(paramLong1, paramLong2, paramException);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultDRMService.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */