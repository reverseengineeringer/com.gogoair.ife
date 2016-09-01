package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$10
  implements ICallback
{
  VideoPlayerPlugin$10(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (VideoInfo)VideoPlayerPlugin.access$1100(this$0).call(val$cachedData);
    if (paramObject != null) {}
    for (paramObject = streamType;; paramObject = null)
    {
      VideoPlayerPlugin.access$2100(this$0).debug(VideoPlayerPlugin.access$2000(this$0), "Resolving video.streamType: " + (String)paramObject);
      return paramObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.10
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */