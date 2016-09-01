package com.auditude.creativerepackaging;

public class RepackagingParameters
{
  private final String HLS_FORMAT = "m3u8";
  private final String HLS_MIMETYPE = "application/x-mpegURL";
  private String creativeURL;
  private String requiredFormat;
  private int videoHeight;
  private int videoWidth;
  
  public String getCreativeURL()
  {
    return creativeURL;
  }
  
  public String getRequiredFormat()
  {
    return requiredFormat;
  }
  
  public int getVideoHeight()
  {
    return videoHeight;
  }
  
  public int getVideoWidth()
  {
    return videoWidth;
  }
  
  public void setCreativeURL(String paramString)
  {
    creativeURL = paramString;
  }
  
  public void setRequiredFormat(String paramString)
  {
    if (paramString.equalsIgnoreCase("application/x-mpegURL"))
    {
      requiredFormat = "m3u8";
      return;
    }
    requiredFormat = null;
  }
  
  public void setVideoHeight(int paramInt)
  {
    videoHeight = paramInt;
  }
  
  public void setVideoWidth(int paramInt)
  {
    videoWidth = paramInt;
  }
}

/* Location:
 * Qualified Name:     com.auditude.creativerepackaging.RepackagingParameters
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */