package com.adobe.primetime.va.plugins.videoplayer;

public final class QoSInfo
{
  public Long bitrate = Long.valueOf(0L);
  public Long droppedFrames = Long.valueOf(0L);
  public Double fps = Double.valueOf(0.0D);
  public Double startupTime = Double.valueOf(0.0D);
  
  public String toString()
  {
    return "bitrate=" + bitrate + ", fps=" + fps + ", droppedFrames=" + droppedFrames + ", startupTime=" + startupTime;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.QoSInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */