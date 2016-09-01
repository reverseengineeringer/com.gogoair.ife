package com.adobe.ave;

public class DataTrackInfo
{
  public boolean activity;
  public String description;
  public boolean isAutoSelect;
  public boolean isDefault;
  public boolean isForced;
  public String language;
  public DataTrackInfoServiceType serviceType;
  
  DataTrackInfo(String paramString1, String paramString2, int paramInt, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4)
  {
    description = paramString1;
    language = paramString2;
    paramString1 = DataTrackInfoServiceType.values();
    int j = paramString1.length;
    int i = 0;
    for (;;)
    {
      if (i < j)
      {
        paramString2 = paramString1[i];
        if (paramString2.getValue() == paramInt) {
          serviceType = paramString2;
        }
      }
      else
      {
        isDefault = paramBoolean1;
        isAutoSelect = paramBoolean2;
        isForced = paramBoolean3;
        activity = paramBoolean4;
        return;
      }
      i += 1;
    }
  }
  
  public static enum DataTrackInfoServiceType
  {
    DATATYPE_608Captions(0),  DATATYPE_708Captions(1),  DATATYPE_WebVTTCaptions(2);
    
    private final int value;
    
    private DataTrackInfoServiceType(int paramInt1)
    {
      value = paramInt1;
    }
    
    public int getValue()
    {
      return value;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.DataTrackInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */