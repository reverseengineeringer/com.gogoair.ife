package com.adobe.mobile;

class MobileConfig$4
  implements Runnable
{
  MobileConfig$4(MobileConfig paramMobileConfig) {}
  
  public void run()
  {
    if ((MobileConfig.access$000(this$0) == null) || (MobileConfig.access$000(this$0).length() <= 0))
    {
      MobileConfig.access$100(this$0);
      return;
    }
    RemoteDownload.remoteDownloadSync(MobileConfig.access$000(this$0), new MobileConfig.4.1(this));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MobileConfig.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */