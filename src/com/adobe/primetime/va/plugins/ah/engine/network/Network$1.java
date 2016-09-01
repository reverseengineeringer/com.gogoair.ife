package com.adobe.primetime.va.plugins.ah.engine.network;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class Network$1
  implements ICallback
{
  Network$1(Network paramNetwork) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (Map)((Event)paramObject).getData();
    Network.access$100(this$0).debug(Network.access$000(this$0), "#_onApiConfig(sb_server=" + ((Map)paramObject).get("tracking_server") + ", check_status_server=" + ((Map)paramObject).get("check_status_server") + ", publisher=" + ((Map)paramObject).get("publisher") + ", quiet_mode=" + ((Map)paramObject).get("quiet_mode") + ", ssl=" + ((Map)paramObject).get("ssl") + ")");
    Network.access$202(this$0, Network.access$300((String)((Map)paramObject).get("tracking_server"), ((Boolean)((Map)paramObject).get("ssl")).booleanValue()));
    Network.access$402(this$0, Network.access$300((String)((Map)paramObject).get("check_status_server"), ((Boolean)((Map)paramObject).get("ssl")).booleanValue()));
    Network.access$502(this$0, (String)((Map)paramObject).get("publisher"));
    Network.access$602(this$0, ((Boolean)((Map)paramObject).get("quiet_mode")).booleanValue());
    Network.access$702(this$0, true);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.network.Network.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */