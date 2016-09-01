.class Lcom/adobe/mediacore/CustomAdView$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;


# instance fields
.field final synthetic this$0:Lcom/adobe/mediacore/CustomAdView;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/CustomAdView;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAdClickThru(Ljava/lang/String;Z)V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {p1, p2}, Lcom/adobe/mediacore/CustomAdEvent;->createAdClickThru(Ljava/lang/String;Z)Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdDurationChange()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdDurationChange()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdError(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {p1}, Lcom/adobe/mediacore/CustomAdEvent;->createAdError(Ljava/lang/String;)Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdExpandedChange()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdExpandedChange()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdImpression()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdImpression()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdInteraction()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdInteraction()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdLinearChange()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdLinearChange()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdPaused()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdPaused()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdPlaying()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdPlaying()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdRemainingTimeChange(FF)V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {p1, p2}, Lcom/adobe/mediacore/CustomAdEvent;->createAdProgress(FF)Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdSizeChange()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdSizeChange()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdSkippableStateChange()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdSkippableStateChange()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdSkipped()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdSkipped()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdStarted()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdStarted()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdStopped()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdStopped()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdUserAcceptInvitation()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdUserAcceptInvitation()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdUserClose()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdUserClose()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdUserMinimize()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdUserMinimize()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdVideoComplete()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdVideoComplete()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdVideoFirstQuartile()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdVideoFirstQuartile()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdVideoMidpoint()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdVideoMidpoint()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdVideoStart()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdVideoStart()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdVideoThirdQuartile()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdVideoThirdQuartile()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onAdVolumeChange()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mediacore/CustomAdEvent;->createAdVolumeChange()Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method

.method public onDocumentReady()V
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:PrimetimeJS.setOptions("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    invoke-virtual {v1}, Lcom/adobe/mediacore/CustomAdView;->getWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    invoke-virtual {v1}, Lcom/adobe/mediacore/CustomAdView;->getHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_bitrate:J
    invoke-static {v1}, Lcom/adobe/mediacore/CustomAdView;->access$300(Lcom/adobe/mediacore/CustomAdView;)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_url:Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/mediacore/CustomAdView;->access$400(Lcom/adobe/mediacore/CustomAdView;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\', \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_parameters:Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/mediacore/CustomAdView;->access$500(Lcom/adobe/mediacore/CustomAdView;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\', "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_timeout:I
    invoke-static {v1}, Lcom/adobe/mediacore/CustomAdView;->access$600(Lcom/adobe/mediacore/CustomAdView;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdView$3;->this$0:Lcom/adobe/mediacore/CustomAdView;

    invoke-virtual {v1, v0}, Lcom/adobe/mediacore/CustomAdView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method
