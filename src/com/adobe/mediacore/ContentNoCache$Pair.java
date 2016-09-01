package com.adobe.mediacore;

class ContentNoCache$Pair
{
  private AdHandle _adHandle;
  private String _url;
  
  public ContentNoCache$Pair(ContentNoCache paramContentNoCache, String paramString, AdHandle paramAdHandle)
  {
    _url = paramString;
    _adHandle = paramAdHandle;
  }
  
  AdHandle getAdHandle()
  {
    return _adHandle;
  }
  
  String getUrl()
  {
    return _url;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.ContentNoCache.Pair
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */