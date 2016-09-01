package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$30
  implements ICallback
{
  VideoPlayerPlugin$30(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (QoSInfo)VideoPlayerPlugin.access$5700(this$0).call(val$cachedData);
    if (paramObject != null) {}
    for (paramObject = Double.valueOf(startupTime.doubleValue() * 1000.0D);; paramObject = null)
    {
      VideoPlayerPlugin.access$6500(this$0).debug(VideoPlayerPlugin.access$6400(this$0), "Resolving qos.startupTime: " + paramObject);
      return paramObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.30
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */