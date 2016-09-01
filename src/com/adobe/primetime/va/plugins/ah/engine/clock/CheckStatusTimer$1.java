package com.adobe.primetime.va.plugins.ah.engine.clock;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class CheckStatusTimer$1
  implements ICallback
{
  CheckStatusTimer$1(CheckStatusTimer paramCheckStatusTimer) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (Double)((Map)((Event)paramObject).getData()).get("check_status_interval");
    this$0._logger.debug(this$0._logTag, "#_onCheckStatusComplete(interval=" + paramObject + ")");
    if (paramObject != null)
    {
      if (((Double)paramObject).equals(this$0._interval))
      {
        this$0._logger.debug(this$0._logTag, "#_onCheckStatusComplete() - Interval value not changed.");
        return null;
      }
      if (((Double)paramObject).doubleValue() > 600.0D)
      {
        this$0._logger.warn(this$0._logTag, "#_onCheckStatusComplete() - Interval value too large: " + paramObject);
        this$0.setInterval(600.0D);
        return null;
      }
      this$0._logger.debug(this$0._logTag, "#_onCheckStatusComplete() - Interval changed to: " + paramObject);
      this$0.setInterval(((Double)paramObject).doubleValue());
      return null;
    }
    this$0._logger.warn(this$0._logTag, "#_onCheckStatusComplete() - Invalid interval value.");
    this$0.setInterval(60.0D);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.clock.CheckStatusTimer.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */