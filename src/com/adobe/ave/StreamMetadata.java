package com.adobe.ave;

public class StreamMetadata
{
  public float frameRate;
  public int level;
  public int outputHeight;
  public int outputWidth;
  public int profile;
  
  StreamMetadata(int paramInt1, int paramInt2, float paramFloat, int paramInt3, int paramInt4)
  {
    outputWidth = paramInt1;
    outputHeight = paramInt2;
    frameRate = paramFloat;
    profile = paramInt3;
    level = paramInt4;
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.StreamMetadata
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */