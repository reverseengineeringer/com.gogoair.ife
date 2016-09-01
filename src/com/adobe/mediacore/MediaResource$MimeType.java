package com.adobe.mediacore;

public enum MediaResource$MimeType
{
  HLS_MIME_TYPE("application/x-mpegurl");
  
  private final String _value;
  
  private MediaResource$MimeType(String paramString1)
  {
    _value = paramString1;
  }
  
  public String getValue()
  {
    return _value;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaResource.MimeType
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */