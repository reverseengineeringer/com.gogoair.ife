package com.adobe.mediacore;

class OperationFailedEvent
  extends MediaPlayerEvent
{
  private OperationFailedEvent()
  {
    super(MediaPlayerEvent.Type.OPERATION_FAILED);
  }
  
  public static OperationFailedEvent createEvent(MediaPlayerNotification.Warning paramWarning)
  {
    OperationFailedEvent localOperationFailedEvent = new OperationFailedEvent();
    localOperationFailedEvent.setNotification(paramWarning);
    return localOperationFailedEvent;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.OperationFailedEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */