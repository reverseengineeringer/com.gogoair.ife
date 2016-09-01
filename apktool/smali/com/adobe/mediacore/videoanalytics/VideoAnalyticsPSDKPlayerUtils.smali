.class public Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;
.super Ljava/lang/Object;


# static fields
.field static final DEFAULT_ENABLE_CHAPTER_TRACKING:Ljava/lang/Boolean;

.field static final DEFAULT_ENABLE_SSL:Ljava/lang/Boolean;

.field static final PRIMETIME_PLAYER_NAME:Ljava/lang/String; = "PSDK-based player"

.field static final PSDK_TIME_SCALE:Ljava/lang/Double;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v2, 0x0

    const-wide v0, 0x408f400000000000L    # 1000.0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    sput-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->PSDK_TIME_SCALE:Ljava/lang/Double;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->DEFAULT_ENABLE_CHAPTER_TRACKING:Ljava/lang/Boolean;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->DEFAULT_ENABLE_SSL:Ljava/lang/Boolean;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getAdMetadata(Lcom/adobe/mediacore/MediaPlayerItem;Lcom/adobe/mediacore/timeline/advertising/Ad;)Ljava/util/HashMap;
    .locals 2

    invoke-static {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getAdMetadataBlock()Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$AdMetadataBlock;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getAdMetadataBlock()Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$AdMetadataBlock;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$AdMetadataBlock;->call(Lcom/adobe/mediacore/timeline/advertising/Ad;)Ljava/util/HashMap;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static getAppVersion(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getPlayerName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/utils/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getAppVersion()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static getChannel(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/String;
    .locals 1

    invoke-static {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getChannel()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static getChapterMetadata(Lcom/adobe/mediacore/MediaPlayerItem;Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;)Ljava/util/HashMap;
    .locals 2

    invoke-static {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getChapterMetadataBlock()Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$ChapterMetadataBlock;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getChapterMetadataBlock()Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$ChapterMetadataBlock;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$ChapterMetadataBlock;->call(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;)Ljava/util/HashMap;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static getChapterTrackingEnabled(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/Boolean;
    .locals 2

    invoke-static {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Lcom/adobe/mediacore/MediaPlayerItem;->isLive()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getEnableChapterTracking()Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->DEFAULT_ENABLE_CHAPTER_TRACKING:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method static getChapters(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/util/List;
    .locals 1

    invoke-static {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getChapters()Ljava/util/List;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getDebugLoggingSetting(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/Boolean;
    .locals 1

    invoke-static {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->debugLogging:Ljava/lang/Boolean;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method static getHeartbeatPublisher(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/String;
    .locals 1

    invoke-static {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getPublisher()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static getHeartbeatTrackingServer(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/String;
    .locals 1

    invoke-static {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getTrackingServer()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static getMainAssetDuration(Lcom/adobe/mediacore/MediaPlayer;)D
    .locals 4

    invoke-interface {p0}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayerItem;->isLive()Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    :goto_0
    return-wide v0

    :cond_0
    invoke-interface {p0}, Lcom/adobe/mediacore/MediaPlayer;->getPlaybackRange()Lcom/adobe/mediacore/utils/TimeRange;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/utils/TimeRange;->getDuration()J

    move-result-wide v0

    long-to-double v0, v0

    invoke-static {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getTotalAdDuration(Lcom/adobe/mediacore/MediaPlayer;)D

    move-result-wide v2

    sub-double/2addr v0, v2

    sget-object v2, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->PSDK_TIME_SCALE:Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    div-double/2addr v0, v2

    goto :goto_0
.end method

.method static getPlayerName(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getPlayerName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/utils/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getPlayerName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "PSDK-based player"

    goto :goto_0
.end method

.method static getQuietModeSetting(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/Boolean;
    .locals 1

    invoke-static {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->quietMode:Ljava/lang/Boolean;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method static getTotalAdDuration(Lcom/adobe/mediacore/MediaPlayer;)D
    .locals 5

    const-wide/16 v0, 0x0

    invoke-interface {p0}, Lcom/adobe/mediacore/MediaPlayer;->getTimeline()Lcom/adobe/mediacore/timeline/Timeline;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-interface {v2}, Lcom/adobe/mediacore/timeline/Timeline;->timelineMarkers()Ljava/util/Iterator;

    move-result-object v4

    move-wide v2, v0

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/timeline/TimelineMarker;

    invoke-interface {v0}, Lcom/adobe/mediacore/timeline/TimelineMarker;->getDuration()J

    move-result-wide v0

    long-to-double v0, v0

    add-double/2addr v0, v2

    move-wide v2, v0

    goto :goto_0

    :cond_0
    move-wide v2, v0

    :cond_1
    return-wide v2
.end method

.method static getUseSSLSetting(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/Boolean;
    .locals 1

    invoke-static {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getUseSSL()Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->DEFAULT_ENABLE_SSL:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method static getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;
    .locals 3

    const/4 v1, 0x0

    if-eqz p0, :cond_0

    invoke-interface {p0}, Lcom/adobe/mediacore/MediaPlayerItem;->getResource()Lcom/adobe/mediacore/MediaResource;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    move-object v0, v1

    :goto_0
    return-object v0

    :cond_1
    invoke-interface {p0}, Lcom/adobe/mediacore/MediaPlayerItem;->getResource()Lcom/adobe/mediacore/MediaResource;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/MediaResource;->getMetadata()Lcom/adobe/mediacore/metadata/Metadata;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/metadata/MetadataNode;

    if-eqz v0, :cond_2

    sget-object v2, Lcom/adobe/mediacore/metadata/DefaultMetadataKeys;->VIDEO_ANALYTICS_METADATA_KEY:Lcom/adobe/mediacore/metadata/DefaultMetadataKeys;

    invoke-virtual {v2}, Lcom/adobe/mediacore/metadata/DefaultMetadataKeys;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/adobe/mediacore/metadata/MetadataNode;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    sget-object v1, Lcom/adobe/mediacore/metadata/DefaultMetadataKeys;->VIDEO_ANALYTICS_METADATA_KEY:Lcom/adobe/mediacore/metadata/DefaultMetadataKeys;

    invoke-virtual {v1}, Lcom/adobe/mediacore/metadata/DefaultMetadataKeys;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/metadata/MetadataNode;->getNode(Ljava/lang/String;)Lcom/adobe/mediacore/metadata/MetadataNode;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    goto :goto_0

    :cond_2
    move-object v0, v1

    goto :goto_0
.end method

.method static getVideoId(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getVideoId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/utils/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getVideoId()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-interface {p0}, Lcom/adobe/mediacore/MediaPlayerItem;->getResource()Lcom/adobe/mediacore/MediaResource;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/MediaResource;->getUrl()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method static getVideoMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/util/HashMap;
    .locals 2

    invoke-static {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getVideoMetadataBlock()Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$VideoMetadataBlock;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getVideoMetadataBlock()Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$VideoMetadataBlock;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$VideoMetadataBlock;->call()Ljava/util/HashMap;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static getVideoName(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/String;
    .locals 1

    invoke-static {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getVideoName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
