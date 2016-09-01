package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$7
  implements ICallback
{
  VideoPlayerPlugin$7(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (VideoInfo)VideoPlayerPlugin.access$1100(this$0).call(val$cachedData);
    if (paramObject != null) {}
    for (paramObject = name;; paramObject = null)
    {
      VideoPlayerPlugin.access$1500(this$0).debug(VideoPlayerPlugin.access$1400(this$0), "Resolving video.name: " + (String)paramObject);
      return paramObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.7
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */