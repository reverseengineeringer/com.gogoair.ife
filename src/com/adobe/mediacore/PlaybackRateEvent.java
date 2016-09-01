package com.adobe.mediacore;

class PlaybackRateEvent
  extends MediaPlayerEvent
{
  private float _rate;
  
  public PlaybackRateEvent(MediaPlayerEvent.Type paramType, float paramFloat)
  {
    super(paramType);
    _rate = paramFloat;
  }
  
  public static PlaybackRateEvent createRatePlayingEvent(float paramFloat)
  {
    return new PlaybackRateEvent(MediaPlayerEvent.Type.RATE_PLAYING, paramFloat);
  }
  
  public static PlaybackRateEvent createRateSelectedEvent(float paramFloat)
  {
    return new PlaybackRateEvent(MediaPlayerEvent.Type.RATE_SELECTED, paramFloat);
  }
  
  public float getRate()
  {
    return _rate;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.PlaybackRateEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */