package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$8
  implements ICallback
{
  VideoPlayerPlugin$8(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (VideoInfo)VideoPlayerPlugin.access$1100(this$0).call(val$cachedData);
    if (paramObject != null) {}
    for (paramObject = length;; paramObject = null)
    {
      VideoPlayerPlugin.access$1700(this$0).debug(VideoPlayerPlugin.access$1600(this$0), "Resolving video.length: " + paramObject);
      return paramObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.8
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */