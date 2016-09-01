package com.adobe.mediacore.videoanalytics;

import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.timeline.advertising.Ad;
import java.util.HashMap;
import java.util.List;

public final class VideoAnalyticsMetadata
  extends MetadataNode
{
  private static final String AA_AD_METADATA_KEY = "aaAdMetadata";
  private static final String AA_CHAPTER_METADATA_KEY = "aaChapterMetadata";
  private static final String AA_VIDEO_METADATA_KEY = "aaVideoMetadata";
  private static final String APP_VERSION_KEY = "appVersion";
  private static final String CHANNEL_KEY = "channelName";
  private static final String CHAPTER_DATA_KEY = "chapterData";
  private static final String ENABLE_CHAPTER_TRACKING = "enableChapterTracking";
  private static final String ENABLE_SSL = "enableSSL";
  private static final String PLAYER_NAME_KEY = "playerName";
  private static final String PUBLISHER_KEY = "publisher";
  private static final String TRACKING_SERVER_KEY = "trackingServer";
  private static final String VIDEO_ID_KEY = "videoId";
  private static final String VIDEO_NAME_KEY = "videoName";
  public Boolean debugLogging = Boolean.valueOf(false);
  public Boolean quietMode = Boolean.valueOf(false);
  
  public AdMetadataBlock getAdMetadataBlock()
  {
    return (AdMetadataBlock)getObject("aaAdMetadata");
  }
  
  public String getAppVersion()
  {
    return getValue("appVersion");
  }
  
  public String getChannel()
  {
    return getValue("channelName");
  }
  
  public ChapterMetadataBlock getChapterMetadataBlock()
  {
    return (ChapterMetadataBlock)getObject("aaChapterMetadata");
  }
  
  public List getChapters()
  {
    if (containsObject("chapterData")) {
      return (List)getObject("chapterData");
    }
    return null;
  }
  
  public Boolean getEnableChapterTracking()
  {
    return Boolean.valueOf(getValue("enableChapterTracking"));
  }
  
  public String getPlayerName()
  {
    return getValue("playerName");
  }
  
  public String getPublisher()
  {
    return getValue("publisher");
  }
  
  public String getTrackingServer()
  {
    return getValue("trackingServer");
  }
  
  public Boolean getUseSSL()
  {
    return Boolean.valueOf(getValue("enableSSL"));
  }
  
  public String getVideoId()
  {
    return getValue("videoId");
  }
  
  public VideoMetadataBlock getVideoMetadataBlock()
  {
    return (VideoMetadataBlock)getObject("aaVideoMetadata");
  }
  
  public String getVideoName()
  {
    return getValue("videoName");
  }
  
  public void setAdMetadataBlock(AdMetadataBlock paramAdMetadataBlock)
  {
    setObject("aaAdMetadata", paramAdMetadataBlock);
  }
  
  public void setAppVersion(String paramString)
  {
    if ((paramString == null) || (paramString.equals(""))) {
      throw new IllegalArgumentException("The parameter 'appVersion' cannot be null or empty.");
    }
    setValue("appVersion", paramString);
  }
  
  public void setChannel(String paramString)
  {
    if ((paramString == null) || (paramString.equals(""))) {
      throw new IllegalArgumentException("The parameter 'channel' cannot be null or empty.");
    }
    setValue("channelName", paramString);
  }
  
  public void setChapterMetadataBlock(ChapterMetadataBlock paramChapterMetadataBlock)
  {
    setObject("aaChapterMetadata", paramChapterMetadataBlock);
  }
  
  public void setChapters(List paramList)
  {
    if ((paramList == null) || (paramList.size() <= 0)) {
      throw new IllegalArgumentException("The parameter 'chapters' cannot be null or empty.");
    }
    setObject("chapterData", paramList);
  }
  
  public void setEnableChapterTracking(Boolean paramBoolean)
  {
    setValue("enableChapterTracking", String.valueOf(paramBoolean));
  }
  
  public void setPlayerName(String paramString)
  {
    if ((paramString == null) || (paramString.equals(""))) {
      throw new IllegalArgumentException("The parameter 'playerName' cannot be null or empty.");
    }
    setValue("playerName", paramString);
  }
  
  public void setPublisher(String paramString)
  {
    if ((paramString == null) || (paramString.equals(""))) {
      throw new IllegalArgumentException("The parameter 'publisher' cannot be null or empty.");
    }
    setValue("publisher", paramString);
  }
  
  public void setTrackingServer(String paramString)
  {
    if ((paramString == null) || (paramString.equals(""))) {
      throw new IllegalArgumentException("The parameter 'trackingServer' cannot be null or empty.");
    }
    setValue("trackingServer", paramString);
  }
  
  public void setUseSSL(Boolean paramBoolean)
  {
    setValue("enableSSL", String.valueOf(paramBoolean));
  }
  
  public void setVideoId(String paramString)
  {
    if ((paramString == null) || (paramString.equals(""))) {
      throw new IllegalArgumentException("The parameter 'videoId' cannot be null or empty.");
    }
    setValue("videoId", paramString);
  }
  
  public void setVideoMetadataBlock(VideoMetadataBlock paramVideoMetadataBlock)
  {
    setObject("aaVideoMetadata", paramVideoMetadataBlock);
  }
  
  public void setVideoName(String paramString)
  {
    if ((paramString == null) || (paramString.equals(""))) {
      throw new IllegalArgumentException("The parameter 'videoName' cannot be null or empty.");
    }
    setValue("videoName", paramString);
  }
  
  public static abstract interface AdMetadataBlock
  {
    public abstract HashMap call(Ad paramAd);
  }
  
  public static abstract interface ChapterMetadataBlock
  {
    public abstract HashMap call(VideoAnalyticsChapterData paramVideoAnalyticsChapterData);
  }
  
  public static abstract interface VideoMetadataBlock
  {
    public abstract HashMap call();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.videoanalytics.VideoAnalyticsMetadata
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */