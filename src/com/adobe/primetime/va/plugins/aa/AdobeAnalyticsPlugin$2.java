package com.adobe.primetime.va.plugins.aa;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.radio.Command;
import com.adobe.primetime.core.radio.CommandQueue;

class AdobeAnalyticsPlugin$2
  implements ICallback
{
  AdobeAnalyticsPlugin$2(AdobeAnalyticsPlugin paramAdobeAnalyticsPlugin) {}
  
  public Object call(Object paramObject)
  {
    AdobeAnalyticsPlugin.access$200(this$0).debug(AdobeAnalyticsPlugin.access$100(this$0), "#_cmdVideoStart()");
    if (!this$0._canProcess()) {
      return null;
    }
    AdobeAnalyticsPlugin.access$400(this$0).addCommand(new Command(AdobeAnalyticsPlugin.access$300(this$0), paramObject));
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */