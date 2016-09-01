package com.adobe.primetime.va.plugins.videoplayer;

public final class AdBreakInfo
{
  public String name = "";
  public String playerName = "";
  public Long position = Long.valueOf(0L);
  public Double startTime = Double.valueOf(0.0D);
  
  public String toString()
  {
    return "playerName=" + playerName + ", name=" + name + ", position=" + position + ", startTime=" + startTime;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.AdBreakInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */