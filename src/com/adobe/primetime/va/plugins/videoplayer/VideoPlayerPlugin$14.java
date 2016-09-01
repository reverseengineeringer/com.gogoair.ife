package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$14
  implements ICallback
{
  VideoPlayerPlugin$14(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (AdBreakInfo)VideoPlayerPlugin.access$2400(this$0).call(val$cachedData);
    if (paramObject != null) {}
    for (paramObject = position;; paramObject = null)
    {
      VideoPlayerPlugin.access$3000(this$0).debug(VideoPlayerPlugin.access$2900(this$0), "Resolving pod.position: " + paramObject);
      return paramObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.14
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */