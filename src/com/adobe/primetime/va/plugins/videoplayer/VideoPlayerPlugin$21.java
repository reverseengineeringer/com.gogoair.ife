package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$21
  implements ICallback
{
  VideoPlayerPlugin$21(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (AdInfo)VideoPlayerPlugin.access$3500(this$0).call(val$cachedData);
    if (paramObject != null) {}
    for (paramObject = position;; paramObject = null)
    {
      VideoPlayerPlugin.access$4500(this$0).debug(VideoPlayerPlugin.access$4400(this$0), "Resolving ad.position: " + paramObject);
      return paramObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.21
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */