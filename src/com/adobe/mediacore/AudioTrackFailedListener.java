package com.adobe.mediacore;

import com.adobe.mediacore.info.AudioTrack;

abstract interface AudioTrackFailedListener
  extends MediaPlayer.EventListener
{
  public abstract void onFailed(AudioTrack paramAudioTrack, MediaPlayerNotification.Error paramError);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AudioTrackFailedListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */