package com.adobe.mediacore.timeline;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.timeline.advertising.PlacementInformation;

public final class PlacementOpportunity
{
  public final String _id;
  public final Metadata _metadata;
  public final PlacementInformation _placementInformation;
  
  public PlacementOpportunity(String paramString, PlacementInformation paramPlacementInformation, Metadata paramMetadata)
  {
    _id = paramString;
    _placementInformation = paramPlacementInformation;
    _metadata = paramMetadata;
  }
  
  public String getId()
  {
    return _id;
  }
  
  public Metadata getMetadata()
  {
    return _metadata;
  }
  
  public PlacementInformation getPlacementInformation()
  {
    return _placementInformation;
  }
  
  public String toString()
  {
    return "PlacementOpportunity { id: " + getId() + ", placementInformation: " + _placementInformation.toString() + " }";
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.PlacementOpportunity
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */