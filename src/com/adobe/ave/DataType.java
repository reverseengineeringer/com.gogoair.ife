package com.adobe.ave;

public enum DataType
{
  DT_3GPP_CAPTION_METADATA(860311632),  DT_AMF(1095583278);
  
  private final int value;
  
  private DataType(int paramInt1)
  {
    value = paramInt1;
  }
  
  final int getValue()
  {
    return value;
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.DataType
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */