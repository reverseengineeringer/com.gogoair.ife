package com.adobe.mediacore.timeline.advertising;

import com.adobe.mediacore.timeline.TimelineMarker;
import com.adobe.mediacore.timeline.TimelineOperation;

public final class AdBreakPlacement
  extends TimelineOperation
  implements TimelineMarker
{
  private final AdBreak _adBreak;
  
  public AdBreakPlacement(AdBreak paramAdBreak, PlacementInformation paramPlacementInformation)
  {
    super(paramPlacementInformation);
    switch (paramPlacementInformation.getType())
    {
    }
    for (;;)
    {
      _adBreak = paramAdBreak;
      return;
      paramAdBreak.setType(AdBreak.Type.PRE_ROLL);
      continue;
      paramAdBreak.setType(AdBreak.Type.MID_ROLL);
      continue;
      paramAdBreak.setType(AdBreak.Type.POST_ROLL);
    }
  }
  
  public AdBreak getAdBreak()
  {
    return _adBreak;
  }
  
  public long getDuration()
  {
    return _adBreak.getDuration();
  }
  
  public long getTime()
  {
    return _placementInformation.getTime();
  }
  
  public boolean isValid()
  {
    return _adBreak.isValid();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.AdBreakPlacement
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */