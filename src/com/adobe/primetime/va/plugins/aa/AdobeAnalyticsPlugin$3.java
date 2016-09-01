package com.adobe.primetime.va.plugins.aa;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.radio.Command;
import com.adobe.primetime.core.radio.CommandQueue;

class AdobeAnalyticsPlugin$3
  implements ICallback
{
  AdobeAnalyticsPlugin$3(AdobeAnalyticsPlugin paramAdobeAnalyticsPlugin) {}
  
  public Object call(Object paramObject)
  {
    AdobeAnalyticsPlugin.access$600(this$0).debug(AdobeAnalyticsPlugin.access$500(this$0), "#_cmdAdStart()");
    if (!this$0._canProcess()) {
      return null;
    }
    AdobeAnalyticsPlugin.access$400(this$0).addCommand(new Command(AdobeAnalyticsPlugin.access$700(this$0), paramObject));
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */