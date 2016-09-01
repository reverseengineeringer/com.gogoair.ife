package com.adobe.primetime.va.plugins.ah.engine.clock;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.radio.Channel;

class Timer$3
  implements ICallback
{
  Timer$3(Timer paramTimer) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (Event)paramObject;
    this$0._channel.trigger(new Event("clock:" + this$0._name + ".tick", ((Event)paramObject).getData()));
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.clock.Timer.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */