package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdBreak;

class AdPlaybackEvent
  extends MediaPlayerEvent
{
  private final Ad _ad;
  private final AdBreak _adBreak;
  private final int _progress;
  
  private AdPlaybackEvent(MediaPlayerEvent.Type paramType, AdBreak paramAdBreak, Ad paramAd, int paramInt)
  {
    super(paramType);
    _adBreak = paramAdBreak;
    _ad = paramAd;
    _progress = paramInt;
  }
  
  public static AdPlaybackEvent createCompleteEvent(AdBreak paramAdBreak, Ad paramAd)
  {
    AdPlaybackEvent localAdPlaybackEvent = new AdPlaybackEvent(MediaPlayerEvent.Type.AD_COMPLETE, paramAdBreak, paramAd, 100);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.AD_COMPLETE, "Ad has completed.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("AD_BREAK", paramAdBreak.toString());
    localMetadataNode.setValue("AD", paramAd.toString());
    localInfo.setMetadata(localMetadataNode);
    localAdPlaybackEvent.setNotification(localInfo);
    return localAdPlaybackEvent;
  }
  
  public static AdPlaybackEvent createProgressEvent(AdBreak paramAdBreak, Ad paramAd, int paramInt)
  {
    AdPlaybackEvent localAdPlaybackEvent = new AdPlaybackEvent(MediaPlayerEvent.Type.AD_PROGRESS, paramAdBreak, paramAd, paramInt);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.AD_PROGRESS, "Ad playback progress.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("AD_BREAK", paramAdBreak.toString());
    localMetadataNode.setValue("AD", paramAd.toString());
    localMetadataNode.setValue("PROGRESS", paramInt + "");
    localInfo.setMetadata(localMetadataNode);
    localAdPlaybackEvent.setNotification(localInfo);
    return localAdPlaybackEvent;
  }
  
  public static AdPlaybackEvent createStartEvent(AdBreak paramAdBreak, Ad paramAd)
  {
    AdPlaybackEvent localAdPlaybackEvent = new AdPlaybackEvent(MediaPlayerEvent.Type.AD_START, paramAdBreak, paramAd, 0);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.AD_START, "Ad has started.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("AD_BREAK", paramAdBreak.toString());
    localMetadataNode.setValue("AD", paramAd.toString());
    localInfo.setMetadata(localMetadataNode);
    localAdPlaybackEvent.setNotification(localInfo);
    return localAdPlaybackEvent;
  }
  
  public Ad getAd()
  {
    return _ad;
  }
  
  public AdBreak getAdBreak()
  {
    return _adBreak;
  }
  
  public int getProgress()
  {
    return _progress;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdPlaybackEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */