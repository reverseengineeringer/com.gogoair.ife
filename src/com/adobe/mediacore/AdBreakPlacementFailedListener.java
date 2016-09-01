package com.adobe.mediacore;

import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;

abstract interface AdBreakPlacementFailedListener
  extends MediaPlayer.EventListener
{
  public abstract void onFailed(AdBreakPlacement paramAdBreakPlacement);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdBreakPlacementFailedListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */