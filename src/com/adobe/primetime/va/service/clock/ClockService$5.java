package com.adobe.primetime.va.service.clock;

import com.adobe.primetime.core.ICallback;

class ClockService$5
  implements ICallback
{
  ClockService$5(ClockService paramClockService) {}
  
  public Object call(Object paramObject)
  {
    return Boolean.valueOf(ClockService.access$000(this$0).isTimerPaused((String)paramObject));
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.service.clock.ClockService.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */