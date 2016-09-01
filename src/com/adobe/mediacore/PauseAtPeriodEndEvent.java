package com.adobe.mediacore;

class PauseAtPeriodEndEvent
  extends MediaPlayerEvent
{
  private final int _adId;
  
  public PauseAtPeriodEndEvent(MediaPlayerEvent.Type paramType, int paramInt)
  {
    super(paramType);
    _adId = paramInt;
  }
  
  public int getAdId()
  {
    return _adId;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.PauseAtPeriodEndEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */