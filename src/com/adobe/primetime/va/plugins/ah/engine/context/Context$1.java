package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.radio.Channel;
import com.adobe.primetime.va.ErrorInfo;

class Context$1
  implements ICallback
{
  Context$1(Context paramContext) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (ErrorInfo)paramObject;
    Context.access$100(this$0).error(Context.access$000(this$0), ((ErrorInfo)paramObject).getMessage() + " | " + ((ErrorInfo)paramObject).getDetails());
    this$0._channel.trigger(new Event("error", paramObject));
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */