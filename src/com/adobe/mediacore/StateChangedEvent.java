package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;

class StateChangedEvent
  extends MediaPlayerEvent
{
  private final MediaPlayer.PlayerState _currentState;
  private final MediaPlayerNotification _notification;
  
  private StateChangedEvent(MediaPlayer.PlayerState paramPlayerState, MediaPlayerNotification paramMediaPlayerNotification)
  {
    super(MediaPlayerEvent.Type.STATE_CHANGED);
    _currentState = paramPlayerState;
    _notification = paramMediaPlayerNotification;
  }
  
  public static StateChangedEvent createChangedEvent(MediaPlayer.PlayerState paramPlayerState, MediaPlayerNotification paramMediaPlayerNotification)
  {
    StateChangedEvent localStateChangedEvent = new StateChangedEvent(paramPlayerState, paramMediaPlayerNotification);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.PLAYER_STATE_CHANGE, "Player state has changed.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("STATE", paramPlayerState.name());
    localInfo.setMetadata(localMetadataNode);
    localInfo.setInnerNotification(paramMediaPlayerNotification);
    localStateChangedEvent.setNotification(localInfo);
    return localStateChangedEvent;
  }
  
  public MediaPlayer.PlayerState getCurrentState()
  {
    return _currentState;
  }
  
  public MediaPlayerNotification getNotification()
  {
    return _notification;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.StateChangedEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */