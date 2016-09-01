package com.adobe.primetime.va.service.clock;

import com.adobe.primetime.core.ICallback;
import java.util.HashMap;

class ClockService$1
  implements ICallback
{
  ClockService$1(ClockService paramClockService) {}
  
  public Object call(Object paramObject)
  {
    if (((HashMap)paramObject).containsKey("repeat_count")) {}
    for (int i = ((Integer)((HashMap)paramObject).get("repeat_count")).intValue();; i = -1)
    {
      ClockService.access$000(this$0).createTimer((String)((HashMap)paramObject).get("name"), ((Double)((HashMap)paramObject).get("interval")).doubleValue(), i);
      return null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.service.clock.ClockService.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */