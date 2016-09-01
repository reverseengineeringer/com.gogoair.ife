package com.adobe.mediacore.videoanalytics;

import android.os.Handler;
import com.adobe.mediacore.MediaPlayer;
import com.adobe.mediacore.MediaPlayer.PlayerState;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.qos.PlaybackInformation;
import com.adobe.mediacore.qos.QOSProvider;
import com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin;
import com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin;
import java.util.List;

class VideoAnalyticsPSDKWrapper$1
  implements Runnable
{
  VideoAnalyticsPSDKWrapper$1(VideoAnalyticsPSDKWrapper paramVideoAnalyticsPSDKWrapper) {}
  
  public void run()
  {
    int i;
    VideoAnalyticsChapterData localVideoAnalyticsChapterData;
    if (VideoAnalyticsPSDKWrapper.access$000(this$0).booleanValue())
    {
      VideoAnalyticsPSDKWrapper.access$102(this$0, VideoAnalyticsPSDKWrapper.access$200(this$0));
      VideoAnalyticsPSDKWrapper.access$202(this$0, Double.valueOf(VideoAnalyticsPSDKWrapper.access$300(this$0).getLocalTime() / VideoAnalyticsPSDKPlayerUtils.PSDK_TIME_SCALE.doubleValue()));
      if (VideoAnalyticsPSDKWrapper.access$400(this$0) != null) {
        access$400this$0).playhead = VideoAnalyticsPSDKWrapper.access$500(this$0);
      }
      if ((VideoAnalyticsPSDKWrapper.access$600(this$0) != null) && (VideoAnalyticsPSDKWrapper.access$200(this$0).doubleValue() != 0.0D) && (!VideoAnalyticsPSDKWrapper.access$700(this$0).booleanValue()) && (!VideoAnalyticsPSDKWrapper.access$800(this$0).booleanValue()))
      {
        i = 0;
        if (i < VideoAnalyticsPSDKWrapper.access$600(this$0).size())
        {
          localVideoAnalyticsChapterData = (VideoAnalyticsChapterData)VideoAnalyticsPSDKWrapper.access$600(this$0).get(i);
          if ((VideoAnalyticsPSDKWrapper.access$200(this$0).doubleValue() - (localVideoAnalyticsChapterData.getStartTime().doubleValue() + VideoAnalyticsPSDKWrapper.access$900(this$0).longValue()) <= 0.0D) || (VideoAnalyticsPSDKWrapper.access$200(this$0).doubleValue() - (localVideoAnalyticsChapterData.getEndTime().doubleValue() - VideoAnalyticsPSDKWrapper.access$900(this$0).longValue()) >= 0.0D) || (localVideoAnalyticsChapterData == VideoAnalyticsPSDKWrapper.access$1000(this$0))) {
            break label532;
          }
          VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#internalTimer", "trackChapterStart() - time: " + String.valueOf(VideoAnalyticsPSDKWrapper.access$200(this$0)) + "; " + localVideoAnalyticsChapterData.toString() + ".");
          VideoAnalyticsPSDKWrapper.access$1300(this$0, localVideoAnalyticsChapterData, i);
          if (VideoAnalyticsPSDKWrapper.access$1400(this$0) != null) {
            VideoAnalyticsPSDKWrapper.access$1400(this$0).setChapterMetadata(VideoAnalyticsPSDKPlayerUtils.getChapterMetadata(VideoAnalyticsPSDKWrapper.access$300(this$0).getCurrentItem(), localVideoAnalyticsChapterData));
          }
          VideoAnalyticsPSDKWrapper.access$1500(this$0).trackChapterStart();
        }
      }
      label390:
      long l = VideoAnalyticsPSDKWrapper.access$1600(this$0).getPlaybackInformation().getBitrate();
      if (VideoAnalyticsPSDKWrapper.access$1700(this$0).longValue() != l)
      {
        VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#internalTimer", "Bitrate changed to: " + String.valueOf(l) + ".");
        VideoAnalyticsPSDKWrapper.access$1500(this$0).trackBitrateChange();
        VideoAnalyticsPSDKWrapper.access$1702(this$0, Long.valueOf(l));
      }
    }
    for (;;)
    {
      if (!VideoAnalyticsPSDKWrapper.access$1900(this$0).booleanValue()) {
        VideoAnalyticsPSDKWrapper.access$2100(this$0).postDelayed(VideoAnalyticsPSDKWrapper.access$2000(this$0), 500L);
      }
      return;
      label532:
      if ((VideoAnalyticsPSDKWrapper.access$200(this$0).doubleValue() - (localVideoAnalyticsChapterData.getEndTime().doubleValue() - VideoAnalyticsPSDKWrapper.access$900(this$0).longValue()) >= 0.0D) && (localVideoAnalyticsChapterData.getEndTime().doubleValue() + VideoAnalyticsPSDKWrapper.access$900(this$0).longValue() - VideoAnalyticsPSDKWrapper.access$100(this$0).doubleValue() >= 0.0D) && (localVideoAnalyticsChapterData.getEndTime().doubleValue() - VideoAnalyticsPSDKWrapper.access$900(this$0).longValue() - VideoAnalyticsPSDKWrapper.access$100(this$0).doubleValue() <= 500.0D / VideoAnalyticsPSDKPlayerUtils.PSDK_TIME_SCALE.doubleValue()) && (localVideoAnalyticsChapterData == VideoAnalyticsPSDKWrapper.access$1000(this$0)))
      {
        VideoAnalyticsPSDKWrapper.access$1200().i(VideoAnalyticsPSDKWrapper.access$1100() + "#internalTimer", "trackChapterComplete() - time: " + String.valueOf(VideoAnalyticsPSDKWrapper.access$200(this$0)) + "; " + localVideoAnalyticsChapterData.toString() + ".");
        VideoAnalyticsPSDKWrapper.access$1300(this$0, null, -1L);
        VideoAnalyticsPSDKWrapper.access$1500(this$0).trackChapterComplete();
        break label390;
      }
      i += 1;
      break;
      if (VideoAnalyticsPSDKWrapper.access$300(this$0).getStatus() == MediaPlayer.PlayerState.PLAYING) {
        VideoAnalyticsPSDKWrapper.access$1800(this$0);
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.videoanalytics.VideoAnalyticsPSDKWrapper.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */