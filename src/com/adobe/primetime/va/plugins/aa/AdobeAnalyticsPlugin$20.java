package com.adobe.primetime.va.plugins.aa;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.va.ErrorInfo;

class AdobeAnalyticsPlugin$20
  implements ICallback
{
  AdobeAnalyticsPlugin$20(AdobeAnalyticsPlugin paramAdobeAnalyticsPlugin) {}
  
  public Object call(Object paramObject)
  {
    AdobeAnalyticsPlugin.access$002(this$0, (ErrorInfo)paramObject);
    AdobeAnalyticsPlugin.access$2400(this$0).error(AdobeAnalyticsPlugin.access$2300(this$0), AdobeAnalyticsPlugin.access$000(this$0).getMessage() + " | " + AdobeAnalyticsPlugin.access$000(this$0).getDetails());
    AdobeAnalyticsPlugin.access$2500(this$0, "error", paramObject);
    if (AdobeAnalyticsPlugin.access$900(this$0) != null) {
      AdobeAnalyticsPlugin.access$900(this$0).onError(AdobeAnalyticsPlugin.access$000(this$0));
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin.20
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */