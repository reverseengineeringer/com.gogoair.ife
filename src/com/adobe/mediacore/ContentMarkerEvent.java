package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;

class ContentMarkerEvent
  extends MediaPlayerEvent
{
  private final int _contentId;
  private final long _position;
  
  private ContentMarkerEvent(int paramInt, long paramLong)
  {
    super(MediaPlayerEvent.Type.CONTENT_MARKER);
    _contentId = paramInt;
    _position = paramLong;
  }
  
  public static ContentMarkerEvent createContentMarkerEvent(int paramInt, long paramLong)
  {
    ContentMarkerEvent localContentMarkerEvent = new ContentMarkerEvent(paramInt, paramLong);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.CONTENT_MARKER, "Content marker received.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("CONTENT_ID", paramInt + "");
    localMetadataNode.setValue("CURRENT_MEDIA_TIME", paramLong + "");
    localInfo.setMetadata(localMetadataNode);
    localContentMarkerEvent.setNotification(localInfo);
    return localContentMarkerEvent;
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
 * Qualified Name:     com.adobe.mediacore.ContentMarkerEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */