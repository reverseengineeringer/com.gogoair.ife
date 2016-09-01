package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;

class VideoSizeChangedEvent
  extends MediaPlayerEvent
{
  private final int _height;
  private final int _width;
  
  private VideoSizeChangedEvent(int paramInt1, int paramInt2)
  {
    super(MediaPlayerEvent.Type.SIZE_CHANGED);
    _height = paramInt1;
    _width = paramInt2;
  }
  
  public static VideoSizeChangedEvent createChangedEvent(int paramInt1, int paramInt2)
  {
    VideoSizeChangedEvent localVideoSizeChangedEvent = new VideoSizeChangedEvent(paramInt1, paramInt2);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.VIDEO_SIZE_CHANGED, "The size of the video has changed.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("HEIGHT", paramInt1 + "");
    localMetadataNode.setValue("WIDTH", paramInt2 + "");
    localInfo.setMetadata(localMetadataNode);
    localVideoSizeChangedEvent.setNotification(localInfo);
    return localVideoSizeChangedEvent;
  }
  
  public int getHeight()
  {
    return _height;
  }
  
  public int getWidth()
  {
    return _width;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoSizeChangedEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */