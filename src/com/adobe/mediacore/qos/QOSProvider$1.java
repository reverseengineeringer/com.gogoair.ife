package com.adobe.mediacore.qos;

import com.adobe.mediacore.MediaPlayer.QOSEventListener;
import com.adobe.mediacore.MediaPlayerNotification;
import com.adobe.mediacore.MediaPlayerNotification.ErrorCode;
import com.adobe.mediacore.MediaPlayerNotification.Warning;
import com.adobe.mediacore.qos.metrics.BufferingMetrics;
import com.adobe.mediacore.qos.metrics.SeekMetrics;
import com.adobe.mediacore.qos.metrics.SeekMetrics.Result;

class QOSProvider$1
  implements MediaPlayer.QOSEventListener
{
  QOSProvider$1(QOSProvider paramQOSProvider) {}
  
  public void onBufferComplete()
  {
    QOSProvider.access$000(this$0).recordBufferFull();
  }
  
  public void onBufferStart()
  {
    QOSProvider.access$000(this$0).recordBufferEmpty();
  }
  
  public void onLoadInfo(LoadInfo paramLoadInfo) {}
  
  public void onOperationFailed(MediaPlayerNotification.Warning paramWarning)
  {
    if (paramWarning == null) {}
    for (;;)
    {
      return;
      if (paramWarning.getCode() == MediaPlayerNotification.ErrorCode.SEEK_ERROR)
      {
        QOSProvider.access$100(this$0).recordSeekComplete(SeekMetrics.Result.FAIL);
        return;
      }
      for (paramWarning = paramWarning.getInnerNotification(); paramWarning != null; paramWarning = paramWarning.getInnerNotification()) {
        if (paramWarning.getCode() == MediaPlayerNotification.ErrorCode.SEEK_ERROR)
        {
          QOSProvider.access$100(this$0).recordSeekComplete(SeekMetrics.Result.FAIL);
          return;
        }
      }
    }
  }
  
  public void onSeekComplete(long paramLong)
  {
    QOSProvider.access$100(this$0).recordSeekComplete(SeekMetrics.Result.SUCCESS);
  }
  
  public void onSeekStart()
  {
    QOSProvider.access$100(this$0).recordSeekStart();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.qos.QOSProvider.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */