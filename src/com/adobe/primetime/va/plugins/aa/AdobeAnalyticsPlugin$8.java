package com.adobe.primetime.va.plugins.aa;

import com.adobe.mobile.MobileServices;
import com.adobe.primetime.core.ICallback;

class AdobeAnalyticsPlugin$8
  implements ICallback
{
  AdobeAnalyticsPlugin$8(AdobeAnalyticsPlugin paramAdobeAnalyticsPlugin) {}
  
  public Object call(Object paramObject)
  {
    return MobileServices.getSCTrackingServer();
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin.8
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */