package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.HashMap;

class VideoPlayerPlugin$2
  implements ICallback
{
  VideoPlayerPlugin$2(VideoPlayerPlugin paramVideoPlayerPlugin) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (HashMap)paramObject;
    if (((HashMap)paramObject).containsKey("ad")) {
      return ((HashMap)paramObject).get("ad");
    }
    ((HashMap)paramObject).put("ad", VideoPlayerPlugin.access$000(this$0).getAdInfo());
    VideoPlayerPlugin.access$400(this$0).info(VideoPlayerPlugin.access$300(this$0), "Data from delegate > AdInfo: " + ((HashMap)paramObject).get("ad"));
    return ((HashMap)paramObject).get("ad");
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */