package com.adobe.primetime.va.plugins.aa;

import com.adobe.mobile.AudienceManager;
import com.adobe.primetime.core.ICallback;

class AdobeAnalyticsPlugin$13
  implements ICallback
{
  AdobeAnalyticsPlugin$13(AdobeAnalyticsPlugin paramAdobeAnalyticsPlugin) {}
  
  public Object call(Object paramObject)
  {
    return AudienceManager.getDpid();
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin.13
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */