package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdClick;

class AdClickEvent
  extends MediaPlayerEvent
{
  private final Ad _ad;
  private final AdBreak _adBreak;
  private final AdClick _adClick;
  
  private AdClickEvent(MediaPlayerEvent.Type paramType, Ad paramAd, AdBreak paramAdBreak, AdClick paramAdClick)
  {
    super(paramType);
    _ad = paramAd;
    _adBreak = paramAdBreak;
    _adClick = paramAdClick;
  }
  
  public static AdClickEvent createAdClickEvent()
  {
    return new AdClickEvent(MediaPlayerEvent.Type.VIEW_CLICKED, null, null, null);
  }
  
  public static AdClickEvent createAdClickEvent(AdBreak paramAdBreak, Ad paramAd, AdClick paramAdClick)
  {
    AdClickEvent localAdClickEvent = new AdClickEvent(MediaPlayerEvent.Type.AD_CLICK, paramAd, paramAdBreak, paramAdClick);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.AD_CLICK, "Ad click event detected.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("AD_BREAK", paramAdBreak.toString());
    localMetadataNode.setValue("AD", paramAd.toString());
    localMetadataNode.setValue("AD_CLICK", paramAdClick.toString());
    localInfo.setMetadata(localMetadataNode);
    localAdClickEvent.setNotification(localInfo);
    return localAdClickEvent;
  }
  
  public Ad getAd()
  {
    return _ad;
  }
  
  public AdBreak getAdBreak()
  {
    return _adBreak;
  }
  
  public AdClick getAdClick()
  {
    return _adClick;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdClickEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */