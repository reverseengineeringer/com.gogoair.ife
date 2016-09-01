package com.adobe.primetime.va.plugins.aa;

import com.adobe.primetime.core.ICallback;
import java.util.Map;

class AdobeAnalyticsPlugin$16
  implements ICallback
{
  AdobeAnalyticsPlugin$16(AdobeAnalyticsPlugin paramAdobeAnalyticsPlugin) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (String)paramObject;
    Object localObject = ((String)paramObject).split("\\.");
    if (localObject.length < 2) {}
    do
    {
      do
      {
        do
        {
          return null;
          localObject = AdobeAnalyticsPlugin.Domain.valueOf(localObject[0]);
          paramObject = ((String)paramObject).substring(((String)paramObject).indexOf(".") + 1);
        } while (localObject == null);
        switch (AdobeAnalyticsPlugin.21.$SwitchMap$com$adobe$primetime$va$plugins$aa$AdobeAnalyticsPlugin$Domain[localObject.ordinal()])
        {
        default: 
          return null;
        case 1: 
          if (((String)paramObject).equals("*")) {
            return AdobeAnalyticsPlugin.access$1900(this$0);
          }
          break;
        }
      } while ((AdobeAnalyticsPlugin.access$1900(this$0) == null) || (!AdobeAnalyticsPlugin.access$1900(this$0).containsKey(paramObject)));
      return (String)AdobeAnalyticsPlugin.access$1900(this$0).get(paramObject);
      if (((String)paramObject).equals("*")) {
        return AdobeAnalyticsPlugin.access$2000(this$0);
      }
      return AdobeAnalyticsPlugin.access$2000(this$0).get(paramObject);
      if (((String)paramObject).equals("*")) {
        return AdobeAnalyticsPlugin.access$2100(this$0);
      }
    } while ((AdobeAnalyticsPlugin.access$2100(this$0) == null) || (!AdobeAnalyticsPlugin.access$2100(this$0).containsKey(paramObject)));
    return (String)AdobeAnalyticsPlugin.access$2100(this$0).get(paramObject);
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin.16
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */