package com.adobe.mobile;

import java.io.File;
import java.util.concurrent.ExecutorService;

class MobileConfig$5
  implements RemoteDownload.RemoteDownloadBlock
{
  MobileConfig$5(MobileConfig paramMobileConfig) {}
  
  public void call(boolean paramBoolean, File paramFile)
  {
    StaticMethods.getAnalyticsExecutor().execute(new MobileConfig.5.1(this, paramFile));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MobileConfig.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */