.class Lcom/adobe/mediacore/CustomAdPlaybackManager$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/adobe/mediacore/MediaPlayer$CustomAdEventListener;


# instance fields
.field final synthetic this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/CustomAdPlaybackManager;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAdClickThru(Ljava/lang/String;Z)V
    .locals 4

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAd:Lcom/adobe/mediacore/timeline/advertising/Ad;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$900(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getPrimaryAsset()Lcom/adobe/mediacore/timeline/advertising/AdAsset;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/AdAsset;->getAdClick()Lcom/adobe/mediacore/timeline/advertising/AdClick;

    move-result-object v0

    :goto_0
    if-eqz p2, :cond_0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$100(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    invoke-static {v2}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$300(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAd:Lcom/adobe/mediacore/timeline/advertising/Ad;
    invoke-static {v3}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$900(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/adobe/mediacore/AdClickEvent;->createAdClickEvent(Lcom/adobe/mediacore/timeline/advertising/AdBreak;Lcom/adobe/mediacore/timeline/advertising/Ad;Lcom/adobe/mediacore/timeline/advertising/AdClick;)Lcom/adobe/mediacore/AdClickEvent;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    :cond_0
    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAd:Lcom/adobe/mediacore/timeline/advertising/Ad;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$900(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getContentTracker()Lcom/adobe/mediacore/timeline/advertising/ContentTracker;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAd:Lcom/adobe/mediacore/timeline/advertising/Ad;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$900(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getContentTracker()Lcom/adobe/mediacore/timeline/advertising/ContentTracker;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAd:Lcom/adobe/mediacore/timeline/advertising/Ad;
    invoke-static {v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$900(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/mediacore/timeline/advertising/ContentTracker;->onAdClick(Lcom/adobe/mediacore/timeline/advertising/Ad;)V

    :cond_1
    return-void

    :cond_2
    new-instance v0, Lcom/adobe/mediacore/timeline/advertising/AdClick;

    const-string v1, ""

    const-string v2, ""

    invoke-direct {v0, v1, v2, p1}, Lcom/adobe/mediacore/timeline/advertising/AdClick;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onAdDurationChange()V
    .locals 0

    return-void
.end method

.method public onAdError(Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0}, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->onAdStopped()V

    return-void
.end method

.method public onAdExpandedChange()V
    .locals 0

    return-void
.end method

.method public onAdImpression()V
    .locals 0

    return-void
.end method

.method public onAdInteraction()V
    .locals 0

    return-void
.end method

.method public onAdLinearChange()V
    .locals 0

    return-void
.end method

.method public onAdPaused()V
    .locals 0

    return-void
.end method

.method public onAdPlaying()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    const/4 v1, 0x1

    # setter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_isCustomAdPlaying:Z
    invoke-static {v0, v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$1102(Lcom/adobe/mediacore/CustomAdPlaybackManager;Z)Z

    return-void
.end method

.method public onAdProgress(FF)V
    .locals 4

    const/4 v1, 0x0

    cmpg-float v0, p1, v1

    if-lez v0, :cond_0

    cmpg-float v0, p2, v1

    if-gtz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    sub-float v0, p1, p2

    div-float/2addr v0, p1

    const/high16 v1, 0x42c80000    # 100.0f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_lastKnownProgress:I
    invoke-static {v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$1300(Lcom/adobe/mediacore/CustomAdPlaybackManager;)I

    move-result v1

    if-le v0, v1, :cond_0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # setter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_lastKnownProgress:I
    invoke-static {v1, v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$1302(Lcom/adobe/mediacore/CustomAdPlaybackManager;I)I

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$100(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    invoke-static {v2}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$300(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAd:Lcom/adobe/mediacore/timeline/advertising/Ad;
    invoke-static {v3}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$900(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/adobe/mediacore/AdPlaybackEvent;->createProgressEvent(Lcom/adobe/mediacore/timeline/advertising/AdBreak;Lcom/adobe/mediacore/timeline/advertising/Ad;I)Lcom/adobe/mediacore/AdPlaybackEvent;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    goto :goto_0
.end method

.method public onAdSizeChange()V
    .locals 0

    return-void
.end method

.method public onAdSkippableStateChange()V
    .locals 0

    return-void
.end method

.method public onAdSkipped()V
    .locals 0

    invoke-virtual {p0}, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->onAdStopped()V

    return-void
.end method

.method public onAdStarted()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$1000(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$1;

    invoke-direct {v1, p0}, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$1;-><init>(Lcom/adobe/mediacore/CustomAdPlaybackManager$2;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onAdStopped()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_isCustomAdPlaying:Z
    invoke-static {v0, v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$1102(Lcom/adobe/mediacore/CustomAdPlaybackManager;Z)Z

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # operator++ for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$408(Lcom/adobe/mediacore/CustomAdPlaybackManager;)I

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$1000(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;

    invoke-direct {v1, p0}, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;-><init>(Lcom/adobe/mediacore/CustomAdPlaybackManager$2;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onAdUserAcceptInvitation()V
    .locals 0

    return-void
.end method

.method public onAdUserClose()V
    .locals 0

    return-void
.end method

.method public onAdUserMinimize()V
    .locals 0

    return-void
.end method

.method public onAdVideoComplete()V
    .locals 0

    return-void
.end method

.method public onAdVideoFirstQuartile()V
    .locals 0

    return-void
.end method

.method public onAdVideoMidpoint()V
    .locals 0

    return-void
.end method

.method public onAdVideoStart()V
    .locals 0

    return-void
.end method

.method public onAdVideoThirdQuartile()V
    .locals 0

    return-void
.end method

.method public onAdVolumeChange()V
    .locals 0

    return-void
.end method
