package com.adobe.mediacore.qos;

public class PlaybackInformation
{
  private final long _bitrate;
  private final long _bufferLength;
  private final long _bufferTime;
  private final long _bufferingTime;
  private final long _droppedFrameCount;
  private final long _emptyBufferCount;
  private final float _frameRate;
  private final long _lastSeekTime;
  private final long _secondsPlayed;
  private final long _secondsSpent;
  private final long _timeToFail;
  private final long _timeToFirstByte;
  private final long _timeToFirstFrame;
  private final long _timeToLoad;
  private final long _timeToPrepare;
  private final long _timeToStart;
  
  public PlaybackInformation(long paramLong1, long paramLong2, long paramLong3, long paramLong4, long paramLong5, long paramLong6, long paramLong7, long paramLong8, float paramFloat, long paramLong9, long paramLong10, long paramLong11, long paramLong12, long paramLong13, long paramLong14, long paramLong15)
  {
    _timeToFirstByte = paramLong1;
    _timeToLoad = paramLong2;
    _timeToStart = paramLong3;
    _timeToFirstFrame = paramLong4;
    _timeToPrepare = paramLong5;
    _timeToFail = paramLong6;
    _secondsPlayed = paramLong7;
    _secondsSpent = paramLong8;
    _frameRate = paramFloat;
    _droppedFrameCount = paramLong9;
    _bitrate = paramLong10;
    _bufferTime = paramLong11;
    _bufferLength = paramLong12;
    _emptyBufferCount = paramLong13;
    _bufferingTime = paramLong14;
    _lastSeekTime = paramLong15;
  }
  
  public final long getBitrate()
  {
    return _bitrate;
  }
  
  public final long getBufferLength()
  {
    return _bufferLength;
  }
  
  public final long getBufferTime()
  {
    return _bufferTime;
  }
  
  public final long getBufferingTime()
  {
    return _bufferingTime;
  }
  
  public final long getDroppedFrameCount()
  {
    return _droppedFrameCount;
  }
  
  public final long getEmptyBufferCount()
  {
    return _emptyBufferCount;
  }
  
  public final float getFrameRate()
  {
    return _frameRate;
  }
  
  public long getLastSeekTime()
  {
    return _lastSeekTime;
  }
  
  public final long getTimeToFail()
  {
    return _timeToFail;
  }
  
  public final long getTimeToFirstByte()
  {
    return _timeToFirstByte;
  }
  
  public final long getTimeToFirstFrame()
  {
    return _timeToFirstFrame;
  }
  
  public final long getTimeToLoad()
  {
    return _timeToLoad;
  }
  
  public long getTimeToPrepare()
  {
    return _timeToPrepare;
  }
  
  public final long getTimeToStart()
  {
    return _timeToStart;
  }
  
  public final long getTotalSecondsPlayed()
  {
    return _secondsPlayed;
  }
  
  public final long getTotalSecondsSpent()
  {
    return _secondsSpent;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.qos.PlaybackInformation
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */