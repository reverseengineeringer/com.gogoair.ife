package com.adobe.mediacore.info;

public class AudioTrack
  extends Track
{
  private final boolean _isAutoSelect;
  private final boolean _isForced;
  
  public AudioTrack(String paramString1, String paramString2, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    super(paramString1, paramString2, paramBoolean1);
    _isAutoSelect = paramBoolean2;
    _isForced = paramBoolean3;
  }
  
  public boolean isAutoSelect()
  {
    return _isAutoSelect;
  }
  
  public boolean isForced()
  {
    return _isForced;
  }
  
  public String toString()
  {
    return "Name: " + getName() + ". Language: " + getLanguage();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.info.AudioTrack
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */