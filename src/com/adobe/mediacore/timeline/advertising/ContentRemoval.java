package com.adobe.mediacore.timeline.advertising;

import com.adobe.mediacore.timeline.TimelineOperation;

public class ContentRemoval
  extends TimelineOperation
{
  public ContentRemoval(PlacementInformation paramPlacementInformation)
  {
    super(paramPlacementInformation);
  }
  
  public boolean isValid()
  {
    return true;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.ContentRemoval
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */