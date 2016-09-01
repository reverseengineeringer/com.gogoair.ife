package com.auditude.ads.network.vast.model;

import com.auditude.ads.util.StringUtil;
import java.util.ArrayList;

public class VASTClick
{
  private ArrayList customClickUrls;
  private ArrayList trackingUrls;
  private String url;
  
  public final void addClickTrackingUrl(String paramString)
  {
    if (StringUtil.isNullOrEmpty(paramString)) {
      return;
    }
    if (trackingUrls == null) {
      trackingUrls = new ArrayList();
    }
    trackingUrls.add(paramString);
  }
  
  public final void addCustomClickUrl(String paramString)
  {
    if (StringUtil.isNullOrEmpty(paramString)) {
      return;
    }
    if (customClickUrls == null) {
      customClickUrls = new ArrayList();
    }
    customClickUrls.add(paramString);
  }
  
  public final ArrayList getCustomClickUrls()
  {
    return customClickUrls;
  }
  
  public final ArrayList getTrackingUrls()
  {
    return trackingUrls;
  }
  
  public final String getUrl()
  {
    return url;
  }
  
  public final void setCustomClickUrls(ArrayList paramArrayList)
  {
    customClickUrls = paramArrayList;
  }
  
  public final void setTrackingUrls(ArrayList paramArrayList)
  {
    trackingUrls = paramArrayList;
  }
  
  public final void setUrl(String paramString)
  {
    url = paramString;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.model.VASTClick
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */