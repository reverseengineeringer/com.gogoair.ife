package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;

class Context$5
  implements ICallback
{
  Context$5(Context paramContext) {}
  
  public Object call(Object paramObject)
  {
    Context.access$100(this$0).debug(Context.access$000(this$0), "#_onApiVideoUnload()");
    if (!Context.access$900(this$0))
    {
      Context.access$100(this$0).debug(Context.access$000(this$0), "#_onApiVideoUnload() > No active tracking session.");
      return null;
    }
    Context.access$902(this$0, false);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */