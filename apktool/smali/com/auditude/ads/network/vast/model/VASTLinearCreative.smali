.class public Lcom/auditude/ads/network/vast/model/VASTLinearCreative;
.super Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;
.source "SourceFile"


# instance fields
.field public click:Lcom/auditude/ads/network/vast/model/VASTClick;

.field public duration:I

.field private mediaFiles:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 5
    invoke-direct {p0}, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;-><init>()V

    .line 7
    const/4 v0, 0x0

    iput v0, p0, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->duration:I

    .line 5
    return-void
.end method


# virtual methods
.method public final addMediaFile(Lcom/auditude/ads/network/vast/model/VASTMediaFile;)V
    .locals 1

    .prologue
    .line 63
    if-nez p1, :cond_0

    .line 73
    :goto_0
    return-void

    .line 68
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->mediaFiles:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->mediaFiles:Ljava/util/ArrayList;

    .line 72
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->mediaFiles:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public final getBestMediaFile()Lcom/auditude/ads/network/vast/model/VASTMediaFile;
    .locals 11

    .prologue
    const/4 v2, 0x5

    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 14
    new-array v7, v2, [Ljava/lang/String;

    const-string v0, "application/x-mpegurl"

    aput-object v0, v7, v6

    const-string v0, "video/mp4"

    aput-object v0, v7, v4

    const/4 v0, 0x2

    const-string v1, "video/m4v"

    aput-object v1, v7, v0

    const/4 v0, 0x3

    const-string v1, "video/x-flv"

    aput-object v1, v7, v0

    const/4 v0, 0x4

    const-string v1, "video/webm"

    aput-object v1, v7, v0

    .line 15
    new-array v8, v2, [I

    fill-array-data v8, :array_0

    .line 16
    const/4 v2, 0x0

    .line 19
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->mediaFiles:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    move v5, v6

    move v1, v6

    .line 21
    :goto_0
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->mediaFiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v5, v0, :cond_1

    :cond_0
    move-object v0, v2

    .line 53
    :goto_1
    return-object v0

    .line 23
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->mediaFiles:Ljava/util/ArrayList;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;

    .line 24
    iget-object v3, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->type:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    aget-object v9, v7, v6

    invoke-virtual {v3, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 26
    aget v1, v8, v6

    goto :goto_1

    :cond_2
    move v3, v4

    .line 31
    :goto_2
    array-length v9, v7

    if-lt v3, v9, :cond_3

    .line 21
    add-int/lit8 v0, v5, 0x1

    move v5, v0

    goto :goto_0

    .line 33
    :cond_3
    iget-object v9, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->type:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    aget-object v10, v7, v3

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6

    add-int/lit8 v9, v3, -0x1

    aget v9, v8, v9

    if-ge v1, v9, :cond_6

    .line 35
    if-eqz v2, :cond_7

    .line 37
    iget-object v9, v2, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->type:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    iget-object v10, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->type:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    iget v9, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->bitrate:I

    iget v10, v2, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->bitrate:I

    if-gt v9, v10, :cond_5

    :cond_4
    iget-object v9, v2, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->type:Ljava/lang/String;

    iget-object v10, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->type:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_6

    .line 39
    :cond_5
    aget v1, v8, v3

    move-object v2, v0

    .line 31
    :cond_6
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 45
    :cond_7
    aget v1, v8, v3

    move-object v2, v0

    .line 46
    goto :goto_3

    .line 15
    nop

    :array_0
    .array-data 4
        0x32
        0x28
        0x1e
        0x14
        0xa
    .end array-data
.end method

.method public final getMediaFiles()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->mediaFiles:Ljava/util/ArrayList;

    return-object v0
.end method

.method public final hasAssetsWithMimeType(Ljava/util/ArrayList;)Ljava/lang/Boolean;
    .locals 5

    .prologue
    .line 77
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 79
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->mediaFiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 90
    :cond_1
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    .line 79
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;

    .line 81
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 83
    iget-object v4, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->type:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 85
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method
