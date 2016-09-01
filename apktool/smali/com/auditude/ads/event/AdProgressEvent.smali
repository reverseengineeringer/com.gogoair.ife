.class public Lcom/auditude/ads/event/AdProgressEvent;
.super Lcom/auditude/ads/event/AdPluginEvent;
.source "SourceFile"


# static fields
.field public static final AD_PROGRESS:Ljava/lang/String; = "adProgress"


# instance fields
.field private asset:Lcom/auditude/ads/model/IAsset;

.field private duration:I

.field private position:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IILcom/auditude/ads/model/IAsset;)V
    .locals 6

    .prologue
    .line 15
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/event/AdProgressEvent;-><init>(Ljava/lang/String;IILcom/auditude/ads/model/IAsset;Ljava/util/HashMap;)V

    .line 16
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILcom/auditude/ads/model/IAsset;Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0, p1, p5}, Lcom/auditude/ads/event/AdPluginEvent;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 21
    iput p2, p0, Lcom/auditude/ads/event/AdProgressEvent;->position:I

    .line 22
    iput p3, p0, Lcom/auditude/ads/event/AdProgressEvent;->duration:I

    .line 23
    iput-object p4, p0, Lcom/auditude/ads/event/AdProgressEvent;->asset:Lcom/auditude/ads/model/IAsset;

    .line 24
    return-void
.end method


# virtual methods
.method public final getAsset()Lcom/auditude/ads/model/IAsset;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/auditude/ads/event/AdProgressEvent;->asset:Lcom/auditude/ads/model/IAsset;

    return-object v0
.end method

.method public final getDuration()I
    .locals 1

    .prologue
    .line 33
    iget v0, p0, Lcom/auditude/ads/event/AdProgressEvent;->duration:I

    return v0
.end method

.method public final getPosition()I
    .locals 1

    .prologue
    .line 28
    iget v0, p0, Lcom/auditude/ads/event/AdProgressEvent;->position:I

    return v0
.end method
