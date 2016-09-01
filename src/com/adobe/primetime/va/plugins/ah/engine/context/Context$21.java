package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class Context$21
  implements ICallback
{
  Context$21(Context paramContext) {}
  
  public Object call(Object paramObject)
  {
    synchronized (Context.access$200(this$0))
    {
      paramObject = (Map)((Event)paramObject).getData();
      Context.access$1502(this$0, ((Boolean)((Map)paramObject).get("track_external_errors")).booleanValue());
      Context.access$100(this$0).debug(Context.access$000(this$0), "#_onNetworkCheckStatusComplete(track_ext_err=" + Context.access$1500(this$0) + ")");
      return null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.21
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */