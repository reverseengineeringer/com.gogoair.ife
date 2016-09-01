package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.metadata.TimedMetadata;
import com.adobe.mediacore.metadata.TimedMetadata.Type;

class TimedMetadataAddedEvent
  extends MediaPlayerEvent
{
  private static final int DEFAULT_ID = 0;
  private static final String DEFAULT_NAME = "";
  private final TimedMetadata _timedMetadata;
  
  private TimedMetadataAddedEvent(TimedMetadata paramTimedMetadata, MediaPlayerEvent.Type paramType)
  {
    super(paramType);
    _timedMetadata = paramTimedMetadata;
  }
  
  public static TimedMetadataAddedEvent createAddedEvent(TimedMetadata paramTimedMetadata)
  {
    TimedMetadataAddedEvent localTimedMetadataAddedEvent = new TimedMetadataAddedEvent(paramTimedMetadata, MediaPlayerEvent.Type.TIMED_METADATA_ADDED);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.TIMED_METADATA_ADD, "A new timed metadata was discovered in the manifest.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("TYPE", String.valueOf(paramTimedMetadata.getType()));
    localMetadataNode.setValue("ID", String.valueOf(paramTimedMetadata.getId()));
    localMetadataNode.setValue("NAME", paramTimedMetadata.getName());
    localMetadataNode.setValue("TIME", String.valueOf(paramTimedMetadata.getTime()));
    localInfo.setMetadata(localMetadataNode);
    localTimedMetadataAddedEvent.setNotification(localInfo);
    return localTimedMetadataAddedEvent;
  }
  
  public static TimedMetadataAddedEvent createAddedID3Event(Metadata paramMetadata, long paramLong)
  {
    paramMetadata = new TimedMetadata(TimedMetadata.Type.ID3, paramLong, 0L, "", paramMetadata);
    TimedMetadataAddedEvent localTimedMetadataAddedEvent = new TimedMetadataAddedEvent(paramMetadata, MediaPlayerEvent.Type.TIMED_METADATA_ADDED);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.TIMED_METADATA_ADD, "A new id3 timed metadata was discovered in the transport segment.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("TYPE", String.valueOf(paramMetadata.getType()));
    localMetadataNode.setValue("ID", String.valueOf(paramMetadata.getId()));
    localMetadataNode.setValue("NAME", paramMetadata.getName());
    localMetadataNode.setValue("TIME", String.valueOf(paramMetadata.getTime()));
    localInfo.setMetadata(localMetadataNode);
    localTimedMetadataAddedEvent.setNotification(localInfo);
    return localTimedMetadataAddedEvent;
  }
  
  public static TimedMetadataAddedEvent createBackgroundAddedEvent(TimedMetadata paramTimedMetadata)
  {
    TimedMetadataAddedEvent localTimedMetadataAddedEvent = new TimedMetadataAddedEvent(paramTimedMetadata, MediaPlayerEvent.Type.TIMED_METADATA_ADDED_IN_BACKGROUND);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.TIMED_METADATA_ADD_IN_BACKGROUND, "A new timed metadata was discovered in the background manifest.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("TYPE", String.valueOf(paramTimedMetadata.getType()));
    localMetadataNode.setValue("ID", String.valueOf(paramTimedMetadata.getId()));
    localMetadataNode.setValue("NAME", paramTimedMetadata.getName());
    localMetadataNode.setValue("TIME", String.valueOf(paramTimedMetadata.getTime()));
    localInfo.setMetadata(localMetadataNode);
    localTimedMetadataAddedEvent.setNotification(localInfo);
    return localTimedMetadataAddedEvent;
  }
  
  public TimedMetadata getTimedMetadata()
  {
    return _timedMetadata;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.TimedMetadataAddedEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */