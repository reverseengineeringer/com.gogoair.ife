package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AssetDao;
import com.adobe.primetime.va.plugins.ah.engine.model.report.TrackItem;
import java.util.HashMap;
import java.util.Map;

class Context$7
  implements ICallback
{
  Context$7(Context paramContext) {}
  
  public Object call(Object paramObject)
  {
    for (;;)
    {
      synchronized (Context.access$200(this$0))
      {
        paramObject = (Map)((Event)paramObject).getData();
        Context.access$100(this$0).debug(Context.access$000(this$0), "#_onApiVideoComplete()");
        if (!Context.access$300(this$0, "_onApiVideoComplete")) {
          return null;
        }
        if ((((Map)paramObject).get("_eventData") != null) && ((((Map)paramObject).get("_eventData") instanceof HashMap)))
        {
          paramObject = (ICallback)((HashMap)((Map)paramObject).get("_eventData")).get("callback");
          paramObject = new TrackItem(Context.access$200(this$0), "complete", this$0._assetData.getDuration(), null, (ICallback)paramObject);
          Context.access$700(this$0, (TrackItem)paramObject);
          Context.access$1202(this$0, true);
          return null;
        }
      }
      paramObject = null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.7
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */