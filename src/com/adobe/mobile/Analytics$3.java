package com.adobe.mobile;

import android.location.Location;
import java.util.Map;

final class Analytics$3
  implements Runnable
{
  Analytics$3(Location paramLocation, Map paramMap) {}
  
  public void run()
  {
    AnalyticsTrackLocation.trackLocation(val$location, val$cdata);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Analytics.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */