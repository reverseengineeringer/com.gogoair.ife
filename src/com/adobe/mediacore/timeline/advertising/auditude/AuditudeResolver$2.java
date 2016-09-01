package com.adobe.mediacore.timeline.advertising.auditude;

import com.adobe.mediacore.MediaPlayerNotification;
import com.adobe.mediacore.MediaPlayerNotification.Error;
import com.adobe.mediacore.MediaPlayerNotification.ErrorCode;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.timeline.PlacementOpportunity;
import java.util.LinkedList;
import java.util.List;

class AuditudeResolver$2
  implements Runnable
{
  AuditudeResolver$2(AuditudeResolver paramAuditudeResolver) {}
  
  public void run()
  {
    if (AuditudeResolver.access$500(this$0).isEmpty()) {
      return;
    }
    AuditudeResolver.access$602(this$0, (AuditudeRequest)AuditudeResolver.access$500(this$0).poll());
    try
    {
      AuditudeResolver.access$700(this$0, AuditudeResolver.access$600(this$0).getAuditudeSettings(), (PlacementOpportunity)AuditudeResolver.access$600(this$0).getPlacementOpportunities().get(0), AuditudeResolver.access$600(this$0).getAvailCustomParams(), AuditudeResolver.access$600(this$0).getPlacementInformations());
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      AuditudeResolver.access$300(this$0).w(AuditudeResolver.access$200(this$0) + "#startConsumer", String.valueOf(localIllegalArgumentException.getMessage()));
      MediaPlayerNotification.Error localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.AD_RESOLVER_METADATA_INVALID, "Invalid ad metadata.");
      MetadataNode localMetadataNode = new MetadataNode();
      localMetadataNode.setValue("DESCRIPTION", localIllegalArgumentException.getMessage());
      localError.setMetadata(localMetadataNode);
      AuditudeResolver.access$800(this$0, localError);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.auditude.AuditudeResolver.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */