package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$26
  implements ICallback
{
  VideoPlayerPlugin$26(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (ChapterInfo)VideoPlayerPlugin.access$4600(this$0).call(val$cachedData);
    if (paramObject != null) {}
    for (paramObject = startTime;; paramObject = null)
    {
      VideoPlayerPlugin.access$5600(this$0).debug(VideoPlayerPlugin.access$5500(this$0), "Resolving chapter.startTime: " + paramObject);
      return paramObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.26
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */