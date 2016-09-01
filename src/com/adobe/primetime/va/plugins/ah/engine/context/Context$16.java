package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AssetDao;
import com.adobe.primetime.va.plugins.ah.engine.model.report.TrackItem;
import java.util.HashMap;
import java.util.Map;

class Context$16
  implements ICallback
{
  Context$16(Context paramContext) {}
  
  public Object call(Object paramObject)
  {
    Map localMap;
    synchronized (Context.access$200(this$0))
    {
      localMap = (Map)((Event)paramObject).getData();
      Context.access$100(this$0).debug(Context.access$000(this$0), "#_onApiChapterComplete()");
      if (!Context.access$300(this$0, "_onApiChapterComplete")) {
        return null;
      }
      if (!Context.access$400(this$0).validateFields((HashMap)localMap, new String[] { "playhead" })) {
        return null;
      }
    }
    if (this$0._assetData.getChapterData() == null)
    {
      Context.access$100(this$0).warn(Context.access$000(this$0), "#_onApiChapterComplete() > Ignoring the chapter complete event, because we are no longer in a chapter.");
      return null;
    }
    Context.access$500(this$0, localMap);
    if ((localMap.get("_eventData") != null) && ((localMap.get("_eventData") instanceof HashMap))) {}
    for (paramObject = (ICallback)((HashMap)localMap.get("_eventData")).get("callback");; paramObject = null)
    {
      paramObject = new TrackItem(Context.access$200(this$0), "chapter_complete", ((Double)localMap.get("playhead")).doubleValue(), null, (ICallback)paramObject);
      ((TrackItem)paramObject).getAssetDao().setAdData(null);
      ((TrackItem)paramObject).getAssetDao().setType("main");
      Context.access$700(this$0, (TrackItem)paramObject);
      this$0._assetData.setChapterData(null);
      return null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.16
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */