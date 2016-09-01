.class public Lcom/auditude/ads/core/APIBridge;
.super Lcom/auditude/ads/util/event/EventDispatcher;
.source "SourceFile"


# static fields
.field public static final AD_VIEW_EVENT:Ljava/lang/String; = "adViewEvent"

.field public static final API_EVENT:Ljava/lang/String; = "apiEvent"

.field public static final SMIL_EVENT:Ljava/lang/String; = "smilEvent"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/auditude/ads/util/event/EventDispatcher;-><init>()V

    .line 27
    return-void
.end method


# virtual methods
.method public final adBegin(Lcom/auditude/ads/model/IAsset;[Lcom/auditude/ads/model/IOnPageAsset;Lcom/auditude/ads/session/IPlaybackSession;Z)V
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 43
    instance-of v0, p1, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v0, :cond_2

    .line 45
    new-instance v0, Lcom/auditude/ads/event/LinearAdEvent;

    const-string v1, "linearAdBegin"

    instance-of v3, p1, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v3, :cond_0

    move-object v2, p1

    :cond_0
    check-cast v2, Lcom/auditude/ads/model/ILinearAsset;

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/event/LinearAdEvent;-><init>(Ljava/lang/String;Lcom/auditude/ads/model/ILinearAsset;[Lcom/auditude/ads/model/IOnPageAsset;Lcom/auditude/ads/session/IPlaybackSession;Z)V

    .line 46
    const-string v1, "apiEvent"

    invoke-virtual {p0, v1, v0}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 70
    :cond_1
    :goto_0
    return-void

    .line 48
    :cond_2
    instance-of v0, p1, Lcom/auditude/ads/model/INonLinearAsset;

    if-eqz v0, :cond_4

    .line 50
    new-instance v1, Lcom/auditude/ads/event/NonLinearAdEvent;

    const-string v3, "nonLinearAdBegin"

    instance-of v0, p1, Lcom/auditude/ads/model/INonLinearAsset;

    if-eqz v0, :cond_3

    move-object v0, p1

    :goto_1
    check-cast v0, Lcom/auditude/ads/model/INonLinearAsset;

    invoke-direct {v1, v3, v0, p2}, Lcom/auditude/ads/event/NonLinearAdEvent;-><init>(Ljava/lang/String;Lcom/auditude/ads/model/INonLinearAsset;[Lcom/auditude/ads/model/IOnPageAsset;)V

    .line 51
    const-string v0, "apiEvent"

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_3
    move-object v0, v2

    .line 50
    goto :goto_1

    .line 55
    :cond_4
    instance-of v0, p1, Lcom/auditude/ads/model/IOnPageAsset;

    if-eqz v0, :cond_5

    invoke-interface {p1}, Lcom/auditude/ads/model/IAsset;->getFormat()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onpage"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 57
    new-instance v1, Lcom/auditude/ads/event/OnPageEvent;

    const-string v3, "showBanner"

    instance-of v0, p1, Lcom/auditude/ads/model/IOnPageAsset;

    if-eqz v0, :cond_6

    move-object v0, p1

    :goto_2
    check-cast v0, Lcom/auditude/ads/model/IOnPageAsset;

    invoke-direct {v1, v3, v0}, Lcom/auditude/ads/event/OnPageEvent;-><init>(Ljava/lang/String;Lcom/auditude/ads/model/IOnPageAsset;)V

    .line 58
    const-string v0, "apiEvent"

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 61
    :cond_5
    if-eqz p2, :cond_1

    .line 63
    const/4 v0, 0x0

    :goto_3
    array-length v1, p2

    if-ge v0, v1, :cond_1

    .line 65
    new-instance v1, Lcom/auditude/ads/event/OnPageEvent;

    const-string v2, "showBanner"

    aget-object v3, p2, v0

    invoke-direct {v1, v2, v3}, Lcom/auditude/ads/event/OnPageEvent;-><init>(Ljava/lang/String;Lcom/auditude/ads/model/IOnPageAsset;)V

    .line 66
    const-string v2, "apiEvent"

    invoke-virtual {p0, v2, v1}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 63
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_6
    move-object v0, v2

    .line 57
    goto :goto_2
.end method

.method public final adClick(Lcom/auditude/ads/model/IClick;Ljava/util/HashMap;)V
    .locals 2

    .prologue
    .line 120
    new-instance v0, Lcom/auditude/ads/event/AdClickThroughEvent;

    const-string v1, "adClick"

    invoke-direct {v0, v1, p1, p2}, Lcom/auditude/ads/event/AdClickThroughEvent;-><init>(Ljava/lang/String;Lcom/auditude/ads/model/IClick;Ljava/util/HashMap;)V

    .line 121
    const-string v1, "apiEvent"

    invoke-virtual {p0, v1, v0}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 122
    return-void
.end method

.method public final adEnd(Lcom/auditude/ads/model/IAsset;Z)V
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 74
    instance-of v0, p1, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v0, :cond_2

    .line 76
    new-instance v0, Lcom/auditude/ads/event/LinearAdEvent;

    const-string v1, "linearAdEnd"

    instance-of v2, p1, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v2, :cond_1

    move-object v2, p1

    :goto_0
    check-cast v2, Lcom/auditude/ads/model/ILinearAsset;

    move-object v4, v3

    move v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/event/LinearAdEvent;-><init>(Ljava/lang/String;Lcom/auditude/ads/model/ILinearAsset;[Lcom/auditude/ads/model/IOnPageAsset;Lcom/auditude/ads/session/IPlaybackSession;Z)V

    .line 77
    const-string v1, "apiEvent"

    invoke-virtual {p0, v1, v0}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 92
    :cond_0
    :goto_1
    return-void

    :cond_1
    move-object v2, v3

    .line 76
    goto :goto_0

    .line 79
    :cond_2
    instance-of v0, p1, Lcom/auditude/ads/model/INonLinearAsset;

    if-eqz v0, :cond_4

    .line 81
    new-instance v1, Lcom/auditude/ads/event/NonLinearAdEvent;

    const-string v2, "nonLinearAdEnd"

    instance-of v0, p1, Lcom/auditude/ads/model/INonLinearAsset;

    if-eqz v0, :cond_3

    move-object v0, p1

    :goto_2
    check-cast v0, Lcom/auditude/ads/model/INonLinearAsset;

    invoke-direct {v1, v2, v0, v3}, Lcom/auditude/ads/event/NonLinearAdEvent;-><init>(Ljava/lang/String;Lcom/auditude/ads/model/INonLinearAsset;[Lcom/auditude/ads/model/IOnPageAsset;)V

    .line 82
    const-string v0, "apiEvent"

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :cond_3
    move-object v0, v3

    .line 81
    goto :goto_2

    .line 86
    :cond_4
    instance-of v0, p1, Lcom/auditude/ads/model/IOnPageAsset;

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/auditude/ads/model/IAsset;->getFormat()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onpage"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 88
    new-instance v1, Lcom/auditude/ads/event/OnPageEvent;

    const-string v2, "hideBanner"

    instance-of v0, p1, Lcom/auditude/ads/model/IOnPageAsset;

    if-eqz v0, :cond_5

    move-object v0, p1

    :goto_3
    check-cast v0, Lcom/auditude/ads/model/IOnPageAsset;

    invoke-direct {v1, v2, v0}, Lcom/auditude/ads/event/OnPageEvent;-><init>(Ljava/lang/String;Lcom/auditude/ads/model/IOnPageAsset;)V

    .line 89
    const-string v0, "apiEvent"

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :cond_5
    move-object v0, v3

    .line 88
    goto :goto_3
.end method

.method public final adPaused(Lcom/auditude/ads/model/IAsset;)V
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 96
    instance-of v0, p1, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v0, :cond_0

    .line 98
    new-instance v0, Lcom/auditude/ads/event/LinearAdEvent;

    const-string v1, "linearAdPaused"

    instance-of v2, p1, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v2, :cond_1

    move-object v2, p1

    :goto_0
    check-cast v2, Lcom/auditude/ads/model/ILinearAsset;

    const/4 v5, 0x1

    move-object v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/event/LinearAdEvent;-><init>(Ljava/lang/String;Lcom/auditude/ads/model/ILinearAsset;[Lcom/auditude/ads/model/IOnPageAsset;Lcom/auditude/ads/session/IPlaybackSession;Z)V

    .line 99
    const-string v1, "apiEvent"

    invoke-virtual {p0, v1, v0}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 101
    :cond_0
    return-void

    :cond_1
    move-object v2, v3

    .line 98
    goto :goto_0
.end method

.method public final adProgress(Lcom/auditude/ads/model/IAsset;IILjava/util/HashMap;)V
    .locals 6

    .prologue
    .line 114
    new-instance v0, Lcom/auditude/ads/event/AdProgressEvent;

    const-string v1, "adProgress"

    move v2, p2

    move v3, p3

    move-object v4, p1

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/event/AdProgressEvent;-><init>(Ljava/lang/String;IILcom/auditude/ads/model/IAsset;Ljava/util/HashMap;)V

    .line 115
    const-string v1, "apiEvent"

    invoke-virtual {p0, v1, v0}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 116
    return-void
.end method

.method public final adResumed(Lcom/auditude/ads/model/IAsset;)V
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 105
    instance-of v0, p1, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v0, :cond_0

    .line 107
    new-instance v0, Lcom/auditude/ads/event/LinearAdEvent;

    const-string v1, "linearAdResumed"

    instance-of v2, p1, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v2, :cond_1

    move-object v2, p1

    :goto_0
    check-cast v2, Lcom/auditude/ads/model/ILinearAsset;

    const/4 v5, 0x1

    move-object v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/event/LinearAdEvent;-><init>(Ljava/lang/String;Lcom/auditude/ads/model/ILinearAsset;[Lcom/auditude/ads/model/IOnPageAsset;Lcom/auditude/ads/session/IPlaybackSession;Z)V

    .line 108
    const-string v1, "apiEvent"

    invoke-virtual {p0, v1, v0}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 110
    :cond_0
    return-void

    :cond_1
    move-object v2, v3

    .line 107
    goto :goto_0
.end method

.method public final breakBegin(Ljava/util/HashMap;)V
    .locals 2

    .prologue
    .line 31
    new-instance v0, Lcom/auditude/ads/event/AdPluginEvent;

    const-string v1, "breakBegin"

    invoke-direct {v0, v1, p1}, Lcom/auditude/ads/event/AdPluginEvent;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 32
    const-string v1, "apiEvent"

    invoke-virtual {p0, v1, v0}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 33
    return-void
.end method

.method public final breakEnd(Ljava/util/HashMap;)V
    .locals 2

    .prologue
    .line 37
    new-instance v0, Lcom/auditude/ads/event/AdPluginEvent;

    const-string v1, "breakEnd"

    invoke-direct {v0, v1, p1}, Lcom/auditude/ads/event/AdPluginEvent;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 38
    const-string v1, "apiEvent"

    invoke-virtual {p0, v1, v0}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 39
    return-void
.end method

.method public final pauseMainMedia(Ljava/util/HashMap;)V
    .locals 2

    .prologue
    .line 126
    new-instance v0, Lcom/auditude/ads/event/AdPluginEvent;

    const-string v1, "pausePlayback"

    invoke-direct {v0, v1, p1}, Lcom/auditude/ads/event/AdPluginEvent;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 127
    const-string v1, "apiEvent"

    invoke-virtual {p0, v1, v0}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 128
    return-void
.end method

.method public final resumeMainMedia(Ljava/util/HashMap;)V
    .locals 2

    .prologue
    .line 132
    new-instance v0, Lcom/auditude/ads/event/AdPluginEvent;

    const-string v1, "resumePlayback"

    invoke-direct {v0, v1, p1}, Lcom/auditude/ads/event/AdPluginEvent;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 133
    const-string v1, "apiEvent"

    invoke-virtual {p0, v1, v0}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 134
    return-void
.end method
