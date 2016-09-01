package com.adobe.mediacore.qos.metrics;

import com.adobe.mediacore.utils.TimeRange;

public abstract class PlaybackMetrics
{
  protected long _bitrate;
  protected long _bufferLength;
  protected long _bufferTime;
  protected TimeRange _bufferedRange = TimeRange.createRange(0L, 0L);
  protected long _droppedFramesCount;
  protected float _frameRate;
  protected TimeRange _playbackRange = TimeRange.createRange(0L, 0L);
  protected TimeRange _seekableRange = TimeRange.createRange(0L, 0L);
  protected long _time;
  protected long _timeLocal;
  
  protected abstract void doUpdate();
  
  public long getBitrate()
  {
    return _bitrate;
  }
  
  public long getBufferLength()
  {
    return _bufferLength;
  }
  
  public long getBufferTime()
  {
    return _bufferTime;
  }
  
  public TimeRange getBufferedRange()
  {
    return _bufferedRange;
  }
  
  public long getDroppedFramesCount()
  {
    return _droppedFramesCount;
  }
  
  public float getFrameRate()
  {
    return _frameRate;
  }
  
  public TimeRange getPlaybackRange()
  {
    return _playbackRange;
  }
  
  public TimeRange getSeekableRange()
  {
    return _seekableRange;
  }
  
  public long getTime()
  {
    return _time;
  }
  
  public long getTimeLocal()
  {
    return _timeLocal;
  }
  
  public void reset()
  {
    _time = 0L;
    _timeLocal = 0L;
    _playbackRange = TimeRange.createRange(0L, 0L);
    _seekableRange = TimeRange.createRange(0L, 0L);
    _bufferedRange = TimeRange.createRange(0L, 0L);
    _frameRate = 0.0F;
    _droppedFramesCount = 0L;
    _bitrate = 0L;
    _bufferTime = 0L;
    _bufferLength = 0L;
  }
  
  public void update()
  {
    doUpdate();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.qos.metrics.PlaybackMetrics
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */