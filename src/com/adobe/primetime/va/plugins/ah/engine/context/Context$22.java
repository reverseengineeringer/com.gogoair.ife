package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.SessionDao;

class Context$22
  implements ICallback
{
  Context$22(Context paramContext) {}
  
  public Object call(Object paramObject)
  {
    if ((this$0._sessionData != null) && (this$0._sessionData.getSessionId() != null)) {
      return this$0._sessionData.getSessionId();
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.22
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */