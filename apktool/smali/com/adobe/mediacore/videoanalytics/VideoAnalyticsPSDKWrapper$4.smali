.class Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/adobe/mediacore/MediaPlayer$QOSEventListener;


# instance fields
.field final synthetic this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBufferComplete()V
    .locals 3

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isContentLoaded:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isSeeking:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$700(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

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

    const-string v2, "#onBufferComplete"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "In seeking, skip trackBufferComplete()."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
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

    const-string v2, "#onBufferComplete"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "trackBufferComplete()."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->trackBufferComplete()V

    goto :goto_0
.end method

.method public onBufferStart()V
    .locals 3

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isContentLoaded:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isSeeking:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$700(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

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

    const-string v2, "#onBufferStart"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "In seeking, skip trackBufferStart()."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
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

    const-string v2, "#onBufferStart"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "trackBufferStart()."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->trackBufferStart()V

    goto :goto_0
.end method

.method public onLoadInfo(Lcom/adobe/mediacore/qos/LoadInfo;)V
    .locals 0

    return-void
.end method

.method public onOperationFailed(Lcom/adobe/mediacore/MediaPlayerNotification$Warning;)V
    .locals 0

    return-void
.end method

.method public onSeekComplete(J)V
    .locals 7

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isSeeking:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$700(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
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

    const-string v2, "#onSeekComplete"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Adjusted time: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

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

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_videoInfo:Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$400(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_videoInfo:Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$400(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # invokes: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->playhead()Ljava/lang/Double;
    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;->playhead:Ljava/lang/Double;

    :cond_2
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    # setter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isSeeking:Ljava/lang/Boolean;
    invoke-static {v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$702(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # invokes: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->resetCurrentChapter()V
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2700(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V

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

    const-string v2, "#onSeekComplete"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "trackSeekComplete()."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->trackSeekComplete()V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$300(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getStatus()Lcom/adobe/mediacore/MediaPlayer$PlayerState;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$PlayerState;->PLAYING:Lcom/adobe/mediacore/MediaPlayer$PlayerState;

    if-ne v0, v1, :cond_0

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

    const-string v2, "#onSeekComplete"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Handle playing state change during seek."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # invokes: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->handleStatusPlaying()V
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1800(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V

    goto/16 :goto_0
.end method

.method public onSeekStart()V
    .locals 3

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isContentLoaded:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_previousState:Lcom/adobe/mediacore/MediaPlayer$PlayerState;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2300(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/mediacore/MediaPlayer$PlayerState;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$PlayerState;->PREPARED:Lcom/adobe/mediacore/MediaPlayer$PlayerState;

    if-ne v0, v1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # invokes: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->beginTracking()V
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2200(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    # setter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isSeeking:Ljava/lang/Boolean;
    invoke-static {v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$702(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Boolean;)Ljava/lang/Boolean;

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

    const-string v2, "#onSeekStart"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "trackSeekStart()."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->trackSeekStart()V

    goto :goto_0
.end method
