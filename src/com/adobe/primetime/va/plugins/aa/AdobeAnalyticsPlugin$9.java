package com.adobe.primetime.va.plugins.aa;

import com.adobe.mobile.MobileServices;
import com.adobe.primetime.core.ICallback;

class AdobeAnalyticsPlugin$9
  implements ICallback
{
  AdobeAnalyticsPlugin$9(AdobeAnalyticsPlugin paramAdobeAnalyticsPlugin) {}
  
  public Object call(Object paramObject)
  {
    return Boolean.valueOf(MobileServices.getUseSSL());
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin.9
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */