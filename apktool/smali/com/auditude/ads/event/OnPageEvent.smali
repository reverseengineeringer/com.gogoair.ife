.class public Lcom/auditude/ads/event/OnPageEvent;
.super Lcom/auditude/ads/event/AdPluginEvent;
.source "SourceFile"


# static fields
.field public static final HIDE_BANNER:Ljava/lang/String; = "hideBanner"

.field public static final SHOW_BANNER:Ljava/lang/String; = "showBanner"


# instance fields
.field private asset:Lcom/auditude/ads/model/IOnPageAsset;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/auditude/ads/model/IOnPageAsset;)V
    .locals 1

    .prologue
    .line 14
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/auditude/ads/event/OnPageEvent;-><init>(Ljava/lang/String;Lcom/auditude/ads/model/IOnPageAsset;Ljava/util/HashMap;)V

    .line 16
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/auditude/ads/model/IOnPageAsset;Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0, p1, p3}, Lcom/auditude/ads/event/AdPluginEvent;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 21
    iput-object p2, p0, Lcom/auditude/ads/event/OnPageEvent;->asset:Lcom/auditude/ads/model/IOnPageAsset;

    .line 22
    return-void
.end method


# virtual methods
.method public final getAsset()Lcom/auditude/ads/model/IOnPageAsset;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/auditude/ads/event/OnPageEvent;->asset:Lcom/auditude/ads/model/IOnPageAsset;

    return-object v0
.end method
