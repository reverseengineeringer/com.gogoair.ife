package com.adobe.primetime.va.plugins.aa;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.va.ErrorInfo;

class AdobeAnalyticsPlugin$4
  implements ICallback
{
  AdobeAnalyticsPlugin$4(AdobeAnalyticsPlugin paramAdobeAnalyticsPlugin) {}
  
  public Object call(Object paramObject)
  {
    if (AdobeAnalyticsPlugin.access$000(this$0) != null) {}
    do
    {
      return null;
      AdobeAnalyticsPlugin.access$002(this$0, new ErrorInfo("Internal error", "HeartbeatPlugin is in ERROR state."));
      AdobeAnalyticsPlugin.access$800(this$0, "error", AdobeAnalyticsPlugin.access$000(this$0));
    } while (AdobeAnalyticsPlugin.access$900(this$0) == null);
    AdobeAnalyticsPlugin.access$900(this$0).onError(AdobeAnalyticsPlugin.access$000(this$0));
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */