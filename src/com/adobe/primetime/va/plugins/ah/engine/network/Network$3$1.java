package com.adobe.primetime.va.plugins.ah.engine.network;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.radio.Channel;
import java.util.Map;

class Network$3$1
  implements ICallback
{
  Network$3$1(Network.3 param3) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (String)((Map)((Event)paramObject).getData()).get("server_response");
    if ((paramObject != null) && (!((String)paramObject).equals("")))
    {
      paramObject = new SettingsParser((String)paramObject, Network.access$100(this$1.this$0)).parse();
      if (paramObject != null) {
        Network.access$900(this$1.this$0).trigger(new Event("net:check_status_complete", paramObject));
      }
    }
    for (;;)
    {
      return null;
      Network.access$100(this$1.this$0).warn(Network.access$000(this$1.this$0), "#_onClockCheckStatusTick() > Failed to parse the config. settings.");
      continue;
      Network.access$100(this$1.this$0).warn(Network.access$000(this$1.this$0), "#_onClockCheckStatusTick() > Null or empty config. settings..");
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.network.Network.3.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */