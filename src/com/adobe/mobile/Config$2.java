package com.adobe.mobile;

import java.util.concurrent.Callable;

final class Config$2
  implements Callable
{
  public MobilePrivacyStatus call()
    throws Exception
  {
    return MobileConfig.getInstance().getPrivacyStatus();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Config.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */