package com.gogoair.ife.drm;

import com.adobe.ave.drm.DRMAuthenticationCompleteCallback;

class DRMHelper$2$2
  implements DRMAuthenticationCompleteCallback
{
  DRMHelper$2$2(DRMHelper.2 param2) {}
  
  public void AuthenticationComplete(byte[] paramArrayOfByte)
  {
    this$0.val$authenticationListener.onAuthenticationComplete(paramArrayOfByte);
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.drm.DRMHelper.2.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */