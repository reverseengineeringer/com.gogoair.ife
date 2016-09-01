package com.adobe.mediacore.session;

import com.adobe.mediacore.MediaPlayerNotification;

public class NotificationHistory$Item
{
  private final long _index;
  private final MediaPlayerNotification _notification;
  private final long _timeStamp;
  
  public NotificationHistory$Item(NotificationHistory paramNotificationHistory, long paramLong1, long paramLong2, MediaPlayerNotification paramMediaPlayerNotification)
  {
    _index = paramLong1;
    _timeStamp = paramLong2;
    _notification = paramMediaPlayerNotification;
  }
  
  public long getIndex()
  {
    return _index;
  }
  
  public MediaPlayerNotification getNotification()
  {
    return _notification;
  }
  
  public long getTimeStamp()
  {
    return _timeStamp;
  }
  
  public String toString()
  {
    StringBuffer localStringBuffer = new StringBuffer("{");
    localStringBuffer.append("\"index\":").append(_index).append(",");
    localStringBuffer.append("\"timestamp\":").append(_timeStamp).append(",");
    if (_notification != null) {
      localStringBuffer.append("\"notification\":").append(_notification);
    }
    for (;;)
    {
      return "}";
      localStringBuffer.append("\"notification\":null");
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.session.NotificationHistory.Item
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */