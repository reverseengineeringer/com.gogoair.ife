package com.adobe.primetime.va.service.clock;

import com.adobe.primetime.core.ICallback;
import java.util.HashMap;

class ClockService$4
  implements ICallback
{
  ClockService$4(ClockService paramClockService) {}
  
  public Object call(Object paramObject)
  {
    ClockService.access$000(this$0).destroyTimer((String)((HashMap)paramObject).get("name"));
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.service.clock.ClockService.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */