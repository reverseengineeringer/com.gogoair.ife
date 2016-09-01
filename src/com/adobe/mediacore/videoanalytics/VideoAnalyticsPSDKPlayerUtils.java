package com.adobe.mediacore.videoanalytics;

import com.adobe.mediacore.MediaPlayer;
import com.adobe.mediacore.MediaPlayerItem;
import com.adobe.mediacore.MediaResource;
import com.adobe.mediacore.metadata.DefaultMetadataKeys;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.timeline.Timeline;
import com.adobe.mediacore.timeline.TimelineMarker;
import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.utils.StringUtils;
import com.adobe.mediacore.utils.TimeRange;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class VideoAnalyticsPSDKPlayerUtils
{
  static final Boolean DEFAULT_ENABLE_CHAPTER_TRACKING = Boolean.valueOf(false);
  static final Boolean DEFAULT_ENABLE_SSL = Boolean.valueOf(false);
  static final String PRIMETIME_PLAYER_NAME = "PSDK-based player";
  static final Double PSDK_TIME_SCALE = Double.valueOf(1000.0D);
  
  static HashMap getAdMetadata(MediaPlayerItem paramMediaPlayerItem, Ad paramAd)
  {
    paramMediaPlayerItem = getVideoAnalyticsMetadata(paramMediaPlayerItem);
    if ((paramMediaPlayerItem != null) && (paramMediaPlayerItem.getAdMetadataBlock() != null)) {
      return paramMediaPlayerItem.getAdMetadataBlock().call(paramAd);
    }
    return null;
  }
  
  static String getAppVersion(MediaPlayerItem paramMediaPlayerItem)
  {
    paramMediaPlayerItem = getVideoAnalyticsMetadata(paramMediaPlayerItem);
    if ((paramMediaPlayerItem != null) && (!StringUtils.isEmpty(paramMediaPlayerItem.getPlayerName()))) {
      return paramMediaPlayerItem.getAppVersion();
    }
    return null;
  }
  
  static String getChannel(MediaPlayerItem paramMediaPlayerItem)
  {
    paramMediaPlayerItem = getVideoAnalyticsMetadata(paramMediaPlayerItem);
    if (paramMediaPlayerItem != null) {
      return paramMediaPlayerItem.getChannel();
    }
    return null;
  }
  
  static HashMap getChapterMetadata(MediaPlayerItem paramMediaPlayerItem, VideoAnalyticsChapterData paramVideoAnalyticsChapterData)
  {
    paramMediaPlayerItem = getVideoAnalyticsMetadata(paramMediaPlayerItem);
    if ((paramMediaPlayerItem != null) && (paramMediaPlayerItem.getChapterMetadataBlock() != null)) {
      return paramMediaPlayerItem.getChapterMetadataBlock().call(paramVideoAnalyticsChapterData);
    }
    return null;
  }
  
  static Boolean getChapterTrackingEnabled(MediaPlayerItem paramMediaPlayerItem)
  {
    VideoAnalyticsMetadata localVideoAnalyticsMetadata = getVideoAnalyticsMetadata(paramMediaPlayerItem);
    if ((localVideoAnalyticsMetadata != null) && (!paramMediaPlayerItem.isLive())) {
      return localVideoAnalyticsMetadata.getEnableChapterTracking();
    }
    return DEFAULT_ENABLE_CHAPTER_TRACKING;
  }
  
  static List getChapters(MediaPlayerItem paramMediaPlayerItem)
  {
    paramMediaPlayerItem = getVideoAnalyticsMetadata(paramMediaPlayerItem);
    if (paramMediaPlayerItem != null) {
      return paramMediaPlayerItem.getChapters();
    }
    return null;
  }
  
  public static Boolean getDebugLoggingSetting(MediaPlayerItem paramMediaPlayerItem)
  {
    paramMediaPlayerItem = getVideoAnalyticsMetadata(paramMediaPlayerItem);
    if (paramMediaPlayerItem != null) {
      return debugLogging;
    }
    return Boolean.valueOf(false);
  }
  
  static String getHeartbeatPublisher(MediaPlayerItem paramMediaPlayerItem)
  {
    paramMediaPlayerItem = getVideoAnalyticsMetadata(paramMediaPlayerItem);
    if (paramMediaPlayerItem != null) {
      return paramMediaPlayerItem.getPublisher();
    }
    return null;
  }
  
  static String getHeartbeatTrackingServer(MediaPlayerItem paramMediaPlayerItem)
  {
    paramMediaPlayerItem = getVideoAnalyticsMetadata(paramMediaPlayerItem);
    if (paramMediaPlayerItem != null) {
      return paramMediaPlayerItem.getTrackingServer();
    }
    return null;
  }
  
  static double getMainAssetDuration(MediaPlayer paramMediaPlayer)
  {
    if (paramMediaPlayer.getCurrentItem().isLive()) {
      return -1.0D;
    }
    return (paramMediaPlayer.getPlaybackRange().getDuration() - getTotalAdDuration(paramMediaPlayer)) / PSDK_TIME_SCALE.doubleValue();
  }
  
  static String getPlayerName(MediaPlayerItem paramMediaPlayerItem)
  {
    paramMediaPlayerItem = getVideoAnalyticsMetadata(paramMediaPlayerItem);
    if ((paramMediaPlayerItem != null) && (!StringUtils.isEmpty(paramMediaPlayerItem.getPlayerName()))) {
      return paramMediaPlayerItem.getPlayerName();
    }
    return "PSDK-based player";
  }
  
  static Boolean getQuietModeSetting(MediaPlayerItem paramMediaPlayerItem)
  {
    paramMediaPlayerItem = getVideoAnalyticsMetadata(paramMediaPlayerItem);
    if (paramMediaPlayerItem != null) {
      return quietMode;
    }
    return Boolean.valueOf(false);
  }
  
  static double getTotalAdDuration(MediaPlayer paramMediaPlayer)
  {
    paramMediaPlayer = paramMediaPlayer.getTimeline();
    if (paramMediaPlayer != null)
    {
      paramMediaPlayer = paramMediaPlayer.timelineMarkers();
      for (double d1 = 0.0D;; d1 = ((TimelineMarker)paramMediaPlayer.next()).getDuration() + d1)
      {
        d2 = d1;
        if (!paramMediaPlayer.hasNext()) {
          break;
        }
      }
    }
    double d2 = 0.0D;
    return d2;
  }
  
  static Boolean getUseSSLSetting(MediaPlayerItem paramMediaPlayerItem)
  {
    paramMediaPlayerItem = getVideoAnalyticsMetadata(paramMediaPlayerItem);
    if (paramMediaPlayerItem != null) {
      return paramMediaPlayerItem.getUseSSL();
    }
    return DEFAULT_ENABLE_SSL;
  }
  
  static VideoAnalyticsMetadata getVideoAnalyticsMetadata(MediaPlayerItem paramMediaPlayerItem)
  {
    if ((paramMediaPlayerItem == null) || (paramMediaPlayerItem.getResource() == null)) {
      return null;
    }
    paramMediaPlayerItem = (MetadataNode)paramMediaPlayerItem.getResource().getMetadata();
    if ((paramMediaPlayerItem != null) && (paramMediaPlayerItem.containsKey(DefaultMetadataKeys.VIDEO_ANALYTICS_METADATA_KEY.getValue()))) {
      return (VideoAnalyticsMetadata)paramMediaPlayerItem.getNode(DefaultMetadataKeys.VIDEO_ANALYTICS_METADATA_KEY.getValue());
    }
    return null;
  }
  
  static String getVideoId(MediaPlayerItem paramMediaPlayerItem)
  {
    VideoAnalyticsMetadata localVideoAnalyticsMetadata = getVideoAnalyticsMetadata(paramMediaPlayerItem);
    if ((localVideoAnalyticsMetadata != null) && (!StringUtils.isEmpty(localVideoAnalyticsMetadata.getVideoId()))) {
      return localVideoAnalyticsMetadata.getVideoId();
    }
    return paramMediaPlayerItem.getResource().getUrl();
  }
  
  static HashMap getVideoMetadata(MediaPlayerItem paramMediaPlayerItem)
  {
    paramMediaPlayerItem = getVideoAnalyticsMetadata(paramMediaPlayerItem);
    if ((paramMediaPlayerItem != null) && (paramMediaPlayerItem.getVideoMetadataBlock() != null)) {
      return paramMediaPlayerItem.getVideoMetadataBlock().call();
    }
    return null;
  }
  
  static String getVideoName(MediaPlayerItem paramMediaPlayerItem)
  {
    paramMediaPlayerItem = getVideoAnalyticsMetadata(paramMediaPlayerItem);
    if (paramMediaPlayerItem != null) {
      return paramMediaPlayerItem.getVideoName();
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.videoanalytics.VideoAnalyticsPSDKPlayerUtils
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */