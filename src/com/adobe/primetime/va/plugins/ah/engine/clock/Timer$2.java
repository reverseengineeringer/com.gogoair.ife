package com.adobe.primetime.va.plugins.ah.engine.clock;

import com.adobe.primetime.core.ICallback;
import java.util.HashMap;

class Timer$2
  implements ICallback
{
  Timer$2(Timer paramTimer) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (HashMap)paramObject;
    if ((paramObject != null) && (((Boolean)((HashMap)paramObject).get("reset")).booleanValue())) {}
    for (paramObject = (Boolean)((HashMap)paramObject).get("reset");; paramObject = Boolean.valueOf(false))
    {
      this$0.pause((Boolean)paramObject);
      return null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.clock.Timer.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */