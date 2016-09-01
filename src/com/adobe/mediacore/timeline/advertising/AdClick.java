package com.adobe.mediacore.timeline.advertising;

public final class AdClick
{
  private final String _id;
  private final String _title;
  private final String _url;
  
  public AdClick(String paramString1, String paramString2, String paramString3)
  {
    _id = paramString1;
    _title = paramString2;
    _url = paramString3;
  }
  
  public static AdClick newInstance(AdClick paramAdClick)
  {
    return new AdClick(_id, _title, _url);
  }
  
  public String getId()
  {
    return _id;
  }
  
  public String getTitle()
  {
    return _title;
  }
  
  public String getUrl()
  {
    return _url;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(getClass().getSimpleName()).append(" Object {");
    localStringBuilder.append(" url=").append(_url);
    localStringBuilder.append(" ,title=").append(_title);
    localStringBuilder.append(" ,id=").append(_id);
    localStringBuilder.append(" }");
    return localStringBuilder.toString();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.AdClick
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */