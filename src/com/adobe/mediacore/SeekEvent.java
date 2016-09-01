package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;

class SeekEvent
  extends MediaPlayerEvent
{
  private final long _position;
  
  private SeekEvent(MediaPlayerEvent.Type paramType, long paramLong)
  {
    super(paramType);
    _position = paramLong;
  }
  
  public static SeekEvent createSeekAdjustCompleted(long paramLong)
  {
    SeekEvent localSeekEvent = new SeekEvent(MediaPlayerEvent.Type.SEEK_ADJUST_COMPLETED, paramLong);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.SEEK_ADJUST_COMPLETE, "Seek adjust operation completed.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("SEEK_TIME", paramLong + "");
    localInfo.setMetadata(localMetadataNode);
    localSeekEvent.setNotification(localInfo);
    return localSeekEvent;
  }
  
  public static SeekEvent createSeekCompleted(long paramLong)
  {
    SeekEvent localSeekEvent = new SeekEvent(MediaPlayerEvent.Type.SEEK_COMPLETED, paramLong);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.SEEK_COMPLETE, "Seek operation completed.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("SEEK_TIME", paramLong + "");
    localInfo.setMetadata(localMetadataNode);
    localSeekEvent.setNotification(localInfo);
    return localSeekEvent;
  }
  
  public static SeekEvent createSeekStarted(long paramLong)
  {
    SeekEvent localSeekEvent = new SeekEvent(MediaPlayerEvent.Type.SEEK_STARTED, paramLong);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.SEEK_START, "Seek operation started.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("SEEK_TIME", paramLong + "");
    localInfo.setMetadata(localMetadataNode);
    localSeekEvent.setNotification(localInfo);
    return localSeekEvent;
  }
  
  public long getPosition()
  {
    return _position;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.SeekEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */