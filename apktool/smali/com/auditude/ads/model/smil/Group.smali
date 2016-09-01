.class public Lcom/auditude/ads/model/smil/Group;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/model/smil/ISMILIterator;
.implements Lcom/auditude/ads/model/smil/Par$ParResoultionCompleteListener;
.implements Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;
.implements Lcom/auditude/ads/util/event/IEventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/auditude/ads/model/smil/Group$PrefetchCompleteListener;
    }
.end annotation


# instance fields
.field private adPluginEvents:Ljava/util/ArrayList;

.field private adSettings:Lcom/auditude/ads/core/AdSettings;

.field private currentSequence:Lcom/auditude/ads/model/smil/Sequence;

.field private duration:I

.field private index:I

.field private isWatched:Z

.field private maxDuration:I

.field private prefetchListener:Lcom/auditude/ads/model/smil/Group$PrefetchCompleteListener;

.field private prefetchParCount:I

.field private repackageAssetCount:I

.field private repackageCreatives:Z

.field private repackagerArray:Ljava/util/ArrayList;

.field private sequenceIteratorIndex:I

.field private sequenceList:Ljava/util/ArrayList;

.field private skipCurrentSequence:Z

.field private startTime:I

.field private type:Lcom/auditude/ads/model/smil/SmilElementType;


# direct methods
.method public constructor <init>(Lcom/auditude/ads/model/smil/SmilElementType;ILcom/auditude/ads/core/AdSettings;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-boolean v1, p0, Lcom/auditude/ads/model/smil/Group;->isWatched:Z

    .line 22
    iput v1, p0, Lcom/auditude/ads/model/smil/Group;->maxDuration:I

    .line 23
    iput v1, p0, Lcom/auditude/ads/model/smil/Group;->duration:I

    .line 24
    iput v1, p0, Lcom/auditude/ads/model/smil/Group;->startTime:I

    .line 25
    iput v1, p0, Lcom/auditude/ads/model/smil/Group;->index:I

    .line 26
    const/4 v0, -0x1

    iput v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceIteratorIndex:I

    .line 27
    invoke-static {}, Lcom/auditude/ads/model/smil/SmilElementType;->values()[Lcom/auditude/ads/model/smil/SmilElementType;

    move-result-object v0

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Group;->type:Lcom/auditude/ads/model/smil/SmilElementType;

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    .line 30
    iput-boolean v1, p0, Lcom/auditude/ads/model/smil/Group;->skipCurrentSequence:Z

    .line 31
    iput v1, p0, Lcom/auditude/ads/model/smil/Group;->prefetchParCount:I

    .line 35
    iput-boolean v1, p0, Lcom/auditude/ads/model/smil/Group;->repackageCreatives:Z

    .line 36
    iput v1, p0, Lcom/auditude/ads/model/smil/Group;->repackageAssetCount:I

    .line 43
    iput-object p1, p0, Lcom/auditude/ads/model/smil/Group;->type:Lcom/auditude/ads/model/smil/SmilElementType;

    .line 44
    iput p2, p0, Lcom/auditude/ads/model/smil/Group;->index:I

    .line 45
    iput-object p3, p0, Lcom/auditude/ads/model/smil/Group;->adSettings:Lcom/auditude/ads/core/AdSettings;

    .line 46
    return-void
.end method

.method private notifyPrefetchComplete()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 373
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->prefetchListener:Lcom/auditude/ads/model/smil/Group$PrefetchCompleteListener;

    if-eqz v0, :cond_0

    .line 375
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->prefetchListener:Lcom/auditude/ads/model/smil/Group$PrefetchCompleteListener;

    iget-object v1, p0, Lcom/auditude/ads/model/smil/Group;->adPluginEvents:Ljava/util/ArrayList;

    invoke-interface {v0, v1}, Lcom/auditude/ads/model/smil/Group$PrefetchCompleteListener;->onPrefetchComplete(Ljava/util/ArrayList;)V

    .line 376
    iput-object v2, p0, Lcom/auditude/ads/model/smil/Group;->prefetchListener:Lcom/auditude/ads/model/smil/Group$PrefetchCompleteListener;

    .line 379
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->adPluginEvents:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 381
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->adPluginEvents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 382
    iput-object v2, p0, Lcom/auditude/ads/model/smil/Group;->adPluginEvents:Ljava/util/ArrayList;

    .line 384
    :cond_1
    return-void
.end method

.method private repackageIncompatibleCreatives()V
    .locals 8

    .prologue
    const/4 v6, 0x0

    .line 392
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->type:Lcom/auditude/ads/model/smil/SmilElementType;

    sget-object v1, Lcom/auditude/ads/model/smil/SmilElementType;->LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    if-eq v0, v1, :cond_1

    .line 468
    :cond_0
    :goto_0
    return-void

    .line 397
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Group;->repackagerArray:Ljava/util/ArrayList;

    .line 398
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Group;->getRefs()Ljava/util/ArrayList;

    move-result-object v1

    .line 400
    if-eqz v1, :cond_9

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_9

    .line 403
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->adSettings:Lcom/auditude/ads/core/AdSettings;

    const-string v2, "repackageCreativeEnabled"

    invoke-virtual {v0, v2}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 405
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->adSettings:Lcom/auditude/ads/core/AdSettings;

    const-string v2, "repackageCreativeEnabled"

    invoke-virtual {v0, v2}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 408
    :goto_1
    const-string v3, ""

    .line 409
    iget-object v2, p0, Lcom/auditude/ads/model/smil/Group;->adSettings:Lcom/auditude/ads/core/AdSettings;

    const-string v4, "repackageCreativeFormat"

    invoke-virtual {v2, v4}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 411
    iget-object v2, p0, Lcom/auditude/ads/model/smil/Group;->adSettings:Lcom/auditude/ads/core/AdSettings;

    const-string v3, "repackageCreativeFormat"

    invoke-virtual {v2, v3}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 414
    :cond_2
    invoke-static {v3}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    if-eqz v0, :cond_8

    .line 416
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Group;->repackagerArray:Ljava/util/ArrayList;

    .line 417
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_3
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_4

    .line 446
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->repackagerArray:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_7

    .line 448
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->repackagerArray:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Lcom/auditude/ads/model/smil/Group;->repackageAssetCount:I

    .line 449
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->repackagerArray:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/repackaging/AssetRepackager;

    .line 451
    invoke-virtual {v0}, Lcom/auditude/ads/repackaging/AssetRepackager;->repackage()V

    goto :goto_3

    .line 417
    :cond_4
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Ref;

    .line 419
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Ref;->getPrimaryAsset()Lcom/auditude/ads/model/Asset;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 421
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Ref;->getPrimaryAsset()Lcom/auditude/ads/model/Asset;

    move-result-object v2

    .line 422
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 423
    invoke-virtual {v2}, Lcom/auditude/ads/model/Asset;->getMediaFiles()Ljava/util/ArrayList;

    move-result-object v1

    .line 424
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move-object v1, v0

    :cond_5
    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_6

    .line 438
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {v2}, Lcom/auditude/ads/model/Asset;->getParent()Lcom/auditude/ads/model/BaseElement;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Ad;

    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->isRepackagingEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 440
    new-instance v0, Lcom/auditude/ads/repackaging/AssetRepackager;

    iget-object v1, p0, Lcom/auditude/ads/model/smil/Group;->adSettings:Lcom/auditude/ads/core/AdSettings;

    invoke-virtual {v1}, Lcom/auditude/ads/core/AdSettings;->getDomain()Ljava/lang/String;

    move-result-object v4

    iget-object v1, p0, Lcom/auditude/ads/model/smil/Group;->adSettings:Lcom/auditude/ads/core/AdSettings;

    invoke-virtual {v1}, Lcom/auditude/ads/core/AdSettings;->getZoneId()I

    move-result v5

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/repackaging/AssetRepackager;-><init>(Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;Lcom/auditude/ads/model/Asset;Ljava/lang/String;Ljava/lang/String;I)V

    .line 441
    iget-object v1, p0, Lcom/auditude/ads/model/smil/Group;->repackagerArray:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 424
    :cond_6
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/media/MediaFile;

    .line 426
    if-eqz v0, :cond_5

    .line 428
    iget-object v5, v0, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    invoke-static {v5}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 430
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    iget-object v0, v0, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 432
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    move-object v1, v0

    goto :goto_4

    .line 456
    :cond_7
    invoke-direct {p0}, Lcom/auditude/ads/model/smil/Group;->notifyPrefetchComplete()V

    goto/16 :goto_0

    .line 461
    :cond_8
    invoke-direct {p0}, Lcom/auditude/ads/model/smil/Group;->notifyPrefetchComplete()V

    goto/16 :goto_0

    .line 466
    :cond_9
    invoke-direct {p0}, Lcom/auditude/ads/model/smil/Group;->notifyPrefetchComplete()V

    goto/16 :goto_0

    :cond_a
    move v0, v6

    goto/16 :goto_1
.end method


# virtual methods
.method public final addSequence(Lcom/auditude/ads/model/smil/Sequence;)V
    .locals 2

    .prologue
    .line 186
    if-eqz p1, :cond_1

    .line 188
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 189
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Sequence;->getMaxDuration()I

    move-result v0

    if-ltz v0, :cond_0

    .line 191
    iget v0, p0, Lcom/auditude/ads/model/smil/Group;->maxDuration:I

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Sequence;->getMaxDuration()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/auditude/ads/model/smil/Group;->maxDuration:I

    .line 193
    :cond_0
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Sequence;->getDuration()I

    move-result v0

    if-ltz v0, :cond_1

    .line 195
    iget v0, p0, Lcom/auditude/ads/model/smil/Group;->duration:I

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Sequence;->getDuration()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/auditude/ads/model/smil/Group;->duration:I

    .line 198
    :cond_1
    return-void
.end method

.method public final begin()V
    .locals 1

    .prologue
    .line 134
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Group;->reset()V

    .line 136
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/auditude/ads/model/smil/Group;->isWatched:Z

    .line 137
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/model/smil/Group;->skipCurrentSequence:Z

    .line 138
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    .line 139
    return-void
.end method

.method public final dispose()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 503
    iput-object v2, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    .line 505
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 509
    iput-object v2, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    .line 510
    return-void

    .line 505
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Sequence;

    .line 507
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->dispose()V

    goto :goto_0
.end method

.method public final end()V
    .locals 1

    .prologue
    .line 143
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/auditude/ads/model/smil/Group;->end(Z)V

    .line 144
    return-void
.end method

.method public final end(Z)V
    .locals 1

    .prologue
    .line 149
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/auditude/ads/model/smil/Group;->isWatched:Z

    .line 150
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/model/smil/Group;->skipCurrentSequence:Z

    .line 152
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    if-eqz v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    invoke-virtual {v0, p1}, Lcom/auditude/ads/model/smil/Sequence;->end(Z)V

    .line 155
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    .line 157
    :cond_0
    return-void
.end method

.method public final getCurrent()Lcom/auditude/ads/model/smil/Par;
    .locals 1

    .prologue
    .line 223
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    if-eqz v0, :cond_0

    .line 225
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->getCurrent()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    .line 228
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic getCurrent()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Group;->getCurrent()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    return-object v0
.end method

.method public final getDescription()Ljava/util/HashMap;
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 113
    .line 115
    iget-object v1, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v0

    move v2, v0

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 122
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 123
    const-string v3, "startTime"

    iget v4, p0, Lcom/auditude/ads/model/smil/Group;->startTime:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    const-string v3, "isEmpty"

    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Group;->isEmpty()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    const-string v3, "breakDuration"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    const-string v2, "breakIndex"

    iget v3, p0, Lcom/auditude/ads/model/smil/Group;->index:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    const-string v2, "adCount"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    return-object v0

    .line 115
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Sequence;

    .line 117
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->getPlayableMetrics()Ljava/util/HashMap;

    move-result-object v4

    .line 118
    sget-object v0, Lcom/auditude/ads/model/smil/Sequence;->PLAYABLE_DURATION:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr v2, v0

    .line 119
    sget-object v0, Lcom/auditude/ads/model/smil/Sequence;->PLAYABLE_AD_COUNT:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0
.end method

.method public final getDuration()I
    .locals 1

    .prologue
    .line 83
    iget v0, p0, Lcom/auditude/ads/model/smil/Group;->duration:I

    return v0
.end method

.method public final getIndex()I
    .locals 1

    .prologue
    .line 55
    iget v0, p0, Lcom/auditude/ads/model/smil/Group;->index:I

    return v0
.end method

.method public final getMaxDuration()I
    .locals 1

    .prologue
    .line 88
    iget v0, p0, Lcom/auditude/ads/model/smil/Group;->maxDuration:I

    return v0
.end method

.method public final getNext()Lcom/auditude/ads/model/smil/Par;
    .locals 2

    .prologue
    .line 233
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    .line 234
    if-eqz v0, :cond_1

    .line 236
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->getNext()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    .line 237
    if-eqz v0, :cond_1

    .line 257
    :cond_0
    :goto_0
    return-object v0

    .line 243
    :cond_1
    iget v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceIteratorIndex:I

    add-int/lit8 v0, v0, 0x1

    move v1, v0

    .line 245
    :goto_1
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v1, v0, :cond_2

    .line 257
    const/4 v0, 0x0

    goto :goto_0

    .line 247
    :cond_2
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Sequence;

    .line 248
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->getNext()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    .line 249
    if-nez v0, :cond_0

    .line 254
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1
.end method

.method public final getPars()Ljava/util/ArrayList;
    .locals 3

    .prologue
    .line 303
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 304
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 306
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v1, v0, :cond_1

    .line 312
    :cond_0
    return-object v2

    .line 308
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Sequence;

    .line 309
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->getPars()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 306
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0
.end method

.method public final getPlayableDuration()I
    .locals 4

    .prologue
    .line 102
    const/4 v0, 0x0

    .line 103
    iget-object v1, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 108
    return v1

    .line 103
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Sequence;

    .line 105
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->getPlayableMetrics()Ljava/util/HashMap;

    move-result-object v0

    .line 106
    sget-object v3, Lcom/auditude/ads/model/smil/Sequence;->PLAYABLE_DURATION:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0
.end method

.method public final getRefs()Ljava/util/ArrayList;
    .locals 4

    .prologue
    .line 202
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 205
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 218
    return-object v1

    .line 205
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Sequence;

    .line 208
    if-eqz v0, :cond_0

    .line 210
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->getRefs()Ljava/util/ArrayList;

    move-result-object v0

    .line 211
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 213
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0
.end method

.method public final getSequenceList()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public final getSkipCurrentSequence()Z
    .locals 1

    .prologue
    .line 93
    iget-boolean v0, p0, Lcom/auditude/ads/model/smil/Group;->skipCurrentSequence:Z

    return v0
.end method

.method public final getStartTime()I
    .locals 1

    .prologue
    .line 74
    iget v0, p0, Lcom/auditude/ads/model/smil/Group;->startTime:I

    return v0
.end method

.method public final getType()Lcom/auditude/ads/model/smil/SmilElementType;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->type:Lcom/auditude/ads/model/smil/SmilElementType;

    return-object v0
.end method

.method public final isEmpty()Z
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 161
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    move v2, v3

    .line 176
    :cond_0
    :goto_0
    return v2

    :cond_1
    move v1, v2

    .line 167
    :goto_1
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v1, v0, :cond_2

    move v2, v3

    .line 176
    goto :goto_0

    .line 169
    :cond_2
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Sequence;

    .line 170
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 167
    :cond_3
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1
.end method

.method public final isLinear()Z
    .locals 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->type:Lcom/auditude/ads/model/smil/SmilElementType;

    sget-object v1, Lcom/auditude/ads/model/smil/SmilElementType;->LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isWatched()Z
    .locals 1

    .prologue
    .line 65
    iget-boolean v0, p0, Lcom/auditude/ads/model/smil/Group;->isWatched:Z

    return v0
.end method

.method public final load(Lcom/auditude/ads/model/smil/Group$PrefetchCompleteListener;Ljava/lang/Boolean;Ljava/util/HashMap;)V
    .locals 3

    .prologue
    .line 326
    iput-object p1, p0, Lcom/auditude/ads/model/smil/Group;->prefetchListener:Lcom/auditude/ads/model/smil/Group$PrefetchCompleteListener;

    .line 327
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/auditude/ads/model/smil/Group;->repackageCreatives:Z

    .line 329
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Group;->getPars()Ljava/util/ArrayList;

    move-result-object v0

    .line 330
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    iput v1, p0, Lcom/auditude/ads/model/smil/Group;->prefetchParCount:I

    .line 331
    iget v1, p0, Lcom/auditude/ads/model/smil/Group;->prefetchParCount:I

    if-lez v1, :cond_1

    .line 333
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 344
    :goto_1
    return-void

    .line 333
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Par;

    .line 335
    const-string v2, "error"

    invoke-virtual {v0, v2, p0}, Lcom/auditude/ads/model/smil/Par;->addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 336
    invoke-virtual {v0, p0}, Lcom/auditude/ads/model/smil/Par;->setParResolutionCompleteListener(Lcom/auditude/ads/model/smil/Par$ParResoultionCompleteListener;)V

    .line 337
    invoke-virtual {v0, p3}, Lcom/auditude/ads/model/smil/Par;->resolve(Ljava/util/HashMap;)V

    goto :goto_0

    .line 342
    :cond_1
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Group;->onParResolutionComplete()V

    goto :goto_1
.end method

.method public final load(Lcom/auditude/ads/model/smil/Group$PrefetchCompleteListener;Ljava/util/HashMap;)V
    .locals 1

    .prologue
    .line 321
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, p1, v0, p2}, Lcom/auditude/ads/model/smil/Group;->load(Lcom/auditude/ads/model/smil/Group$PrefetchCompleteListener;Ljava/lang/Boolean;Ljava/util/HashMap;)V

    .line 322
    return-void
.end method

.method public final moveNext()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 262
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    if-eqz v0, :cond_1

    .line 264
    iget-boolean v0, p0, Lcom/auditude/ads/model/smil/Group;->skipCurrentSequence:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->moveNext()Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    .line 298
    :goto_0
    return v0

    .line 269
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->getType()Lcom/auditude/ads/model/smil/SmilElementType;

    move-result-object v0

    sget-object v3, Lcom/auditude/ads/model/smil/SmilElementType;->LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    if-ne v0, v3, :cond_1

    .line 271
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/smil/Sequence;->end(Z)V

    .line 272
    iput-object v4, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    .line 276
    :cond_1
    iput-boolean v2, p0, Lcom/auditude/ads/model/smil/Group;->skipCurrentSequence:Z

    .line 278
    iget v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceIteratorIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceIteratorIndex:I

    .line 280
    :goto_1
    iget v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceIteratorIndex:I

    iget-object v3, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v0, v3, :cond_2

    move v0, v2

    .line 298
    goto :goto_0

    .line 282
    :cond_2
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    iget v3, p0, Lcom/auditude/ads/model/smil/Group;->sequenceIteratorIndex:I

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Sequence;

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    .line 283
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->begin()V

    .line 285
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->moveNext()Z

    move-result v0

    if-eqz v0, :cond_3

    move v0, v1

    .line 287
    goto :goto_0

    .line 289
    :cond_3
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->getType()Lcom/auditude/ads/model/smil/SmilElementType;

    move-result-object v0

    sget-object v3, Lcom/auditude/ads/model/smil/SmilElementType;->LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    if-ne v0, v3, :cond_4

    .line 291
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/smil/Sequence;->end(Z)V

    .line 292
    iput-object v4, p0, Lcom/auditude/ads/model/smil/Group;->currentSequence:Lcom/auditude/ads/model/smil/Sequence;

    .line 295
    :cond_4
    iget v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceIteratorIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceIteratorIndex:I

    goto :goto_1
.end method

.method public onEvent(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .prologue
    .line 348
    instance-of v0, p2, Lcom/auditude/ads/event/AdPluginEvent;

    if-eqz v0, :cond_1

    .line 350
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->adPluginEvents:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Group;->adPluginEvents:Ljava/util/ArrayList;

    .line 351
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->adPluginEvents:Ljava/util/ArrayList;

    check-cast p2, Lcom/auditude/ads/event/AdPluginEvent;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 353
    :cond_1
    return-void
.end method

.method public onParResolutionComplete()V
    .locals 1

    .prologue
    .line 357
    iget v0, p0, Lcom/auditude/ads/model/smil/Group;->prefetchParCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/auditude/ads/model/smil/Group;->prefetchParCount:I

    .line 358
    iget v0, p0, Lcom/auditude/ads/model/smil/Group;->prefetchParCount:I

    if-gtz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->prefetchListener:Lcom/auditude/ads/model/smil/Group$PrefetchCompleteListener;

    if-eqz v0, :cond_0

    .line 360
    iget-boolean v0, p0, Lcom/auditude/ads/model/smil/Group;->repackageCreatives:Z

    if-eqz v0, :cond_1

    .line 362
    invoke-direct {p0}, Lcom/auditude/ads/model/smil/Group;->repackageIncompatibleCreatives()V

    .line 369
    :cond_0
    :goto_0
    return-void

    .line 366
    :cond_1
    invoke-direct {p0}, Lcom/auditude/ads/model/smil/Group;->notifyPrefetchComplete()V

    goto :goto_0
.end method

.method public onRepackagingComplete(Lcom/auditude/ads/model/Asset;Z)V
    .locals 1

    .prologue
    .line 472
    iget v0, p0, Lcom/auditude/ads/model/smil/Group;->repackageAssetCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/auditude/ads/model/smil/Group;->repackageAssetCount:I

    .line 474
    iget v0, p0, Lcom/auditude/ads/model/smil/Group;->repackageAssetCount:I

    if-gtz v0, :cond_0

    .line 476
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Group;->repackagerArray:Ljava/util/ArrayList;

    .line 477
    invoke-direct {p0}, Lcom/auditude/ads/model/smil/Group;->notifyPrefetchComplete()V

    .line 479
    :cond_0
    return-void
.end method

.method public final reset()V
    .locals 2

    .prologue
    .line 488
    const/4 v0, -0x1

    iput v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceIteratorIndex:I

    .line 491
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v1, v0, :cond_0

    .line 499
    return-void

    .line 493
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Group;->sequenceList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Sequence;

    .line 494
    if-eqz v0, :cond_1

    .line 496
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->reset()V

    .line 491
    :cond_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0
.end method

.method public final setSkipCurrentSequence(Z)V
    .locals 0

    .prologue
    .line 97
    iput-boolean p1, p0, Lcom/auditude/ads/model/smil/Group;->skipCurrentSequence:Z

    .line 98
    return-void
.end method

.method public final setStartTime(I)V
    .locals 0

    .prologue
    .line 78
    iput p1, p0, Lcom/auditude/ads/model/smil/Group;->startTime:I

    .line 79
    return-void
.end method

.method public final setWatched(Z)V
    .locals 0

    .prologue
    .line 69
    iput-boolean p1, p0, Lcom/auditude/ads/model/smil/Group;->isWatched:Z

    .line 70
    return-void
.end method
