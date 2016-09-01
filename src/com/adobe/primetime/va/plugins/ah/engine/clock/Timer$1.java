package com.adobe.primetime.va.plugins.ah.engine.clock;

import com.adobe.primetime.core.ICallback;
import java.util.HashMap;

class Timer$1
  implements ICallback
{
  Timer$1(Timer paramTimer) {}
  
  public Object call(Object paramObject)
  {
    HashMap localHashMap = (HashMap)paramObject;
    Boolean localBoolean = Boolean.valueOf(false);
    paramObject = localBoolean;
    if (localHashMap != null)
    {
      paramObject = localBoolean;
      if (localHashMap.containsKey("reset")) {
        paramObject = (Boolean)localHashMap.get("reset");
      }
    }
    this$0.resume((Boolean)paramObject);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.clock.Timer.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */