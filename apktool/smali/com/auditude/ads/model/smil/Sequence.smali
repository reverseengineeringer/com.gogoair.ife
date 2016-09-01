.class public Lcom/auditude/ads/model/smil/Sequence;
.super Lcom/auditude/ads/model/BaseElement;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/model/smil/ISMILIterator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/auditude/ads/model/smil/Sequence$RefIterator;
    }
.end annotation


# static fields
.field public static PLAYABLE_AD_COUNT:Ljava/lang/String;

.field public static PLAYABLE_DURATION:Ljava/lang/String;

.field public static PLAYABLE_REFS:Ljava/lang/String;


# instance fields
.field private count:I

.field private creativeMaxDuration:I

.field private duration:I

.field private enumeratorIndex:I

.field private isWatched:Z

.field private maxCount:I

.field private maxDuration:I

.field private pars:Ljava/util/ArrayList;

.field private submissionId:Ljava/lang/String;

.field private type:Lcom/auditude/ads/model/smil/SmilElementType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-string v0, "playableDuration"

    sput-object v0, Lcom/auditude/ads/model/smil/Sequence;->PLAYABLE_DURATION:Ljava/lang/String;

    .line 32
    const-string v0, "playableAdCount"

    sput-object v0, Lcom/auditude/ads/model/smil/Sequence;->PLAYABLE_AD_COUNT:Ljava/lang/String;

    .line 33
    const-string v0, "playableRefs"

    sput-object v0, Lcom/auditude/ads/model/smil/Sequence;->PLAYABLE_REFS:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/SmilElementType;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 37
    invoke-direct {p0, p1}, Lcom/auditude/ads/model/BaseElement;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 19
    invoke-static {}, Lcom/auditude/ads/model/smil/SmilElementType;->values()[Lcom/auditude/ads/model/smil/SmilElementType;

    move-result-object v0

    aget-object v0, v0, v2

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Sequence;->type:Lcom/auditude/ads/model/smil/SmilElementType;

    .line 20
    iput v1, p0, Lcom/auditude/ads/model/smil/Sequence;->maxDuration:I

    .line 21
    iput v1, p0, Lcom/auditude/ads/model/smil/Sequence;->duration:I

    .line 22
    iput v1, p0, Lcom/auditude/ads/model/smil/Sequence;->maxCount:I

    .line 23
    iput v1, p0, Lcom/auditude/ads/model/smil/Sequence;->count:I

    .line 24
    iput v1, p0, Lcom/auditude/ads/model/smil/Sequence;->creativeMaxDuration:I

    .line 25
    iput-boolean v2, p0, Lcom/auditude/ads/model/smil/Sequence;->isWatched:Z

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Sequence;->pars:Ljava/util/ArrayList;

    .line 29
    iput v1, p0, Lcom/auditude/ads/model/smil/Sequence;->enumeratorIndex:I

    .line 38
    iput-object p2, p0, Lcom/auditude/ads/model/smil/Sequence;->type:Lcom/auditude/ads/model/smil/SmilElementType;

    .line 39
    return-void
.end method

.method private prioritizePars()V
    .locals 0

    .prologue
    .line 314
    return-void
.end method

.method private resetAds()V
    .locals 2

    .prologue
    .line 305
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Sequence;->pars:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 309
    return-void

    .line 305
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Par;

    .line 307
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->resetAds()V

    goto :goto_0
.end method


# virtual methods
.method public final addPar(Lcom/auditude/ads/model/smil/Par;)V
    .locals 1

    .prologue
    .line 250
    if-eqz p1, :cond_0

    .line 252
    invoke-virtual {p1, p0}, Lcom/auditude/ads/model/smil/Par;->setSequence(Lcom/auditude/ads/model/smil/Sequence;)V

    .line 253
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Sequence;->pars:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 255
    :cond_0
    return-void
.end method

.method public final addState(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 79
    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p2}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 81
    invoke-super {p0}, Lcom/auditude/ads/model/BaseElement;->getState()Ljava/util/HashMap;

    move-result-object v0

    .line 82
    if-nez v0, :cond_0

    .line 84
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 86
    :cond_0
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    invoke-super {p0, v0}, Lcom/auditude/ads/model/BaseElement;->setState(Ljava/util/HashMap;)V

    .line 89
    :cond_1
    return-void
.end method

.method public final begin()V
    .locals 8

    .prologue
    .line 186
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/auditude/ads/model/smil/Sequence;->isWatched:Z

    .line 193
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->isLinear()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 195
    invoke-direct {p0}, Lcom/auditude/ads/model/smil/Sequence;->resetAds()V

    .line 198
    :cond_0
    invoke-direct {p0}, Lcom/auditude/ads/model/smil/Sequence;->prioritizePars()V

    .line 203
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAPI()Lcom/auditude/ads/core/APIBridge;

    move-result-object v6

    const-string v7, "smilEvent"

    .line 204
    new-instance v0, Lcom/auditude/ads/event/SMILEvent;

    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/core/AuditudeEnv;->getAPI()Lcom/auditude/ads/core/APIBridge;

    move-result-object v1

    sget-object v2, Lcom/auditude/ads/event/SMILEvent$SMILEventType;->SEQUENCE_BEGIN:Lcom/auditude/ads/event/SMILEvent$SMILEventType;

    const/4 v4, 0x0

    .line 205
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->shouldAdvanceAdPatternOnBegin()Z

    move-result v5

    move-object v3, p0

    .line 204
    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/event/SMILEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/event/SMILEvent$SMILEventType;Lcom/auditude/ads/model/smil/Sequence;Lcom/auditude/ads/model/smil/Par;Z)V

    .line 203
    invoke-virtual {v6, v7, v0}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 206
    return-void
.end method

.method public final dispose()V
    .locals 2

    .prologue
    .line 318
    invoke-super {p0}, Lcom/auditude/ads/model/BaseElement;->dispose()V

    .line 320
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Sequence;->pars:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 324
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/model/smil/Sequence;->pars:Ljava/util/ArrayList;

    .line 325
    return-void

    .line 320
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Par;

    .line 322
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->dispose()V

    goto :goto_0
.end method

.method public final end(Z)V
    .locals 8

    .prologue
    .line 211
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/auditude/ads/model/smil/Sequence;->isWatched:Z

    .line 214
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAPI()Lcom/auditude/ads/core/APIBridge;

    move-result-object v6

    const-string v7, "smilEvent"

    .line 215
    new-instance v0, Lcom/auditude/ads/event/SMILEvent;

    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/core/AuditudeEnv;->getAPI()Lcom/auditude/ads/core/APIBridge;

    move-result-object v1

    sget-object v2, Lcom/auditude/ads/event/SMILEvent$SMILEventType;->SEQUENCE_END:Lcom/auditude/ads/event/SMILEvent$SMILEventType;

    const/4 v4, 0x0

    .line 216
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->shouldAdvanceAdPatternOnEnd()Z

    move-result v5

    :goto_0
    move-object v3, p0

    .line 215
    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/event/SMILEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/event/SMILEvent$SMILEventType;Lcom/auditude/ads/model/smil/Sequence;Lcom/auditude/ads/model/smil/Par;Z)V

    .line 214
    invoke-virtual {v6, v7, v0}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 217
    return-void

    .line 216
    :cond_0
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public final getCount()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lcom/auditude/ads/model/smil/Sequence;->count:I

    return v0
.end method

.method public final getCreativeMaxDuration()I
    .locals 1

    .prologue
    .line 71
    iget v0, p0, Lcom/auditude/ads/model/smil/Sequence;->creativeMaxDuration:I

    return v0
.end method

.method public final getCurrent()Lcom/auditude/ads/model/smil/Par;
    .locals 2

    .prologue
    .line 259
    iget v0, p0, Lcom/auditude/ads/model/smil/Sequence;->enumeratorIndex:I

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/auditude/ads/model/smil/Sequence;->enumeratorIndex:I

    iget-object v1, p0, Lcom/auditude/ads/model/smil/Sequence;->pars:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_1

    .line 261
    :cond_0
    const/4 v0, 0x0

    .line 264
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Sequence;->pars:Ljava/util/ArrayList;

    iget v1, p0, Lcom/auditude/ads/model/smil/Sequence;->enumeratorIndex:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Par;

    goto :goto_0
.end method

.method public bridge synthetic getCurrent()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->getCurrent()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    return-object v0
.end method

.method public final getDuration()I
    .locals 1

    .prologue
    .line 55
    iget v0, p0, Lcom/auditude/ads/model/smil/Sequence;->duration:I

    return v0
.end method

.method public final getMaxCount()I
    .locals 1

    .prologue
    .line 67
    iget v0, p0, Lcom/auditude/ads/model/smil/Sequence;->maxCount:I

    if-gez v0, :cond_0

    iget v0, p0, Lcom/auditude/ads/model/smil/Sequence;->count:I

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/auditude/ads/model/smil/Sequence;->maxCount:I

    goto :goto_0
.end method

.method public final getMaxDuration()I
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Lcom/auditude/ads/model/smil/Sequence;->maxDuration:I

    if-gez v0, :cond_0

    iget v0, p0, Lcom/auditude/ads/model/smil/Sequence;->duration:I

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/auditude/ads/model/smil/Sequence;->maxDuration:I

    goto :goto_0
.end method

.method public final getNext()Lcom/auditude/ads/model/smil/Par;
    .locals 2

    .prologue
    .line 269
    iget v0, p0, Lcom/auditude/ads/model/smil/Sequence;->enumeratorIndex:I

    add-int/lit8 v0, v0, 0x1

    .line 271
    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/auditude/ads/model/smil/Sequence;->pars:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->hasAvailableSlot()Z

    move-result v1

    if-nez v1, :cond_1

    .line 273
    :cond_0
    const/4 v0, 0x0

    .line 276
    :goto_0
    return-object v0

    :cond_1
    iget-object v1, p0, Lcom/auditude/ads/model/smil/Sequence;->pars:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Par;

    goto :goto_0
.end method

.method public final getPars()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Sequence;->pars:Ljava/util/ArrayList;

    return-object v0
.end method

.method public final getPlayableMetrics()Ljava/util/HashMap;
    .locals 8

    .prologue
    const/4 v0, 0x0

    .line 102
    .line 104
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 106
    new-instance v5, Lcom/auditude/ads/model/smil/Sequence$RefIterator;

    iget-object v1, p0, Lcom/auditude/ads/model/smil/Sequence;->pars:Ljava/util/ArrayList;

    invoke-direct {v5, p0, v1}, Lcom/auditude/ads/model/smil/Sequence$RefIterator;-><init>(Lcom/auditude/ads/model/smil/Sequence;Ljava/util/ArrayList;)V

    move v2, v0

    move v3, v0

    .line 110
    :cond_0
    invoke-virtual {v5}, Lcom/auditude/ads/model/smil/Sequence$RefIterator;->next()Lcom/auditude/ads/model/smil/Ref;

    move-result-object v6

    .line 111
    if-nez v6, :cond_2

    .line 140
    :cond_1
    :goto_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 141
    sget-object v1, Lcom/auditude/ads/model/smil/Sequence;->PLAYABLE_DURATION:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    sget-object v1, Lcom/auditude/ads/model/smil/Sequence;->PLAYABLE_AD_COUNT:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    sget-object v1, Lcom/auditude/ads/model/smil/Sequence;->PLAYABLE_REFS:Ljava/lang/String;

    invoke-virtual {v0, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    return-object v0

    .line 113
    :cond_2
    invoke-virtual {v6}, Lcom/auditude/ads/model/smil/Ref;->getPrimaryAsset()Lcom/auditude/ads/model/Asset;

    move-result-object v1

    .line 114
    instance-of v0, v1, Lcom/auditude/ads/model/LinearAsset;

    if-eqz v0, :cond_0

    .line 117
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->getMaxCount()I

    move-result v0

    if-ltz v0, :cond_3

    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->getMaxCount()I

    move-result v0

    if-ge v2, v0, :cond_1

    .line 118
    :cond_3
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->getMaxDuration()I

    move-result v0

    if-ltz v0, :cond_4

    move-object v0, v1

    check-cast v0, Lcom/auditude/ads/model/LinearAsset;

    invoke-virtual {v0}, Lcom/auditude/ads/model/LinearAsset;->getDurationInMillis()I

    move-result v0

    add-int/2addr v0, v3

    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->getMaxDuration()I

    move-result v7

    if-gt v0, v7, :cond_0

    .line 120
    :cond_4
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->getCreativeMaxDuration()I

    move-result v0

    if-ltz v0, :cond_5

    invoke-virtual {v1}, Lcom/auditude/ads/model/Asset;->getDurationInMillis()I

    move-result v0

    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->getCreativeMaxDuration()I

    move-result v7

    if-gt v0, v7, :cond_0

    .line 122
    :cond_5
    add-int/lit8 v2, v2, 0x1

    move-object v0, v1

    .line 123
    check-cast v0, Lcom/auditude/ads/model/LinearAsset;

    invoke-virtual {v0}, Lcom/auditude/ads/model/LinearAsset;->getDurationInMillis()I

    move-result v0

    add-int/2addr v3, v0

    .line 124
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 126
    invoke-virtual {v1}, Lcom/auditude/ads/model/Asset;->getAuditudeParams()Ljava/util/HashMap;

    move-result-object v0

    .line 127
    if-eqz v0, :cond_0

    const-string v1, "daisy_chaining"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 129
    const-string v1, "daisy_chaining"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 130
    const-string v1, "never"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0
.end method

.method public final getRefs()Ljava/util/ArrayList;
    .locals 2

    .prologue
    .line 96
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->getPlayableMetrics()Ljava/util/HashMap;

    move-result-object v0

    .line 97
    sget-object v1, Lcom/auditude/ads/model/smil/Sequence;->PLAYABLE_REFS:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    return-object v0
.end method

.method public final getRemainingMaxAdDuration()I
    .locals 4

    .prologue
    .line 150
    const/4 v0, 0x0

    .line 152
    new-instance v2, Lcom/auditude/ads/model/smil/Sequence$RefIterator;

    iget-object v1, p0, Lcom/auditude/ads/model/smil/Sequence;->pars:Ljava/util/ArrayList;

    invoke-direct {v2, p0, v1}, Lcom/auditude/ads/model/smil/Sequence$RefIterator;-><init>(Lcom/auditude/ads/model/smil/Sequence;Ljava/util/ArrayList;)V

    move v1, v0

    .line 156
    :cond_0
    :goto_0
    invoke-virtual {v2}, Lcom/auditude/ads/model/smil/Sequence$RefIterator;->next()Lcom/auditude/ads/model/smil/Ref;

    move-result-object v0

    .line 157
    if-nez v0, :cond_1

    .line 168
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->getMaxDuration()I

    move-result v0

    sub-int/2addr v0, v1

    return v0

    .line 159
    :cond_1
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Ref;->getPrimaryAsset()Lcom/auditude/ads/model/Asset;

    move-result-object v0

    .line 160
    instance-of v3, v0, Lcom/auditude/ads/model/LinearAsset;

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->isDisplayed()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 162
    check-cast v0, Lcom/auditude/ads/model/LinearAsset;

    invoke-virtual {v0}, Lcom/auditude/ads/model/LinearAsset;->getDurationInMillis()I

    move-result v0

    add-int/2addr v0, v1

    move v1, v0

    .line 154
    goto :goto_0
.end method

.method public final getSubmissionId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Sequence;->submissionId:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lcom/auditude/ads/model/smil/SmilElementType;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Sequence;->type:Lcom/auditude/ads/model/smil/SmilElementType;

    return-object v0
.end method

.method public final hasAvailableSlot()Z
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 221
    .line 223
    new-instance v2, Lcom/auditude/ads/model/smil/Sequence$RefIterator;

    iget-object v0, p0, Lcom/auditude/ads/model/smil/Sequence;->pars:Ljava/util/ArrayList;

    invoke-direct {v2, p0, v0}, Lcom/auditude/ads/model/smil/Sequence$RefIterator;-><init>(Lcom/auditude/ads/model/smil/Sequence;Ljava/util/ArrayList;)V

    move v0, v1

    .line 227
    :cond_0
    :goto_0
    invoke-virtual {v2}, Lcom/auditude/ads/model/smil/Sequence$RefIterator;->next()Lcom/auditude/ads/model/smil/Ref;

    move-result-object v3

    .line 228
    if-nez v3, :cond_1

    .line 242
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->getMaxCount()I

    move-result v2

    if-ltz v2, :cond_3

    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->getMaxCount()I

    move-result v2

    if-lt v0, v2, :cond_3

    .line 245
    :goto_1
    return v1

    .line 230
    :cond_1
    invoke-virtual {v3}, Lcom/auditude/ads/model/smil/Ref;->getPrimaryAsset()Lcom/auditude/ads/model/Asset;

    move-result-object v3

    .line 231
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->isLinear()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 233
    instance-of v4, v3, Lcom/auditude/ads/model/LinearAsset;

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Lcom/auditude/ads/model/Asset;->isDisplayed()Z

    move-result v3

    if-eqz v3, :cond_0

    add-int/lit8 v0, v0, 0x1

    .line 234
    goto :goto_0

    .line 237
    :cond_2
    instance-of v4, v3, Lcom/auditude/ads/model/NonLinearAsset;

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Lcom/auditude/ads/model/Asset;->isDisplayed()Z

    move-result v3

    if-eqz v3, :cond_0

    add-int/lit8 v0, v0, 0x1

    .line 225
    goto :goto_0

    .line 245
    :cond_3
    const/4 v1, 0x1

    goto :goto_1
.end method

.method public final isEmpty()Z
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Sequence;->pars:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public final isLinear()Z
    .locals 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Sequence;->type:Lcom/auditude/ads/model/smil/SmilElementType;

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
    .line 47
    iget-boolean v0, p0, Lcom/auditude/ads/model/smil/Sequence;->isWatched:Z

    return v0
.end method

.method public final moveNext()Z
    .locals 2

    .prologue
    .line 281
    iget v0, p0, Lcom/auditude/ads/model/smil/Sequence;->enumeratorIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/auditude/ads/model/smil/Sequence;->enumeratorIndex:I

    .line 283
    iget v0, p0, Lcom/auditude/ads/model/smil/Sequence;->enumeratorIndex:I

    iget-object v1, p0, Lcom/auditude/ads/model/smil/Sequence;->pars:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 286
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->hasAvailableSlot()Z

    move-result v0

    .line 289
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final reset()V
    .locals 2

    .prologue
    .line 294
    const/4 v0, -0x1

    iput v0, p0, Lcom/auditude/ads/model/smil/Sequence;->enumeratorIndex:I

    .line 297
    iget-object v0, p0, Lcom/auditude/ads/model/smil/Sequence;->pars:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 301
    return-void

    .line 297
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Par;

    .line 299
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->reset()V

    goto :goto_0
.end method

.method public final setCount(I)V
    .locals 0

    .prologue
    .line 61
    iput p1, p0, Lcom/auditude/ads/model/smil/Sequence;->count:I

    return-void
.end method

.method public final setCreativeMaxDuration(I)V
    .locals 0

    .prologue
    .line 73
    iput p1, p0, Lcom/auditude/ads/model/smil/Sequence;->creativeMaxDuration:I

    return-void
.end method

.method public final setDuration(I)V
    .locals 0

    .prologue
    .line 57
    iput p1, p0, Lcom/auditude/ads/model/smil/Sequence;->duration:I

    return-void
.end method

.method public final setIsWatched(Z)V
    .locals 0

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/auditude/ads/model/smil/Sequence;->isWatched:Z

    return-void
.end method

.method public final setMaxCount(I)V
    .locals 0

    .prologue
    .line 69
    iput p1, p0, Lcom/auditude/ads/model/smil/Sequence;->maxCount:I

    return-void
.end method

.method public final setMaxDuration(I)V
    .locals 0

    .prologue
    .line 65
    iput p1, p0, Lcom/auditude/ads/model/smil/Sequence;->maxDuration:I

    return-void
.end method

.method public final setSubmissionId(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 53
    iput-object p1, p0, Lcom/auditude/ads/model/smil/Sequence;->submissionId:Ljava/lang/String;

    return-void
.end method

.method public setType(Lcom/auditude/ads/model/smil/SmilElementType;)V
    .locals 0

    .prologue
    .line 43
    iput-object p1, p0, Lcom/auditude/ads/model/smil/Sequence;->type:Lcom/auditude/ads/model/smil/SmilElementType;

    return-void
.end method

.method public final shouldAdvanceAdPatternOnBegin()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 175
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->isLinear()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v1

    iget-object v1, v1, Lcom/auditude/ads/core/AuditudeEnv;->shouldPauseAdPatterns:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public final shouldAdvanceAdPatternOnEnd()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 180
    invoke-virtual {p0}, Lcom/auditude/ads/model/smil/Sequence;->isLinear()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v1

    iget-object v1, v1, Lcom/auditude/ads/core/AuditudeEnv;->shouldPauseAdPatterns:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method
