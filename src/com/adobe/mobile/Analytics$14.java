package com.adobe.mobile;

final class Analytics$14
  implements Runnable
{
  public void run()
  {
    AnalyticsWorker.sharedInstance().forceKick();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Analytics.14
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */