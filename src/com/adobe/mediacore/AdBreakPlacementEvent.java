package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;

class AdBreakPlacementEvent
  extends MediaPlayerEvent
{
  private final AdBreakPlacement _acceptedAdBreak;
  private final AdBreakPlacement _proposedAdBreak;
  
  private AdBreakPlacementEvent(MediaPlayerEvent.Type paramType, AdBreakPlacement paramAdBreakPlacement1, AdBreakPlacement paramAdBreakPlacement2)
  {
    super(paramType);
    _proposedAdBreak = paramAdBreakPlacement1;
    _acceptedAdBreak = paramAdBreakPlacement2;
  }
  
  public static AdBreakPlacementEvent createPlacementCompletedEvent(AdBreakPlacement paramAdBreakPlacement1, AdBreakPlacement paramAdBreakPlacement2)
  {
    AdBreakPlacementEvent localAdBreakPlacementEvent = new AdBreakPlacementEvent(MediaPlayerEvent.Type.ADBREAK_PLACEMENT_COMPLETED, paramAdBreakPlacement1, paramAdBreakPlacement2);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.AD_BREAK_PLACEMENT_COMPLETE, "Ad-break placement operation is complete.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("PROPOSED_AD_BREAK", paramAdBreakPlacement1.toString());
    localMetadataNode.setValue("ACCEPTED_AD_BREAK", paramAdBreakPlacement2.toString());
    localInfo.setMetadata(localMetadataNode);
    localAdBreakPlacementEvent.setNotification(localInfo);
    return localAdBreakPlacementEvent;
  }
  
  public static AdBreakPlacementEvent createPlacementFailedEvent(AdBreakPlacement paramAdBreakPlacement)
  {
    AdBreakPlacementEvent localAdBreakPlacementEvent = new AdBreakPlacementEvent(MediaPlayerEvent.Type.ADBREAK_PLACEMENT_FAILED, paramAdBreakPlacement, null);
    MediaPlayerNotification.Error localError = new MediaPlayerNotification.Error(MediaPlayerNotification.ErrorCode.AD_INSERTION_FAIL, "Ad-break placement operation has failed.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("PROPOSED_AD_BREAK", paramAdBreakPlacement.toString());
    localError.setMetadata(localMetadataNode);
    localAdBreakPlacementEvent.setNotification(localError);
    return localAdBreakPlacementEvent;
  }
  
  public AdBreakPlacement getAcceptedAdBreak()
  {
    return _acceptedAdBreak;
  }
  
  public AdBreakPlacement getProposedAdBreak()
  {
    return _proposedAdBreak;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdBreakPlacementEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */