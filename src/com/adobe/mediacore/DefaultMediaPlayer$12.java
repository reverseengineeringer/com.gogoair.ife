package com.adobe.mediacore;

import com.adobe.mediacore.logging.Logger;

class DefaultMediaPlayer$12
  implements VideoStateChangedListener
{
  DefaultMediaPlayer$12(DefaultMediaPlayer paramDefaultMediaPlayer) {}
  
  public void onStateChanged(MediaPlayerState paramMediaPlayerState, MediaPlayerNotification paramMediaPlayerNotification)
  {
    if (DefaultMediaPlayer.access$1800(this$0) == MediaPlayer.PlayerState.ERROR) {
      DefaultMediaPlayer.access$1700(this$0).w(DefaultMediaPlayer.access$1500() + "#onStateChanged", "Ignore event as media player is in ERROR state.");
    }
    do
    {
      return;
      switch (DefaultMediaPlayer.15.$SwitchMap$com$adobe$mediacore$MediaPlayerState[paramMediaPlayerState.ordinal()])
      {
      default: 
        return;
      case 1: 
        DefaultMediaPlayer.access$1700(this$0).i(DefaultMediaPlayer.access$1500() + "#onPlayPaused", "Playback paused.");
        return;
      case 2: 
        DefaultMediaPlayer.access$1700(this$0).i(DefaultMediaPlayer.access$1500() + "#onPlayStart", "Playback started.");
        if (DefaultMediaPlayer.access$300(this$0).getCustomAdView().isActive()) {
          DefaultMediaPlayer.access$300(this$0).getCustomAdView().reset();
        }
        if (!DefaultMediaPlayer.access$700(this$0)) {
          DefaultMediaPlayer.access$800(this$0);
        }
        DefaultMediaPlayer.access$100(this$0).dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.PLAY_START));
      }
    } while (this$0.getStatus() != MediaPlayer.PlayerState.COMPLETE);
    this$0.setStatus(MediaPlayer.PlayerState.PLAYING, null);
    return;
    DefaultMediaPlayer.access$1700(this$0).i(DefaultMediaPlayer.access$1500() + "#onPlaybackComplete", "Playback completed.");
    if (DefaultMediaPlayer.access$1000(this$0) != null) {
      DefaultMediaPlayer.access$1000(this$0).updateCurrentAdInfo(null);
    }
    this$0.stopInternalTimer();
    DefaultMediaPlayer.access$100(this$0).addEventListener(MediaPlayerEvent.Type.POST_ROLL_COMPLETE, DefaultMediaPlayer.access$2400(this$0));
    DefaultMediaPlayer.access$300(this$0).handlePostRoll();
    return;
    DefaultMediaPlayer.access$1700(this$0).i(DefaultMediaPlayer.access$1500() + "#onStateChanged", "Playback suspended");
    this$0.setStatus(MediaPlayer.PlayerState.SUSPENDED, null);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultMediaPlayer.12
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */