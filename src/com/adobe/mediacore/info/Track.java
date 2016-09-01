package com.adobe.mediacore.info;

public abstract class Track
{
  private final boolean _isDefault;
  private final String _language;
  private final String _name;
  
  public Track(String paramString1, String paramString2, boolean paramBoolean)
  {
    _name = paramString1;
    _language = paramString2;
    _isDefault = paramBoolean;
  }
  
  public String getLanguage()
  {
    return _language;
  }
  
  public String getName()
  {
    return _name;
  }
  
  public boolean isDefault()
  {
    return _isDefault;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.info.Track
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */