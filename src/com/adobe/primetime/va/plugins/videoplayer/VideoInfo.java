package com.adobe.primetime.va.plugins.videoplayer;

public final class VideoInfo
{
  public String id = "";
  public Double length = Double.valueOf(0.0D);
  public String name = "";
  public String playerName = "";
  public Double playhead = Double.valueOf(0.0D);
  public String streamType = "";
  
  public String toString()
  {
    return "playerName=" + playerName + ", id=" + id + ", name=" + name + ", length=" + length + ", playhead=" + playhead + ", streamType=" + streamType;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */