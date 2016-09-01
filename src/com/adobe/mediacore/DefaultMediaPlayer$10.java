package com.adobe.mediacore;

import com.adobe.mediacore.info.AudioTrack;
import com.adobe.mediacore.logging.Logger;

class DefaultMediaPlayer$10
  implements AudioTrackFailedListener
{
  DefaultMediaPlayer$10(DefaultMediaPlayer paramDefaultMediaPlayer) {}
  
  public void onFailed(AudioTrack paramAudioTrack, MediaPlayerNotification.Error paramError)
  {
    DefaultMediaPlayer.access$1700(this$0).w(DefaultMediaPlayer.access$1500() + "::AudioTrackFailedListener#onFailed", "Audio track failed: [" + paramAudioTrack + "].");
    paramAudioTrack = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.PLAYBACK_OPERATION_FAIL, "Failed to load audio track. Please select another track.");
    paramAudioTrack.setInnerNotification(paramError);
    DefaultMediaPlayer.access$100(this$0).dispatch(OperationFailedEvent.createEvent(paramAudioTrack));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultMediaPlayer.10
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */