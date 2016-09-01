package com.adobe.mobile;

import java.io.File;

class MobileConfig$5$1
  implements Runnable
{
  MobileConfig$5$1(MobileConfig.5 param5, File paramFile) {}
  
  public void run()
  {
    if (val$file != null)
    {
      StaticMethods.logDebugFormat("Config - Using remote definition for points of interest", new Object[0]);
      this$1.this$0.updatePOIData(val$file);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MobileConfig.5.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */