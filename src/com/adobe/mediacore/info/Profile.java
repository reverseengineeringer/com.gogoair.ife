package com.adobe.mediacore.info;

public class Profile
{
  private final int _bitrate;
  private final int _height;
  private final int _width;
  
  public Profile(int paramInt1, int paramInt2, int paramInt3)
  {
    _bitrate = paramInt1;
    _width = paramInt2;
    _height = paramInt3;
  }
  
  public int getBitrate()
  {
    return _bitrate;
  }
  
  public int getHeight()
  {
    return _height;
  }
  
  public int getWidth()
  {
    return _width;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.info.Profile
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */