.class Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    const-wide/16 v8, 0x0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isContentLoaded:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;
    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$200(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Double;

    move-result-object v1

    # setter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_previousTime:Ljava/lang/Double;
    invoke-static {v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$102(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Double;)Ljava/lang/Double;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$300(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v1

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getLocalTime()J

    move-result-wide v2

    long-to-double v2, v2

    sget-object v1, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->PSDK_TIME_SCALE:Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    # setter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;
    invoke-static {v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$202(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Double;)Ljava/lang/Double;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_videoInfo:Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$400(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_videoInfo:Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$400(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # invokes: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->playhead()Ljava/lang/Double;
    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;->playhead:Ljava/lang/Double;

    :cond_0
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapters:Ljava/util/List;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$600(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$200(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    cmpl-double v0, v0, v8

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isSeeking:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$700(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_inAd:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$800(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapters:Ljava/util/List;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$600(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_2

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapters:Ljava/util/List;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$600(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;
    invoke-static {v2}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$200(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->getStartTime()Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    iget-object v6, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterBoundaryOffset:Ljava/lang/Long;
    invoke-static {v6}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$900(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    long-to-double v6, v6

    add-double/2addr v4, v6

    sub-double/2addr v2, v4

    cmpl-double v2, v2, v8

    if-lez v2, :cond_5

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;
    invoke-static {v2}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$200(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->getEndTime()Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    iget-object v6, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterBoundaryOffset:Ljava/lang/Long;
    invoke-static {v6}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$900(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    long-to-double v6, v6

    sub-double/2addr v4, v6

    sub-double/2addr v2, v4

    cmpg-double v2, v2, v8

    if-gez v2, :cond_5

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentChapter:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;
    invoke-static {v2}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;

    move-result-object v2

    if-eq v0, v2, :cond_5

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1200()Lcom/adobe/mediacore/logging/Logger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1100()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "#internalTimer"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "trackChapterStart() - time: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;
    invoke-static {v5}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$200(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Double;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    int-to-long v4, v1

    # invokes: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->updateCurrentChapter(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;J)V
    invoke-static {v2, v0, v4, v5}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1300(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;J)V

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_analyticsPlugin:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;
    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1400(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_analyticsPlugin:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;
    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1400(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v2}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$300(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v2

    invoke-interface {v2}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getChapterMetadata(Lcom/adobe/mediacore/MediaPlayerItem;Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->setChapterMetadata(Ljava/util/Map;)V

    :cond_1
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->trackChapterStart()V

    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_qosProvider:Lcom/adobe/mediacore/qos/QOSProvider;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1600(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/mediacore/qos/QOSProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/qos/QOSProvider;->getPlaybackInformation()Lcom/adobe/mediacore/qos/PlaybackInformation;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/qos/PlaybackInformation;->getBitrate()J

    move-result-wide v0

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_bitrate:Ljava/lang/Long;
    invoke-static {v2}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1700(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    cmp-long v2, v2, v0

    if-eqz v2, :cond_3

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1200()Lcom/adobe/mediacore/logging/Logger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1100()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "#internalTimer"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Bitrate changed to: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;
    invoke-static {v2}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->trackBitrateChange()V

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    # setter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_bitrate:Ljava/lang/Long;
    invoke-static {v2, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1702(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Long;)Ljava/lang/Long;

    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_shouldStopInternalTimer:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1900(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2100(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_internalTimer:Ljava/lang/Runnable;
    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_4
    return-void

    :cond_5
    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;
    invoke-static {v2}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$200(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->getEndTime()Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    iget-object v6, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterBoundaryOffset:Ljava/lang/Long;
    invoke-static {v6}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$900(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    long-to-double v6, v6

    sub-double/2addr v4, v6

    sub-double/2addr v2, v4

    cmpl-double v2, v2, v8

    if-ltz v2, :cond_6

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->getEndTime()Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    iget-object v4, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterBoundaryOffset:Ljava/lang/Long;
    invoke-static {v4}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$900(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    long-to-double v4, v4

    add-double/2addr v2, v4

    iget-object v4, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_previousTime:Ljava/lang/Double;
    invoke-static {v4}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$100(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    sub-double/2addr v2, v4

    cmpl-double v2, v2, v8

    if-ltz v2, :cond_6

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->getEndTime()Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    iget-object v4, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterBoundaryOffset:Ljava/lang/Long;
    invoke-static {v4}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$900(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    long-to-double v4, v4

    sub-double/2addr v2, v4

    iget-object v4, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_previousTime:Ljava/lang/Double;
    invoke-static {v4}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$100(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    sub-double/2addr v2, v4

    const-wide v4, 0x407f400000000000L    # 500.0

    sget-object v6, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->PSDK_TIME_SCALE:Ljava/lang/Double;

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    div-double/2addr v4, v6

    cmpg-double v2, v2, v4

    if-gtz v2, :cond_6

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentChapter:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;
    invoke-static {v2}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;

    move-result-object v2

    if-ne v0, v2, :cond_6

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1200()Lcom/adobe/mediacore/logging/Logger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1100()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "#internalTimer"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "trackChapterComplete() - time: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;
    invoke-static {v4}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$200(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Double;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "."

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    const/4 v1, 0x0

    const-wide/16 v2, -0x1

    # invokes: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->updateCurrentChapter(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;J)V
    invoke-static {v0, v1, v2, v3}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1300(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;J)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->trackChapterComplete()V

    goto/16 :goto_1

    :cond_6
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto/16 :goto_0

    :cond_7
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$300(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getStatus()Lcom/adobe/mediacore/MediaPlayer$PlayerState;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$PlayerState;->PLAYING:Lcom/adobe/mediacore/MediaPlayer$PlayerState;

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # invokes: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->handleStatusPlaying()V
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1800(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V

    goto/16 :goto_2
.end method
