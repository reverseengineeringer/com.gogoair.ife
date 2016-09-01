package com.adobe.mediacore;

import com.adobe.mediacore.metadata.AdSignalingMode;

class DefaultOpportunityDetectorFactory
{
  public static PlacementOpportunityDetector createOpportunityDetector(MediaPlayerItem paramMediaPlayerItem, AdSignalingMode paramAdSignalingMode)
  {
    if ((paramMediaPlayerItem.isLive()) || (paramAdSignalingMode == AdSignalingMode.MANIFEST_CUES)) {
      return new SpliceOutPlacementOpportunityDetector(paramMediaPlayerItem);
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultOpportunityDetectorFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */