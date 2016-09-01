.class public Lcom/auditude/ads/model/smil/Ref;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private ad:Lcom/auditude/ads/model/Ad;

.field private assets:[Lcom/auditude/ads/model/Asset;

.field private companions:[Lcom/auditude/ads/model/OnPageAsset;

.field private id:Ljava/lang/String;

.field private isWatched:Z

.field private par:Lcom/auditude/ads/model/smil/Par;

.field private primaryAsset:Lcom/auditude/ads/model/Asset;

.field private type:Lcom/auditude/ads/model/smil/SmilElementType;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/auditude/ads/model/smil/Ref;-><init>(Lcom/auditude/ads/model/smil/Par;)V

    .line 23
    return-void
.end method

.method public constructor <init>(Lcom/auditude/ads/model/smil/Par;)V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/model/smil/Ref;->isWatched:Z

    .line 15
    sget-object v0, Lcom/auditude/ads/model/smil/SmilElementType;->LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->type:Lcom/auditude/ads/model/smil/SmilElementType;

    .line 27
    iput-object p1, p0, Lcom/auditude/ads/model/smil/Ref;->par:Lcom/auditude/ads/model/smil/Par;

    .line 28
    return-void
.end method

.method private mapAssets()V
    .locals 7

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 98
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->ad:Lcom/auditude/ads/model/Ad;

    if-nez v0, :cond_0

    .line 128
    :goto_0
    return-void

    .line 103
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 104
    iput-object v3, p0, Lcom/auditude/ads/model/smil/Ref;->primaryAsset:Lcom/auditude/ads/model/Asset;

    .line 106
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->assets:[Lcom/auditude/ads/model/Asset;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->assets:[Lcom/auditude/ads/model/Asset;

    array-length v0, v0

    if-lez v0, :cond_1

    move v1, v2

    .line 109
    :goto_1
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->assets:[Lcom/auditude/ads/model/Asset;

    array-length v0, v0

    if-lt v1, v0, :cond_2

    .line 127
    :cond_1
    new-array v0, v2, [Lcom/auditude/ads/model/OnPageAsset;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/auditude/ads/model/OnPageAsset;

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->companions:[Lcom/auditude/ads/model/OnPageAsset;

    goto :goto_0

    .line 111
    :cond_2
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->assets:[Lcom/auditude/ads/model/Asset;

    aget-object v0, v0, v1

    .line 112
    instance-of v5, v0, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v5, :cond_4

    iget-object v5, p0, Lcom/auditude/ads/model/smil/Ref;->type:Lcom/auditude/ads/model/smil/SmilElementType;

    sget-object v6, Lcom/auditude/ads/model/smil/SmilElementType;->LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    if-ne v5, v6, :cond_4

    .line 114
    iput-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->primaryAsset:Lcom/auditude/ads/model/Asset;

    .line 109
    :cond_3
    :goto_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    .line 116
    :cond_4
    instance-of v5, v0, Lcom/auditude/ads/model/INonLinearAsset;

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/auditude/ads/model/smil/Ref;->type:Lcom/auditude/ads/model/smil/SmilElementType;

    sget-object v6, Lcom/auditude/ads/model/smil/SmilElementType;->NON_LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    if-ne v5, v6, :cond_5

    .line 118
    iput-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->primaryAsset:Lcom/auditude/ads/model/Asset;

    goto :goto_2

    .line 120
    :cond_5
    instance-of v5, v0, Lcom/auditude/ads/model/OnPageAsset;

    if-eqz v5, :cond_3

    .line 122
    instance-of v5, v0, Lcom/auditude/ads/model/OnPageAsset;

    if-eqz v5, :cond_6

    :goto_3
    check-cast v0, Lcom/auditude/ads/model/OnPageAsset;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_6
    move-object v0, v3

    goto :goto_3
.end method


# virtual methods
.method public final dispose()V
    .locals 0

    .prologue
    .line 133
    return-void
.end method

.method public final getAd()Lcom/auditude/ads/model/Ad;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->ad:Lcom/auditude/ads/model/Ad;

    return-object v0
.end method

.method public final getAssets()[Lcom/auditude/ads/model/Asset;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->assets:[Lcom/auditude/ads/model/Asset;

    return-object v0
.end method

.method public final getCompanions()[Lcom/auditude/ads/model/OnPageAsset;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->companions:[Lcom/auditude/ads/model/OnPageAsset;

    return-object v0
.end method

.method public final getID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->id:Ljava/lang/String;

    return-object v0
.end method

.method public final getPar()Lcom/auditude/ads/model/smil/Par;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->par:Lcom/auditude/ads/model/smil/Par;

    return-object v0
.end method

.method public final getPrimaryAsset()Lcom/auditude/ads/model/Asset;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->primaryAsset:Lcom/auditude/ads/model/Asset;

    return-object v0
.end method

.method public final getType()Lcom/auditude/ads/model/smil/SmilElementType;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->par:Lcom/auditude/ads/model/smil/Par;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/model/smil/Ref;->par:Lcom/auditude/ads/model/smil/Par;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getType()Lcom/auditude/ads/model/smil/SmilElementType;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/auditude/ads/model/smil/SmilElementType;->UNKNOWN:Lcom/auditude/ads/model/smil/SmilElementType;

    goto :goto_0
.end method

.method public final isWatched()Z
    .locals 1

    .prologue
    .line 88
    iget-boolean v0, p0, Lcom/auditude/ads/model/smil/Ref;->isWatched:Z

    return v0
.end method

.method public final setAd(Lcom/auditude/ads/model/Ad;)V
    .locals 0

    .prologue
    .line 62
    iput-object p1, p0, Lcom/auditude/ads/model/smil/Ref;->ad:Lcom/auditude/ads/model/Ad;

    .line 63
    return-void
.end method

.method public final setAssets([Lcom/auditude/ads/model/Asset;)V
    .locals 0

    .prologue
    .line 72
    iput-object p1, p0, Lcom/auditude/ads/model/smil/Ref;->assets:[Lcom/auditude/ads/model/Asset;

    .line 73
    invoke-direct {p0}, Lcom/auditude/ads/model/smil/Ref;->mapAssets()V

    .line 74
    return-void
.end method

.method public final setID(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 52
    iput-object p1, p0, Lcom/auditude/ads/model/smil/Ref;->id:Ljava/lang/String;

    .line 53
    return-void
.end method

.method public setPar(Lcom/auditude/ads/model/smil/Par;)V
    .locals 0

    .prologue
    .line 37
    iput-object p1, p0, Lcom/auditude/ads/model/smil/Ref;->par:Lcom/auditude/ads/model/smil/Par;

    .line 38
    return-void
.end method

.method public final setWatched(Z)V
    .locals 0

    .prologue
    .line 93
    iput-boolean p1, p0, Lcom/auditude/ads/model/smil/Ref;->isWatched:Z

    .line 94
    return-void
.end method
