package com.adobe.primetime.va.plugins.ah.engine.network;

import com.adobe.mobile.Config;
import com.adobe.mobile.MobilePrivacyStatus;
import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.URLLoader;
import com.adobe.primetime.core.URLLoader.HttpMethod;
import com.adobe.primetime.core.URLLoader.URLRequest;
import com.adobe.primetime.va.plugins.ah.engine.model.report.Report;
import com.adobe.primetime.va.plugins.ah.engine.model.serialization.QueryStringSerializer;
import java.util.HashMap;
import java.util.Map;

class Network$2
  implements ICallback
{
  Network$2(Network paramNetwork) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (Map)((Event)paramObject).getData();
    if (!Network.access$700(this$0)) {
      Network.access$100(this$0).warn(Network.access$000(this$0), "#_onFilterReportAvailable() > Unable to send request: not configured.");
    }
    Object localObject1;
    Network.2.2 local2;
    do
    {
      return null;
      paramObject = (Report)((Map)paramObject).get("report");
      localObject1 = Network.access$800(this$0).serializeReport((Report)paramObject);
      paramObject = new Network.2.1(this, (HashMap)localObject1);
      local2 = new Network.2.2(this, (HashMap)localObject1);
      localObject2 = Network.access$200(this$0) + "/?" + ((HashMap)localObject1).get("serializedOutput");
      localObject1 = new URLLoader.URLRequest((String)localObject2, URLLoader.HttpMethod.GET);
      Network.access$100(this$0).info(Network.access$000(this$0), "_onFilterReportAvailable() > " + (String)localObject2);
    } while ((Network.access$600(this$0)) || (Config.getPrivacyStatus() == MobilePrivacyStatus.MOBILE_PRIVACY_STATUS_OPT_OUT));
    Object localObject2 = new URLLoader(Network.access$100(this$0));
    ((URLLoader)localObject2).on("success", local2);
    ((URLLoader)localObject2).on("error", (ICallback)paramObject);
    ((URLLoader)localObject2).load((URLLoader.URLRequest)localObject1);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.network.Network.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */