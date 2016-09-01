.class public Lcom/auditude/ads/view/AdPlaybackSession;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/session/IPlaybackSession;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;,
        Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;
    }
.end annotation


# instance fields
.field private listener:Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;

.field private source:Lcom/auditude/ads/view/model/AdViewSource;

.field private view:Lcom/auditude/ads/view/AdView;


# direct methods
.method public constructor <init>(Lcom/auditude/ads/view/model/AdViewSource;Lcom/auditude/ads/view/AdView;Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;)V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/auditude/ads/view/AdPlaybackSession;->source:Lcom/auditude/ads/view/model/AdViewSource;

    .line 31
    iput-object p2, p0, Lcom/auditude/ads/view/AdPlaybackSession;->view:Lcom/auditude/ads/view/AdView;

    .line 32
    iput-object p3, p0, Lcom/auditude/ads/view/AdPlaybackSession;->listener:Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;

    .line 33
    return-void
.end method


# virtual methods
.method public final getOnAdPlaybackSessionEventListener()Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/auditude/ads/view/AdPlaybackSession;->listener:Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;

    return-object v0
.end method

.method public final notify(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 4

    .prologue
    .line 95
    iget-object v0, p0, Lcom/auditude/ads/view/AdPlaybackSession;->listener:Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;

    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->NOTIFY:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    iget-object v2, p0, Lcom/auditude/ads/view/AdPlaybackSession;->source:Lcom/auditude/ads/view/model/AdViewSource;

    iget-object v3, p0, Lcom/auditude/ads/view/AdPlaybackSession;->view:Lcom/auditude/ads/view/AdView;

    invoke-interface {v0, v1, v2, v3, p2}, Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;->onAdPlaybackSessionEvent(Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;Lcom/auditude/ads/view/model/AdViewSource;Lcom/auditude/ads/view/AdView;Ljava/util/HashMap;)V

    .line 96
    return-void
.end method

.method public final notifyClick()V
    .locals 5

    .prologue
    .line 82
    iget-object v0, p0, Lcom/auditude/ads/view/AdPlaybackSession;->source:Lcom/auditude/ads/view/model/AdViewSource;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/view/AdPlaybackSession;->source:Lcom/auditude/ads/view/model/AdViewSource;

    invoke-virtual {v0}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/view/AdPlaybackSession;->source:Lcom/auditude/ads/view/model/AdViewSource;

    invoke-virtual {v0}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/model/IAsset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/view/AdPlaybackSession;->source:Lcom/auditude/ads/view/model/AdViewSource;

    invoke-virtual {v0}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/model/IAsset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/model/IClick;->getUrl()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/view/AdPlaybackSession;->source:Lcom/auditude/ads/view/model/AdViewSource;

    invoke-virtual {v0}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/model/IAsset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/model/IClick;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/auditude/ads/view/AdPlaybackSession;->listener:Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;

    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->CLICK:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    iget-object v2, p0, Lcom/auditude/ads/view/AdPlaybackSession;->source:Lcom/auditude/ads/view/model/AdViewSource;

    iget-object v3, p0, Lcom/auditude/ads/view/AdPlaybackSession;->view:Lcom/auditude/ads/view/AdView;

    const/4 v4, 0x0

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;->onAdPlaybackSessionEvent(Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;Lcom/auditude/ads/view/model/AdViewSource;Lcom/auditude/ads/view/AdView;Ljava/util/HashMap;)V

    .line 86
    :cond_0
    return-void
.end method

.method public final notifyComplete()V
    .locals 5

    .prologue
    .line 67
    iget-object v0, p0, Lcom/auditude/ads/view/AdPlaybackSession;->listener:Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;

    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->COMPLETE:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    iget-object v2, p0, Lcom/auditude/ads/view/AdPlaybackSession;->source:Lcom/auditude/ads/view/model/AdViewSource;

    iget-object v3, p0, Lcom/auditude/ads/view/AdPlaybackSession;->view:Lcom/auditude/ads/view/AdView;

    const/4 v4, 0x0

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;->onAdPlaybackSessionEvent(Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;Lcom/auditude/ads/view/model/AdViewSource;Lcom/auditude/ads/view/AdView;Ljava/util/HashMap;)V

    .line 68
    return-void
.end method

.method public final notifyError(Ljava/lang/RuntimeException;)V
    .locals 5

    .prologue
    .line 72
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 73
    if-eqz p1, :cond_0

    .line 75
    const-string v1, "error"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    :cond_0
    iget-object v1, p0, Lcom/auditude/ads/view/AdPlaybackSession;->listener:Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;

    sget-object v2, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ERROR:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    iget-object v3, p0, Lcom/auditude/ads/view/AdPlaybackSession;->source:Lcom/auditude/ads/view/model/AdViewSource;

    iget-object v4, p0, Lcom/auditude/ads/view/AdPlaybackSession;->view:Lcom/auditude/ads/view/AdView;

    invoke-interface {v1, v2, v3, v4, v0}, Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;->onAdPlaybackSessionEvent(Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;Lcom/auditude/ads/view/model/AdViewSource;Lcom/auditude/ads/view/AdView;Ljava/util/HashMap;)V

    .line 78
    return-void
.end method

.method public final notifyPause()V
    .locals 5

    .prologue
    .line 52
    iget-object v0, p0, Lcom/auditude/ads/view/AdPlaybackSession;->listener:Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;

    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->PAUSE:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    iget-object v2, p0, Lcom/auditude/ads/view/AdPlaybackSession;->source:Lcom/auditude/ads/view/model/AdViewSource;

    iget-object v3, p0, Lcom/auditude/ads/view/AdPlaybackSession;->view:Lcom/auditude/ads/view/AdView;

    const/4 v4, 0x0

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;->onAdPlaybackSessionEvent(Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;Lcom/auditude/ads/view/model/AdViewSource;Lcom/auditude/ads/view/AdView;Ljava/util/HashMap;)V

    .line 53
    return-void
.end method

.method public final notifyProgress(II)V
    .locals 5

    .prologue
    .line 100
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 101
    const-string v1, "position"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    const-string v1, "duration"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    iget-object v1, p0, Lcom/auditude/ads/view/AdPlaybackSession;->listener:Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;

    sget-object v2, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->PROGRESS:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    iget-object v3, p0, Lcom/auditude/ads/view/AdPlaybackSession;->source:Lcom/auditude/ads/view/model/AdViewSource;

    iget-object v4, p0, Lcom/auditude/ads/view/AdPlaybackSession;->view:Lcom/auditude/ads/view/AdView;

    invoke-interface {v1, v2, v3, v4, v0}, Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;->onAdPlaybackSessionEvent(Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;Lcom/auditude/ads/view/model/AdViewSource;Lcom/auditude/ads/view/AdView;Ljava/util/HashMap;)V

    .line 104
    return-void
.end method

.method public final notifyResume()V
    .locals 5

    .prologue
    .line 57
    iget-object v0, p0, Lcom/auditude/ads/view/AdPlaybackSession;->listener:Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;

    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->RESUME:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    iget-object v2, p0, Lcom/auditude/ads/view/AdPlaybackSession;->source:Lcom/auditude/ads/view/model/AdViewSource;

    iget-object v3, p0, Lcom/auditude/ads/view/AdPlaybackSession;->view:Lcom/auditude/ads/view/AdView;

    const/4 v4, 0x0

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;->onAdPlaybackSessionEvent(Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;Lcom/auditude/ads/view/model/AdViewSource;Lcom/auditude/ads/view/AdView;Ljava/util/HashMap;)V

    .line 58
    return-void
.end method

.method public final notifySkip()V
    .locals 5

    .prologue
    .line 90
    iget-object v0, p0, Lcom/auditude/ads/view/AdPlaybackSession;->listener:Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;

    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->SKIP:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    iget-object v2, p0, Lcom/auditude/ads/view/AdPlaybackSession;->source:Lcom/auditude/ads/view/model/AdViewSource;

    iget-object v3, p0, Lcom/auditude/ads/view/AdPlaybackSession;->view:Lcom/auditude/ads/view/AdView;

    const/4 v4, 0x0

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;->onAdPlaybackSessionEvent(Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;Lcom/auditude/ads/view/model/AdViewSource;Lcom/auditude/ads/view/AdView;Ljava/util/HashMap;)V

    .line 91
    return-void
.end method

.method public final notifyStart()V
    .locals 5

    .prologue
    .line 47
    iget-object v0, p0, Lcom/auditude/ads/view/AdPlaybackSession;->listener:Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;

    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->START:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    iget-object v2, p0, Lcom/auditude/ads/view/AdPlaybackSession;->source:Lcom/auditude/ads/view/model/AdViewSource;

    iget-object v3, p0, Lcom/auditude/ads/view/AdPlaybackSession;->view:Lcom/auditude/ads/view/AdView;

    const/4 v4, 0x0

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;->onAdPlaybackSessionEvent(Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;Lcom/auditude/ads/view/model/AdViewSource;Lcom/auditude/ads/view/AdView;Ljava/util/HashMap;)V

    .line 48
    return-void
.end method

.method public final notifyStop()V
    .locals 5

    .prologue
    .line 62
    iget-object v0, p0, Lcom/auditude/ads/view/AdPlaybackSession;->listener:Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;

    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->STOP:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    iget-object v2, p0, Lcom/auditude/ads/view/AdPlaybackSession;->source:Lcom/auditude/ads/view/model/AdViewSource;

    iget-object v3, p0, Lcom/auditude/ads/view/AdPlaybackSession;->view:Lcom/auditude/ads/view/AdView;

    const/4 v4, 0x0

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;->onAdPlaybackSessionEvent(Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;Lcom/auditude/ads/view/model/AdViewSource;Lcom/auditude/ads/view/AdView;Ljava/util/HashMap;)V

    .line 63
    return-void
.end method

.method public final setOnAdPlaybackSessionEventListener(Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;)V
    .locals 0

    .prologue
    .line 42
    iput-object p1, p0, Lcom/auditude/ads/view/AdPlaybackSession;->listener:Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;

    .line 43
    return-void
.end method
