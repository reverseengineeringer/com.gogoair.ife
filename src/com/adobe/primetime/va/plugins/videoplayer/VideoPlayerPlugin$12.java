package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$12
  implements ICallback
{
  VideoPlayerPlugin$12(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (AdBreakInfo)VideoPlayerPlugin.access$2400(this$0).call(val$cachedData);
    if (paramObject != null) {}
    for (paramObject = name;; paramObject = null)
    {
      VideoPlayerPlugin.access$2600(this$0).debug(VideoPlayerPlugin.access$2500(this$0), "Resolving pod.name: " + (String)paramObject);
      return paramObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.12
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */