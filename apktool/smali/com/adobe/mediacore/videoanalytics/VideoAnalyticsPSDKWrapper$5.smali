.class Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/adobe/mediacore/MediaPlayer$AdPlaybackEventListener;


# instance fields
.field final synthetic this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAdBreakComplete(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)V
    .locals 4

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1200()Lcom/adobe/mediacore/logging/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1100()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#onAdBreakComplete"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "trackAdBreakComplete()."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isContentLoaded:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    # setter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adIndex:Ljava/lang/Long;
    invoke-static {v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2902(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Long;)Ljava/lang/Long;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adBreakInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;
    invoke-static {v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$3002(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;)Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;

    goto :goto_0
.end method

.method public onAdBreakSkipped(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)V
    .locals 0

    return-void
.end method

.method public onAdBreakStart(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)V
    .locals 6

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1200()Lcom/adobe/mediacore/logging/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1100()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#onAdBreakStart"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Ad Break starts."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isContentLoaded:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # invokes: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->beginTracking()V
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2200(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V

    :cond_0
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adBreakIndex:Ljava/lang/Long;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2800(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Long;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adBreakIndex:Ljava/lang/Long;
    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2800(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    # setter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adBreakIndex:Ljava/lang/Long;
    invoke-static {v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2802(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Long;)Ljava/lang/Long;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    # setter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adIndex:Ljava/lang/Long;
    invoke-static {v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2902(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Long;)Ljava/lang/Long;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    new-instance v1, Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;

    invoke-direct {v1}, Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;-><init>()V

    # setter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adBreakInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;
    invoke-static {v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$3002(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;)Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adBreakInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$3000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$300(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v1

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getPlayerName(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;->playerName:Ljava/lang/String;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adBreakInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$3000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adBreakIndex:Ljava/lang/Long;
    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2800(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;->position:Ljava/lang/Long;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adBreakInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$3000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

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

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;->startTime:Ljava/lang/Double;

    return-void
.end method

.method public onAdClick(Lcom/adobe/mediacore/timeline/advertising/AdBreak;Lcom/adobe/mediacore/timeline/advertising/Ad;Lcom/adobe/mediacore/timeline/advertising/AdClick;)V
    .locals 0

    return-void
.end method

.method public onAdComplete(Lcom/adobe/mediacore/timeline/advertising/AdBreak;Lcom/adobe/mediacore/timeline/advertising/Ad;)V
    .locals 3

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1200()Lcom/adobe/mediacore/logging/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1100()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#onAdComplete"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Ad complete."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isContentLoaded:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;
    invoke-static {v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$3102(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;)Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    # setter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_inAd:Ljava/lang/Boolean;
    invoke-static {v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$802(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->trackAdComplete()V

    goto :goto_0
.end method

.method public onAdProgress(Lcom/adobe/mediacore/timeline/advertising/AdBreak;Lcom/adobe/mediacore/timeline/advertising/Ad;I)V
    .locals 0

    return-void
.end method

.method public onAdStart(Lcom/adobe/mediacore/timeline/advertising/AdBreak;Lcom/adobe/mediacore/timeline/advertising/Ad;)V
    .locals 8

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1200()Lcom/adobe/mediacore/logging/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1100()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#onAdStart"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Ad start."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isContentLoaded:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    # setter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_inAd:Ljava/lang/Boolean;
    invoke-static {v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$802(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    invoke-virtual {p2}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getDuration()J

    move-result-wide v2

    long-to-double v2, v2

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adIndex:Ljava/lang/Long;
    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2900(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Long;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    iget-object v4, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adIndex:Ljava/lang/Long;
    invoke-static {v4}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2900(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    # setter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adIndex:Ljava/lang/Long;
    invoke-static {v1, v4}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2902(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Long;)Ljava/lang/Long;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    new-instance v4, Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;

    invoke-direct {v4}, Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;-><init>()V

    # setter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;
    invoke-static {v1, v4}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$3102(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;)Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;
    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$3100(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;

    move-result-object v1

    iput-object v0, v1, Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;->id:Ljava/lang/String;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$3100(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->PSDK_TIME_SCALE:Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;->length:Ljava/lang/Double;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$3100(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adIndex:Ljava/lang/Long;
    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2900(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;->position:Ljava/lang/Long;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1200()Lcom/adobe/mediacore/logging/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1100()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#onAdStart"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "trackAdStart(); Ad: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lcom/adobe/mediacore/timeline/advertising/Ad;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_analyticsPlugin:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1400(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$300(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v1

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-static {v1, p2}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getAdMetadata(Lcom/adobe/mediacore/MediaPlayerItem;Lcom/adobe/mediacore/timeline/advertising/Ad;)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->setAdMetadata(Ljava/util/Map;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->trackAdStart()V

    goto/16 :goto_0
.end method
