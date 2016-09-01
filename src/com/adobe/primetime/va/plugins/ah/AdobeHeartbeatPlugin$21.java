package com.adobe.primetime.va.plugins.ah;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.radio.Channel;
import com.adobe.primetime.va.ErrorInfo;
import java.util.HashMap;

class AdobeHeartbeatPlugin$21
  implements ICallback
{
  AdobeHeartbeatPlugin$21(AdobeHeartbeatPlugin paramAdobeHeartbeatPlugin) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (Event)paramObject;
    AdobeHeartbeatPlugin.access$002(this$0, (ErrorInfo)((Event)paramObject).getData());
    paramObject = new HashMap();
    ((HashMap)paramObject).put("source", "sourceErrorHeartbeat");
    ((HashMap)paramObject).put("error_id", AdobeHeartbeatPlugin.access$000(this$0).getMessage() + "|" + AdobeHeartbeatPlugin.access$000(this$0).getDetails());
    AdobeHeartbeatPlugin.access$400(this$0).trigger(new Event(AdobeHeartbeatPlugin.access$2600(), paramObject));
    paramObject = new HashMap();
    ((HashMap)paramObject).put("reset", Boolean.valueOf(true));
    AdobeHeartbeatPlugin.access$400(this$0).command("clock:reporting.pause", paramObject);
    AdobeHeartbeatPlugin.access$2700(this$0, "error", AdobeHeartbeatPlugin.access$000(this$0));
    if (AdobeHeartbeatPlugin.access$200(this$0) != null) {
      AdobeHeartbeatPlugin.access$200(this$0).onError(AdobeHeartbeatPlugin.access$000(this$0));
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.AdobeHeartbeatPlugin.21
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */