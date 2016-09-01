package com.adobe.mediacore.timeline.advertising;

import com.adobe.mediacore.metadata.AdBreakAsWatched;
import java.util.List;

public abstract interface AdPolicySelector
{
  public abstract List selectAdBreaksToPlay(AdPolicyInfo paramAdPolicyInfo);
  
  public abstract AdBreakPolicy selectPolicyForAdBreak(AdPolicyInfo paramAdPolicyInfo);
  
  public abstract AdPolicy selectPolicyForSeekIntoAd(AdPolicyInfo paramAdPolicyInfo);
  
  public abstract AdBreakAsWatched selectWatchedPolicyForAdBreak(AdPolicyInfo paramAdPolicyInfo);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.AdPolicySelector
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */