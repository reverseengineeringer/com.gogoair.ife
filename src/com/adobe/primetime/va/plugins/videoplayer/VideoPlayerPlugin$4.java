package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.HashMap;

class VideoPlayerPlugin$4
  implements ICallback
{
  VideoPlayerPlugin$4(VideoPlayerPlugin paramVideoPlayerPlugin) {}
  
  public Object call(Object paramObject)
  {
    HashMap localHashMap = (HashMap)paramObject;
    if (localHashMap.containsKey("chapter")) {
      return localHashMap.get("chapter");
    }
    localHashMap.put("chapter", VideoPlayerPlugin.access$000(this$0).getChapterInfo());
    VideoPlayerPlugin.access$800(this$0).info(VideoPlayerPlugin.access$700(this$0), "Data from delegate > ChapterInfo: " + ((HashMap)paramObject).get("chapter"));
    return localHashMap.get("chapter");
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */