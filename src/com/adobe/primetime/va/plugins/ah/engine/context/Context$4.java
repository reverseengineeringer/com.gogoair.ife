package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;

class Context$4
  implements ICallback
{
  Context$4(Context paramContext) {}
  
  public Object call(Object arg1)
  {
    synchronized (Context.access$200(this$0))
    {
      Context.access$100(this$0).debug(Context.access$000(this$0), "#_onApiVideoLoad()");
      Context.access$800(this$0);
      Context.access$902(this$0, true);
      return null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */