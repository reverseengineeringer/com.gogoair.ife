package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AssetDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.CUserDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.UserDao;
import com.adobe.primetime.va.plugins.ah.engine.model.report.TrackItem;
import java.util.HashMap;
import java.util.Map;

class Context$2
  implements ICallback
{
  Context$2(Context paramContext) {}
  
  public Object call(Object paramObject)
  {
    Map localMap;
    synchronized (Context.access$200(this$0))
    {
      localMap = (Map)((Event)paramObject).getData();
      Context.access$100(this$0).debug(Context.access$000(this$0), "#_onApiAnalyticsStart");
      if (!Context.access$300(this$0, "_onApiAnalyticsStart")) {
        return null;
      }
      if (!Context.access$400(this$0).validateFields((HashMap)localMap, new String[] { "playhead" })) {
        return null;
      }
    }
    this$0._userData.setVisitorId((String)localMap.get("vid"));
    this$0._userData.setAnalyticsVisitorId((String)localMap.get("aid"));
    this$0._userData.setMarketingCloudVisitorId((String)localMap.get("mid"));
    this$0._cuserData = new CUserDao();
    this$0._cuserData.setDpid((String)localMap.get("dpid"));
    this$0._cuserData.setDpuuid((String)localMap.get("dpuuid"));
    Context.access$500(this$0, localMap);
    if ((localMap.get("_eventData") != null) && ((localMap.get("_eventData") instanceof HashMap))) {}
    for (paramObject = (ICallback)((HashMap)localMap.get("_eventData")).get("callback");; paramObject = null)
    {
      paramObject = new TrackItem(Context.access$200(this$0), "aa_start", ((Double)localMap.get("playhead")).doubleValue(), null, (ICallback)paramObject);
      ((TrackItem)paramObject).getAssetDao().setAdData(null);
      ((TrackItem)paramObject).getAssetDao().setType("main");
      if ((!Context.access$600(this$0)) && (((TrackItem)paramObject).getAssetDao() != null)) {
        ((TrackItem)paramObject).getAssetDao().setChapterData(null);
      }
      this$0._cuserData = null;
      Context.access$700(this$0, (TrackItem)paramObject);
      return null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */