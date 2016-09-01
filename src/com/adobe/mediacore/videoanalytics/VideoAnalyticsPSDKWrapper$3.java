package com.adobe.mediacore.videoanalytics;

import com.adobe.mediacore.MediaPlayer;
import com.adobe.mediacore.MediaPlayer.PlaybackEventListener;
import com.adobe.mediacore.MediaPlayer.PlayerState;
import com.adobe.mediacore.MediaPlayerNotification;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.TimedMetadata;
import com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin;

class VideoAnalyticsPSDKWrapper$3
  implements MediaPlayer.PlaybackEventListener
{
  VideoAnalyticsPSDKWrapper$3(VideoAnalyticsPSDKWrapper paramVideoAnalyticsPSDKWrapper) {}
  
  public void onPlayComplete() {}
  
  public void onPlayStart() {}
  
  public void onPrepared() {}
  
  public void onProfileChanged(long paramLong1, long paramLong2) {}
  
  public void onRatePlaying(float paramFloat) {}
  
  public void onRateSelected(float paramFloat) {}
  
  public void onReplaceMediaPlayerItem()
  {
    if (VideoAnalyticsPSDKWrapper.access$300(this$0).getCurrentItem() != null) {
      VideoAnalyticsPSDKWrapper.access$2200(this$0);
    }
  }
  
  public void onSizeAvailable(long paramLong1, long paramLong2) {}
  
  public void onStateChanged(MediaPlayer.PlayerState paramPlayerState, MediaPlayerNotification paramMediaPlayerNotification)
  {
    VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onStateChanged", "State: " + paramPlayerState.toString() + ".");
    VideoAnalyticsPSDKWrapper.access$2302(this$0, paramPlayerState);
    switch (VideoAnalyticsPSDKWrapper.6.$SwitchMap$com$adobe$mediacore$MediaPlayer$PlayerState[paramPlayerState.ordinal()])
    {
    case 1: 
    default: 
    case 2: 
    case 3: 
      do
      {
        return;
        VideoAnalyticsPSDKWrapper.access$2200(this$0);
        return;
        VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onStateChanged", "status: playing.");
      } while (VideoAnalyticsPSDKWrapper.access$700(this$0).booleanValue());
      VideoAnalyticsPSDKWrapper.access$1800(this$0);
      return;
    case 4: 
      VideoAnalyticsPSDKWrapper.access$2200(this$0);
      VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onStateChanged", "status: paused.");
      VideoAnalyticsPSDKWrapper.access$1500(this$0).trackPause();
      return;
    case 5: 
      VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onStateChanged", "status: complete.");
      VideoAnalyticsPSDKWrapper.access$1500(this$0).trackComplete(VideoAnalyticsPSDKWrapper.access$2400(this$0));
      VideoAnalyticsPSDKWrapper.access$2500(this$0);
      return;
    case 6: 
      VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onStateChanged", "status: error.");
      VideoAnalyticsPSDKWrapper.access$2600(this$0, paramMediaPlayerNotification);
      return;
    }
    VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onStateChanged", "status: released.");
    this$0.endSession();
  }
  
  public void onTimedMetadata(TimedMetadata paramTimedMetadata) {}
  
  public void onTimelineUpdated() {}
  
  public void onUpdated() {}
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.videoanalytics.VideoAnalyticsPSDKWrapper.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */