package com.adobe.mediacore;

import com.adobe.mediacore.info.AudioTrack;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;

class AudioTrackEvent
  extends MediaPlayerEvent
{
  private final AudioTrack _audioTrack;
  
  private AudioTrackEvent(MediaPlayerEvent.Type paramType, AudioTrack paramAudioTrack)
  {
    super(paramType);
    _audioTrack = paramAudioTrack;
  }
  
  public static AudioTrackEvent createAudioTrackFailedEvent(AudioTrack paramAudioTrack)
  {
    AudioTrackEvent localAudioTrackEvent = new AudioTrackEvent(MediaPlayerEvent.Type.AUDIO_TRACK_FAILED, paramAudioTrack);
    MediaPlayerNotification.Error localError = new MediaPlayerNotification.Error(MediaPlayerNotification.ErrorCode.AUDIO_TRACK_ERROR, "An error related to an audio track occured.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("AUDIO_TRACK_NAME", paramAudioTrack.getName());
    localMetadataNode.setValue("AUDIO_TRACK_LANGUAGE", paramAudioTrack.getLanguage());
    localError.setMetadata(localMetadataNode);
    localAudioTrackEvent.setNotification(localError);
    return localAudioTrackEvent;
  }
  
  public AudioTrack getAudioTrack()
  {
    return _audioTrack;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AudioTrackEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */