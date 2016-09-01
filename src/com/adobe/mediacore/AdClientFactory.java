package com.adobe.mediacore;

import com.adobe.mediacore.timeline.advertising.AdProvider;

public abstract interface AdClientFactory
{
  @Deprecated
  public abstract AdProvider createAdProvider(MediaPlayerItem paramMediaPlayerItem);
  
  public abstract PlacementOpportunityDetector createOpportunityDetector(MediaPlayerItem paramMediaPlayerItem);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdClientFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */