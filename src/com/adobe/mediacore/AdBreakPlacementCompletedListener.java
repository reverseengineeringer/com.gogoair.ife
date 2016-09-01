package com.adobe.mediacore;

import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;

abstract interface AdBreakPlacementCompletedListener
  extends MediaPlayer.EventListener
{
  public abstract void onCompleted(AdBreakPlacement paramAdBreakPlacement1, AdBreakPlacement paramAdBreakPlacement2);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdBreakPlacementCompletedListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */