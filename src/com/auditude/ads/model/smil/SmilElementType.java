package com.auditude.ads.model.smil;

public enum SmilElementType
{
  LINEAR,  NON_LINEAR,  UNKNOWN;
  
  public static SmilElementType forValue(int paramInt)
  {
    return values()[paramInt];
  }
  
  public int getValue()
  {
    return ordinal();
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.smil.SmilElementType
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */