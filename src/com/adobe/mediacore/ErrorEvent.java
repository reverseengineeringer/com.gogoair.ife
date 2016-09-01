package com.adobe.mediacore;

class ErrorEvent
  extends MediaPlayerEvent
{
  private ErrorEvent()
  {
    super(MediaPlayerEvent.Type.VIDEO_ERROR);
  }
  
  public static ErrorEvent createVideoErrorEvent(MediaPlayerNotification.Error paramError)
  {
    ErrorEvent localErrorEvent = new ErrorEvent();
    localErrorEvent.setNotification(paramError);
    return localErrorEvent;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.ErrorEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */