package com.adobe.primetime.va.plugins.ah.engine.network;

import com.adobe.primetime.core.ICallback;
import java.util.HashMap;

class Network$2$2
  implements ICallback
{
  Network$2$2(Network.2 param2, HashMap paramHashMap) {}
  
  public Object call(Object paramObject)
  {
    if ((val$payload != null) && (val$payload.get("callback") != null)) {
      ((ICallback)val$payload.get("callback")).call(null);
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.network.Network.2.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */