package com.adobe.mediacore.timeline.advertising.auditude;

import com.adobe.mediacore.MediaPlayerNotification;
import com.adobe.mediacore.MediaPlayerNotification.Error;
import com.adobe.mediacore.MediaPlayerNotification.ErrorCode;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.auditude.ads.event.AdClickThroughEvent;
import com.auditude.ads.event.AdPluginErrorEvent;
import com.auditude.ads.event.AdPluginEvent;
import com.auditude.ads.event.AdProgressEvent;
import com.auditude.ads.event.AuditudePluginEventListener;
import com.auditude.ads.event.LinearAdEvent;
import com.auditude.ads.event.NonLinearAdEvent;
import com.auditude.ads.event.OnPageEvent;

class AuditudeResolver$1
  implements AuditudePluginEventListener
{
  AuditudeResolver$1(AuditudeResolver paramAuditudeResolver) {}
  
  public void onAdClickEvent(AdClickThroughEvent paramAdClickThroughEvent)
  {
    AuditudeResolver.access$300(this$0).w(AuditudeResolver.access$200(this$0) + "#AdClickThroughEvent", "Event: " + paramAdClickThroughEvent);
  }
  
  public void onAdPluginErrorEvent(AdPluginErrorEvent paramAdPluginErrorEvent)
  {
    AuditudeResolver.access$300(this$0).w(AuditudeResolver.access$200(this$0) + "#onAdPluginErrorEvent", "An error ocurred while resolving ads");
    MediaPlayerNotification.Error localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.AD_RESOLVER_RESOLVE_FAIL, "Auditude plugin failed to resolve ad.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("NATIVE_ERROR_CODE", paramAdPluginErrorEvent.getType());
    localError.setMetadata(localMetadataNode);
    AuditudeResolver.access$400(this$0, localError);
    AuditudeResolver.access$100(this$0);
  }
  
  public void onAdPluginEvent(AdPluginEvent paramAdPluginEvent)
  {
    if ("initComplete".equals(paramAdPluginEvent.getType()))
    {
      AuditudeResolver.access$000(this$0, paramAdPluginEvent);
      AuditudeResolver.access$100(this$0);
    }
  }
  
  public void onAdProgressEvent(AdProgressEvent paramAdProgressEvent)
  {
    AuditudeResolver.access$300(this$0).w(AuditudeResolver.access$200(this$0) + "#AdProgressEvent", "Event: " + paramAdProgressEvent);
  }
  
  public void onLinearAdEvent(LinearAdEvent paramLinearAdEvent)
  {
    AuditudeResolver.access$300(this$0).w(AuditudeResolver.access$200(this$0) + "#LinearAdEvent", "Event: " + paramLinearAdEvent);
  }
  
  public void onNonLinearAdEvent(NonLinearAdEvent paramNonLinearAdEvent)
  {
    AuditudeResolver.access$300(this$0).w(AuditudeResolver.access$200(this$0) + "#NonLinearAdEvent", "Event: " + paramNonLinearAdEvent);
  }
  
  public void onOnPageAdEvent(OnPageEvent paramOnPageEvent)
  {
    AuditudeResolver.access$300(this$0).w(AuditudeResolver.access$200(this$0) + "#OnPageEvent", "Event: " + paramOnPageEvent);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.auditude.AuditudeResolver.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */