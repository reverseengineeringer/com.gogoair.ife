package com.adobe.mobile;

import java.util.concurrent.Callable;

final class Analytics$12
  implements Callable
{
  public Long call()
    throws Exception
  {
    return Long.valueOf(AnalyticsWorker.sharedInstance().getTrackingQueueSize());
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Analytics.12
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */