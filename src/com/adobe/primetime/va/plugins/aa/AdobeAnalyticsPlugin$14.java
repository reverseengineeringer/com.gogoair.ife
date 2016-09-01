package com.adobe.primetime.va.plugins.aa;

import com.adobe.mobile.AudienceManager;
import com.adobe.primetime.core.ICallback;

class AdobeAnalyticsPlugin$14
  implements ICallback
{
  AdobeAnalyticsPlugin$14(AdobeAnalyticsPlugin paramAdobeAnalyticsPlugin) {}
  
  public Object call(Object paramObject)
  {
    return AudienceManager.getDpuuid();
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin.14
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */