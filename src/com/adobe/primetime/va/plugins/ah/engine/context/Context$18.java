package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.EventDao;
import com.adobe.primetime.va.plugins.ah.engine.model.report.TrackItem;
import java.util.HashMap;
import java.util.Map;

class Context$18
  implements ICallback
{
  Context$18(Context paramContext) {}
  
  public Object call(Object paramObject)
  {
    for (;;)
    {
      Map localMap;
      synchronized (Context.access$200(this$0))
      {
        localMap = (Map)((Event)paramObject).getData();
        if ((localMap.get("_eventData") == null) || (!(localMap.get("_eventData") instanceof HashMap))) {
          break label279;
        }
        paramObject = (HashMap)localMap.get("_eventData");
        localObject = (ICallback)((HashMap)paramObject).get("callback");
        if (paramObject != null) {
          Context.access$100(this$0).debug(Context.access$000(this$0), "#_onApiTrackError(source=" + ((HashMap)paramObject).get("source") + ", err_id=" + ((HashMap)paramObject).get("error_id") + ")");
        }
        if (!Context.access$900(this$0))
        {
          Context.access$100(this$0).warn(Context.access$000(this$0), "#_onApiTrackError() > No active tracking session.");
          return null;
        }
        if ((!Context.access$1500(this$0)) && (!((HashMap)paramObject).get("source").equals("sourceErrorSDK"))) {
          return null;
        }
      }
      Context.access$500(this$0, localMap);
      Object localObject = new TrackItem(Context.access$200(this$0), "error", 0.0D, null, (ICallback)localObject);
      ((TrackItem)localObject).getEventDao().setId((String)((HashMap)paramObject).get("error_id"));
      ((TrackItem)localObject).getEventDao().setSource((String)((HashMap)paramObject).get("source"));
      Context.access$700(this$0, (TrackItem)localObject);
      return null;
      label279:
      localObject = null;
      paramObject = null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.18
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */