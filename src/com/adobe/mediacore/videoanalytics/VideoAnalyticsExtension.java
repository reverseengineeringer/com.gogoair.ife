package com.adobe.mediacore.videoanalytics;

import com.adobe.mediacore.MediaPlayerItem;
import com.adobe.primetime.core.plugin.IPlugin;

public abstract interface VideoAnalyticsExtension
{
  public abstract IPlugin getExtension(MediaPlayerItem paramMediaPlayerItem);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.videoanalytics.VideoAnalyticsExtension
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */