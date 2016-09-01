package com.adobe.mediacore;

public class MediaPlayerNotification$Warning
  extends MediaPlayerNotification
{
  public MediaPlayerNotification$Warning(MediaPlayerNotification.NotificationCode paramNotificationCode, String paramString)
  {
    _type = MediaPlayerNotification.EntryType.WARN;
    _code = paramNotificationCode;
    _description = paramString;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayerNotification.Warning
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */