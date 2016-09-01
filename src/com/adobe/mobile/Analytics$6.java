package com.adobe.mobile;

import java.math.BigDecimal;
import java.util.HashMap;

final class Analytics$6
  implements Runnable
{
  Analytics$6(BigDecimal paramBigDecimal, HashMap paramHashMap) {}
  
  public void run()
  {
    AnalyticsTrackLifetimeValueIncrease.trackLifetimeValueIncrease(val$amount, val$contextData);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Analytics.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */