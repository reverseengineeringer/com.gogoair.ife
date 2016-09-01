package com.adobe.primetime.va.plugins.videoplayer;

public final class AdInfo
{
  public String id = "";
  public Double length = Double.valueOf(0.0D);
  public String name = "";
  public Long position = Long.valueOf(0L);
  
  public String toString()
  {
    return "id=" + id + ", name=" + name + ", length=" + length + ", position=" + position;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.AdInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */