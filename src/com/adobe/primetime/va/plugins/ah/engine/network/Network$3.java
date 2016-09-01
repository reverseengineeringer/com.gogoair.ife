package com.adobe.primetime.va.plugins.ah.engine.network;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.URLLoader;
import com.adobe.primetime.core.URLLoader.HttpMethod;
import com.adobe.primetime.core.URLLoader.URLRequest;
import java.util.Date;

class Network$3
  implements ICallback
{
  Network$3(Network paramNetwork) {}
  
  public Object call(Object paramObject)
  {
    if (!Network.access$700(this$0))
    {
      Network.access$100(this$0).warn(Network.access$000(this$0), "#_onClockCheckStatusTick() - Unable to send request: not configured.");
      return null;
    }
    if (Network.access$500(this$0) == null)
    {
      Network.access$100(this$0).warn(Network.access$000(this$0), "#_onClockCheckStatusTick() > Publisher is NULL.");
      return null;
    }
    paramObject = new Network.3.1(this);
    Network.3.2 local2 = new Network.3.2(this);
    String str = Network.access$500(this$0).replaceAll("[^a-zA-Z0-9]+", "-").toLowerCase();
    str = Network.access$400(this$0) + str + ".xml?r=" + new Date().getTime();
    URLLoader.URLRequest localURLRequest = new URLLoader.URLRequest(str, URLLoader.HttpMethod.GET);
    URLLoader localURLLoader = new URLLoader(Network.access$100(this$0));
    localURLLoader.on("success", (ICallback)paramObject);
    localURLLoader.on("error", local2);
    Network.access$100(this$0).debug(Network.access$000(this$0), "#_onClockCheckStatusTick() - Get new settings from: " + str);
    localURLLoader.load(localURLRequest);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.network.Network.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */