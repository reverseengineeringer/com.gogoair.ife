package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.HashMap;

class VideoPlayerPlugin$3
  implements ICallback
{
  VideoPlayerPlugin$3(VideoPlayerPlugin paramVideoPlayerPlugin) {}
  
  public Object call(Object paramObject)
  {
    HashMap localHashMap = (HashMap)paramObject;
    if (localHashMap.containsKey("pod")) {
      return localHashMap.get("pod");
    }
    localHashMap.put("pod", VideoPlayerPlugin.access$000(this$0).getAdBreakInfo());
    VideoPlayerPlugin.access$600(this$0).info(VideoPlayerPlugin.access$500(this$0), "Data from delegate > AdBreakInfo: " + ((HashMap)paramObject).get("pod"));
    return localHashMap.get("pod");
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */