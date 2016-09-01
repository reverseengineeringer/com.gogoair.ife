package com.adobe.mediacore.timeline.advertising.auditude;

public final class AdInfo
{
  private Object data;
  private final long duration;
  private final String id;
  private final String url;
  
  public AdInfo(String paramString1, String paramString2, long paramLong, Object paramObject)
  {
    id = paramString1;
    url = paramString2;
    duration = paramLong;
    data = paramObject;
  }
  
  public final Object getData()
  {
    return data;
  }
  
  public final long getDuration()
  {
    return duration;
  }
  
  public final String getId()
  {
    return id;
  }
  
  public final String getUrl()
  {
    return url;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.auditude.AdInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */