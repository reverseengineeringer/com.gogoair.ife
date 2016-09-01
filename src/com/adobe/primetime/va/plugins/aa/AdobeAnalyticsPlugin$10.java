package com.adobe.primetime.va.plugins.aa;

import com.adobe.mobile.MobileServices;
import com.adobe.primetime.core.ICallback;

class AdobeAnalyticsPlugin$10
  implements ICallback
{
  AdobeAnalyticsPlugin$10(AdobeAnalyticsPlugin paramAdobeAnalyticsPlugin) {}
  
  public Object call(Object paramObject)
  {
    return MobileServices.getVisitorID();
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin.10
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */