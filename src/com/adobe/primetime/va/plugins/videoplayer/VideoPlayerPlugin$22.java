package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.Map;

class VideoPlayerPlugin$22
  implements ICallback
{
  VideoPlayerPlugin$22(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    if ((ChapterInfo)VideoPlayerPlugin.access$4600(this$0).call(val$cachedData) != null) {}
    for (boolean bool = true;; bool = false)
    {
      VideoPlayerPlugin.access$4800(this$0).debug(VideoPlayerPlugin.access$4700(this$0), "Resolving chapter.isInChapter: " + bool);
      return Boolean.valueOf(bool);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.22
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */