.class Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;


# instance fields
.field final synthetic this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPlayComplete()V
    .locals 0

    return-void
.end method

.method public onPlayStart()V
    .locals 0

    return-void
.end method

.method public onPrepared()V
    .locals 0

    return-void
.end method

.method public onProfileChanged(JJ)V
    .locals 0

    return-void
.end method

.method public onRatePlaying(F)V
    .locals 0

    return-void
.end method

.method public onRateSelected(F)V
    .locals 0

    return-void
.end method

.method public onReplaceMediaPlayerItem()V
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$300(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # invokes: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->beginTracking()V
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2200(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V

    :cond_0
    return-void
.end method

.method public onSizeAvailable(JJ)V
    .locals 0

    return-void
.end method

.method public onStateChanged(Lcom/adobe/mediacore/MediaPlayer$PlayerState;Lcom/adobe/mediacore/MediaPlayerNotification;)V
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

    const-string v2, "#onStateChanged"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "State: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/mediacore/MediaPlayer$PlayerState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # setter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_previousState:Lcom/adobe/mediacore/MediaPlayer$PlayerState;
    invoke-static {v0, p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2302(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Lcom/adobe/mediacore/MediaPlayer$PlayerState;)Lcom/adobe/mediacore/MediaPlayer$PlayerState;

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$6;->$SwitchMap$com$adobe$mediacore$MediaPlayer$PlayerState:[I

    invoke-virtual {p1}, Lcom/adobe/mediacore/MediaPlayer$PlayerState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # invokes: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->beginTracking()V
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2200(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V

    goto :goto_0

    :pswitch_2
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

    const-string v2, "#onStateChanged"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "status: playing."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isSeeking:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$700(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # invokes: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->handleStatusPlaying()V
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1800(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # invokes: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->beginTracking()V
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2200(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V

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

    const-string v2, "#onStateChanged"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "status: paused."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->trackPause()V

    goto :goto_0

    :pswitch_4
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

    const-string v2, "#onStateChanged"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "status: complete."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$1500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->onVideoComplete:Lcom/adobe/primetime/core/ICallback;
    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2400(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/core/ICallback;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->trackComplete(Lcom/adobe/primetime/core/ICallback;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # invokes: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->closeVideo()V
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V

    goto/16 :goto_0

    :pswitch_5
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

    const-string v2, "#onStateChanged"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "status: error."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    # invokes: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->onMediaError(Lcom/adobe/mediacore/MediaPlayerNotification;)V
    invoke-static {v0, p2}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->access$2600(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Lcom/adobe/mediacore/MediaPlayerNotification;)V

    goto/16 :goto_0

    :pswitch_6
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

    const-string v2, "#onStateChanged"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "status: released."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->endSession()V

    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public onTimedMetadata(Lcom/adobe/mediacore/metadata/TimedMetadata;)V
    .locals 0

    return-void
.end method

.method public onTimelineUpdated()V
    .locals 0

    return-void
.end method

.method public onUpdated()V
    .locals 0

    return-void
.end method
