package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.utils.MD5;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AssetDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.ChapterDao;
import com.adobe.primetime.va.plugins.ah.engine.model.report.TrackItem;
import java.util.HashMap;
import java.util.Map;

class Context$15
  implements ICallback
{
  Context$15(Context paramContext) {}
  
  public Object call(Object paramObject)
  {
    Map localMap;
    synchronized (Context.access$200(this$0))
    {
      localMap = (Map)((Event)paramObject).getData();
      Context.access$100(this$0).debug(Context.access$000(this$0), "#_onApiChapterStart(name=" + localMap.get("chapterName") + ", length=" + localMap.get("chapterLength") + ", position=" + localMap.get("chapterPosition") + ", chapter_offset=" + localMap.get("chapterOffset") + ")");
      if (!Context.access$300(this$0, "_onApiChapterStart")) {
        return null;
      }
      if (!Context.access$400(this$0).validateFields((HashMap)localMap, new String[] { "playhead", "chapterPosition", "chapterOffset", "chapterLength" })) {
        return null;
      }
    }
    paramObject = new ChapterDao();
    ((ChapterDao)paramObject).setId(MD5.hash(this$0._assetData.getVideoId()) + "_" + localMap.get("chapterPosition"));
    ((ChapterDao)paramObject).setName((String)localMap.get("chapterName"));
    ((ChapterDao)paramObject).setLength(((Double)localMap.get("chapterLength")).doubleValue());
    ((ChapterDao)paramObject).setPosition(((Long)localMap.get("chapterPosition")).longValue());
    ((ChapterDao)paramObject).setOffset(((Double)localMap.get("chapterOffset")).doubleValue());
    ((ChapterDao)paramObject).setSid(Context.access$1100());
    this$0._assetData.setChapterData((ChapterDao)paramObject);
    Context.access$500(this$0, localMap);
    if (localMap.get("metaVideo") != null) {}
    for (paramObject = new HashMap((HashMap)localMap.get("metaVideo"));; paramObject = null)
    {
      Object localObject = paramObject;
      if (localMap.get("metaChapter") != null)
      {
        localObject = (HashMap)localMap.get("metaChapter");
        if (paramObject != null)
        {
          ((HashMap)paramObject).putAll((Map)localObject);
          localObject = paramObject;
        }
      }
      else
      {
        if ((localMap.get("_eventData") == null) || (!(localMap.get("_eventData") instanceof HashMap))) {
          break label539;
        }
      }
      label539:
      for (paramObject = (ICallback)((HashMap)localMap.get("_eventData")).get("callback");; paramObject = null)
      {
        paramObject = new TrackItem(Context.access$200(this$0), "chapter_start", ((Double)localMap.get("playhead")).doubleValue(), localObject, (ICallback)paramObject);
        ((TrackItem)paramObject).getAssetDao().setAdData(null);
        ((TrackItem)paramObject).getAssetDao().setType("main");
        Context.access$700(this$0, (TrackItem)paramObject);
        return null;
        localObject = new HashMap((Map)localObject);
        break;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.15
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */