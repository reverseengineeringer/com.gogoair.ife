.class public Lcom/auditude/ads/event/NonLinearAdEvent;
.super Lcom/auditude/ads/event/AdPluginEvent;
.source "SourceFile"


# static fields
.field public static final AD_BEGIN:Ljava/lang/String; = "nonLinearAdBegin"

.field public static final AD_END:Ljava/lang/String; = "nonLinearAdEnd"


# instance fields
.field private asset:Lcom/auditude/ads/model/INonLinearAsset;

.field private banners:[Lcom/auditude/ads/model/IOnPageAsset;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/auditude/ads/model/INonLinearAsset;[Lcom/auditude/ads/model/IOnPageAsset;)V
    .locals 1

    .prologue
    .line 16
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/auditude/ads/event/NonLinearAdEvent;-><init>(Ljava/lang/String;Lcom/auditude/ads/model/INonLinearAsset;[Lcom/auditude/ads/model/IOnPageAsset;Ljava/util/HashMap;)V

    .line 18
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/auditude/ads/model/INonLinearAsset;[Lcom/auditude/ads/model/IOnPageAsset;Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0, p1, p4}, Lcom/auditude/ads/event/AdPluginEvent;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 23
    iput-object p2, p0, Lcom/auditude/ads/event/NonLinearAdEvent;->asset:Lcom/auditude/ads/model/INonLinearAsset;

    .line 24
    iput-object p3, p0, Lcom/auditude/ads/event/NonLinearAdEvent;->banners:[Lcom/auditude/ads/model/IOnPageAsset;

    .line 25
    return-void
.end method


# virtual methods
.method public final getAsset()Lcom/auditude/ads/model/INonLinearAsset;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/auditude/ads/event/NonLinearAdEvent;->asset:Lcom/auditude/ads/model/INonLinearAsset;

    return-object v0
.end method

.method public final getBanners()[Lcom/auditude/ads/model/IOnPageAsset;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/auditude/ads/event/NonLinearAdEvent;->banners:[Lcom/auditude/ads/model/IOnPageAsset;

    return-object v0
.end method
