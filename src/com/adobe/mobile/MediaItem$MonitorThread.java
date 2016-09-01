package com.adobe.mobile;

import java.util.concurrent.ExecutorService;

class MediaItem$MonitorThread
  extends Thread
{
  protected boolean canceled = false;
  long delay = 1000L;
  protected MediaItem monitorMediaItem;
  
  public void run()
  {
    try
    {
      while (!canceled)
      {
        Thread.sleep(delay);
        StaticMethods.getMediaExecutor().execute(new MediaItem.MonitorThread.1(this));
      }
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      StaticMethods.logWarningFormat("Media - Background Thread Interrupted : %s", new Object[] { localInterruptedException.getMessage() });
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MediaItem.MonitorThread
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */