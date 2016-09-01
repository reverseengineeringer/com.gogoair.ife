package com.adobe.ave;

public enum DataTrackInfo$DataTrackInfoServiceType
{
  DATATYPE_608Captions(0),  DATATYPE_708Captions(1),  DATATYPE_WebVTTCaptions(2);
  
  private final int value;
  
  private DataTrackInfo$DataTrackInfoServiceType(int paramInt1)
  {
    value = paramInt1;
  }
  
  public int getValue()
  {
    return value;
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.DataTrackInfo.DataTrackInfoServiceType
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */