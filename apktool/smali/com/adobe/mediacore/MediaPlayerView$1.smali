.class Lcom/adobe/mediacore/MediaPlayerView$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/adobe/mediacore/MediaPlayer$CustomAdEventListener;


# instance fields
.field final synthetic this$0:Lcom/adobe/mediacore/MediaPlayerView;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/MediaPlayerView;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/MediaPlayerView$1;->this$0:Lcom/adobe/mediacore/MediaPlayerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAdClickThru(Ljava/lang/String;Z)V
    .locals 0

    return-void
.end method

.method public onAdDurationChange()V
    .locals 0

    return-void
.end method

.method public onAdError(Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0}, Lcom/adobe/mediacore/MediaPlayerView$1;->onAdStopped()V

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
    .locals 0

    return-void
.end method

.method public onAdProgress(FF)V
    .locals 0

    return-void
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

    invoke-virtual {p0}, Lcom/adobe/mediacore/MediaPlayerView$1;->onAdStopped()V

    return-void
.end method

.method public onAdStarted()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/MediaPlayerView$1;->this$0:Lcom/adobe/mediacore/MediaPlayerView;

    const/4 v1, 0x1

    # setter for: Lcom/adobe/mediacore/MediaPlayerView;->_customAdPlaying:Z
    invoke-static {v0, v1}, Lcom/adobe/mediacore/MediaPlayerView;->access$602(Lcom/adobe/mediacore/MediaPlayerView;Z)Z

    return-void
.end method

.method public onAdStopped()V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/MediaPlayerView$1;->this$0:Lcom/adobe/mediacore/MediaPlayerView;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/mediacore/MediaPlayerView;->_customAdPlaying:Z
    invoke-static {v0, v1}, Lcom/adobe/mediacore/MediaPlayerView;->access$602(Lcom/adobe/mediacore/MediaPlayerView;Z)Z

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
