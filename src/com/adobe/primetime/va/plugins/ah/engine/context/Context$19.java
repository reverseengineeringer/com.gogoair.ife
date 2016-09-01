package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.EventDao;
import com.adobe.primetime.va.plugins.ah.engine.model.report.TrackItem;
import java.util.Map;

class Context$19
  implements ICallback
{
  Context$19(Context paramContext) {}
  
  public Object call(Object paramObject)
  {
    synchronized (Context.access$200(this$0))
    {
      paramObject = (Map)((Event)paramObject).getData();
      Context.access$100(this$0).debug(Context.access$000(this$0), "#_onApiTrackInternalError(source=" + ((Map)paramObject).get("source") + ", err_id=" + ((Map)paramObject).get("error_id") + ")");
      Context.access$500(this$0, (Map)paramObject);
      TrackItem localTrackItem = new TrackItem(Context.access$200(this$0), "error", 0.0D, null, null);
      localTrackItem.getEventDao().setId((String)((Map)paramObject).get("error_id"));
      localTrackItem.getEventDao().setSource((String)((Map)paramObject).get("source"));
      Context.access$700(this$0, localTrackItem);
      return null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.19
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */