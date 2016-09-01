.class public Lcom/auditude/ads/event/LinearAdEvent;
.super Lcom/auditude/ads/event/AdPluginEvent;
.source "SourceFile"


# static fields
.field public static final AD_BEGIN:Ljava/lang/String; = "linearAdBegin"

.field public static final AD_END:Ljava/lang/String; = "linearAdEnd"

.field public static final AD_PAUSED:Ljava/lang/String; = "linearAdPaused"

.field public static final AD_RESUMED:Ljava/lang/String; = "linearAdResumed"


# instance fields
.field private asset:Lcom/auditude/ads/model/ILinearAsset;

.field private auditudeHandlesAd:Z

.field private banners:[Lcom/auditude/ads/model/IOnPageAsset;

.field private session:Lcom/auditude/ads/session/IPlaybackSession;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/auditude/ads/model/ILinearAsset;[Lcom/auditude/ads/model/IOnPageAsset;Lcom/auditude/ads/session/IPlaybackSession;Z)V
    .locals 7

    .prologue
    .line 21
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/auditude/ads/event/LinearAdEvent;-><init>(Ljava/lang/String;Lcom/auditude/ads/model/ILinearAsset;[Lcom/auditude/ads/model/IOnPageAsset;Lcom/auditude/ads/session/IPlaybackSession;ZLjava/util/HashMap;)V

    .line 22
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/auditude/ads/model/ILinearAsset;[Lcom/auditude/ads/model/IOnPageAsset;Lcom/auditude/ads/session/IPlaybackSession;ZLjava/util/HashMap;)V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0, p1, p6}, Lcom/auditude/ads/event/AdPluginEvent;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 27
    iput-object p2, p0, Lcom/auditude/ads/event/LinearAdEvent;->asset:Lcom/auditude/ads/model/ILinearAsset;

    .line 28
    iput-object p3, p0, Lcom/auditude/ads/event/LinearAdEvent;->banners:[Lcom/auditude/ads/model/IOnPageAsset;

    .line 29
    iput-object p4, p0, Lcom/auditude/ads/event/LinearAdEvent;->session:Lcom/auditude/ads/session/IPlaybackSession;

    .line 30
    iput-boolean p5, p0, Lcom/auditude/ads/event/LinearAdEvent;->auditudeHandlesAd:Z

    .line 31
    return-void
.end method


# virtual methods
.method public final getAsset()Lcom/auditude/ads/model/ILinearAsset;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/auditude/ads/event/LinearAdEvent;->asset:Lcom/auditude/ads/model/ILinearAsset;

    return-object v0
.end method

.method public final getAuditudeHandlesAd()Z
    .locals 1

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/auditude/ads/event/LinearAdEvent;->auditudeHandlesAd:Z

    return v0
.end method

.method public final getBanners()[Lcom/auditude/ads/model/IOnPageAsset;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/auditude/ads/event/LinearAdEvent;->banners:[Lcom/auditude/ads/model/IOnPageAsset;

    return-object v0
.end method

.method public final getSession()Lcom/auditude/ads/session/IPlaybackSession;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/auditude/ads/event/LinearAdEvent;->session:Lcom/auditude/ads/session/IPlaybackSession;

    return-object v0
.end method
