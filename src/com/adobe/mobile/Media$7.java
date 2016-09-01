package com.adobe.mobile;

import java.util.Map;

final class Media$7
  implements Runnable
{
  Media$7(String paramString, Map paramMap) {}
  
  public void run()
  {
    MediaAnalytics.sharedInstance().track(val$name, val$fdata);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Media.7
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */