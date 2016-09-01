.class public Lcom/auditude/ads/model/smil/Par;
.super Lcom/auditude/ads/util/event/EventDispatcher;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/model/smil/ISMILIterator;
.implements Lcom/auditude/ads/util/event/IEventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/auditude/ads/model/smil/Par$ParResoultionCompleteListener;
    }
.end annotation


# instance fields
.field private enumeratorIndex:I

.field private isResolved:Z

.field private networkAdLoader:Lcom/auditude/ads/network/INetworkAdLoader;

.field private parListener:Lcom/auditude/ads/model/smil/Par$ParResoultionCompleteListener;

.field private priority:I

.field private refList:Ljava/util/ArrayList;

.field private sequence:Lcom/auditude/ads/model/smil/Sequence;

.field private state:Ljava/util/HashMap;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/auditude/ads/model/smil/Par;-><init>(Lcom/auditude/ads/model/smil/Sequence;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Lcom/auditude/ads/model/smil/Sequence;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 34
    invoke-direct {p0}, Lcom/auditude/ads/util/event/EventDispatcher;-><init>()V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Par;->refList:Ljava/util/ArrayList;

    .line 23
    iput v1, p0, Lcom/auditude/ads/model/smil/Par;->priority:I

    .line 24
    iput-boolean v1, p0, Lcom/auditude/ads/model/smil/Par;->isResolved:Z

    .line 27
    const/4 v0, -0x1

    iput v0, p0, Lcom/auditude/ads/model/smil/Par;->enumeratorIndex:I

    .line 36
    iput-object p1, p0, Lcom/auditude/ads/model/smil/Par;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    .line 37
    return-void
.end method

.method private notifyResolutionComplete()V
    .locals 1

    .prologue
    .line 278
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/auditude/ads/model/smil/Par;->isResolved:Z

    .line 280
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->parListener:Lcom/auditude/ads/model/smil/Par$ParResoultionCompleteListener;

    if-eqz v0, :cond_0

    .line 282
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->parListener:Lcom/auditude/ads/model/smil/Par$ParResoultionCompleteListener;

    invoke-interface {v0}, Lcom/auditude/ads/model/smil/Par$ParResoultionCompleteListener;->onParResolutionComplete()V

    .line 284
    :cond_0
    return-void
.end method


# virtual methods
.method public final addRef(Lcom/auditude/ads/model/smil/Ref;)V
    .locals 1

    .prologue
    .line 89
    if-eqz p1, :cond_0

    .line 91
    invoke-virtual {p1, p0}, Lcom/auditude/ads/model/smil/Ref;->setPar(Lcom/auditude/ads/model/smil/Par;)V

    .line 92
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 94
    :cond_0
    return-void
.end method

.method public final addState(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 61
    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p2}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 63
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->state:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 65
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Par;->state:Ljava/util/HashMap;

    .line 68
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->state:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    :cond_1
    return-void
.end method

.method public final dispose()V
    .locals 2

    .prologue
    .line 288
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 292
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Par;->refList:Ljava/util/ArrayList;

    .line 293
    return-void

    .line 288
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Ref;

    .line 290
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Ref;->dispose()V

    goto :goto_0
.end method

.method public final getCurrent()Lcom/auditude/ads/model/smil/Ref;
    .locals 2

    .prologue
    .line 98
    iget v0, p0, Lcom/auditude/ads/model/smil/Par;->enumeratorIndex:I

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/auditude/ads/model/smil/Par;->enumeratorIndex:I

    iget-object v1, p0, Lcom/auditude/ads/model/smil/Par;->refList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_1

    .line 100
    :cond_0
    const/4 v0, 0x0

    .line 103
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->refList:Ljava/util/ArrayList;

    iget v1, p0, Lcom/auditude/ads/model/smil/Par;->enumeratorIndex:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Ref;

    goto :goto_0
.end method

.method public bridge synthetic getCurrent()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Par;->getCurrent()Lcom/auditude/ads/model/smil/Ref;

    move-result-object v0

    return-object v0
.end method

.method public final getNext()Lcom/auditude/ads/model/smil/Ref;
    .locals 2

    .prologue
    .line 108
    iget v0, p0, Lcom/auditude/ads/model/smil/Par;->enumeratorIndex:I

    add-int/lit8 v0, v0, 0x1

    .line 110
    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/auditude/ads/model/smil/Par;->refList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/auditude/ads/model/smil/Par;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Sequence;->hasAvailableSlot()Z

    move-result v1

    if-nez v1, :cond_1

    .line 112
    :cond_0
    const/4 v0, 0x0

    .line 115
    :goto_0
    return-object v0

    :cond_1
    iget-object v1, p0, Lcom/auditude/ads/model/smil/Par;->refList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Ref;

    goto :goto_0
.end method

.method public final getPrimaryAd()Lcom/auditude/ads/model/Ad;
    .locals 2

    .prologue
    .line 78
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 80
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->refList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Ref;

    .line 81
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Ref;->getAd()Lcom/auditude/ads/model/Ad;

    move-result-object v0

    .line 84
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getPriority()I
    .locals 1

    .prologue
    .line 53
    iget v0, p0, Lcom/auditude/ads/model/smil/Par;->priority:I

    return v0
.end method

.method public final getRefList()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->refList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public final getSequence()Lcom/auditude/ads/model/smil/Sequence;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    return-object v0
.end method

.method public final getState()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->state:Ljava/util/HashMap;

    return-object v0
.end method

.method public final getType()Lcom/auditude/ads/model/smil/SmilElementType;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->getType()Lcom/auditude/ads/model/smil/SmilElementType;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/auditude/ads/model/smil/SmilElementType;->UNKNOWN:Lcom/auditude/ads/model/smil/SmilElementType;

    goto :goto_0
.end method

.method public final isResolved()Z
    .locals 1

    .prologue
    .line 72
    iget-boolean v0, p0, Lcom/auditude/ads/model/smil/Par;->isResolved:Z

    return v0
.end method

.method public final moveNext()Z
    .locals 2

    .prologue
    .line 120
    iget v0, p0, Lcom/auditude/ads/model/smil/Par;->enumeratorIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/auditude/ads/model/smil/Par;->enumeratorIndex:I

    .line 123
    iget v0, p0, Lcom/auditude/ads/model/smil/Par;->enumeratorIndex:I

    iget-object v1, p0, Lcom/auditude/ads/model/smil/Par;->refList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 125
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->hasAvailableSlot()Z

    move-result v0

    .line 128
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onEvent(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 7

    .prologue
    const/4 v1, 0x0

    .line 205
    const-string v0, "error"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 207
    instance-of v0, p2, Lcom/auditude/ads/event/AdPluginEvent;

    if-eqz v0, :cond_0

    .line 209
    invoke-virtual {p0, p1, p2}, Lcom/auditude/ads/model/smil/Par;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 274
    :cond_0
    :goto_0
    return-void

    .line 214
    :cond_1
    const-string v0, "complete"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 218
    instance-of v0, p2, Lcom/auditude/ads/util/event/Event;

    if-eqz v0, :cond_9

    move-object v0, p2

    check-cast v0, Lcom/auditude/ads/util/event/Event;

    invoke-virtual {v0}, Lcom/auditude/ads/util/event/Event;->getOwner()Lcom/auditude/ads/util/event/IEventDispatcher;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/network/INetworkAdLoader;

    if-eqz v0, :cond_9

    .line 220
    check-cast p2, Lcom/auditude/ads/util/event/Event;

    invoke-virtual {p2}, Lcom/auditude/ads/util/event/Event;->getOwner()Lcom/auditude/ads/util/event/IEventDispatcher;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/INetworkAdLoader;

    .line 221
    invoke-interface {v0}, Lcom/auditude/ads/network/INetworkAdLoader;->getAd()Lcom/auditude/ads/model/Ad;

    move-result-object v2

    .line 224
    :goto_1
    if-eqz v2, :cond_2

    .line 226
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/auditude/ads/model/smil/Par;->refList:Ljava/util/ArrayList;

    .line 227
    invoke-interface {v0}, Lcom/auditude/ads/network/INetworkAdLoader;->getResult()Ljava/lang/Object;

    move-result-object v0

    .line 228
    if-eqz v0, :cond_8

    instance-of v3, v0, Ljava/util/ArrayList;

    if-eqz v3, :cond_8

    .line 231
    check-cast v0, Ljava/util/ArrayList;

    .line 232
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_3

    .line 273
    :cond_2
    :goto_3
    invoke-direct {p0}, Lcom/auditude/ads/model/smil/Par;->notifyResolutionComplete()V

    goto :goto_0

    .line 232
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 234
    new-instance v3, Lcom/auditude/ads/model/smil/Ref;

    invoke-direct {v3, p0}, Lcom/auditude/ads/model/smil/Ref;-><init>(Lcom/auditude/ads/model/smil/Par;)V

    .line 235
    invoke-virtual {v3, v2}, Lcom/auditude/ads/model/smil/Ref;->setAd(Lcom/auditude/ads/model/Ad;)V

    .line 237
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 238
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_5

    .line 240
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_4
    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_6

    .line 259
    :cond_5
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/auditude/ads/model/Asset;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/auditude/ads/model/Asset;

    invoke-virtual {v3, v0}, Lcom/auditude/ads/model/smil/Ref;->setAssets([Lcom/auditude/ads/model/Asset;)V

    .line 260
    invoke-virtual {p0, v3}, Lcom/auditude/ads/model/smil/Par;->addRef(Lcom/auditude/ads/model/smil/Ref;)V

    goto :goto_2

    .line 240
    :cond_6
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Asset;

    .line 242
    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/auditude/ads/model/Ad;->getTrackingAssetByType(Ljava/lang/String;)Lcom/auditude/ads/model/Asset;

    move-result-object v6

    .line 243
    if-eqz v6, :cond_7

    .line 245
    invoke-virtual {v6}, Lcom/auditude/ads/model/Asset;->Reset()V

    .line 246
    invoke-virtual {v6, v0}, Lcom/auditude/ads/model/Asset;->CopyTo(Lcom/auditude/ads/model/Asset;)V

    .line 249
    :cond_7
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 252
    instance-of v6, v0, Lcom/auditude/ads/model/OnPageAsset;

    if-eqz v6, :cond_4

    .line 254
    invoke-static {v4, v0}, Lcom/auditude/ads/model/Ad;->consolidateOnPageAsset(Ljava/util/ArrayList;Lcom/auditude/ads/model/Asset;)V

    goto :goto_4

    .line 266
    :cond_8
    new-instance v0, Lcom/auditude/ads/model/smil/Ref;

    invoke-direct {v0, p0}, Lcom/auditude/ads/model/smil/Ref;-><init>(Lcom/auditude/ads/model/smil/Par;)V

    .line 267
    invoke-virtual {v0, v2}, Lcom/auditude/ads/model/smil/Ref;->setAd(Lcom/auditude/ads/model/Ad;)V

    .line 268
    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/smil/Ref;->setAssets([Lcom/auditude/ads/model/Asset;)V

    .line 269
    invoke-virtual {p0, v0}, Lcom/auditude/ads/model/smil/Par;->addRef(Lcom/auditude/ads/model/smil/Ref;)V

    goto :goto_3

    :cond_9
    move-object v0, v1

    move-object v2, v1

    goto/16 :goto_1
.end method

.method public final reset()V
    .locals 1

    .prologue
    .line 133
    const/4 v0, -0x1

    iput v0, p0, Lcom/auditude/ads/model/smil/Par;->enumeratorIndex:I

    .line 134
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/model/smil/Par;->isResolved:Z

    .line 135
    return-void
.end method

.method public final resetAds()V
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 139
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 157
    return-void

    .line 139
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Ref;

    .line 142
    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/smil/Ref;->setWatched(Z)V

    .line 145
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Ref;->getAssets()[Lcom/auditude/ads/model/Asset;

    move-result-object v3

    .line 146
    if-eqz v3, :cond_0

    array-length v0, v3

    if-lez v0, :cond_0

    .line 148
    array-length v4, v3

    move v0, v1

    :goto_0
    if-ge v0, v4, :cond_0

    aget-object v5, v3, v0

    .line 150
    if-eqz v5, :cond_2

    .line 152
    invoke-virtual {v5}, Lcom/auditude/ads/model/Asset;->Reset()V

    .line 148
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public final resolve(Ljava/util/HashMap;)V
    .locals 3

    .prologue
    .line 161
    iget-boolean v0, p0, Lcom/auditude/ads/model/smil/Par;->isResolved:Z

    if-eqz v0, :cond_0

    .line 163
    invoke-direct {p0}, Lcom/auditude/ads/model/smil/Par;->notifyResolutionComplete()V

    .line 201
    :goto_0
    return-void

    .line 167
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 169
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->refList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Ref;

    .line 170
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Ref;->getAd()Lcom/auditude/ads/model/Ad;

    move-result-object v0

    .line 172
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->getIsNetworkAd()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 175
    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->getNetworkAdType()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/auditude/ads/network/NetworkAdLoaderFactory;->getLoaderForType(Ljava/lang/String;)Lcom/auditude/ads/network/INetworkAdLoader;

    move-result-object v1

    iput-object v1, p0, Lcom/auditude/ads/model/smil/Par;->networkAdLoader:Lcom/auditude/ads/network/INetworkAdLoader;

    .line 177
    iget-object v1, p0, Lcom/auditude/ads/model/smil/Par;->networkAdLoader:Lcom/auditude/ads/network/INetworkAdLoader;

    if-eqz v1, :cond_1

    .line 179
    iget-object v1, p0, Lcom/auditude/ads/model/smil/Par;->networkAdLoader:Lcom/auditude/ads/network/INetworkAdLoader;

    const-string v2, "error"

    invoke-interface {v1, v2, p0}, Lcom/auditude/ads/network/INetworkAdLoader;->addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 180
    iget-object v1, p0, Lcom/auditude/ads/model/smil/Par;->networkAdLoader:Lcom/auditude/ads/network/INetworkAdLoader;

    const-string v2, "complete"

    invoke-interface {v1, v2, p0}, Lcom/auditude/ads/network/INetworkAdLoader;->addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 181
    iget-object v1, p0, Lcom/auditude/ads/model/smil/Par;->networkAdLoader:Lcom/auditude/ads/network/INetworkAdLoader;

    invoke-interface {v1, p1}, Lcom/auditude/ads/network/INetworkAdLoader;->setCustomParams(Ljava/util/HashMap;)V

    .line 182
    iget-object v1, p0, Lcom/auditude/ads/model/smil/Par;->networkAdLoader:Lcom/auditude/ads/network/INetworkAdLoader;

    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->getNetworkAdSource()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/auditude/ads/network/INetworkAdLoader;->setSource(Ljava/lang/Object;)V

    .line 183
    iget-object v1, p0, Lcom/auditude/ads/model/smil/Par;->networkAdLoader:Lcom/auditude/ads/network/INetworkAdLoader;

    invoke-interface {v1, v0}, Lcom/auditude/ads/network/INetworkAdLoader;->setAd(Lcom/auditude/ads/model/Ad;)V

    .line 184
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Par;->networkAdLoader:Lcom/auditude/ads/network/INetworkAdLoader;

    invoke-interface {v0}, Lcom/auditude/ads/network/INetworkAdLoader;->load()V

    goto :goto_0

    .line 188
    :cond_1
    invoke-direct {p0}, Lcom/auditude/ads/model/smil/Par;->notifyResolutionComplete()V

    goto :goto_0

    .line 193
    :cond_2
    invoke-direct {p0}, Lcom/auditude/ads/model/smil/Par;->notifyResolutionComplete()V

    goto :goto_0

    .line 199
    :cond_3
    invoke-direct {p0}, Lcom/auditude/ads/model/smil/Par;->notifyResolutionComplete()V

    goto :goto_0
.end method

.method public setParResolutionCompleteListener(Lcom/auditude/ads/model/smil/Par$ParResoultionCompleteListener;)V
    .locals 0

    .prologue
    .line 46
    iput-object p1, p0, Lcom/auditude/ads/model/smil/Par;->parListener:Lcom/auditude/ads/model/smil/Par$ParResoultionCompleteListener;

    .line 47
    return-void
.end method

.method public final setPriority(I)V
    .locals 0

    .prologue
    .line 55
    iput p1, p0, Lcom/auditude/ads/model/smil/Par;->priority:I

    return-void
.end method

.method public setSequence(Lcom/auditude/ads/model/smil/Sequence;)V
    .locals 0

    .prologue
    .line 51
    iput-object p1, p0, Lcom/auditude/ads/model/smil/Par;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    return-void
.end method
