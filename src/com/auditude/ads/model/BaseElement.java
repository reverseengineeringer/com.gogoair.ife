package com.auditude.ads.model;

import com.auditude.ads.model.tracking.Submission;
import com.auditude.ads.model.tracking.TrackingEvent;
import com.auditude.ads.model.tracking.TrackingUrl;
import com.auditude.ads.util.StringUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class BaseElement
{
  public String errorUrl;
  private String id;
  private BaseElement parent;
  private HashMap state;
  private ArrayList trackingEvents = new ArrayList();
  
  public BaseElement(BaseElement paramBaseElement)
  {
    parent = paramBaseElement;
  }
  
  public final void addTrackingUrlForType(TrackingUrl paramTrackingUrl, String paramString)
  {
    paramString = getTrackingEventByType(paramString, true);
    if (paramString != null)
    {
      if (paramString.getTrackingUrls() == null) {
        paramString.addTrackingUrl(paramTrackingUrl);
      }
    }
    else {
      return;
    }
    int i = 0;
    for (;;)
    {
      if (i >= paramString.getTrackingUrls().size())
      {
        paramString.addTrackingUrl(paramTrackingUrl);
        return;
      }
      TrackingUrl localTrackingUrl = (TrackingUrl)paramString.getTrackingUrls().get(i);
      if ((localTrackingUrl != null) && (localTrackingUrl.getUrl() != null) && (localTrackingUrl.getUrl().equalsIgnoreCase(paramTrackingUrl.getUrl()))) {
        break;
      }
      i += 1;
    }
  }
  
  public final void copyTrackingEventsTo(BaseElement paramBaseElement, String paramString1, String paramString2)
  {
    Object localObject = getTrackingEventByType(paramString1);
    if ((localObject != null) && (((TrackingEvent)localObject).getTrackingUrls() != null))
    {
      paramBaseElement = paramBaseElement.getTrackingEventByType(paramString1, true);
      paramString1 = ((TrackingEvent)localObject).getTrackingUrls().iterator();
    }
    for (;;)
    {
      if (!paramString1.hasNext()) {
        return;
      }
      localObject = ((TrackingUrl)paramString1.next()).duplicate();
      if ((localObject instanceof Submission)) {
        externalUrl = paramString2;
      }
      paramBaseElement.addTrackingUrl((TrackingUrl)localObject);
    }
  }
  
  public void dispose()
  {
    trackingEvents = null;
    state = null;
    parent = null;
  }
  
  public final String getID()
  {
    return id;
  }
  
  public final BaseElement getParent()
  {
    return parent;
  }
  
  public final HashMap getState()
  {
    return state;
  }
  
  public final TrackingEvent getTrackingEventByType(String paramString)
  {
    return getTrackingEventByType(paramString, false);
  }
  
  public final TrackingEvent getTrackingEventByType(String paramString, boolean paramBoolean)
  {
    int i;
    if ((trackingEvents != null) && (!StringUtil.isNullOrEmpty(paramString))) {
      i = 0;
    }
    for (;;)
    {
      if (i >= trackingEvents.size())
      {
        if ((!paramBoolean) || (StringUtil.isNullOrEmpty(paramString))) {
          break;
        }
        paramString = new TrackingEvent(paramString.toLowerCase());
        trackingEvents.add(paramString);
        return paramString;
      }
      if (((TrackingEvent)trackingEvents.get(i)).getType().equalsIgnoreCase(paramString.toLowerCase())) {
        return (TrackingEvent)trackingEvents.get(i);
      }
      i += 1;
    }
    return null;
  }
  
  public final ArrayList getTrackingEvents()
  {
    return trackingEvents;
  }
  
  public final void resetTrackingEvents()
  {
    if ((trackingEvents == null) || (trackingEvents.isEmpty())) {}
    for (;;)
    {
      return;
      Iterator localIterator = trackingEvents.iterator();
      while (localIterator.hasNext()) {
        ((TrackingEvent)localIterator.next()).reset();
      }
    }
  }
  
  public final void setID(String paramString)
  {
    id = paramString;
  }
  
  public final void setState(HashMap paramHashMap)
  {
    state = paramHashMap;
  }
  
  public final void setTrackingEvents(ArrayList paramArrayList)
  {
    trackingEvents = paramArrayList;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.BaseElement
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */