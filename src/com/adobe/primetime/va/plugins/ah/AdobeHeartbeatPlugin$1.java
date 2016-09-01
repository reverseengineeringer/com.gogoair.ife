package com.adobe.primetime.va.plugins.ah;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.va.ErrorInfo;

class AdobeHeartbeatPlugin$1
  implements ICallback
{
  AdobeHeartbeatPlugin$1(AdobeHeartbeatPlugin paramAdobeHeartbeatPlugin) {}
  
  public Object call(Object paramObject)
  {
    if (AdobeHeartbeatPlugin.access$000(this$0) != null) {}
    do
    {
      return null;
      AdobeHeartbeatPlugin.access$002(this$0, new ErrorInfo("Internal error", "AdobeHeartbeatPlugin is in ERROR state."));
      AdobeHeartbeatPlugin.access$100(this$0, "error", AdobeHeartbeatPlugin.access$000(this$0));
    } while (AdobeHeartbeatPlugin.access$200(this$0) == null);
    AdobeHeartbeatPlugin.access$200(this$0).onError(AdobeHeartbeatPlugin.access$000(this$0));
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.AdobeHeartbeatPlugin.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */