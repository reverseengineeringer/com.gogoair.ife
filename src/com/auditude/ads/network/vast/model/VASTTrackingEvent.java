package com.auditude.ads.network.vast.model;

import com.auditude.ads.util.StringUtil;
import java.util.ArrayList;

public class VASTTrackingEvent
{
  private ArrayList trackingUrls;
  public String type;
  
  public VASTTrackingEvent(String paramString)
  {
    type = paramString;
  }
  
  public final void addTrackingUrl(VASTTrackingUrl paramVASTTrackingUrl)
  {
    if ((paramVASTTrackingUrl == null) || (!StringUtil.isNotNullOrEmpty(paramVASTTrackingUrl.getUrl()))) {
      return;
    }
    if (trackingUrls == null) {
      trackingUrls = new ArrayList();
    }
    trackingUrls.add(paramVASTTrackingUrl);
  }
  
  public final ArrayList getTrackingUrls()
  {
    return trackingUrls;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.model.VASTTrackingEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */