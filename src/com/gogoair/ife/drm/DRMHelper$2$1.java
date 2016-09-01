package com.gogoair.ife.drm;

import com.adobe.ave.drm.DRMOperationErrorCallback;

class DRMHelper$2$1
  implements DRMOperationErrorCallback
{
  DRMHelper$2$1(DRMHelper.2 param2) {}
  
  public void OperationError(long paramLong1, long paramLong2, Exception paramException)
  {
    this$0.val$authenticationListener.onAuthenticationError(paramLong1, paramLong2, paramException);
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.drm.DRMHelper.2.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */