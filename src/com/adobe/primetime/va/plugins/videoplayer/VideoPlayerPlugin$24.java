package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$24
  implements ICallback
{
  VideoPlayerPlugin$24(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (ChapterInfo)VideoPlayerPlugin.access$4600(this$0).call(val$cachedData);
    if (paramObject != null) {}
    for (paramObject = length;; paramObject = null)
    {
      VideoPlayerPlugin.access$5200(this$0).debug(VideoPlayerPlugin.access$5100(this$0), "Resolving chapter.length: " + paramObject);
      return paramObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.24
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */