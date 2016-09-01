package com.adobe.ave;

public class ABRProfileInfo
{
  public int bitsPerSecond;
  public String codecs;
  public int height;
  public int width;
  
  private ABRProfileInfo(int paramInt1, int paramInt2, int paramInt3, String paramString)
  {
    bitsPerSecond = paramInt1;
    width = paramInt2;
    height = paramInt3;
    codecs = paramString;
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.ABRProfileInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */