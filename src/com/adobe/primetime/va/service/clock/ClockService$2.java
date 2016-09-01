package com.adobe.primetime.va.service.clock;

import com.adobe.primetime.core.ICallback;
import java.util.HashMap;

class ClockService$2
  implements ICallback
{
  ClockService$2(ClockService paramClockService) {}
  
  public Object call(Object paramObject)
  {
    TimerManager localTimerManager = ClockService.access$000(this$0);
    String str = (String)((HashMap)paramObject).get("name");
    if (((HashMap)paramObject).get("reset") != null) {}
    for (boolean bool = true;; bool = false)
    {
      localTimerManager.pauseTimer(str, bool);
      return null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.service.clock.ClockService.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */