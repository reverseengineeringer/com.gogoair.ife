package com.adobe.primetime.va.plugins.aa;

import com.adobe.mobile.Analytics;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.utils.MD5;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

class AdobeAnalyticsPlugin$6
  implements ICallback
{
  AdobeAnalyticsPlugin$6(AdobeAnalyticsPlugin paramAdobeAnalyticsPlugin) {}
  
  public Object call(Object paramObject)
  {
    HashMap localHashMap1 = (HashMap)paramObject;
    String str1 = MD5.hash((String)localHashMap1.get("videoId")) + "_" + localHashMap1.get("podPosition");
    AdobeAnalyticsPlugin.access$1600(this$0).debug(AdobeAnalyticsPlugin.access$1500(this$0), "#_executeOpenAd(id=" + localHashMap1.get("adId") + ", length=" + localHashMap1.get("adLength") + ", podPlayerName=" + localHashMap1.get("podPlayerName") + ", parentId=" + localHashMap1.get("videoId") + ", podId=" + str1 + ", parentPodPosition=" + localHashMap1.get("adPosition") + ", podSecond=" + localHashMap1.get("podSecond") + ")");
    if (!this$0._canProcess()) {}
    while (!AdobeAnalyticsPlugin.access$1200(this$0).validateFields(localHashMap1, new String[] { "videoId", "streamType", "playerName", "adId", "adLength", "podPlayerName", "adPosition" })) {
      return null;
    }
    if (!(localHashMap1.get("podSecond") instanceof Double)) {}
    Object localObject1;
    HashMap localHashMap2;
    Object localObject2;
    for (paramObject = localHashMap1.get("playhead");; paramObject = localHashMap1.get("podSecond"))
    {
      localHashMap1.put("podSecond", paramObject);
      localObject1 = (HashMap)localHashMap1.get("metaVideo");
      paramObject = (HashMap)localHashMap1.get("metaAd");
      localHashMap2 = new HashMap();
      if (localObject1 == null) {
        break;
      }
      localObject2 = ((HashMap)localObject1).keySet().iterator();
      while (((Iterator)localObject2).hasNext())
      {
        String str2 = (String)((Iterator)localObject2).next();
        localHashMap2.put(str2, ((HashMap)localObject1).get(str2));
        AdobeAnalyticsPlugin.access$1300(this$0).add(str2);
      }
    }
    if (paramObject != null)
    {
      localObject1 = ((HashMap)paramObject).keySet().iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (String)((Iterator)localObject1).next();
        localHashMap2.put(localObject2, ((HashMap)paramObject).get(localObject2));
        AdobeAnalyticsPlugin.access$1300(this$0).add(localObject2);
      }
    }
    localHashMap2.put("a.contentType", localHashMap1.get("streamType"));
    localHashMap2.put("a.media.name", localHashMap1.get("videoId"));
    localHashMap2.put("a.media.playerName", localHashMap1.get("playerName"));
    if (localHashMap1.get("channel") != null) {
      paramObject = localHashMap1.get("channel");
    }
    for (;;)
    {
      localHashMap2.put("a.media.channel", paramObject);
      localHashMap2.put("a.media.ad.name", localHashMap1.get("adId"));
      if (localHashMap1.get("adName") != null)
      {
        paramObject = localHashMap1.get("adName");
        label534:
        localHashMap2.put("a.media.ad.friendlyName", paramObject);
        if (localHashMap1.get("podName") == null) {
          break label769;
        }
        paramObject = localHashMap1.get("podName");
        label558:
        localHashMap2.put("a.media.ad.podFriendlyName", paramObject);
        if (((Double)localHashMap1.get("adLength")).longValue() != 0L) {
          break label775;
        }
        paramObject = "0.0";
        label586:
        localHashMap2.put("a.media.ad.length", paramObject);
        localHashMap2.put("a.media.ad.playerName", localHashMap1.get("podPlayerName"));
        localHashMap2.put("a.media.ad.pod", str1);
        if (localHashMap1.get("adPosition") != null) {
          break label794;
        }
        paramObject = "0.0";
        label628:
        localHashMap2.put("a.media.ad.podPosition", paramObject);
        if (((Double)localHashMap1.get("podSecond")).longValue() != 0L) {
          break label807;
        }
        paramObject = "0.0";
        label656:
        localHashMap2.put("a.media.ad.podSecond", paramObject);
        localHashMap2.put("a.media.ad.view", String.valueOf(true));
        localHashMap2.put("&&pev3", "videoAd");
        if (!((Boolean)localHashMap1.get("isPrimetime")).booleanValue()) {
          break label826;
        }
        paramObject = "mspa_s";
        localHashMap2.put("&&pe", paramObject);
        localHashMap2.put("&&cid.userId.id", localHashMap1.get("dpid"));
        localHashMap2.put("&&cid.puuid.id", localHashMap1.get("dpuuid"));
        Analytics.trackAction(null, localHashMap2);
      }
      try
      {
        Thread.sleep(0L);
        AdobeAnalyticsPlugin.access$1700(this$0, "sc_ad_start", localHashMap1);
        return null;
        paramObject = "";
        continue;
        paramObject = "";
        break label534;
        label769:
        paramObject = "";
        break label558;
        label775:
        paramObject = Long.valueOf(((Double)localHashMap1.get("adLength")).longValue());
        break label586;
        label794:
        paramObject = (Long)localHashMap1.get("adPosition");
        break label628;
        label807:
        paramObject = Long.valueOf(((Double)localHashMap1.get("podSecond")).longValue());
        break label656;
        label826:
        paramObject = "msa_s";
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
 * Qualified Name:     com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */