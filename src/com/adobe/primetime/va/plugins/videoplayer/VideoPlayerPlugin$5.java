package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.HashMap;

class VideoPlayerPlugin$5
  implements ICallback
{
  VideoPlayerPlugin$5(VideoPlayerPlugin paramVideoPlayerPlugin) {}
  
  public Object call(Object paramObject)
  {
    HashMap localHashMap = (HashMap)paramObject;
    if (localHashMap.containsKey("qos")) {
      return ((HashMap)paramObject).get("qos");
    }
    localHashMap.put("qos", VideoPlayerPlugin.access$000(this$0).getQoSInfo());
    VideoPlayerPlugin.access$1000(this$0).info(VideoPlayerPlugin.access$900(this$0), "Data from delegate > QoSInfo: " + ((HashMap)paramObject).get("qos"));
    return localHashMap.get("qos");
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */