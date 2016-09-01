package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.timeline.advertising.AdBreak;

class AdBreakPlaybackEvent
  extends MediaPlayerEvent
{
  private final AdBreak _adBreak;
  
  private AdBreakPlaybackEvent(MediaPlayerEvent.Type paramType, AdBreak paramAdBreak)
  {
    super(paramType);
    _adBreak = paramAdBreak;
  }
  
  public static AdBreakPlaybackEvent createCompleteEvent(AdBreak paramAdBreak)
  {
    AdBreakPlaybackEvent localAdBreakPlaybackEvent = new AdBreakPlaybackEvent(MediaPlayerEvent.Type.AD_BREAK_COMPLETE, paramAdBreak);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.AD_BREAK_COMPLETE, "Ad-break has completed.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("AD_BREAK", paramAdBreak.toString());
    localInfo.setMetadata(localMetadataNode);
    localAdBreakPlaybackEvent.setNotification(localInfo);
    return localAdBreakPlaybackEvent;
  }
  
  public static AdBreakPlaybackEvent createSkippedEvent(AdBreak paramAdBreak)
  {
    AdBreakPlaybackEvent localAdBreakPlaybackEvent = new AdBreakPlaybackEvent(MediaPlayerEvent.Type.AD_BREAK_SKIPPED, paramAdBreak);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.AD_BREAK_SKIPPED, "Ad-break has been skipped.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("AD_BREAK", paramAdBreak.toString());
    localInfo.setMetadata(localMetadataNode);
    localAdBreakPlaybackEvent.setNotification(localInfo);
    return localAdBreakPlaybackEvent;
  }
  
  public static AdBreakPlaybackEvent createStartEvent(AdBreak paramAdBreak)
  {
    AdBreakPlaybackEvent localAdBreakPlaybackEvent = new AdBreakPlaybackEvent(MediaPlayerEvent.Type.AD_BREAK_START, paramAdBreak);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.AD_BREAK_START, "Ad-break has started.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("AD_BREAK", paramAdBreak.toString());
    localInfo.setMetadata(localMetadataNode);
    localAdBreakPlaybackEvent.setNotification(localInfo);
    return localAdBreakPlaybackEvent;
  }
  
  public AdBreak getAdBreak()
  {
    return _adBreak;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdBreakPlaybackEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */