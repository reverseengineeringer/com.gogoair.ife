package com.adobe.mobile;

final class Media$1
  implements Runnable
{
  Media$1(MediaSettings paramMediaSettings, Media.MediaCallback paramMediaCallback) {}
  
  public void run()
  {
    MediaAnalytics.sharedInstance().open(val$settings, val$callback);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Media.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */