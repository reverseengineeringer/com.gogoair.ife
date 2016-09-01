package com.auditude.ads.model.tracking;

import com.auditude.ads.model.BaseElement;
import java.util.ArrayList;

public class Submissions
  extends BaseElement
{
  public Submissions()
  {
    super(null);
  }
  
  public Submission getSubmissionById(String paramString)
  {
    Object localObject = null;
    TrackingEvent localTrackingEvent = getTrackingEventByType(paramString);
    paramString = (String)localObject;
    if (localTrackingEvent != null)
    {
      paramString = (String)localObject;
      if (localTrackingEvent.getTrackingUrls().size() > 0)
      {
        paramString = (TrackingUrl)localTrackingEvent.getTrackingUrls().get(0);
        if (!(paramString instanceof Submission)) {
          break label52;
        }
      }
    }
    for (;;)
    {
      paramString = (Submission)paramString;
      return paramString;
      label52:
      paramString = null;
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.tracking.Submissions
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */