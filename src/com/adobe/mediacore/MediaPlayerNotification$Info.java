package com.adobe.mediacore;

public class MediaPlayerNotification$Info
  extends MediaPlayerNotification
{
  public MediaPlayerNotification$Info(MediaPlayerNotification.NotificationCode paramNotificationCode, String paramString)
  {
    _type = MediaPlayerNotification.EntryType.INFO;
    _code = paramNotificationCode;
    _description = paramString;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayerNotification.Info
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */