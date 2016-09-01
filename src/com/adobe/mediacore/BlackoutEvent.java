package com.adobe.mediacore;

class BlackoutEvent
  extends MediaPlayerEvent
{
  public BlackoutEvent(MediaPlayerEvent.Type paramType)
  {
    super(paramType);
  }
  
  public static BlackoutEvent createBlackoutEvent()
  {
    return new BlackoutEvent(MediaPlayerEvent.Type.BACKGROUND_MANIFEST_FAILED);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.BlackoutEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */