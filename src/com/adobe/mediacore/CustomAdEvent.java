package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;

class CustomAdEvent
  extends MediaPlayerEvent
{
  static final String AD_CLICK_HANDLE = "adClickThruHandle";
  static final String AD_CLICK_THRU_URL = "adClickThruUrl";
  static final String AD_DURATION = "duration";
  static final String AD_ERROR_MSG = "error";
  static final String AD_REMAINING = "remaining";
  private Metadata _adData;
  private final CustomAdEventType _eventType;
  
  private CustomAdEvent(CustomAdEventType paramCustomAdEventType)
  {
    this(paramCustomAdEventType, new MetadataNode());
  }
  
  private CustomAdEvent(CustomAdEventType paramCustomAdEventType, Metadata paramMetadata)
  {
    super(MediaPlayerEvent.Type.CUSTOM_AD_EVENT);
    _eventType = paramCustomAdEventType;
    _adData = paramMetadata;
  }
  
  public static CustomAdEvent createAdClickThru(String paramString, boolean paramBoolean)
  {
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("adClickThruUrl", paramString);
    if (paramBoolean) {
      localMetadataNode.setValue("adClickThruHandle", "player");
    }
    return new CustomAdEvent(CustomAdEventType.AD_CLICK_THROUGH, localMetadataNode);
  }
  
  public static CustomAdEvent createAdDurationChange()
  {
    return new CustomAdEvent(CustomAdEventType.AD_DURATION_CHANGE);
  }
  
  public static CustomAdEvent createAdError(String paramString)
  {
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("error", paramString);
    return new CustomAdEvent(CustomAdEventType.AD_ERROR, localMetadataNode);
  }
  
  public static CustomAdEvent createAdExpandedChange()
  {
    return new CustomAdEvent(CustomAdEventType.AD_EXPANDED_CHANGE);
  }
  
  public static CustomAdEvent createAdImpression()
  {
    return new CustomAdEvent(CustomAdEventType.AD_IMPRESSION);
  }
  
  public static CustomAdEvent createAdInteraction()
  {
    return new CustomAdEvent(CustomAdEventType.AD_INTERACTION);
  }
  
  public static CustomAdEvent createAdLinearChange()
  {
    return new CustomAdEvent(CustomAdEventType.AD_LINEAR_CHANGE);
  }
  
  public static CustomAdEvent createAdPaused()
  {
    return new CustomAdEvent(CustomAdEventType.AD_PAUSED);
  }
  
  public static CustomAdEvent createAdPlaying()
  {
    return new CustomAdEvent(CustomAdEventType.AD_PLAYING);
  }
  
  public static CustomAdEvent createAdProgress(float paramFloat1, float paramFloat2)
  {
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("duration", String.valueOf(paramFloat1));
    localMetadataNode.setValue("remaining", String.valueOf(paramFloat2));
    return new CustomAdEvent(CustomAdEventType.AD_PROGRESS, localMetadataNode);
  }
  
  public static CustomAdEvent createAdSizeChange()
  {
    return new CustomAdEvent(CustomAdEventType.AD_SIZE_CHANGE);
  }
  
  public static CustomAdEvent createAdSkippableStateChange()
  {
    return new CustomAdEvent(CustomAdEventType.AD_SKIPPABLE_STATE_CHANGE);
  }
  
  public static CustomAdEvent createAdSkipped()
  {
    return new CustomAdEvent(CustomAdEventType.AD_SKIPPED);
  }
  
  public static CustomAdEvent createAdStarted()
  {
    return new CustomAdEvent(CustomAdEventType.AD_STARTED);
  }
  
  public static CustomAdEvent createAdStopped()
  {
    return new CustomAdEvent(CustomAdEventType.AD_STOPPED);
  }
  
  public static CustomAdEvent createAdUserAcceptInvitation()
  {
    return new CustomAdEvent(CustomAdEventType.AD_USER_ACCEPT_INVITATION);
  }
  
  public static CustomAdEvent createAdUserClose()
  {
    return new CustomAdEvent(CustomAdEventType.AD_USER_CLOSE);
  }
  
  public static CustomAdEvent createAdUserMinimize()
  {
    return new CustomAdEvent(CustomAdEventType.AD_USER_MINIMIZE);
  }
  
  public static CustomAdEvent createAdVideoComplete()
  {
    return new CustomAdEvent(CustomAdEventType.AD_VIDEO_COMPLETE);
  }
  
  public static CustomAdEvent createAdVideoFirstQuartile()
  {
    return new CustomAdEvent(CustomAdEventType.AD_FIRST_QUARTILE);
  }
  
  public static CustomAdEvent createAdVideoMidpoint()
  {
    return new CustomAdEvent(CustomAdEventType.AD_VIDEO_MIDPOINT);
  }
  
  public static CustomAdEvent createAdVideoStart()
  {
    return new CustomAdEvent(CustomAdEventType.AD_VIDEO_START);
  }
  
  public static CustomAdEvent createAdVideoThirdQuartile()
  {
    return new CustomAdEvent(CustomAdEventType.AD_THIRD_QUARTILE);
  }
  
  public static CustomAdEvent createAdVolumeChange()
  {
    return new CustomAdEvent(CustomAdEventType.AD_VOLUME_CHANGE);
  }
  
  public Metadata getAdData()
  {
    return _adData;
  }
  
  public CustomAdEventType getEventType()
  {
    return _eventType;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.CustomAdEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */