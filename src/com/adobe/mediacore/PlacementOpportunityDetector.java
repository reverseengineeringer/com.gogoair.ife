package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import java.util.List;

public abstract interface PlacementOpportunityDetector
{
  public abstract List process(List paramList, Metadata paramMetadata);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.PlacementOpportunityDetector
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */