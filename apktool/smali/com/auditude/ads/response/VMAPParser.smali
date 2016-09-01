.class public Lcom/auditude/ads/response/VMAPParser;
.super Lcom/auditude/ads/util/event/EventDispatcher;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/loader/DataLoader$DataLoaderListener;
.implements Lcom/auditude/ads/response/IResponseParser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/auditude/ads/response/VMAPParser$sortOnStartTime;
    }
.end annotation


# static fields
.field public static final VMAP:Ljava/lang/String; = "VMAP"


# instance fields
.field private adBreaks:Ljava/util/ArrayList;

.field private adRequest:Lcom/auditude/ads/loader/AdRequest;

.field private adResponse:Lcom/auditude/ads/response/AdResponse;

.field private breaks:Ljava/util/ArrayList;

.field private chapters:Ljava/util/ArrayList;

.field private dataLoader:Lcom/auditude/ads/loader/DataLoader;

.field private listener:Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;

.field private loadFailed:Ljava/lang/Boolean;

.field private timeout:I

.field private trackingAd:Lcom/auditude/ads/model/Ad;

.field private xmlParser:Lcom/auditude/ads/response/VmapXmlParser;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/auditude/ads/util/event/EventDispatcher;-><init>()V

    .line 42
    new-instance v0, Lcom/auditude/ads/response/VmapXmlParser;

    invoke-direct {v0}, Lcom/auditude/ads/response/VmapXmlParser;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->xmlParser:Lcom/auditude/ads/response/VmapXmlParser;

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->breaks:Ljava/util/ArrayList;

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->chapters:Ljava/util/ArrayList;

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->adBreaks:Ljava/util/ArrayList;

    .line 49
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->loadFailed:Ljava/lang/Boolean;

    .line 34
    return-void
.end method

.method private appendSequenceState(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 10

    .prologue
    const/4 v6, 0x0

    .line 510
    move v5, v6

    :goto_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v5, v0, :cond_0

    .line 535
    return-void

    .line 512
    :cond_0
    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Group;

    .line 513
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, v5, :cond_1

    .line 515
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/auditude/ads/model/smil/Group;

    move v7, v6

    .line 516
    :goto_1
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getSequenceList()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v7, v2, :cond_2

    .line 510
    :cond_1
    add-int/lit8 v0, v5, 0x1

    move v5, v0

    goto :goto_0

    .line 518
    :cond_2
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getSequenceList()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/auditude/ads/model/smil/Sequence;

    .line 519
    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Group;->getSequenceList()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-le v3, v7, :cond_3

    .line 521
    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Group;->getSequenceList()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/auditude/ads/model/smil/Sequence;

    .line 523
    invoke-virtual {v2}, Lcom/auditude/ads/model/smil/Sequence;->getSubmissionId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/auditude/ads/model/smil/Sequence;->setSubmissionId(Ljava/lang/String;)V

    .line 524
    invoke-virtual {v2}, Lcom/auditude/ads/model/smil/Sequence;->getState()Ljava/util/HashMap;

    move-result-object v8

    .line 525
    invoke-virtual {v8}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_4

    .line 516
    :cond_3
    add-int/lit8 v2, v7, 0x1

    move v7, v2

    goto :goto_1

    .line 525
    :cond_4
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 527
    invoke-virtual {v8, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 528
    invoke-virtual {v3, v2, v4}, Lcom/auditude/ads/model/smil/Sequence;->addState(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method

.method private constructURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .prologue
    const v7, 0x989680

    .line 130
    const-string v1, ""

    .line 131
    const/4 v0, 0x1

    .line 132
    iget-object v2, p0, Lcom/auditude/ads/response/VMAPParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v2}, Lcom/auditude/ads/response/AdResponse;->getBreaks()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move-object v2, v1

    move v1, v0

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 152
    const/16 v1, 0x528

    .line 153
    const/4 v3, -0x1

    .line 154
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v4, "duration"

    invoke-virtual {v0, v4}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_5

    .line 156
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v3, "duration"

    invoke-virtual {v0, v3}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 158
    :goto_1
    if-lez v0, :cond_4

    .line 166
    :goto_2
    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->adRequest:Lcom/auditude/ads/loader/AdRequest;

    invoke-virtual {v1}, Lcom/auditude/ads/loader/AdRequest;->getMediaId()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 167
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v3

    invoke-virtual {v3}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v3

    invoke-virtual {v3}, Lcom/auditude/ads/core/AdSettings;->getPassThroughParams()Ljava/util/HashMap;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/auditude/ads/util/AuditudeUtil;->substituteCustomPublisherTags(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v3

    .line 168
    const-string v4, "\\[vdur\\]"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 169
    const-string v3, "\\[pvrn\\]"

    const-string v4, "[random]"

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 170
    const-string v3, "\\[vprn\\]"

    const-string v4, "[random]"

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 171
    const-string v3, "\\[vid\\]"

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 172
    const-string v1, "\\[slot\\]"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 173
    invoke-static {v0}, Lcom/auditude/ads/util/AuditudeUtil;->substituteTags(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 175
    return-object v0

    .line 132
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Group;

    .line 134
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getStartTime()I

    move-result v3

    if-lez v3, :cond_0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getStartTime()I

    move-result v3

    if-ge v3, v7, :cond_0

    .line 136
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "pod"

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 137
    const-string v3, "midroll"

    .line 138
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getStartTime()I

    move-result v6

    if-gtz v6, :cond_3

    .line 140
    const-string v3, "preroll"

    .line 146
    :cond_2
    :goto_3
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getStartTime()I

    move-result v0

    div-int/lit16 v0, v0, 0x3e8

    .line 147
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v6, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "slid="

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "&slau="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&h=[height]&w=[width]&tpos="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "&ptgt=a&cpsq="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ";"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 148
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto/16 :goto_0

    .line 142
    :cond_3
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getStartTime()I

    move-result v6

    if-lt v6, v7, :cond_2

    .line 144
    const-string v3, "postroll"

    goto :goto_3

    :cond_4
    move v0, v1

    goto/16 :goto_2

    :cond_5
    move v0, v3

    goto/16 :goto_1
.end method

.method private createGroups()V
    .locals 12

    .prologue
    .line 402
    const/4 v2, 0x0

    .line 403
    const/4 v1, 0x0

    .line 404
    const/4 v0, 0x0

    .line 405
    iget-object v3, p0, Lcom/auditude/ads/response/VMAPParser;->adBreaks:Ljava/util/ArrayList;

    new-instance v4, Lcom/auditude/ads/response/VMAPParser$sortOnStartTime;

    invoke-direct {v4, p0}, Lcom/auditude/ads/response/VMAPParser$sortOnStartTime;-><init>(Lcom/auditude/ads/response/VMAPParser;)V

    invoke-static {v3, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 406
    iget-object v3, p0, Lcom/auditude/ads/response/VMAPParser;->adBreaks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v4, v2

    move v2, v0

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 495
    const v0, 0x186a0

    if-ge v4, v0, :cond_0

    .line 497
    new-instance v0, Lcom/auditude/ads/model/smil/Group;

    sget-object v1, Lcom/auditude/ads/model/smil/SmilElementType;->NON_LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    iget-object v3, p0, Lcom/auditude/ads/response/VMAPParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v3}, Lcom/auditude/ads/response/AdResponse;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/auditude/ads/model/smil/Group;-><init>(Lcom/auditude/ads/model/smil/SmilElementType;ILcom/auditude/ads/core/AdSettings;)V

    .line 498
    mul-int/lit16 v1, v4, 0x3e8

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/smil/Group;->setStartTime(I)V

    .line 499
    new-instance v1, Lcom/auditude/ads/model/smil/Sequence;

    const/4 v3, 0x0

    sget-object v4, Lcom/auditude/ads/model/smil/SmilElementType;->NON_LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    invoke-direct {v1, v3, v4}, Lcom/auditude/ads/model/smil/Sequence;-><init>(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/SmilElementType;)V

    .line 500
    const v3, 0x5f5e100

    invoke-virtual {v1, v3}, Lcom/auditude/ads/model/smil/Sequence;->setDuration(I)V

    .line 501
    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/smil/Group;->addSequence(Lcom/auditude/ads/model/smil/Sequence;)V

    .line 502
    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 503
    add-int/lit8 v0, v2, 0x1

    .line 506
    :cond_0
    return-void

    .line 406
    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/response/VMAPAdBreak;

    .line 412
    if-nez v1, :cond_2

    invoke-virtual {v0}, Lcom/auditude/ads/response/VMAPAdBreak;->getStartTime()I

    move-result v3

    if-eqz v3, :cond_2

    .line 414
    new-instance v3, Lcom/auditude/ads/model/smil/Group;

    sget-object v6, Lcom/auditude/ads/model/smil/SmilElementType;->LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    iget-object v7, p0, Lcom/auditude/ads/response/VMAPParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v7}, Lcom/auditude/ads/response/AdResponse;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v7

    invoke-direct {v3, v6, v1, v7}, Lcom/auditude/ads/model/smil/Group;-><init>(Lcom/auditude/ads/model/smil/SmilElementType;ILcom/auditude/ads/core/AdSettings;)V

    .line 415
    new-instance v6, Lcom/auditude/ads/model/smil/Sequence;

    const/4 v7, 0x0

    sget-object v8, Lcom/auditude/ads/model/smil/SmilElementType;->LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    invoke-direct {v6, v7, v8}, Lcom/auditude/ads/model/smil/Sequence;-><init>(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/SmilElementType;)V

    .line 416
    invoke-virtual {v3, v6}, Lcom/auditude/ads/model/smil/Group;->addSequence(Lcom/auditude/ads/model/smil/Sequence;)V

    .line 417
    iget-object v6, p0, Lcom/auditude/ads/response/VMAPParser;->breaks:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 418
    add-int/lit8 v1, v1, 0x1

    .line 422
    :cond_2
    invoke-virtual {v0}, Lcom/auditude/ads/response/VMAPAdBreak;->getStartTime()I

    move-result v3

    mul-int/lit16 v3, v3, 0x3e8

    invoke-direct {p0, v3}, Lcom/auditude/ads/response/VMAPParser;->getBreakAt(I)Lcom/auditude/ads/model/smil/Group;

    move-result-object v3

    .line 423
    if-nez v3, :cond_8

    .line 425
    new-instance v3, Lcom/auditude/ads/model/smil/Group;

    sget-object v6, Lcom/auditude/ads/model/smil/SmilElementType;->LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    iget-object v7, p0, Lcom/auditude/ads/response/VMAPParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v7}, Lcom/auditude/ads/response/AdResponse;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v7

    invoke-direct {v3, v6, v1, v7}, Lcom/auditude/ads/model/smil/Group;-><init>(Lcom/auditude/ads/model/smil/SmilElementType;ILcom/auditude/ads/core/AdSettings;)V

    .line 426
    invoke-virtual {v0}, Lcom/auditude/ads/response/VMAPAdBreak;->getStartTime()I

    move-result v6

    mul-int/lit16 v6, v6, 0x3e8

    invoke-virtual {v3, v6}, Lcom/auditude/ads/model/smil/Group;->setStartTime(I)V

    .line 427
    iget-object v6, p0, Lcom/auditude/ads/response/VMAPParser;->breaks:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 428
    add-int/lit8 v1, v1, 0x1

    move-object v11, v3

    move v3, v1

    move-object v1, v11

    .line 432
    :goto_1
    new-instance v6, Lcom/auditude/ads/model/smil/Sequence;

    const/4 v7, 0x0

    sget-object v8, Lcom/auditude/ads/model/smil/SmilElementType;->LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    invoke-direct {v6, v7, v8}, Lcom/auditude/ads/model/smil/Sequence;-><init>(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/SmilElementType;)V

    .line 433
    const v7, 0x5f5e100

    invoke-virtual {v6, v7}, Lcom/auditude/ads/model/smil/Sequence;->setDuration(I)V

    .line 434
    invoke-virtual {v1, v6}, Lcom/auditude/ads/model/smil/Group;->addSequence(Lcom/auditude/ads/model/smil/Sequence;)V

    .line 436
    invoke-virtual {v0}, Lcom/auditude/ads/response/VMAPAdBreak;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_3

    .line 441
    invoke-virtual {v0}, Lcom/auditude/ads/response/VMAPAdBreak;->getVastDocuments()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_4

    .line 480
    invoke-virtual {v0}, Lcom/auditude/ads/response/VMAPAdBreak;->getStartTime()I

    move-result v1

    if-eq v1, v4, :cond_7

    .line 482
    new-instance v1, Lcom/auditude/ads/model/smil/Group;

    sget-object v6, Lcom/auditude/ads/model/smil/SmilElementType;->NON_LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    iget-object v7, p0, Lcom/auditude/ads/response/VMAPParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v7}, Lcom/auditude/ads/response/AdResponse;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v7

    invoke-direct {v1, v6, v2, v7}, Lcom/auditude/ads/model/smil/Group;-><init>(Lcom/auditude/ads/model/smil/SmilElementType;ILcom/auditude/ads/core/AdSettings;)V

    .line 483
    mul-int/lit16 v6, v4, 0x3e8

    invoke-virtual {v1, v6}, Lcom/auditude/ads/model/smil/Group;->setStartTime(I)V

    .line 484
    new-instance v6, Lcom/auditude/ads/model/smil/Sequence;

    const/4 v7, 0x0

    sget-object v8, Lcom/auditude/ads/model/smil/SmilElementType;->NON_LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    invoke-direct {v6, v7, v8}, Lcom/auditude/ads/model/smil/Sequence;-><init>(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/SmilElementType;)V

    .line 485
    invoke-virtual {v0}, Lcom/auditude/ads/response/VMAPAdBreak;->getStartTime()I

    move-result v7

    sub-int v4, v7, v4

    mul-int/lit16 v4, v4, 0x3e8

    invoke-virtual {v6, v4}, Lcom/auditude/ads/model/smil/Sequence;->setDuration(I)V

    .line 486
    invoke-virtual {v1, v6}, Lcom/auditude/ads/model/smil/Group;->addSequence(Lcom/auditude/ads/model/smil/Sequence;)V

    .line 487
    iget-object v4, p0, Lcom/auditude/ads/response/VMAPParser;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 488
    add-int/lit8 v1, v2, 0x1

    .line 491
    :goto_4
    invoke-virtual {v0}, Lcom/auditude/ads/response/VMAPAdBreak;->getStartTime()I

    move-result v0

    move v2, v1

    move v4, v0

    move v1, v3

    goto/16 :goto_0

    .line 436
    :cond_3
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/auditude/ads/model/tracking/TrackingUrl;

    .line 438
    invoke-virtual {v1}, Lcom/auditude/ads/model/tracking/TrackingUrl;->getType()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v1, v8}, Lcom/auditude/ads/model/smil/Sequence;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    goto :goto_2

    .line 441
    :cond_4
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/auditude/ads/network/vast/model/VASTDocument;

    .line 444
    new-instance v8, Lcom/auditude/ads/model/Ad;

    const/4 v9, 0x0

    invoke-direct {v8, v9}, Lcom/auditude/ads/model/Ad;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 445
    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/auditude/ads/model/Ad;->setIsFromVmapDoc(Ljava/lang/Boolean;)V

    .line 446
    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/auditude/ads/model/Ad;->setDispatchError(Ljava/lang/Boolean;)V

    .line 447
    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lcom/auditude/ads/model/Ad;->setIsNetworkAd(Z)V

    .line 448
    const-string v9, "vast"

    invoke-virtual {v8, v9}, Lcom/auditude/ads/model/Ad;->setNetworkAdType(Ljava/lang/String;)V

    .line 449
    invoke-virtual {v0}, Lcom/auditude/ads/response/VMAPAdBreak;->getFollowRedirects()Ljava/lang/Boolean;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/auditude/ads/model/Ad;->setFollowRedirects(Ljava/lang/Boolean;)V

    .line 450
    invoke-virtual {v0}, Lcom/auditude/ads/response/VMAPAdBreak;->getAllowMultipleAds()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/auditude/ads/model/Ad;->setAllowMultipleAds(Ljava/lang/String;)V

    .line 453
    iget-object v9, p0, Lcom/auditude/ads/response/VMAPParser;->trackingAd:Lcom/auditude/ads/model/Ad;

    if-eqz v9, :cond_5

    .line 455
    iget-object v9, p0, Lcom/auditude/ads/response/VMAPParser;->trackingAd:Lcom/auditude/ads/model/Ad;

    invoke-virtual {v9}, Lcom/auditude/ads/model/Ad;->getID()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/auditude/ads/model/Ad;->setID(Ljava/lang/String;)V

    .line 456
    iget-object v9, p0, Lcom/auditude/ads/response/VMAPParser;->trackingAd:Lcom/auditude/ads/model/Ad;

    invoke-virtual {v9}, Lcom/auditude/ads/model/Ad;->isRepackagingEnabled()Z

    move-result v9

    invoke-virtual {v8, v9}, Lcom/auditude/ads/model/Ad;->setRepackagingEnabled(Z)V

    .line 457
    iget-object v9, p0, Lcom/auditude/ads/response/VMAPParser;->trackingAd:Lcom/auditude/ads/model/Ad;

    const-string v10, "linear"

    invoke-virtual {v9, v10}, Lcom/auditude/ads/model/Ad;->getTrackingAssetByType(Ljava/lang/String;)Lcom/auditude/ads/model/Asset;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/auditude/ads/model/Ad;->addTrackingAsset(Lcom/auditude/ads/model/Asset;)V

    .line 458
    iget-object v9, p0, Lcom/auditude/ads/response/VMAPParser;->trackingAd:Lcom/auditude/ads/model/Ad;

    const-string v10, "nonlinear"

    invoke-virtual {v9, v10}, Lcom/auditude/ads/model/Ad;->getTrackingAssetByType(Ljava/lang/String;)Lcom/auditude/ads/model/Asset;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/auditude/ads/model/Ad;->addTrackingAsset(Lcom/auditude/ads/model/Asset;)V

    .line 459
    iget-object v9, p0, Lcom/auditude/ads/response/VMAPParser;->trackingAd:Lcom/auditude/ads/model/Ad;

    const-string v10, "companion"

    invoke-virtual {v9, v10}, Lcom/auditude/ads/model/Ad;->getTrackingAssetByType(Ljava/lang/String;)Lcom/auditude/ads/model/Asset;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/auditude/ads/model/Ad;->addTrackingAsset(Lcom/auditude/ads/model/Asset;)V

    .line 462
    :cond_5
    iget-object v9, v1, Lcom/auditude/ads/network/vast/model/VASTDocument;->adTagURI:Ljava/lang/String;

    if-eqz v9, :cond_6

    .line 464
    iget-object v1, v1, Lcom/auditude/ads/network/vast/model/VASTDocument;->adTagURI:Ljava/lang/String;

    invoke-virtual {v8, v1}, Lcom/auditude/ads/model/Ad;->setNetworkAdSource(Ljava/lang/Object;)V

    .line 472
    :goto_5
    new-instance v1, Lcom/auditude/ads/model/smil/Par;

    invoke-direct {v1, v6}, Lcom/auditude/ads/model/smil/Par;-><init>(Lcom/auditude/ads/model/smil/Sequence;)V

    .line 473
    new-instance v9, Lcom/auditude/ads/model/smil/Ref;

    invoke-direct {v9, v1}, Lcom/auditude/ads/model/smil/Ref;-><init>(Lcom/auditude/ads/model/smil/Par;)V

    .line 474
    invoke-virtual {v1, v9}, Lcom/auditude/ads/model/smil/Par;->addRef(Lcom/auditude/ads/model/smil/Ref;)V

    .line 475
    invoke-virtual {v9, v8}, Lcom/auditude/ads/model/smil/Ref;->setAd(Lcom/auditude/ads/model/Ad;)V

    .line 476
    invoke-virtual {v6, v1}, Lcom/auditude/ads/model/smil/Sequence;->addPar(Lcom/auditude/ads/model/smil/Par;)V

    goto/16 :goto_3

    .line 468
    :cond_6
    invoke-virtual {v8, v1}, Lcom/auditude/ads/model/Ad;->setNetworkAdSource(Ljava/lang/Object;)V

    goto :goto_5

    :cond_7
    move v1, v2

    goto/16 :goto_4

    :cond_8
    move-object v11, v3

    move v3, v1

    move-object v1, v11

    goto/16 :goto_1
.end method

.method private createRepeatBreaks(Lcom/auditude/ads/response/VMAPAdBreak;I)V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 363
    invoke-virtual {p1}, Lcom/auditude/ads/response/VMAPAdBreak;->getStartTime()I

    move-result v1

    .line 364
    invoke-virtual {p1}, Lcom/auditude/ads/response/VMAPAdBreak;->getRepeatAfter()I

    move-result v2

    .line 367
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 368
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->adBreaks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 375
    invoke-static {v3}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    move v0, v1

    .line 378
    :goto_1
    add-int v1, v0, v2

    if-le v1, p2, :cond_2

    .line 397
    return-void

    .line 368
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/response/VMAPAdBreak;

    .line 370
    invoke-virtual {v0}, Lcom/auditude/ads/response/VMAPAdBreak;->getStartTime()I

    move-result v5

    if-le v5, v1, :cond_0

    .line 372
    invoke-virtual {v0}, Lcom/auditude/ads/response/VMAPAdBreak;->getStartTime()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 380
    :cond_2
    add-int v1, v0, v2

    .line 381
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_3

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lt v0, v1, :cond_4

    .line 383
    :cond_3
    invoke-virtual {p1, v1}, Lcom/auditude/ads/response/VMAPAdBreak;->getCopy(I)Lcom/auditude/ads/response/VMAPAdBreak;

    move-result-object v0

    .line 384
    iget-object v4, p0, Lcom/auditude/ads/response/VMAPParser;->adBreaks:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 392
    :cond_4
    :goto_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_5

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v0, v1, :cond_6

    :cond_5
    move v0, v1

    goto :goto_1

    .line 394
    :cond_6
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_2
.end method

.method private getAdBreakAt(I)Lcom/auditude/ads/response/VMAPAdBreak;
    .locals 2

    .prologue
    .line 539
    new-instance v0, Lcom/auditude/ads/response/VMAPAdBreak;

    invoke-direct {v0, p1}, Lcom/auditude/ads/response/VMAPAdBreak;-><init>(I)V

    .line 540
    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->adBreaks:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 541
    return-object v0
.end method

.method private getAssetException(ILjava/lang/String;)Lcom/auditude/ads/exception/AssetException;
    .locals 2

    .prologue
    .line 631
    new-instance v0, Lcom/auditude/ads/exception/AssetException;

    invoke-direct {v0, p1, p2}, Lcom/auditude/ads/exception/AssetException;-><init>(ILjava/lang/String;)V

    .line 632
    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->trackingAd:Lcom/auditude/ads/model/Ad;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->trackingAd:Lcom/auditude/ads/model/Ad;

    invoke-virtual {v1}, Lcom/auditude/ads/model/Ad;->getID()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/auditude/ads/exception/AssetException;->adId:Ljava/lang/String;

    .line 633
    :cond_0
    return-object v0
.end method

.method private getBreakAt(I)Lcom/auditude/ads/model/smil/Group;
    .locals 3

    .prologue
    .line 546
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->breaks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 553
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 546
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Group;

    .line 548
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getStartTime()I

    move-result v2

    if-ne v2, p1, :cond_0

    goto :goto_0
.end method

.method private getTimeOffset(Ljava/lang/String;)I
    .locals 4

    .prologue
    const v2, 0x186a0

    const/4 v1, -0x1

    .line 561
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_1

    .line 601
    :cond_0
    :goto_0
    return v1

    .line 567
    :cond_1
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v3, "duration"

    invoke-virtual {v0, v3}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_6

    .line 569
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v3, "duration"

    invoke-virtual {v0, v3}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 573
    :goto_1
    const-string v3, "start"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 575
    const/4 v1, 0x0

    .line 576
    goto :goto_0

    .line 577
    :cond_2
    const-string v3, "end"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    move v1, v2

    .line 580
    goto :goto_0

    .line 581
    :cond_3
    const-string v3, "(^[-.0-9]+:[-.0-9]+:[-.0-9]+$)"

    invoke-virtual {p1, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 583
    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->parseDuration(Ljava/lang/String;)I

    move-result v1

    goto :goto_0

    .line 585
    :cond_4
    const-string v3, "%"

    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    if-lez v0, :cond_0

    .line 587
    const-string v1, "%"

    const-string v3, ""

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/auditude/ads/util/StringUtil;->convertToInt(Ljava/lang/String;)I

    move-result v1

    .line 588
    const/16 v3, 0x64

    if-lt v1, v3, :cond_5

    move v1, v2

    .line 591
    goto :goto_0

    .line 594
    :cond_5
    int-to-float v0, v0

    int-to-float v1, v1

    mul-float/2addr v0, v1

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr v0, v1

    float-to-int v0, v0

    div-int/lit16 v1, v0, 0x3e8

    goto :goto_0

    :cond_6
    move v0, v1

    goto :goto_1
.end method

.method public static isValidParserForResponse(Lcom/auditude/ads/response/AdResponse;)Ljava/lang/Boolean;
    .locals 3

    .prologue
    .line 53
    if-eqz p0, :cond_1

    .line 55
    invoke-virtual {p0}, Lcom/auditude/ads/response/AdResponse;->getAds()Ljava/util/HashMap;

    move-result-object v0

    .line 56
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 58
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 69
    :cond_1
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    .line 58
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 60
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Ad;

    .line 61
    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->getIsNetworkAd()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->getNetworkAdType()Ljava/lang/String;

    move-result-object v0

    const-string v2, "VMAP"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method private loadVMAP(Ljava/lang/String;)V
    .locals 4

    .prologue
    const/16 v3, 0x455

    .line 104
    if-eqz p1, :cond_0

    .line 106
    new-instance v0, Lcom/auditude/ads/loader/DataLoader;

    invoke-direct {v0}, Lcom/auditude/ads/loader/DataLoader;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    .line 107
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    invoke-virtual {v0, p0}, Lcom/auditude/ads/loader/DataLoader;->setDataLoaderListener(Lcom/auditude/ads/loader/DataLoader$DataLoaderListener;)V

    .line 108
    invoke-direct {p0, p1}, Lcom/auditude/ads/response/VMAPParser;->constructURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 109
    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    const/4 v2, 0x0

    iget v3, p0, Lcom/auditude/ads/response/VMAPParser;->timeout:I

    invoke-virtual {v1, v0, v2, v3}, Lcom/auditude/ads/loader/DataLoader;->load(Ljava/lang/String;Ljava/lang/String;I)V

    .line 125
    :goto_0
    return-void

    .line 113
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->breaks:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/auditude/ads/response/AdResponse;->setBreaks(Ljava/util/ArrayList;)V

    .line 114
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/auditude/ads/response/AdResponse;->setChapters(Ljava/util/ArrayList;)V

    .line 115
    const-string v0, "VMAP load failed"

    .line 116
    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->trackingAd:Lcom/auditude/ads/model/Ad;

    if-eqz v1, :cond_1

    .line 118
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, ": "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->trackingAd:Lcom/auditude/ads/model/Ad;

    invoke-virtual {v1}, Lcom/auditude/ads/model/Ad;->getNetworkAdSource()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 120
    :cond_1
    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->listener:Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;

    invoke-direct {p0, v3, v0}, Lcom/auditude/ads/response/VMAPParser;->getAssetException(ILjava/lang/String;)Lcom/auditude/ads/exception/AssetException;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;->onRequestComplete(Lcom/auditude/ads/exception/AssetException;)V

    .line 121
    invoke-virtual {p0, v3, v0}, Lcom/auditude/ads/response/VMAPParser;->logError(ILjava/lang/String;)V

    .line 122
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->loadFailed:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method private parseLinearBreak(Lcom/auditude/ads/response/VmapXmlNode;)V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 291
    const-string v0, "timeOffset"

    invoke-virtual {p1, v0}, Lcom/auditude/ads/response/VmapXmlNode;->getAttributeByName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/auditude/ads/response/VMAPParser;->getTimeOffset(Ljava/lang/String;)I

    move-result v0

    .line 292
    if-ltz v0, :cond_3

    .line 294
    invoke-direct {p0, v0}, Lcom/auditude/ads/response/VMAPParser;->getAdBreakAt(I)Lcom/auditude/ads/response/VMAPAdBreak;

    move-result-object v1

    .line 295
    const-string v0, "repeatAfter"

    invoke-virtual {p1, v0}, Lcom/auditude/ads/response/VmapXmlNode;->getAttributeByName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/auditude/ads/response/VMAPParser;->getTimeOffset(Ljava/lang/String;)I

    move-result v0

    .line 296
    if-ltz v0, :cond_0

    .line 298
    invoke-virtual {v1, v0}, Lcom/auditude/ads/response/VMAPAdBreak;->setRepeatAfter(I)V

    .line 302
    :cond_0
    const-string v0, "AdSource"

    invoke-virtual {p1, v0}, Lcom/auditude/ads/response/VmapXmlNode;->getChildeNodesByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 303
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_2

    .line 305
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/response/VmapXmlNode;

    .line 306
    const-string v2, "allowMultipleAds"

    invoke-virtual {v0, v2}, Lcom/auditude/ads/response/VmapXmlNode;->getAttributeByName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 307
    const-string v3, "followRedirects"

    invoke-virtual {v0, v3}, Lcom/auditude/ads/response/VmapXmlNode;->getAttributeByName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 309
    invoke-virtual {v0}, Lcom/auditude/ads/response/VmapXmlNode;->getChildNodes()Ljava/util/ArrayList;

    move-result-object v0

    .line 311
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_2

    .line 313
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_4

    .line 340
    :cond_2
    const-string v0, "TrackingEvents"

    invoke-virtual {p1, v0}, Lcom/auditude/ads/response/VmapXmlNode;->getChildeNodesByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 341
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 343
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/response/VmapXmlNode;

    .line 344
    const-string v2, "Tracking"

    invoke-virtual {v0, v2}, Lcom/auditude/ads/response/VmapXmlNode;->getChildeNodesByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 346
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 348
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_7

    .line 358
    :cond_3
    return-void

    .line 313
    :cond_4
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/response/VmapXmlNode;

    .line 315
    invoke-virtual {v0}, Lcom/auditude/ads/response/VmapXmlNode;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "AdTagURI"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 317
    invoke-virtual {v1, v2}, Lcom/auditude/ads/response/VMAPAdBreak;->setAllowMultipleAds(Ljava/lang/String;)V

    .line 318
    invoke-virtual {v1, v3}, Lcom/auditude/ads/response/VMAPAdBreak;->setFollowRedirects(Ljava/lang/String;)V

    .line 319
    new-instance v5, Lcom/auditude/ads/network/vast/model/VASTDocument;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Lcom/auditude/ads/network/vast/model/VASTDocument;-><init>(Lcom/auditude/ads/network/vast/model/VASTAd;)V

    .line 320
    invoke-virtual {v0}, Lcom/auditude/ads/response/VmapXmlNode;->getValue()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/auditude/ads/network/vast/model/VASTDocument;->adTagURI:Ljava/lang/String;

    .line 321
    invoke-virtual {v1, v5}, Lcom/auditude/ads/response/VMAPAdBreak;->addVastDocument(Lcom/auditude/ads/network/vast/model/VASTDocument;)V

    .line 323
    :cond_5
    invoke-virtual {v0}, Lcom/auditude/ads/response/VmapXmlNode;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "VASTAdData"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 325
    invoke-virtual {v0}, Lcom/auditude/ads/response/VmapXmlNode;->getVastDocuments()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_6
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTDocument;

    .line 327
    if-eqz v0, :cond_6

    .line 329
    invoke-virtual {v1, v2}, Lcom/auditude/ads/response/VMAPAdBreak;->setAllowMultipleAds(Ljava/lang/String;)V

    .line 330
    invoke-virtual {v1, v3}, Lcom/auditude/ads/response/VMAPAdBreak;->setFollowRedirects(Ljava/lang/String;)V

    .line 331
    invoke-virtual {v1, v0}, Lcom/auditude/ads/response/VMAPAdBreak;->addVastDocument(Lcom/auditude/ads/network/vast/model/VASTDocument;)V

    goto :goto_1

    .line 348
    :cond_7
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/response/VmapXmlNode;

    .line 350
    const-string v3, "event"

    invoke-virtual {v0, v3}, Lcom/auditude/ads/response/VmapXmlNode;->getAttributeByName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 351
    invoke-virtual {v0}, Lcom/auditude/ads/response/VmapXmlNode;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 352
    invoke-virtual {v1, v3, v0}, Lcom/auditude/ads/response/VMAPAdBreak;->addTrackingUrl(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private parseXML(Ljava/lang/String;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 238
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 240
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->xmlParser:Lcom/auditude/ads/response/VmapXmlParser;

    invoke-virtual {v0, p1}, Lcom/auditude/ads/response/VmapXmlParser;->parseXML(Ljava/lang/String;)V

    .line 241
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->xmlParser:Lcom/auditude/ads/response/VmapXmlParser;

    const-string v1, "AdBreak"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/response/VmapXmlParser;->getChildeNodesByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 242
    if-eqz v0, :cond_1

    .line 244
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_6

    .line 256
    :cond_1
    const/4 v1, -0x1

    .line 257
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v2, "duration"

    invoke-virtual {v0, v2}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_2

    .line 259
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v1, "duration"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    move v1, v0

    .line 261
    :cond_2
    if-lez v1, :cond_4

    .line 264
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 265
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->adBreaks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_7

    .line 273
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_8

    .line 279
    :cond_4
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->adBreaks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_5

    .line 282
    invoke-direct {p0}, Lcom/auditude/ads/response/VMAPParser;->createGroups()V

    .line 284
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->breaks:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v1}, Lcom/auditude/ads/response/AdResponse;->getBreaks()Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/auditude/ads/response/VMAPParser;->appendSequenceState(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 285
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->chapters:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v1}, Lcom/auditude/ads/response/AdResponse;->getChapters()Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/auditude/ads/response/VMAPParser;->appendSequenceState(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 287
    :cond_5
    return-void

    .line 244
    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/response/VmapXmlNode;

    .line 246
    const-string v2, "breakType"

    invoke-virtual {v0, v2}, Lcom/auditude/ads/response/VmapXmlNode;->getAttributeByName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aget-object v2, v2, v3

    .line 247
    const-string v3, "linear"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 249
    invoke-direct {p0, v0}, Lcom/auditude/ads/response/VMAPParser;->parseLinearBreak(Lcom/auditude/ads/response/VmapXmlNode;)V

    goto/16 :goto_0

    .line 265
    :cond_7
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/response/VMAPAdBreak;

    .line 267
    invoke-virtual {v0}, Lcom/auditude/ads/response/VMAPAdBreak;->getRepeatAfter()I

    move-result v4

    if-lez v4, :cond_3

    .line 269
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 273
    :cond_8
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/response/VMAPAdBreak;

    .line 275
    div-int/lit16 v3, v1, 0x3e8

    invoke-direct {p0, v0, v3}, Lcom/auditude/ads/response/VMAPParser;->createRepeatBreaks(Lcom/auditude/ads/response/VMAPAdBreak;I)V

    goto :goto_2
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 609
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    if-eqz v0, :cond_0

    .line 611
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    invoke-virtual {v0}, Lcom/auditude/ads/loader/DataLoader;->cancel()V

    .line 613
    :cond_0
    return-void
.end method

.method public loadAdRequest(Lcom/auditude/ads/response/AdResponse;Lcom/auditude/ads/loader/AdRequest;I)V
    .locals 4

    .prologue
    .line 74
    iput-object p1, p0, Lcom/auditude/ads/response/VMAPParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    .line 75
    iput-object p2, p0, Lcom/auditude/ads/response/VMAPParser;->adRequest:Lcom/auditude/ads/loader/AdRequest;

    .line 76
    iput p3, p0, Lcom/auditude/ads/response/VMAPParser;->timeout:I

    .line 78
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    if-eqz v0, :cond_1

    .line 80
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getAds()Ljava/util/HashMap;

    move-result-object v0

    .line 81
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 83
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_3

    .line 99
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->listener:Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;->onRequestComplete(Lcom/auditude/ads/exception/AssetException;)V

    .line 100
    :cond_2
    :goto_0
    return-void

    .line 83
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 85
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Ad;

    .line 86
    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->getIsNetworkAd()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->getNetworkAdType()Ljava/lang/String;

    move-result-object v2

    const-string v3, "VMAP"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 88
    iput-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->trackingAd:Lcom/auditude/ads/model/Ad;

    .line 89
    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->getNetworkAdSource()Ljava/lang/Object;

    move-result-object v1

    .line 90
    instance-of v1, v1, Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 92
    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->getNetworkAdSource()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/auditude/ads/response/VMAPParser;->loadVMAP(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected final logError(ILjava/lang/String;)V
    .locals 4

    .prologue
    .line 625
    invoke-direct {p0, p1, p2}, Lcom/auditude/ads/response/VMAPParser;->getAssetException(ILjava/lang/String;)Lcom/auditude/ads/exception/AssetException;

    move-result-object v0

    .line 626
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/core/AuditudeEnv;->getAPI()Lcom/auditude/ads/core/APIBridge;

    move-result-object v1

    const-string v2, "playerError"

    new-instance v3, Lcom/auditude/ads/event/PlayerErrorEvent;

    invoke-direct {v3, p0, v0}, Lcom/auditude/ads/event/PlayerErrorEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/exception/PlayerException;)V

    invoke-virtual {v1, v2, v3}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 627
    return-void
.end method

.method public onRequestComplete(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 182
    :try_start_0
    invoke-direct {p0, p1}, Lcom/auditude/ads/response/VMAPParser;->parseXML(Ljava/lang/String;)V

    .line 183
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->breaks:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/auditude/ads/response/AdResponse;->setBreaks(Ljava/util/ArrayList;)V

    .line 184
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/auditude/ads/response/AdResponse;->setChapters(Ljava/util/ArrayList;)V

    .line 185
    const-string v0, "VMAP returned no ads"

    .line 186
    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->trackingAd:Lcom/auditude/ads/model/Ad;

    if-eqz v1, :cond_0

    .line 188
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, ": "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->trackingAd:Lcom/auditude/ads/model/Ad;

    invoke-virtual {v1}, Lcom/auditude/ads/model/Ad;->getNetworkAdSource()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 190
    :cond_0
    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->listener:Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;

    if-eqz v1, :cond_1

    .line 192
    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->listener:Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;

    const/16 v2, 0x454

    invoke-direct {p0, v2, v0}, Lcom/auditude/ads/response/VMAPParser;->getAssetException(ILjava/lang/String;)Lcom/auditude/ads/exception/AssetException;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;->onRequestComplete(Lcom/auditude/ads/exception/AssetException;)V

    .line 194
    :cond_1
    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->loadFailed:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->breaks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-gtz v1, :cond_2

    .line 196
    const/16 v1, 0x454

    invoke-virtual {p0, v1, v0}, Lcom/auditude/ads/response/VMAPParser;->logError(ILjava/lang/String;)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 212
    :cond_2
    :goto_0
    return-void

    .line 199
    :catch_0
    move-exception v0

    .line 201
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    .line 202
    const/16 v0, 0x44f

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/response/VMAPParser;->logError(ILjava/lang/String;)V

    .line 203
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->listener:Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;

    if-eqz v0, :cond_2

    .line 205
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->listener:Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;->onRequestComplete(Lcom/auditude/ads/exception/AssetException;)V

    goto :goto_0

    .line 208
    :catch_1
    move-exception v0

    .line 210
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public onRequestFailed(Ljava/lang/Throwable;)V
    .locals 4

    .prologue
    const/16 v3, 0x455

    .line 216
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->breaks:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/auditude/ads/response/AdResponse;->setBreaks(Ljava/util/ArrayList;)V

    .line 217
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/auditude/ads/response/AdResponse;->setChapters(Ljava/util/ArrayList;)V

    .line 218
    instance-of v0, p1, Ljava/net/SocketTimeoutException;

    if-eqz v0, :cond_0

    .line 220
    iget-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->listener:Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;->onRequestComplete(Lcom/auditude/ads/exception/AssetException;)V

    .line 221
    const/16 v0, 0x458

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/response/VMAPParser;->logError(ILjava/lang/String;)V

    .line 233
    :goto_0
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/response/VMAPParser;->loadFailed:Ljava/lang/Boolean;

    .line 234
    return-void

    .line 225
    :cond_0
    const-string v0, "VMAP load failed"

    .line 226
    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->trackingAd:Lcom/auditude/ads/model/Ad;

    if-eqz v1, :cond_1

    .line 228
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, ": "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->trackingAd:Lcom/auditude/ads/model/Ad;

    invoke-virtual {v1}, Lcom/auditude/ads/model/Ad;->getNetworkAdSource()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 230
    :cond_1
    iget-object v1, p0, Lcom/auditude/ads/response/VMAPParser;->listener:Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;

    invoke-direct {p0, v3, v0}, Lcom/auditude/ads/response/VMAPParser;->getAssetException(ILjava/lang/String;)Lcom/auditude/ads/exception/AssetException;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;->onRequestComplete(Lcom/auditude/ads/exception/AssetException;)V

    .line 231
    invoke-virtual {p0, v3, v0}, Lcom/auditude/ads/response/VMAPParser;->logError(ILjava/lang/String;)V

    goto :goto_0
.end method

.method public setResponseParserListener(Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;)V
    .locals 0

    .prologue
    .line 605
    iput-object p1, p0, Lcom/auditude/ads/response/VMAPParser;->listener:Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;

    return-void
.end method
