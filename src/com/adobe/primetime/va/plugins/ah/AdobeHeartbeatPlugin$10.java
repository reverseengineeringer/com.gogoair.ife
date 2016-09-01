package com.adobe.primetime.va.plugins.ah;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.radio.Channel;

class AdobeHeartbeatPlugin$10
  implements ICallback
{
  AdobeHeartbeatPlugin$10(AdobeHeartbeatPlugin paramAdobeHeartbeatPlugin) {}
  
  public Object call(Object paramObject)
  {
    if (!this$0._canProcess()) {
      return null;
    }
    AdobeHeartbeatPlugin.access$400(this$0).trigger(new Event(AdobeHeartbeatPlugin.access$1600(), paramObject));
    AdobeHeartbeatPlugin.access$1400(this$0, paramObject);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.AdobeHeartbeatPlugin.10
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */