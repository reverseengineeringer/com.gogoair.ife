package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AssetDao;
import com.adobe.primetime.va.plugins.ah.engine.model.report.TrackItem;
import java.util.HashMap;
import java.util.Map;

class Context$14
  implements ICallback
{
  Context$14(Context paramContext) {}
  
  public Object call(Object paramObject)
  {
    Map localMap;
    synchronized (Context.access$200(this$0))
    {
      Context.access$100(this$0).debug(Context.access$000(this$0), "#_onApiAdComplete()");
      localMap = (Map)((Event)paramObject).getData();
      if (!Context.access$300(this$0, "_onApiAdComplete")) {
        return null;
      }
      if (!Context.access$400(this$0).validateFields((HashMap)localMap, new String[] { "playhead" })) {
        return null;
      }
    }
    if (this$0._assetData.getType() != "ad")
    {
      Context.access$100(this$0).warn(Context.access$000(this$0), "#_onApiAdComplete() > Ignoring the ad complete event, because we are no longer in an ad.");
      return null;
    }
    if ((localMap.get("_eventData") != null) && ((localMap.get("_eventData") instanceof HashMap))) {}
    for (paramObject = (ICallback)((HashMap)localMap.get("_eventData")).get("callback");; paramObject = null)
    {
      paramObject = new TrackItem(Context.access$200(this$0), "complete", ((Double)localMap.get("playhead")).doubleValue(), null, (ICallback)paramObject);
      Context.access$700(this$0, (TrackItem)paramObject);
      this$0._assetData.setAdData(null);
      this$0._assetData.setType("main");
      Context.access$1002(this$0, this$0._assetData.getVideoId());
      return null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.14
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */