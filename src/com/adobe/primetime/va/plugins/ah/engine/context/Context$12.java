package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.utils.MD5;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AdDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AssetDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.ChapterDao;
import java.util.HashMap;
import java.util.Map;

class Context$12
  implements ICallback
{
  Context$12(Context paramContext) {}
  
  public Object call(Object paramObject)
  {
    synchronized (Context.access$200(this$0))
    {
      Context.access$100(this$0).debug(Context.access$000(this$0), "#_onApiSeekComplete()");
      paramObject = (Map)((Event)paramObject).getData();
      if (!Context.access$300(this$0, "_onApiSeekComplete")) {
        return null;
      }
      if (!Context.access$400(this$0).validateFields((HashMap)paramObject, new String[] { "playhead" })) {
        return null;
      }
    }
    Object localObject;
    if (((Boolean)((Map)paramObject).get("isInAd")).booleanValue())
    {
      if (!Context.access$400(this$0).validateFields((HashMap)paramObject, new String[] { "adId", "adPosition", "podPosition", "podPlayerName" })) {
        return null;
      }
      localObject = MD5.hash(this$0._assetData.getVideoId()) + "_" + ((Map)paramObject).get("podPosition");
      if ((Context.access$1300(this$0) != null) && (Context.access$1300(this$0).getPodId() == localObject) && (Long.parseLong(Context.access$1300(this$0).getPodPosition(), 10) == Long.parseLong(((Map)paramObject).get("adPosition").toString())))
      {
        this$0._assetData.setAdData(Context.access$1300(this$0));
        Context.access$1002(this$0, Context.access$1300(this$0).getAdId());
        this$0._assetData.setType("ad");
      }
    }
    for (;;)
    {
      if (((Boolean)((Map)paramObject).get("isInChapter")).booleanValue())
      {
        if (!Context.access$400(this$0).validateFields((HashMap)paramObject, new String[] { "chapterPosition", "chapterLength", "chapterOffset" }))
        {
          return null;
          if (this$0._assetData.getAdData() != null) {
            break;
          }
          Context.access$1002(this$0, (String)((Map)paramObject).get("adId"));
          AdDao localAdDao = new AdDao();
          localAdDao.setAdId(Context.access$1000(this$0));
          localAdDao.setAdName((String)((Map)paramObject).get("adName"));
          localAdDao.setAdLength(((Double)((Map)paramObject).get("adLength")).longValue());
          localAdDao.setPodId((String)localObject);
          localAdDao.setResolver((String)((Map)paramObject).get("podPlayerName"));
          localAdDao.setPodPosition(String.valueOf(((Map)paramObject).get("podPosition")));
          localAdDao.setPodName(((Map)paramObject).get("podName").toString());
          localAdDao.setPodOffset(((Double)((Map)paramObject).get("podSecond")).longValue());
          localAdDao.setSid(Context.access$1100());
          this$0._assetData.setAdData(localAdDao);
          break;
          this$0._assetData.setAdData(null);
          this$0._assetData.setType("main");
          Context.access$1002(this$0, this$0._assetData.getVideoId());
          continue;
        }
        if ((Context.access$1400(this$0) != null) && (Long.parseLong(String.valueOf(((Map)paramObject).get("chapterPosition"))) == Context.access$1400(this$0).getPosition())) {
          this$0._assetData.setChapterData(Context.access$1400(this$0));
        }
      }
    }
    for (;;)
    {
      Context.access$1302(this$0, null);
      Context.access$1402(this$0, null);
      return null;
      if (this$0._assetData.getChapterData() == null)
      {
        localObject = new ChapterDao();
        ((ChapterDao)localObject).setId(MD5.hash(this$0._assetData.getVideoId()) + "_" + ((Map)paramObject).get("chapterPosition"));
        ((ChapterDao)localObject).setName((String)((Map)paramObject).get("chapterName"));
        ((ChapterDao)localObject).setLength(((Double)((Map)paramObject).get("chapterLength")).doubleValue());
        ((ChapterDao)localObject).setPosition(((Long)((Map)paramObject).get("chapterPosition")).longValue());
        ((ChapterDao)localObject).setOffset(((Double)((Map)paramObject).get("chapterOffset")).doubleValue());
        ((ChapterDao)localObject).setSid(Context.access$1100());
        this$0._assetData.setChapterData((ChapterDao)localObject);
        continue;
        this$0._assetData.setChapterData(null);
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.12
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */