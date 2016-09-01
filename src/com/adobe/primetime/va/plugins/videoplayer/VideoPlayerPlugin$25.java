package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$25
  implements ICallback
{
  VideoPlayerPlugin$25(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (ChapterInfo)VideoPlayerPlugin.access$4600(this$0).call(val$cachedData);
    if (paramObject != null) {}
    for (long l = position.longValue();; l = 0L)
    {
      paramObject = Long.valueOf(l);
      VideoPlayerPlugin.access$5400(this$0).debug(VideoPlayerPlugin.access$5300(this$0), "Resolving chapter.position: " + paramObject);
      return paramObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.25
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */