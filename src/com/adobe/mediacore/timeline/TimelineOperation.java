package com.adobe.mediacore.timeline;

import com.adobe.mediacore.timeline.advertising.PlacementInformation;

public abstract class TimelineOperation
  implements Comparable
{
  protected PlacementInformation _placementInformation;
  
  protected TimelineOperation(PlacementInformation paramPlacementInformation)
  {
    if (paramPlacementInformation == null) {
      throw new IllegalArgumentException("The placement parameter must be not null. A valid operation must indicate which position on the timeline will be affected.");
    }
    _placementInformation = paramPlacementInformation;
  }
  
  public int compareTo(TimelineOperation paramTimelineOperation)
  {
    if (_placementInformation.getTime() < paramTimelineOperation.getPlacement().getTime()) {
      return -1;
    }
    if (_placementInformation.getTime() == _placementInformation.getTime()) {
      return 0;
    }
    return 1;
  }
  
  public PlacementInformation getPlacement()
  {
    return _placementInformation;
  }
  
  public abstract boolean isValid();
  
  public void setPlacement(PlacementInformation paramPlacementInformation)
  {
    _placementInformation = paramPlacementInformation;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.TimelineOperation
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */