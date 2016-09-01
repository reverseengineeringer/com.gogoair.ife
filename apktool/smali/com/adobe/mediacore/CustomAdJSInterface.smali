.class final Lcom/adobe/mediacore/CustomAdJSInterface;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String;


# instance fields
.field private final _logger:Lcom/adobe/mediacore/logging/Logger;

.field private final eventListeners:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[PSDK]::"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/adobe/mediacore/CustomAdJSInterface;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/mediacore/CustomAdJSInterface;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/adobe/mediacore/CustomAdJSInterface;->LOG_TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/adobe/mediacore/logging/Log;->getLogger(Ljava/lang/String;)Lcom/adobe/mediacore/logging/Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public addEventListener(Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;)V
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public onAdClickThru(Ljava/lang/String;Z)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0, p1, p2}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdClickThru(Ljava/lang/String;Z)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdDurationChange()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdDurationChange()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdError(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0, p1}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdError(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdExpandedChange()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdExpandedChange()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdImpression()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdImpression()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdInteraction()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdInteraction()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdLinearChange()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdLinearChange()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdPaused()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdPaused()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdPlaying()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdPlaying()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdRemainingTimeChange(FF)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0, p1, p2}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdRemainingTimeChange(FF)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdSizeChange()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdSizeChange()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdSkippableStateChange()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdSkippableStateChange()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdSkipped()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdSkipped()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdStarted()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdStarted()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdStopped()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdStopped()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdUserAcceptInvitation()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdUserAcceptInvitation()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdUserClose()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdUserClose()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdUserMinimize()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdUserMinimize()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdVideoComplete()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdVideoComplete()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdVideoFirstQuartile()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdVideoFirstQuartile()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdVideoMidpoint()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdVideoMidpoint()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdVideoStart()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdVideoStart()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdVideoThirdQuartile()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdVideoThirdQuartile()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onAdVolumeChange()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onAdVolumeChange()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onDocumentReady()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;

    invoke-interface {v0}, Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;->onDocumentReady()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public removeEventListener(Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;)V
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdJSInterface;->eventListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method
