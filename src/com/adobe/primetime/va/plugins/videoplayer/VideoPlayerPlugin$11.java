package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$11
  implements ICallback
{
  VideoPlayerPlugin$11(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (VideoInfo)VideoPlayerPlugin.access$1100(this$0).call(val$cachedData);
    if (paramObject != null) {}
    for (double d = playhead.doubleValue();; d = 0.0D)
    {
      paramObject = Double.valueOf(d);
      VideoPlayerPlugin.access$2300(this$0).debug(VideoPlayerPlugin.access$2200(this$0), "Resolving video.playhead: " + paramObject);
      return paramObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.11
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */