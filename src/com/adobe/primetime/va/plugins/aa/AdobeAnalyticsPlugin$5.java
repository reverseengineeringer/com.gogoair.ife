package com.adobe.primetime.va.plugins.aa;

import com.adobe.mobile.Analytics;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

class AdobeAnalyticsPlugin$5
  implements ICallback
{
  AdobeAnalyticsPlugin$5(AdobeAnalyticsPlugin paramAdobeAnalyticsPlugin) {}
  
  public Object call(Object paramObject)
  {
    HashMap localHashMap1 = (HashMap)paramObject;
    AdobeAnalyticsPlugin.access$1100(this$0).debug(AdobeAnalyticsPlugin.access$1000(this$0), "#_executeOpen(id=" + localHashMap1.get("videoId") + ", videoName=" + localHashMap1.get("videoName") + ", length=" + localHashMap1.get("videoLength") + ", playerName=" + localHashMap1.get("playerName") + ", channel=" + localHashMap1.get("channel") + ", isPrimetime=" + localHashMap1.get("isPrimetime") + ")");
    if (!this$0._canProcess()) {}
    while (!AdobeAnalyticsPlugin.access$1200(this$0).validateFields(localHashMap1, new String[] { "videoId", "streamType", "videoLength", "playerName" })) {
      return null;
    }
    paramObject = (HashMap)localHashMap1.get("metaVideo");
    HashMap localHashMap2 = new HashMap();
    if (paramObject != null)
    {
      Iterator localIterator = ((HashMap)paramObject).keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        localHashMap2.put(str, ((HashMap)paramObject).get(str));
        AdobeAnalyticsPlugin.access$1300(this$0).add(str);
      }
    }
    localHashMap2.put("a.contentType", localHashMap1.get("streamType"));
    localHashMap2.put("a.media.name", localHashMap1.get("videoId"));
    if (localHashMap1.get("videoName") != null) {
      paramObject = localHashMap1.get("videoName");
    }
    for (;;)
    {
      localHashMap2.put("a.media.friendlyName", paramObject);
      if (localHashMap1.get("videoLength") == null)
      {
        paramObject = "0.0";
        label319:
        localHashMap2.put("a.media.length", paramObject);
        localHashMap2.put("a.media.playerName", localHashMap1.get("playerName"));
        if (localHashMap1.get("channel") == null) {
          break label482;
        }
        paramObject = localHashMap1.get("channel");
        label356:
        localHashMap2.put("a.media.channel", paramObject);
        localHashMap2.put("a.media.view", String.valueOf(true));
        localHashMap2.put("&&pev3", "video");
        if (!((Boolean)localHashMap1.get("isPrimetime")).booleanValue()) {
          break label488;
        }
        paramObject = "msp_s";
        localHashMap2.put("&&pe", paramObject);
        localHashMap2.put("&&cid.userId.id", localHashMap1.get("dpid"));
        localHashMap2.put("&&cid.puuid.id", localHashMap1.get("dpuuid"));
        Analytics.trackAction(null, localHashMap2);
      }
      try
      {
        Thread.sleep(0L);
        AdobeAnalyticsPlugin.access$1400(this$0, "aa_start", localHashMap1);
        return null;
        paramObject = "";
        continue;
        paramObject = Long.valueOf(((Double)localHashMap1.get("videoLength")).longValue());
        break label319;
        label482:
        paramObject = "";
        break label356;
        label488:
        paramObject = "ms_s";
      }
      catch (InterruptedException paramObject)
      {
        for (;;)
        {
          ((InterruptedException)paramObject).printStackTrace();
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */