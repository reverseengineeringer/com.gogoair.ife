package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;

class ContentChangedEvent
  extends MediaPlayerEvent
{
  private final int _contentId;
  private final long _position;
  
  private ContentChangedEvent(int paramInt, long paramLong)
  {
    super(MediaPlayerEvent.Type.CONTENT_CHANGED);
    _contentId = paramInt;
    _position = paramLong;
  }
  
  public static ContentChangedEvent createChangeEvent(int paramInt, long paramLong)
  {
    ContentChangedEvent localContentChangedEvent = new ContentChangedEvent(paramInt, paramLong);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.CONTENT_CHANGE, "Content has changed.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("CONTENT_ID", paramInt + "");
    localMetadataNode.setValue("CURRENT_MEDIA_TIME", paramLong + "");
    localInfo.setMetadata(localMetadataNode);
    localContentChangedEvent.setNotification(localInfo);
    return localContentChangedEvent;
  }
  
  public int getContentId()
  {
    return _contentId;
  }
  
  public long getPosition()
  {
    return _position;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.ContentChangedEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */