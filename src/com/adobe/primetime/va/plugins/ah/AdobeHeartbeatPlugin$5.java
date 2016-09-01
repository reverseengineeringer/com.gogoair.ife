package com.adobe.primetime.va.plugins.ah;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.radio.Channel;

class AdobeHeartbeatPlugin$5
  implements ICallback
{
  AdobeHeartbeatPlugin$5(AdobeHeartbeatPlugin paramAdobeHeartbeatPlugin) {}
  
  public Object call(Object paramObject)
  {
    AdobeHeartbeatPlugin.access$002(this$0, null);
    if (!this$0._canProcess()) {
      return null;
    }
    AdobeHeartbeatPlugin.access$400(this$0).trigger(new Event(AdobeHeartbeatPlugin.access$700(), paramObject));
    AdobeHeartbeatPlugin.access$602(this$0, false);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.AdobeHeartbeatPlugin.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */