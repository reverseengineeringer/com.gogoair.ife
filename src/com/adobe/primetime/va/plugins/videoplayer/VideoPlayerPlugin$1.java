package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.HashMap;

class VideoPlayerPlugin$1
  implements ICallback
{
  VideoPlayerPlugin$1(VideoPlayerPlugin paramVideoPlayerPlugin) {}
  
  public Object call(Object paramObject)
  {
    HashMap localHashMap = (HashMap)paramObject;
    if (localHashMap.containsKey("video")) {
      return ((HashMap)paramObject).get("video");
    }
    localHashMap.put("video", VideoPlayerPlugin.access$000(this$0).getVideoInfo());
    VideoPlayerPlugin.access$200(this$0).info(VideoPlayerPlugin.access$100(this$0), "Data from delegate > VideoInfo: " + localHashMap.get("video"));
    return localHashMap.get("video");
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */