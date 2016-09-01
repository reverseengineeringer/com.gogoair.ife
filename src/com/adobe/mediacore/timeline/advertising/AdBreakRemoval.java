package com.adobe.mediacore.timeline.advertising;

import com.adobe.mediacore.timeline.TimelineOperation;

public final class AdBreakRemoval
  extends TimelineOperation
{
  private final AdBreak _adBreak;
  
  public AdBreakRemoval(AdBreakPlacement paramAdBreakPlacement)
  {
    super(paramAdBreakPlacement.getPlacement());
    _adBreak = paramAdBreakPlacement.getAdBreak();
  }
  
  public AdBreak getAdBreak()
  {
    return _adBreak;
  }
  
  public boolean isValid()
  {
    return _adBreak.isValid();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.AdBreakRemoval
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */