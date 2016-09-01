package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$27
  implements ICallback
{
  VideoPlayerPlugin$27(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (QoSInfo)VideoPlayerPlugin.access$5700(this$0).call(val$cachedData);
    if (paramObject != null) {}
    for (paramObject = bitrate;; paramObject = null)
    {
      VideoPlayerPlugin.access$5900(this$0).debug(VideoPlayerPlugin.access$5800(this$0), "Resolving qos.bitrate: " + paramObject);
      return paramObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.27
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */