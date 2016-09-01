package com.adobe.primetime.va.plugins.ah.engine.clock;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.radio.Channel;

class CheckStatusTimer$2
  implements ICallback
{
  CheckStatusTimer$2(CheckStatusTimer paramCheckStatusTimer) {}
  
  public Object call(Object paramObject)
  {
    this$0._logger.debug(this$0._logTag, "#_getSettings()");
    this$0._channel.trigger(new Event("clock:check_status.tick", null));
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.clock.CheckStatusTimer.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */