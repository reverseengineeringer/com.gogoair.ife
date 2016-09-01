package com.adobe.mediacore.videoanalytics;

import com.adobe.mediacore.MediaPlayer;
import com.adobe.mediacore.MediaPlayer.PlayerState;
import com.adobe.mediacore.MediaPlayer.QOSEventListener;
import com.adobe.mediacore.MediaPlayerNotification.Warning;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.qos.LoadInfo;
import com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin;

class VideoAnalyticsPSDKWrapper$4
  implements MediaPlayer.QOSEventListener
{
  VideoAnalyticsPSDKWrapper$4(VideoAnalyticsPSDKWrapper paramVideoAnalyticsPSDKWrapper) {}
  
  public void onBufferComplete()
  {
    if (!VideoAnalyticsPSDKWrapper.access$000(this$0).booleanValue()) {
      return;
    }
    if (VideoAnalyticsPSDKWrapper.access$700(this$0).booleanValue())
    {
      VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onBufferComplete", "In seeking, skip trackBufferComplete().");
      return;
    }
    VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onBufferComplete", "trackBufferComplete().");
    VideoAnalyticsPSDKWrapper.access$1500(this$0).trackBufferComplete();
  }
  
  public void onBufferStart()
  {
    if (!VideoAnalyticsPSDKWrapper.access$000(this$0).booleanValue()) {
      return;
    }
    if (VideoAnalyticsPSDKWrapper.access$700(this$0).booleanValue())
    {
      VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onBufferStart", "In seeking, skip trackBufferStart().");
      return;
    }
    VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onBufferStart", "trackBufferStart().");
    VideoAnalyticsPSDKWrapper.access$1500(this$0).trackBufferStart();
  }
  
  public void onLoadInfo(LoadInfo paramLoadInfo) {}
  
  public void onOperationFailed(MediaPlayerNotification.Warning paramWarning) {}
  
  public void onSeekComplete(long paramLong)
  {
    if (!VideoAnalyticsPSDKWrapper.access$700(this$0).booleanValue()) {}
    do
    {
      return;
      VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onSeekComplete", "Adjusted time: " + String.valueOf(paramLong) + ".");
      VideoAnalyticsPSDKWrapper.access$202(this$0, Double.valueOf(VideoAnalyticsPSDKWrapper.access$300(this$0).getLocalTime() / VideoAnalyticsPSDKPlayerUtils.PSDK_TIME_SCALE.doubleValue()));
      if (VideoAnalyticsPSDKWrapper.access$400(this$0) != null) {
        access$400this$0).playhead = VideoAnalyticsPSDKWrapper.access$500(this$0);
      }
      VideoAnalyticsPSDKWrapper.access$702(this$0, Boolean.valueOf(false));
      VideoAnalyticsPSDKWrapper.access$2700(this$0);
      VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onSeekComplete", "trackSeekComplete().");
      VideoAnalyticsPSDKWrapper.access$1500(this$0).trackSeekComplete();
    } while (VideoAnalyticsPSDKWrapper.access$300(this$0).getStatus() != MediaPlayer.PlayerState.PLAYING);
    VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onSeekComplete", "Handle playing state change during seek.");
    VideoAnalyticsPSDKWrapper.access$1800(this$0);
  }
  
  public void onSeekStart()
  {
    if ((!VideoAnalyticsPSDKWrapper.access$000(this$0).booleanValue()) || (VideoAnalyticsPSDKWrapper.access$2300(this$0) == MediaPlayer.PlayerState.PREPARED)) {
      return;
    }
    VideoAnalyticsPSDKWrapper.access$2200(this$0);
    VideoAnalyticsPSDKWrapper.access$702(this$0, Boolean.valueOf(true));
    VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onSeekStart", "trackSeekStart().");
    VideoAnalyticsPSDKWrapper.access$1500(this$0).trackSeekStart();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.videoanalytics.VideoAnalyticsPSDKWrapper.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */