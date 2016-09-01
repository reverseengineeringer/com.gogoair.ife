package com.auditude.ads.network.vast.model;

import com.auditude.ads.util.StringUtil;
import java.util.ArrayList;
import java.util.Iterator;

public class VASTAdCreativeBase
{
  public static final String HTML = "html";
  public static final String IFRAME = "iframe";
  public static final String OTHER = "other";
  public static final String SCRIPT = "script";
  public static final String STATIC = "static";
  public String adId;
  public String adParameters;
  public String altText;
  public String apiFramework;
  public String clickThroughUrl;
  public ArrayList clickTrackingUrls;
  public String creativeType;
  public int expandedHeight = 0;
  public int expandedWidth = 0;
  public int height = 0;
  public String id;
  public boolean maintainAspectRatio;
  public String resourceType;
  public boolean scalable;
  public int sequence;
  private ArrayList trackingEvents;
  public String url;
  public int width = 0;
  
  public final void addClickTrakingUrl(String paramString)
  {
    if (clickTrackingUrls == null) {
      clickTrackingUrls = new ArrayList();
    }
    clickTrackingUrls.add(paramString);
  }
  
  public final void addTrackingEvent(VASTTrackingEvent paramVASTTrackingEvent)
  {
    if ((paramVASTTrackingEvent == null) || (StringUtil.isNullOrEmpty(type))) {}
    for (;;)
    {
      return;
      if (trackingEvents == null) {
        trackingEvents = new ArrayList();
      }
      VASTTrackingEvent localVASTTrackingEvent = getTrackingEventByType(type);
      if (localVASTTrackingEvent == null)
      {
        trackingEvents.add(paramVASTTrackingEvent);
        return;
      }
      if (paramVASTTrackingEvent.getTrackingUrls() != null)
      {
        paramVASTTrackingEvent = paramVASTTrackingEvent.getTrackingUrls().iterator();
        while (paramVASTTrackingEvent.hasNext()) {
          localVASTTrackingEvent.addTrackingUrl((VASTTrackingUrl)paramVASTTrackingEvent.next());
        }
      }
    }
  }
  
  public final ArrayList getClickTrackingUrls()
  {
    return clickTrackingUrls;
  }
  
  public final VASTTrackingEvent getTrackingEventByType(String paramString)
  {
    if ((StringUtil.isNullOrEmpty(paramString)) || (trackingEvents == null)) {
      return null;
    }
    Iterator localIterator = trackingEvents.iterator();
    VASTTrackingEvent localVASTTrackingEvent;
    do
    {
      if (!localIterator.hasNext()) {
        return null;
      }
      localVASTTrackingEvent = (VASTTrackingEvent)localIterator.next();
    } while (!type.toLowerCase().equals(paramString.toLowerCase()));
    return localVASTTrackingEvent;
  }
  
  public final ArrayList getTrackingEvents()
  {
    return trackingEvents;
  }
  
  public final void setTrackingEvents(ArrayList paramArrayList)
  {
    trackingEvents = paramArrayList;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.model.VASTAdCreativeBase
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */