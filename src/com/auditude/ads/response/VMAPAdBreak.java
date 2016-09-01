package com.auditude.ads.response;

import com.auditude.ads.model.tracking.TrackingUrl;
import com.auditude.ads.network.vast.model.VASTDocument;
import java.util.ArrayList;
import java.util.Iterator;

public class VMAPAdBreak
{
  private String allowMultipleAds;
  private String followRedirects;
  private int repeatAfter = 0;
  private int startTime = 0;
  private ArrayList trackingUrls = new ArrayList();
  private ArrayList vastDocuments = new ArrayList();
  
  public VMAPAdBreak(int paramInt)
  {
    startTime = paramInt;
  }
  
  public void addTrackingUrl(String paramString1, String paramString2)
  {
    TrackingUrl localTrackingUrl = null;
    if ((paramString1.equalsIgnoreCase("breakstart")) || (paramString1.equalsIgnoreCase("start"))) {}
    for (localTrackingUrl = new TrackingUrl(paramString2, "start");; localTrackingUrl = new TrackingUrl(paramString2, "complete")) {
      do
      {
        if (localTrackingUrl != null) {
          trackingUrls.add(localTrackingUrl);
        }
        return;
      } while ((!paramString1.equalsIgnoreCase("breakend")) && (!paramString1.equalsIgnoreCase("complete")));
    }
  }
  
  public void addVastDocument(VASTDocument paramVASTDocument)
  {
    vastDocuments.add(paramVASTDocument);
  }
  
  public String getAllowMultipleAds()
  {
    return allowMultipleAds;
  }
  
  public VMAPAdBreak getCopy(int paramInt)
  {
    VMAPAdBreak localVMAPAdBreak = new VMAPAdBreak(paramInt);
    localVMAPAdBreak.setAllowMultipleAds(allowMultipleAds);
    localVMAPAdBreak.setFollowRedirects(followRedirects);
    Iterator localIterator = trackingUrls.iterator();
    if (!localIterator.hasNext()) {
      localIterator = vastDocuments.iterator();
    }
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        return localVMAPAdBreak;
        TrackingUrl localTrackingUrl = (TrackingUrl)localIterator.next();
        localVMAPAdBreak.addTrackingUrl(localTrackingUrl.getType(), localTrackingUrl.getUrl());
        break;
      }
      localVMAPAdBreak.addVastDocument((VASTDocument)localIterator.next());
    }
  }
  
  public Boolean getFollowRedirects()
  {
    if (followRedirects != null) {
      return Boolean.valueOf(followRedirects.equalsIgnoreCase("true"));
    }
    return Boolean.valueOf(true);
  }
  
  public int getRepeatAfter()
  {
    return repeatAfter;
  }
  
  public int getStartTime()
  {
    return startTime;
  }
  
  public ArrayList getTrackingUrls()
  {
    return trackingUrls;
  }
  
  public ArrayList getVastDocuments()
  {
    return vastDocuments;
  }
  
  public void setAllowMultipleAds(String paramString)
  {
    allowMultipleAds = paramString;
  }
  
  public void setFollowRedirects(String paramString)
  {
    followRedirects = paramString;
  }
  
  public void setRepeatAfter(int paramInt)
  {
    repeatAfter = paramInt;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.response.VMAPAdBreak
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */