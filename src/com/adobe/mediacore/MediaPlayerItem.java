package com.adobe.mediacore;

import com.adobe.mediacore.info.AudioTrack;
import com.adobe.mediacore.info.ClosedCaptionsTrack;
import java.util.List;

public abstract interface MediaPlayerItem
{
  public abstract List getAdTags();
  
  public abstract List getAudioTracks();
  
  public abstract List getAvailablePlaybackRates();
  
  public abstract List getClosedCaptionsTracks();
  
  public abstract List getDRMMetadataInfos();
  
  public abstract List getProfiles();
  
  public abstract MediaResource getResource();
  
  public abstract AudioTrack getSelectedAudioTrack();
  
  public abstract ClosedCaptionsTrack getSelectedClosedCaptionsTrack();
  
  public abstract List getTimedMetadata();
  
  public abstract boolean hasAlternateAudio();
  
  public abstract boolean hasClosedCaptions();
  
  public abstract boolean hasTimedMetadata();
  
  public abstract boolean isDynamic();
  
  public abstract boolean isLive();
  
  public abstract boolean isProtected();
  
  public abstract boolean isTrickPlaySupported();
  
  public abstract boolean selectAudioTrack(AudioTrack paramAudioTrack);
  
  public abstract boolean selectClosedCaptionsTrack(ClosedCaptionsTrack paramClosedCaptionsTrack);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayerItem
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */