package com.adobe.primetime.va.plugins.ah;

import com.adobe.primetime.core.ICallback;

class AdobeHeartbeatPlugin$13
  implements ICallback
{
  AdobeHeartbeatPlugin$13(AdobeHeartbeatPlugin paramAdobeHeartbeatPlugin) {}
  
  public Object call(Object paramObject)
  {
    if (!this$0._canProcess()) {
      return null;
    }
    AdobeHeartbeatPlugin.access$1002(this$0, false);
    AdobeHeartbeatPlugin.access$1400(this$0, paramObject);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.AdobeHeartbeatPlugin.13
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */