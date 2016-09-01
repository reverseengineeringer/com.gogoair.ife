package com.adobe.mediacore.qos;

import android.content.Context;
import com.adobe.mediacore.MediaPlayer;
import com.adobe.mediacore.MediaPlayer.Event;
import com.adobe.mediacore.MediaPlayer.PlaybackEventListener;
import com.adobe.mediacore.MediaPlayer.QOSEventListener;
import com.adobe.mediacore.qos.metrics.BufferingMetrics;
import com.adobe.mediacore.qos.metrics.PlaybackLoadMetrics;
import com.adobe.mediacore.qos.metrics.PlaybackMetrics;
import com.adobe.mediacore.qos.metrics.PlaybackSessionMetrics;
import com.adobe.mediacore.qos.metrics.SeekMetrics;

public final class QOSProvider
{
  private BufferingMetrics _bufferingMetrics;
  private final DeviceInformation _deviceInformation;
  private MediaPlayer _mediaPlayer;
  private final MediaPlayer.PlaybackEventListener _playbackListener = new QOSProvider.2(this);
  private PlaybackLoadMetrics _playbackLoadMetrics;
  private PlaybackMetrics _playbackMetrics;
  private PlaybackSessionMetrics _playbackSessionMetrics;
  private final MediaPlayer.QOSEventListener _qosListener = new QOSProvider.1(this);
  private SeekMetrics _seekMetrics;
  
  public QOSProvider(Context paramContext)
  {
    _deviceInformation = new DeviceInformation(paramContext);
  }
  
  public void attachMediaPlayer(MediaPlayer paramMediaPlayer)
  {
    if (paramMediaPlayer == null) {
      throw new IllegalArgumentException("Provided media player can not be null.");
    }
    if (_mediaPlayer != null) {
      detachMediaPlayer();
    }
    _mediaPlayer = paramMediaPlayer;
    _playbackMetrics = _mediaPlayer.getPlaybackMetrics();
    _playbackLoadMetrics = new PlaybackLoadMetrics();
    _playbackSessionMetrics = new PlaybackSessionMetrics();
    _bufferingMetrics = new BufferingMetrics();
    _seekMetrics = new SeekMetrics();
    _mediaPlayer.addEventListener(MediaPlayer.Event.QOS, _qosListener);
    _mediaPlayer.addEventListener(MediaPlayer.Event.PLAYBACK, _playbackListener);
  }
  
  public void detachMediaPlayer()
  {
    if (_mediaPlayer != null)
    {
      _bufferingMetrics = null;
      _seekMetrics = null;
      _playbackLoadMetrics = null;
      _playbackSessionMetrics = null;
      _playbackMetrics = null;
      _mediaPlayer.removeEventListener(MediaPlayer.Event.QOS, _qosListener);
      _mediaPlayer.removeEventListener(MediaPlayer.Event.PLAYBACK, _playbackListener);
      _mediaPlayer = null;
    }
  }
  
  public DeviceInformation getDeviceInformation()
  {
    return _deviceInformation;
  }
  
  public PlaybackInformation getPlaybackInformation()
  {
    if (_mediaPlayer == null) {
      throw new IllegalStateException("Playback information is available only when a media player is attached to this qos provided.");
    }
    return new PlaybackInformation(_playbackLoadMetrics.getTimeToFirstByte(), _playbackLoadMetrics.getTimeToLoad(), _playbackLoadMetrics.getTimeToStart(), _playbackLoadMetrics.getTimeToFirstFrame(), _playbackLoadMetrics.getTimeToPrepare(), _playbackLoadMetrics.getTimeToFail(), _playbackSessionMetrics.getSecondsPlayed(), _playbackSessionMetrics.getSecondsSpent(), _playbackMetrics.getFrameRate(), _playbackMetrics.getDroppedFramesCount(), _playbackMetrics.getBitrate(), _playbackMetrics.getBufferTime(), _playbackMetrics.getBufferLength(), _bufferingMetrics.getEmptyBufferCount(), _bufferingMetrics.getTotalBufferingTime(), _seekMetrics.getLastSeekTime());
  }
  
  public void updateMetrics(MediaPlayer paramMediaPlayer)
  {
    if (paramMediaPlayer == null) {
      throw new IllegalArgumentException("Provided media player can not be null.");
    }
    _mediaPlayer = paramMediaPlayer;
    _playbackMetrics = _mediaPlayer.getPlaybackMetrics();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.qos.QOSProvider
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */