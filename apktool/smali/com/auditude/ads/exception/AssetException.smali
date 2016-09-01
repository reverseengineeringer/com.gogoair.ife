.class public Lcom/auditude/ads/exception/AssetException;
.super Lcom/auditude/ads/exception/PlayerException;
.source "SourceFile"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field public adId:Ljava/lang/String;

.field public assetId:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0, p1, p2}, Lcom/auditude/ads/exception/PlayerException;-><init>(ILjava/lang/String;)V

    .line 17
    return-void
.end method


# virtual methods
.method public toParams()Ljava/util/HashMap;
    .locals 3

    .prologue
    .line 22
    invoke-super {p0}, Lcom/auditude/ads/exception/PlayerException;->toParams()Ljava/util/HashMap;

    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/auditude/ads/exception/AssetException;->adId:Ljava/lang/String;

    invoke-static {v1}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "a"

    iget-object v2, p0, Lcom/auditude/ads/exception/AssetException;->adId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    :cond_0
    iget-object v1, p0, Lcom/auditude/ads/exception/AssetException;->assetId:Ljava/lang/String;

    invoke-static {v1}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "a1"

    iget-object v2, p0, Lcom/auditude/ads/exception/AssetException;->assetId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    :cond_1
    return-object v0
.end method
