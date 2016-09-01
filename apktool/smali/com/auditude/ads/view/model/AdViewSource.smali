.class public Lcom/auditude/ads/view/model/AdViewSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/view/model/IAdViewSource;


# instance fields
.field private adParameters:Ljava/lang/Object;

.field private asset:Lcom/auditude/ads/model/IAsset;

.field private companions:[Lcom/auditude/ads/model/IOnPageAsset;


# direct methods
.method public constructor <init>(Lcom/auditude/ads/model/IAsset;[Lcom/auditude/ads/model/IOnPageAsset;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/auditude/ads/view/model/AdViewSource;->asset:Lcom/auditude/ads/model/IAsset;

    .line 15
    iput-object p2, p0, Lcom/auditude/ads/view/model/AdViewSource;->companions:[Lcom/auditude/ads/model/IOnPageAsset;

    .line 16
    iput-object p3, p0, Lcom/auditude/ads/view/model/AdViewSource;->adParameters:Ljava/lang/Object;

    .line 17
    return-void
.end method


# virtual methods
.method public final getAdParameters()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/auditude/ads/view/model/AdViewSource;->adParameters:Ljava/lang/Object;

    return-object v0
.end method

.method public final getAsset()Lcom/auditude/ads/model/IAsset;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/auditude/ads/view/model/AdViewSource;->asset:Lcom/auditude/ads/model/IAsset;

    return-object v0
.end method

.method public final getCompanions()[Lcom/auditude/ads/model/IOnPageAsset;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/auditude/ads/view/model/AdViewSource;->companions:[Lcom/auditude/ads/model/IOnPageAsset;

    return-object v0
.end method
