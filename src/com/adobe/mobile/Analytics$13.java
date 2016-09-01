package com.adobe.mobile;

final class Analytics$13
  implements Runnable
{
  public void run()
  {
    AnalyticsWorker.sharedInstance().clearTrackingQueue();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Analytics.13
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */