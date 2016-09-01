package com.adobe.mediacore;

import com.adobe.mediacore.qos.LoadInfo;

public abstract interface MediaPlayer$QOSEventListener
  extends MediaPlayer.EventListener
{
  public abstract void onBufferComplete();
  
  public abstract void onBufferStart();
  
  public abstract void onLoadInfo(LoadInfo paramLoadInfo);
  
  public abstract void onOperationFailed(MediaPlayerNotification.Warning paramWarning);
  
  public abstract void onSeekComplete(long paramLong);
  
  public abstract void onSeekStart();
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayer.QOSEventListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */