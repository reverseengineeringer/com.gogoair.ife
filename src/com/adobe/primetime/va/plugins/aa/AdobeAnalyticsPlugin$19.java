package com.adobe.primetime.va.plugins.aa;

import com.adobe.mobile.MobileServices;
import com.adobe.primetime.core.ICallback;

class AdobeAnalyticsPlugin$19
  implements ICallback
{
  AdobeAnalyticsPlugin$19(AdobeAnalyticsPlugin paramAdobeAnalyticsPlugin) {}
  
  public Object call(Object paramObject)
  {
    MobileServices.getVisitorID();
    MobileServices.getAnalyticsVisitorID();
    MobileServices.getMarketingCloudVisitorID();
    AdobeAnalyticsPlugin.access$2200(this$0);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin.19
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */