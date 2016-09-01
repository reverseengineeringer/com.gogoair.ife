package com.adobe.mediacore.videoanalytics;

import com.adobe.mediacore.MediaPlayer;
import com.adobe.mediacore.MediaPlayer.AdPlaybackEventListener;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdClick;
import com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin;
import com.adobe.primetime.va.plugins.videoplayer.AdBreakInfo;
import com.adobe.primetime.va.plugins.videoplayer.AdInfo;
import com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin;

class VideoAnalyticsPSDKWrapper$5
  implements MediaPlayer.AdPlaybackEventListener
{
  VideoAnalyticsPSDKWrapper$5(VideoAnalyticsPSDKWrapper paramVideoAnalyticsPSDKWrapper) {}
  
  public void onAdBreakComplete(AdBreak paramAdBreak)
  {
    VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onAdBreakComplete", "trackAdBreakComplete().");
    if (!VideoAnalyticsPSDKWrapper.access$000(this$0).booleanValue()) {
      return;
    }
    VideoAnalyticsPSDKWrapper.access$2902(this$0, Long.valueOf(0L));
    VideoAnalyticsPSDKWrapper.access$3002(this$0, null);
  }
  
  public void onAdBreakSkipped(AdBreak paramAdBreak) {}
  
  public void onAdBreakStart(AdBreak paramAdBreak)
  {
    VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onAdBreakStart", "Ad Break starts.");
    if (!VideoAnalyticsPSDKWrapper.access$000(this$0).booleanValue()) {
      VideoAnalyticsPSDKWrapper.access$2200(this$0);
    }
    VideoAnalyticsPSDKWrapper.access$2800(this$0);
    VideoAnalyticsPSDKWrapper.access$2802(this$0, Long.valueOf(VideoAnalyticsPSDKWrapper.access$2800(this$0).longValue() + 1L));
    VideoAnalyticsPSDKWrapper.access$2902(this$0, Long.valueOf(0L));
    VideoAnalyticsPSDKWrapper.access$3002(this$0, new AdBreakInfo());
    access$3000this$0).playerName = VideoAnalyticsPSDKPlayerUtils.getPlayerName(VideoAnalyticsPSDKWrapper.access$300(this$0).getCurrentItem());
    access$3000this$0).position = VideoAnalyticsPSDKWrapper.access$2800(this$0);
    access$3000this$0).startTime = Double.valueOf(VideoAnalyticsPSDKWrapper.access$300(this$0).getLocalTime() / VideoAnalyticsPSDKPlayerUtils.PSDK_TIME_SCALE.doubleValue());
  }
  
  public void onAdClick(AdBreak paramAdBreak, Ad paramAd, AdClick paramAdClick) {}
  
  public void onAdComplete(AdBreak paramAdBreak, Ad paramAd)
  {
    VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onAdComplete", "Ad complete.");
    if (!VideoAnalyticsPSDKWrapper.access$000(this$0).booleanValue()) {
      return;
    }
    VideoAnalyticsPSDKWrapper.access$3102(this$0, null);
    VideoAnalyticsPSDKWrapper.access$802(this$0, Boolean.valueOf(false));
    VideoAnalyticsPSDKWrapper.access$1500(this$0).trackAdComplete();
  }
  
  public void onAdProgress(AdBreak paramAdBreak, Ad paramAd, int paramInt) {}
  
  public void onAdStart(AdBreak paramAdBreak, Ad paramAd)
  {
    VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onAdStart", "Ad start.");
    if (!VideoAnalyticsPSDKWrapper.access$000(this$0).booleanValue()) {
      return;
    }
    VideoAnalyticsPSDKWrapper.access$802(this$0, Boolean.valueOf(true));
    int i = paramAd.getId();
    double d = paramAd.getDuration();
    VideoAnalyticsPSDKWrapper.access$2900(this$0);
    VideoAnalyticsPSDKWrapper.access$2902(this$0, Long.valueOf(VideoAnalyticsPSDKWrapper.access$2900(this$0).longValue() + 1L));
    VideoAnalyticsPSDKWrapper.access$3102(this$0, new AdInfo());
    access$3100this$0).id = String.valueOf(i);
    access$3100this$0).length = Double.valueOf(d / VideoAnalyticsPSDKPlayerUtils.PSDK_TIME_SCALE.doubleValue());
    access$3100this$0).position = VideoAnalyticsPSDKWrapper.access$2900(this$0);
    VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#onAdStart", "trackAdStart(); Ad: " + paramAd.toString() + ".");
    VideoAnalyticsPSDKWrapper.access$1400(this$0).setAdMetadata(VideoAnalyticsPSDKPlayerUtils.getAdMetadata(VideoAnalyticsPSDKWrapper.access$300(this$0).getCurrentItem(), paramAd));
    VideoAnalyticsPSDKWrapper.access$1500(this$0).trackAdStart();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.videoanalytics.VideoAnalyticsPSDKWrapper.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */