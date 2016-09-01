package com.adobe.primetime.va.plugins.ah.engine.network;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;

class Network$3$2
  implements ICallback
{
  Network$3$2(Network.3 param3) {}
  
  public Object call(Object paramObject)
  {
    Network.access$100(this$1.this$0).warn(Network.access$000(this$1.this$0), "#_onClockCheckStatusTick() - Failed to obtain the config. settings.");
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.network.Network.3.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */