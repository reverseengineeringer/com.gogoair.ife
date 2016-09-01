package com.adobe.primetime.va.plugins.videoplayer;

public class VideoPlayerPluginDelegate
{
  public AdBreakInfo getAdBreakInfo()
  {
    return null;
  }
  
  public AdInfo getAdInfo()
  {
    return null;
  }
  
  public ChapterInfo getChapterInfo()
  {
    return null;
  }
  
  public QoSInfo getQoSInfo()
  {
    return null;
  }
  
  public VideoInfo getVideoInfo()
  {
    throw new IllegalAccessError("Implementation error: Method must be overridden.");
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPluginDelegate
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */