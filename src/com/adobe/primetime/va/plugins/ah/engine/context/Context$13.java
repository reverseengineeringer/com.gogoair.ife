package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.utils.MD5;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AdDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AssetDao;
import com.adobe.primetime.va.plugins.ah.engine.model.report.TrackItem;
import java.util.HashMap;
import java.util.Map;

class Context$13
  implements ICallback
{
  Context$13(Context paramContext) {}
  
  public Object call(Object paramObject)
  {
    Map localMap;
    synchronized (Context.access$200(this$0))
    {
      localMap = (Map)((Event)paramObject).getData();
      Context.access$100(this$0).debug(Context.access$000(this$0), "#_onApiAdStart(id=" + localMap.get("adId") + ", player_name=" + localMap.get("podPlayerName") + ", parent_name=" + this$0._assetData.getVideoId() + ", pod_pos=" + localMap.get("adPosition") + ")");
      if (!Context.access$300(this$0, "_onApiAdStart")) {
        return null;
      }
      if (!Context.access$400(this$0).validateFields((HashMap)localMap, new String[] { "playhead", "podPosition", "podPlayerName", "adId", "adPosition" })) {
        return null;
      }
    }
    Context.access$1002(this$0, (String)localMap.get("adId"));
    paramObject = new AdDao();
    ((AdDao)paramObject).setAdId(Context.access$1000(this$0));
    ((AdDao)paramObject).setAdName((String)localMap.get("adName"));
    ((AdDao)paramObject).setAdLength(((Double)localMap.get("adLength")).longValue());
    ((AdDao)paramObject).setResolver((String)localMap.get("podPlayerName"));
    ((AdDao)paramObject).setPodId(MD5.hash(this$0._assetData.getVideoId()) + "_" + localMap.get("podPosition"));
    ((AdDao)paramObject).setPodPosition(localMap.get("adPosition").toString());
    ((AdDao)paramObject).setPodName(localMap.get("podName").toString());
    ((AdDao)paramObject).setPodOffset(((Double)localMap.get("podSecond")).longValue());
    ((AdDao)paramObject).setSid(Context.access$1100());
    this$0._assetData.setAdData((AdDao)paramObject);
    this$0._assetData.setType("ad");
    Context.access$500(this$0, localMap);
    if (localMap.get("metaVideo") != null) {}
    for (paramObject = new HashMap((HashMap)localMap.get("metaVideo"));; paramObject = null)
    {
      Object localObject = paramObject;
      if (localMap.get("metaAd") != null)
      {
        localObject = (HashMap)localMap.get("metaAd");
        if (paramObject != null)
        {
          ((HashMap)paramObject).putAll((Map)localObject);
          localObject = paramObject;
        }
      }
      else
      {
        if ((localMap.get("_eventData") == null) || (!(localMap.get("_eventData") instanceof HashMap))) {
          break label601;
        }
      }
      label601:
      for (paramObject = (ICallback)((HashMap)localMap.get("_eventData")).get("callback");; paramObject = null)
      {
        paramObject = new TrackItem(Context.access$200(this$0), "start", ((Double)localMap.get("playhead")).doubleValue(), localObject, (ICallback)paramObject);
        Context.access$700(this$0, (TrackItem)paramObject);
        return null;
        localObject = (HashMap)((HashMap)localObject).clone();
        break;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.13
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */