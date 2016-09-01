package com.adobe.primetime.va.plugins.videoplayer;

public final class ChapterInfo
{
  public Double length = Double.valueOf(0.0D);
  public String name = "";
  public Long position = Long.valueOf(0L);
  public Double startTime = Double.valueOf(0.0D);
  
  public String toString()
  {
    return "name=" + name + ", length=" + length + ", position=" + position + ", startTime=" + startTime;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.ChapterInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */