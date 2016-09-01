package com.auditude.ads.model.tracking;

import java.util.ArrayList;
import java.util.Iterator;

public class TrackingEvent
{
  private ArrayList trackingUrls;
  private String type;
  
  public TrackingEvent(String paramString)
  {
    type = paramString;
  }
  
  public final void addTrackingUrl(TrackingUrl paramTrackingUrl)
  {
    if (trackingUrls == null) {
      trackingUrls = new ArrayList();
    }
    if (paramTrackingUrl != null) {
      trackingUrls.add(paramTrackingUrl);
    }
  }
  
  public final ArrayList getTrackingUrls()
  {
    return trackingUrls;
  }
  
  public final String getType()
  {
    return type;
  }
  
  public final void reset()
  {
    Iterator localIterator;
    if (trackingUrls != null) {
      localIterator = trackingUrls.iterator();
    }
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return;
      }
      ((TrackingUrl)localIterator.next()).setLogged(false);
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.tracking.TrackingEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */