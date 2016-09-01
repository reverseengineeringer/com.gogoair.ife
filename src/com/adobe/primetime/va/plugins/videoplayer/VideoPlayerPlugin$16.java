package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$16
  implements ICallback
{
  VideoPlayerPlugin$16(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    if ((AdBreakInfo)VideoPlayerPlugin.access$2400(this$0).call(val$cachedData) != null) {}
    for (boolean bool = true;; bool = false)
    {
      VideoPlayerPlugin.access$3400(this$0).debug(VideoPlayerPlugin.access$3300(this$0), "Resolving ad.isInAdBreak: " + bool);
      return Boolean.valueOf(bool);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.16
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */