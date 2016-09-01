package com.adobe.mobile;

class MediaItem$MonitorThread$1
  implements Runnable
{
  MediaItem$MonitorThread$1(MediaItem.MonitorThread paramMonitorThread) {}
  
  public void run()
  {
    this$0.monitorMediaItem.mediaAnalytics.monitor(this$0.monitorMediaItem.name, -1.0D);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MediaItem.MonitorThread.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */