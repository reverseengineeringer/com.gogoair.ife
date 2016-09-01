package com.adobe.ave;

public class AudioTrackInfo
{
  public String description;
  public boolean isAutoSelect;
  public boolean isDefault;
  public boolean isForced;
  public String language;
  
  AudioTrackInfo(String paramString1, String paramString2, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    description = paramString1;
    language = paramString2;
    isDefault = paramBoolean1;
    isAutoSelect = paramBoolean2;
    isForced = paramBoolean3;
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.AudioTrackInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */