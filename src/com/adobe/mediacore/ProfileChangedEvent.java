package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;

class ProfileChangedEvent
  extends MediaPlayerEvent
{
  private final long _position;
  private final long _profile;
  
  private ProfileChangedEvent(long paramLong1, long paramLong2)
  {
    super(MediaPlayerEvent.Type.PROFILE_CHANGED);
    _profile = paramLong1;
    _position = paramLong2;
  }
  
  public static ProfileChangedEvent createProfileChangeEvent(long paramLong1, long paramLong2)
  {
    ProfileChangedEvent localProfileChangedEvent = new ProfileChangedEvent(paramLong1, paramLong2);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.BITRATE_CHANGE, "Content has changed.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("BITRATE", paramLong1 + "");
    localMetadataNode.setValue("CURRENT_MEDIA_TIME", paramLong2 + "");
    localInfo.setMetadata(localMetadataNode);
    localProfileChangedEvent.setNotification(localInfo);
    return localProfileChangedEvent;
  }
  
  public long getPosition()
  {
    return _position;
  }
  
  public long getProfile()
  {
    return _profile;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.ProfileChangedEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */