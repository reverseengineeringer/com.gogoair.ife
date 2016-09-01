.class Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;


# instance fields
.field final synthetic this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPlayComplete()V
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->getPlaybackEventListener()Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;->onPlayComplete()V

    :cond_0
    return-void
.end method

.method public onPlayStart()V
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->getPlaybackEventListener()Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;->onPlayStart()V

    :cond_0
    return-void
.end method

.method public onPrepared()V
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->getPlaybackEventListener()Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;->onPrepared()V

    :cond_0
    return-void
.end method

.method public onProfileChanged(JJ)V
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->getPlaybackEventListener()Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;->onProfileChanged(JJ)V

    :cond_0
    return-void
.end method

.method public onRatePlaying(F)V
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->getPlaybackEventListener()Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;->onRatePlaying(F)V

    :cond_0
    return-void
.end method

.method public onRateSelected(F)V
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->getPlaybackEventListener()Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;->onRateSelected(F)V

    :cond_0
    return-void
.end method

.method public onReplaceMediaPlayerItem()V
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->getPlaybackEventListener()Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;->onReplaceMediaPlayerItem()V

    :cond_0
    return-void
.end method

.method public onSizeAvailable(JJ)V
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->getPlaybackEventListener()Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;->onSizeAvailable(JJ)V

    :cond_0
    return-void
.end method

.method public onStateChanged(Lcom/adobe/mediacore/MediaPlayer$PlayerState;Lcom/adobe/mediacore/MediaPlayerNotification;)V
    .locals 3

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_logger:Lcom/adobe/mediacore/logging/Logger;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$200()Lcom/adobe/mediacore/logging/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$100()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#onStateChanged: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/adobe/mediacore/MediaPlayer$PlayerState;->name()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$2;->$SwitchMap$com$adobe$mediacore$MediaPlayer$PlayerState:[I

    invoke-virtual {p1}, Lcom/adobe/mediacore/MediaPlayer$PlayerState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :goto_0
    :pswitch_0
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->getPlaybackEventListener()Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;->onStateChanged(Lcom/adobe/mediacore/MediaPlayer$PlayerState;Lcom/adobe/mediacore/MediaPlayerNotification;)V

    :cond_0
    return-void

    :pswitch_1
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # invokes: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->configure()V
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$300(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onTimedMetadata(Lcom/adobe/mediacore/metadata/TimedMetadata;)V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->getPlaybackEventListener()Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;->onTimedMetadata(Lcom/adobe/mediacore/metadata/TimedMetadata;)V

    :cond_0
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$400(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    move-result-object v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/adobe/mediacore/metadata/TimedMetadata;->getMetadata()Lcom/adobe/mediacore/metadata/Metadata;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/adobe/mediacore/metadata/TimedMetadata;->getMetadata()Lcom/adobe/mediacore/metadata/Metadata;

    move-result-object v0

    const-string v1, "PRIV"

    invoke-interface {v0, v1}, Lcom/adobe/mediacore/metadata/Metadata;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_1
    return-void
.end method

.method public onTimelineUpdated()V
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->getPlaybackEventListener()Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;->onTimelineUpdated()V

    :cond_0
    return-void
.end method

.method public onUpdated()V
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    # getter for: Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->getPlaybackEventListener()Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;->onUpdated()V

    :cond_0
    return-void
.end method
