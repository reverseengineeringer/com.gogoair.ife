package com.adobe.primetime.va.plugins.ah;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.radio.Channel;

class AdobeHeartbeatPlugin$4
  implements ICallback
{
  AdobeHeartbeatPlugin$4(AdobeHeartbeatPlugin paramAdobeHeartbeatPlugin) {}
  
  public Object call(Object paramObject)
  {
    AdobeHeartbeatPlugin.access$002(this$0, null);
    if (!this$0._canProcess()) {
      return null;
    }
    if (AdobeHeartbeatPlugin.access$600(this$0)) {
      AdobeHeartbeatPlugin.access$400(this$0).trigger(new Event(AdobeHeartbeatPlugin.access$700(), paramObject));
    }
    AdobeHeartbeatPlugin.access$602(this$0, false);
    AdobeHeartbeatPlugin.access$802(this$0, true);
    AdobeHeartbeatPlugin.access$902(this$0, false);
    AdobeHeartbeatPlugin.access$1002(this$0, false);
    AdobeHeartbeatPlugin.access$400(this$0).trigger(new Event(AdobeHeartbeatPlugin.access$1100(), paramObject));
    AdobeHeartbeatPlugin.access$602(this$0, true);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.AdobeHeartbeatPlugin.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */