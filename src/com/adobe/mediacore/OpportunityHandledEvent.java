package com.adobe.mediacore;

class OpportunityHandledEvent
  extends MediaPlayerEvent
{
  private final long _time;
  
  public OpportunityHandledEvent(MediaPlayerEvent.Type paramType, long paramLong)
  {
    super(paramType);
    _time = paramLong;
  }
  
  public long getTime()
  {
    return _time;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.OpportunityHandledEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */