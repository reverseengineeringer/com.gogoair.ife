package com.auditude.ads.network.vast.model;

public class VASTTrackingUrl
{
  private int offset = 0;
  private Boolean offsetIsPercent = Boolean.valueOf(false);
  private String type;
  private String url;
  
  public VASTTrackingUrl(String paramString1, String paramString2)
  {
    type = paramString2;
    url = paramString1;
  }
  
  public final int getOffset()
  {
    return offset;
  }
  
  public final Boolean getOffsetIsPercent()
  {
    return offsetIsPercent;
  }
  
  public final String getType()
  {
    return type;
  }
  
  public final String getUrl()
  {
    return url;
  }
  
  public final void setOffset(int paramInt)
  {
    offset = paramInt;
  }
  
  public final void setOffsetIsPercent(Boolean paramBoolean)
  {
    offsetIsPercent = paramBoolean;
  }
  
  public final void setType(String paramString)
  {
    type = paramString;
  }
  
  public final void setUrl(String paramString)
  {
    url = paramString;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.model.VASTTrackingUrl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */