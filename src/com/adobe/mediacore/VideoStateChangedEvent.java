package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;

class VideoStateChangedEvent
  extends MediaPlayerEvent
{
  private final MediaPlayerState _playerState;
  
  private VideoStateChangedEvent(MediaPlayerState paramMediaPlayerState)
  {
    super(MediaPlayerEvent.Type.VIDEO_STATE_CHANGED);
    _playerState = paramMediaPlayerState;
  }
  
  public static VideoStateChangedEvent createChangedEvent(MediaPlayerState paramMediaPlayerState, MediaPlayerNotification paramMediaPlayerNotification)
  {
    VideoStateChangedEvent localVideoStateChangedEvent = new VideoStateChangedEvent(paramMediaPlayerState);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.PLAYER_STATE_CHANGE, "Player state has changed.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("STATE", paramMediaPlayerState.name());
    localInfo.setMetadata(localMetadataNode);
    localInfo.setInnerNotification(paramMediaPlayerNotification);
    localVideoStateChangedEvent.setNotification(localInfo);
    return localVideoStateChangedEvent;
  }
  
  public MediaPlayerState getPlayerState()
  {
    return _playerState;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoStateChangedEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */