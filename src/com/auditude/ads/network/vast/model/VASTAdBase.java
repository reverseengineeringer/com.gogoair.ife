package com.auditude.ads.network.vast.model;

import com.auditude.ads.util.StringUtil;
import java.util.ArrayList;

public class VASTAdBase
{
  public String adSystem;
  public String errorUrl;
  private ArrayList extensions;
  private ArrayList impressionUrls;
  private String networkAdId;
  private String skipOffset;
  
  public final void addExtension(Object paramObject)
  {
    if (paramObject == null) {
      return;
    }
    if (extensions == null) {
      extensions = new ArrayList();
    }
    extensions.add(paramObject);
  }
  
  public final void addImpressionUrl(VASTTrackingUrl paramVASTTrackingUrl)
  {
    if (StringUtil.isNullOrEmpty(paramVASTTrackingUrl.getUrl())) {
      return;
    }
    if (impressionUrls == null) {
      impressionUrls = new ArrayList();
    }
    impressionUrls.add(paramVASTTrackingUrl);
  }
  
  public final ArrayList getExtensions()
  {
    return extensions;
  }
  
  public final ArrayList getImpressionUrls()
  {
    return impressionUrls;
  }
  
  public final String getNetworkAdId()
  {
    return networkAdId;
  }
  
  public final String getSkipOffset()
  {
    return skipOffset;
  }
  
  public final void setNetworkAdId(String paramString)
  {
    networkAdId = paramString;
  }
  
  public final void setSkipOffset(String paramString)
  {
    skipOffset = paramString;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.model.VASTAdBase
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */