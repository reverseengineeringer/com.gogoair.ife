package com.adobe.primetime.va.plugins.ah;

import com.adobe.primetime.core.ICallback;

class AdobeHeartbeatPlugin$25
  implements ICallback
{
  AdobeHeartbeatPlugin$25(AdobeHeartbeatPlugin paramAdobeHeartbeatPlugin) {}
  
  public Object call(Object paramObject)
  {
    if (AdobeHeartbeatPlugin.access$2800(this$0) != null) {
      return AdobeHeartbeatPlugin.access$2800(this$0).getPublisher();
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.AdobeHeartbeatPlugin.25
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */