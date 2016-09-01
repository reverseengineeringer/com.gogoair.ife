package com.adobe.mediacore;

public class MediaPlayerNotification$Error
  extends MediaPlayerNotification
{
  public MediaPlayerNotification$Error(MediaPlayerNotification.NotificationCode paramNotificationCode, String paramString)
  {
    _type = MediaPlayerNotification.EntryType.ERROR;
    _code = paramNotificationCode;
    _description = paramString;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayerNotification.Error
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */