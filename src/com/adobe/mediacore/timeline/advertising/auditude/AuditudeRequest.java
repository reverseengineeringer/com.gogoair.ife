package com.adobe.mediacore.timeline.advertising.auditude;

import com.adobe.mediacore.metadata.AuditudeSettings;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.timeline.PlacementOpportunity;
import com.adobe.mediacore.timeline.advertising.PlacementInformation;
import com.adobe.mediacore.timeline.advertising.PlacementInformation.Mode;
import java.util.ArrayList;
import java.util.List;

public class AuditudeRequest
{
  private AuditudeSettings _auditudeSettings;
  private Metadata _availCustomParams;
  private List _placementInformations = new ArrayList();
  private List _placementOpportunities = new ArrayList();
  
  public AuditudeRequest(AuditudeSettings paramAuditudeSettings, PlacementOpportunity paramPlacementOpportunity, Metadata paramMetadata)
  {
    _auditudeSettings = paramAuditudeSettings;
    _availCustomParams = paramMetadata;
    addOpportunity(paramPlacementOpportunity);
  }
  
  private void addOpportunity(PlacementOpportunity paramPlacementOpportunity)
  {
    _placementOpportunities.add(paramPlacementOpportunity);
    if (paramPlacementOpportunity.getPlacementInformation().getMode() == PlacementInformation.Mode.INSERT) {
      _placementInformations.add(paramPlacementOpportunity.getPlacementInformation());
    }
  }
  
  public void addPlacement(PlacementInformation paramPlacementInformation)
  {
    _placementInformations.add(paramPlacementInformation);
  }
  
  public AuditudeSettings getAuditudeSettings()
  {
    return _auditudeSettings;
  }
  
  public Metadata getAvailCustomParams()
  {
    return _availCustomParams;
  }
  
  public List getPlacementInformations()
  {
    return _placementInformations;
  }
  
  public List getPlacementOpportunities()
  {
    return _placementOpportunities;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.auditude.AuditudeRequest
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */