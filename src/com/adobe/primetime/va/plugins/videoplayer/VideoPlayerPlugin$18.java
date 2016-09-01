package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$18
  implements ICallback
{
  VideoPlayerPlugin$18(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (AdInfo)VideoPlayerPlugin.access$3500(this$0).call(val$cachedData);
    if (paramObject != null) {}
    for (paramObject = id;; paramObject = null)
    {
      VideoPlayerPlugin.access$3900(this$0).debug(VideoPlayerPlugin.access$3800(this$0), "Resolving ad.id: " + (String)paramObject);
      return paramObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.18
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */