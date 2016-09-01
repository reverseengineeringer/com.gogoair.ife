package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AdobeAnalyticsDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AssetDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.ServiceProviderDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.SessionDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.StreamDao;
import com.adobe.primetime.va.plugins.ah.engine.model.report.TrackItem;
import java.util.HashMap;
import java.util.Map;

class Context$6
  implements ICallback
{
  Context$6(Context paramContext) {}
  
  public Object call(Object paramObject)
  {
    Map localMap;
    synchronized (Context.access$200(this$0))
    {
      localMap = (Map)((Event)paramObject).getData();
      Context.access$100(this$0).debug(Context.access$000(this$0), "#_onApiVideoStart(id=" + localMap.get("videoId") + ", name=" + localMap.get("videoName") + ", length=" + localMap.get("videoLength") + ", type=" + localMap.get("streamType") + ", playerName=" + localMap.get("playerName") + ")");
      if (!Context.access$300(this$0, "_onApiVideoStart")) {
        return null;
      }
      if (!Context.access$400(this$0).validateFields((HashMap)localMap, new String[] { "videoId", "streamType", "videoLength", "playhead", "playerName" })) {
        return null;
      }
    }
    this$0._adobeAnalyticsData.setReportSuiteId((String)localMap.get("rsid"));
    this$0._adobeAnalyticsData.setTrackingServer((String)localMap.get("trackingServer"));
    this$0._adobeAnalyticsData.setSsl((Boolean)localMap.get("useSsl"));
    this$0._serviceProviderData.setOvp((String)localMap.get("ovp"));
    this$0._serviceProviderData.setSdk((String)localMap.get("sdk"));
    this$0._serviceProviderData.setChannel((String)localMap.get("channel"));
    this$0._serviceProviderData.setLibVersion((String)localMap.get("version"));
    this$0._serviceProviderData.setApiLevel(((Integer)localMap.get("apiLvl")).longValue());
    Context.access$1002(this$0, (String)localMap.get("videoId"));
    this$0._serviceProviderData.setPlayerName((String)localMap.get("playerName"));
    this$0._assetData.setVideoId(Context.access$1000(this$0));
    this$0._assetData.setDuration(((Double)localMap.get("videoLength")).doubleValue());
    this$0._assetData.setType("main");
    this$0._assetData.setPublisher((String)localMap.get("publisher"));
    this$0._assetData.setName((String)localMap.get("videoName"));
    this$0._streamData.setType((String)localMap.get("streamType"));
    this$0._sessionData.setSessionId(Context.access$1100());
    Context.access$500(this$0, localMap);
    if ((localMap.get("_eventData") != null) && ((localMap.get("_eventData") instanceof HashMap))) {}
    for (paramObject = (ICallback)((HashMap)localMap.get("_eventData")).get("callback");; paramObject = null)
    {
      paramObject = new TrackItem(Context.access$200(this$0), "start", ((Double)localMap.get("playhead")).doubleValue(), localMap.get("metaVideo"), (ICallback)paramObject);
      Context.access$700(this$0, (TrackItem)paramObject);
      return null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */