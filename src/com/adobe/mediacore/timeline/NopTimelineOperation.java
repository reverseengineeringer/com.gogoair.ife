package com.adobe.mediacore.timeline;

import com.adobe.mediacore.timeline.advertising.PlacementInformation;

public class NopTimelineOperation
  extends TimelineOperation
{
  public NopTimelineOperation()
  {
    super(new PlacementInformation(null, null, -1L, -1L));
  }
  
  public boolean isValid()
  {
    return true;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.NopTimelineOperation
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */