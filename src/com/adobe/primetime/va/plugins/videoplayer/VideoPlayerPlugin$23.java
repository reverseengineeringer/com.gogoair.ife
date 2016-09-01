package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$23
  implements ICallback
{
  VideoPlayerPlugin$23(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (ChapterInfo)VideoPlayerPlugin.access$4600(this$0).call(val$cachedData);
    if (paramObject != null) {}
    for (paramObject = name;; paramObject = null)
    {
      VideoPlayerPlugin.access$5000(this$0).debug(VideoPlayerPlugin.access$4900(this$0), "Resolving chapter.name: " + (String)paramObject);
      return paramObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.23
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */