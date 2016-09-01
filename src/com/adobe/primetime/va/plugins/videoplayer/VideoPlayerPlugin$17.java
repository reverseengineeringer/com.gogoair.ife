package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$17
  implements ICallback
{
  VideoPlayerPlugin$17(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    if ((AdInfo)VideoPlayerPlugin.access$3500(this$0).call(val$cachedData) != null) {}
    for (boolean bool = true;; bool = false)
    {
      VideoPlayerPlugin.access$3700(this$0).debug(VideoPlayerPlugin.access$3600(this$0), "Resolving ad.isInAd: " + bool);
      return Boolean.valueOf(bool);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.17
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */