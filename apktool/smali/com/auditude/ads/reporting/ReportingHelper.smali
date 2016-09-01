.class public Lcom/auditude/ads/reporting/ReportingHelper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/util/TimeoutUtil$TimeoutCompleteListener;
.implements Lcom/auditude/ads/util/event/IEventListener;


# static fields
.field private static synthetic $SWITCH_TABLE$com$auditude$ads$event$SMILEvent$SMILEventType:[I = null

.field private static synthetic $SWITCH_TABLE$com$auditude$ads$view$AdViewEvent$AdViewEventType:[I = null

.field private static final EVENT_COMPLETE:Ljava/lang/String; = "complete"

.field private static final EVENT_START:Ljava/lang/String; = "start"

.field private static final STATE_PARAM_ADVANCE_PATTERN:Ljava/lang/String; = "advancepattern"

.field private static final STATE_PARAM_EVENT:Ljava/lang/String; = "event"

.field private static final STATE_PARAM_PROGRESS:Ljava/lang/String; = "progress"

.field private static final STATE_PARAM_UNIT:Ljava/lang/String; = "unit"

.field private static final UNIT_PERCENT:Ljava/lang/String; = "percent"


# instance fields
.field private api:Lcom/auditude/ads/core/APIBridge;

.field private isInitialized:Z

.field private par:Lcom/auditude/ads/model/smil/Par;

.field private pendingTimeouts:Ljava/util/ArrayList;

.field private sequence:Lcom/auditude/ads/model/smil/Sequence;

.field private submissions:Lcom/auditude/ads/model/tracking/Submissions;


# direct methods
.method static synthetic $SWITCH_TABLE$com$auditude$ads$event$SMILEvent$SMILEventType()[I
    .locals 3

    .prologue
    .line 34
    sget-object v0, Lcom/auditude/ads/reporting/ReportingHelper;->$SWITCH_TABLE$com$auditude$ads$event$SMILEvent$SMILEventType:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/auditude/ads/event/SMILEvent$SMILEventType;->values()[Lcom/auditude/ads/event/SMILEvent$SMILEventType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/auditude/ads/event/SMILEvent$SMILEventType;->PAR_BEGIN:Lcom/auditude/ads/event/SMILEvent$SMILEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/event/SMILEvent$SMILEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_3

    :goto_1
    :try_start_1
    sget-object v1, Lcom/auditude/ads/event/SMILEvent$SMILEventType;->PAR_END:Lcom/auditude/ads/event/SMILEvent$SMILEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/event/SMILEvent$SMILEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_2

    :goto_2
    :try_start_2
    sget-object v1, Lcom/auditude/ads/event/SMILEvent$SMILEventType;->SEQUENCE_BEGIN:Lcom/auditude/ads/event/SMILEvent$SMILEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/event/SMILEvent$SMILEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_1

    :goto_3
    :try_start_3
    sget-object v1, Lcom/auditude/ads/event/SMILEvent$SMILEventType;->SEQUENCE_END:Lcom/auditude/ads/event/SMILEvent$SMILEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/event/SMILEvent$SMILEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_0

    :goto_4
    sput-object v0, Lcom/auditude/ads/reporting/ReportingHelper;->$SWITCH_TABLE$com$auditude$ads$event$SMILEvent$SMILEventType:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_4

    :catch_1
    move-exception v1

    goto :goto_3

    :catch_2
    move-exception v1

    goto :goto_2

    :catch_3
    move-exception v1

    goto :goto_1
.end method

.method static synthetic $SWITCH_TABLE$com$auditude$ads$view$AdViewEvent$AdViewEventType()[I
    .locals 3

    .prologue
    .line 34
    sget-object v0, Lcom/auditude/ads/reporting/ReportingHelper;->$SWITCH_TABLE$com$auditude$ads$view$AdViewEvent$AdViewEventType:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->values()[Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_CLICK:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_d

    :goto_1
    :try_start_1
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_COMPLETE:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_c

    :goto_2
    :try_start_2
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_ERROR:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_b

    :goto_3
    :try_start_3
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_LOAD:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_a

    :goto_4
    :try_start_4
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_LOG:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_9

    :goto_5
    :try_start_5
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_PAUSE:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_8

    :goto_6
    :try_start_6
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_PROGRESS:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_7

    :goto_7
    :try_start_7
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_REPLAY:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_6

    :goto_8
    :try_start_8
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_RESUME:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_5

    :goto_9
    :try_start_9
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_SKIP:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_4

    :goto_a
    :try_start_a
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_START:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_3

    :goto_b
    :try_start_b
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_STOP:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_2

    :goto_c
    :try_start_c
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_USER_CLOSE:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_1

    :goto_d
    :try_start_d
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_VOLUME_CHANGE:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_0

    :goto_e
    sput-object v0, Lcom/auditude/ads/reporting/ReportingHelper;->$SWITCH_TABLE$com$auditude$ads$view$AdViewEvent$AdViewEventType:[I

    goto/16 :goto_0

    :catch_0
    move-exception v1

    goto :goto_e

    :catch_1
    move-exception v1

    goto :goto_d

    :catch_2
    move-exception v1

    goto :goto_c

    :catch_3
    move-exception v1

    goto :goto_b

    :catch_4
    move-exception v1

    goto :goto_a

    :catch_5
    move-exception v1

    goto :goto_9

    :catch_6
    move-exception v1

    goto :goto_8

    :catch_7
    move-exception v1

    goto :goto_7

    :catch_8
    move-exception v1

    goto :goto_6

    :catch_9
    move-exception v1

    goto :goto_5

    :catch_a
    move-exception v1

    goto :goto_4

    :catch_b
    move-exception v1

    goto/16 :goto_3

    :catch_c
    move-exception v1

    goto/16 :goto_2

    :catch_d
    move-exception v1

    goto/16 :goto_1
.end method

.method public constructor <init>(Lcom/auditude/ads/core/APIBridge;)V
    .locals 2

    .prologue
    const/16 v1, 0x64

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->isInitialized:Z

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->pendingTimeouts:Ljava/util/ArrayList;

    .line 56
    iput-object p1, p0, Lcom/auditude/ads/reporting/ReportingHelper;->api:Lcom/auditude/ads/core/APIBridge;

    .line 58
    const-string v0, "adViewEvent"

    invoke-virtual {p1, v0, p0, v1}, Lcom/auditude/ads/core/APIBridge;->addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;I)V

    .line 59
    const-string v0, "smilEvent"

    invoke-virtual {p1, v0, p0, v1}, Lcom/auditude/ads/core/APIBridge;->addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;I)V

    .line 60
    const-string v0, "playerError"

    invoke-virtual {p1, v0, p0, v1}, Lcom/auditude/ads/core/APIBridge;->addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;I)V

    .line 61
    return-void
.end method

.method private getErrorSubmissionUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 566
    const-string v0, "http://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "https://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 568
    :cond_0
    const-string v0, "http://ad.auditude.com/adserver/e?type=playererror"

    .line 571
    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "http://ad."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/adserver/e?type=playererror"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getProgressState(ILjava/lang/String;)Ljava/util/HashMap;
    .locals 3

    .prologue
    .line 525
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 526
    const-string v1, "progress"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 527
    const-string v1, "unit"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 528
    return-object v0
.end method

.method private getSubmissionState()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 626
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/Submissions;->getState()Ljava/util/HashMap;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/Sequence;Lcom/auditude/ads/model/smil/Par;Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 7

    .prologue
    .line 343
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/Sequence;Lcom/auditude/ads/model/smil/Par;Ljava/lang/String;Ljava/util/HashMap;Z)V

    .line 344
    return-void
.end method

.method private logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/Sequence;Lcom/auditude/ads/model/smil/Par;Ljava/lang/String;Ljava/util/HashMap;Z)V
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 348
    if-nez p1, :cond_1

    .line 372
    :cond_0
    return-void

    .line 353
    :cond_1
    invoke-virtual {p1, p4}, Lcom/auditude/ads/model/BaseElement;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v3

    .line 354
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v3}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 356
    invoke-direct {p0}, Lcom/auditude/ads/reporting/ReportingHelper;->getSubmissionState()Ljava/util/HashMap;

    move-result-object v4

    .line 357
    if-eqz p2, :cond_2

    invoke-virtual {p2}, Lcom/auditude/ads/model/smil/Sequence;->getState()Ljava/util/HashMap;

    move-result-object v0

    move-object v2, v0

    :goto_0
    if-eqz p3, :cond_3

    invoke-virtual {p3}, Lcom/auditude/ads/model/smil/Par;->getState()Ljava/util/HashMap;

    move-result-object v0

    :goto_1
    invoke-static {v2, v0}, Lcom/auditude/ads/util/ObjectUtil;->merge(Ljava/util/HashMap;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v0

    .line 356
    invoke-static {v4, v0}, Lcom/auditude/ads/util/ObjectUtil;->merge(Ljava/util/HashMap;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v0

    .line 358
    invoke-static {v0, p5}, Lcom/auditude/ads/util/ObjectUtil;->merge(Ljava/util/HashMap;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v2

    .line 360
    invoke-virtual {v3}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    .line 362
    instance-of v4, v0, Lcom/auditude/ads/model/tracking/Submission;

    if-eqz v4, :cond_4

    .line 364
    invoke-virtual {v0, p6, v2}, Lcom/auditude/ads/model/tracking/TrackingUrl;->log(ZLjava/util/HashMap;)V

    goto :goto_2

    :cond_2
    move-object v2, v1

    .line 357
    goto :goto_0

    :cond_3
    move-object v0, v1

    goto :goto_1

    .line 368
    :cond_4
    invoke-virtual {v0, p6, v1}, Lcom/auditude/ads/model/tracking/TrackingUrl;->log(ZLjava/util/HashMap;)V

    goto :goto_2
.end method

.method private logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 1

    .prologue
    .line 497
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;Z)V

    .line 498
    return-void
.end method

.method private logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;Z)V
    .locals 4

    .prologue
    .line 502
    if-nez p1, :cond_1

    .line 521
    :cond_0
    return-void

    .line 504
    :cond_1
    invoke-virtual {p1, p2}, Lcom/auditude/ads/model/BaseElement;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v0

    .line 505
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 507
    invoke-virtual {p0}, Lcom/auditude/ads/reporting/ReportingHelper;->currentPodState()Ljava/util/HashMap;

    move-result-object v1

    invoke-static {v1, p3}, Lcom/auditude/ads/util/ObjectUtil;->merge(Ljava/util/HashMap;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v1

    .line 509
    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    .line 511
    instance-of v3, v0, Lcom/auditude/ads/model/tracking/Submission;

    if-eqz v3, :cond_2

    .line 513
    invoke-virtual {v0, p4, v1}, Lcom/auditude/ads/model/tracking/TrackingUrl;->log(ZLjava/util/HashMap;)V

    goto :goto_0

    .line 517
    :cond_2
    const/4 v3, 0x0

    invoke-virtual {v0, p4, v3}, Lcom/auditude/ads/model/tracking/TrackingUrl;->log(ZLjava/util/HashMap;)V

    goto :goto_0
.end method

.method private logSequenceProgress(Lcom/auditude/ads/model/smil/Sequence;Ljava/lang/String;Z)V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 224
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    if-eqz v0, :cond_0

    if-nez p1, :cond_1

    .line 243
    :cond_0
    :goto_0
    return-void

    .line 227
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Sequence;->getSubmissionId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/auditude/ads/model/tracking/Submissions;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v0

    .line 228
    :goto_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_2

    .line 230
    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    .line 231
    instance-of v2, v0, Lcom/auditude/ads/model/tracking/Submission;

    if-eqz v2, :cond_4

    :goto_2
    check-cast v0, Lcom/auditude/ads/model/tracking/Submission;

    move-object v1, v0

    .line 234
    :cond_2
    if-eqz v1, :cond_0

    .line 236
    invoke-direct {p0}, Lcom/auditude/ads/reporting/ReportingHelper;->getSubmissionState()Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Sequence;->getState()Ljava/util/HashMap;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/auditude/ads/util/ObjectUtil;->merge(Ljava/util/HashMap;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v2

    .line 237
    const-string v0, "event"

    invoke-virtual {v2, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    const-string v3, "advancepattern"

    if-eqz p3, :cond_5

    const-string v0, "1"

    :goto_3
    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    const/4 v0, 0x1

    invoke-virtual {v1, v0, v2}, Lcom/auditude/ads/model/tracking/Submission;->log(ZLjava/util/HashMap;)V

    goto :goto_0

    :cond_3
    move-object v0, v1

    .line 227
    goto :goto_1

    :cond_4
    move-object v0, v1

    .line 231
    goto :goto_2

    .line 238
    :cond_5
    const-string v0, "0"

    goto :goto_3
.end method

.method private onAdClick(Lcom/auditude/ads/view/AdViewEvent;)V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 400
    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/model/IAsset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 402
    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/model/IAsset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/Click;

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/model/IAsset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v0

    :goto_0
    check-cast v0, Lcom/auditude/ads/model/Click;

    const-string v2, "click"

    const/4 v3, 0x1

    invoke-direct {p0, v0, v2, v1, v3}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;Z)V

    .line 404
    :cond_0
    return-void

    :cond_1
    move-object v0, v1

    .line 402
    goto :goto_0
.end method

.method private onAdComplete(Lcom/auditude/ads/view/AdViewEvent;)V
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 390
    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 392
    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/Asset;

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    :goto_0
    check-cast v0, Lcom/auditude/ads/model/Asset;

    const-string v2, "complete"

    const/16 v3, 0x64

    const-string v4, "percent"

    invoke-direct {p0, v3, v4}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v3

    invoke-direct {p0, v0, v2, v3}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 393
    invoke-static {v1}, Lcom/auditude/ads/util/AuditudeUtil;->setAssetURI(Ljava/lang/String;)V

    .line 395
    :cond_0
    return-void

    :cond_1
    move-object v0, v1

    .line 392
    goto :goto_0
.end method

.method private onAdError(Lcom/auditude/ads/view/AdViewEvent;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 469
    const/16 v0, 0x190

    .line 470
    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v1

    invoke-interface {v1}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 472
    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v1

    invoke-interface {v1}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v1

    instance-of v1, v1, Lcom/auditude/ads/model/NonLinearAsset;

    if-eqz v1, :cond_2

    .line 474
    const/16 v0, 0x1f4

    move v1, v0

    .line 477
    :goto_0
    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Asset;

    .line 478
    if-eqz v0, :cond_0

    .line 481
    const-string v2, "vasterror"

    invoke-virtual {v0, v2}, Lcom/auditude/ads/model/Asset;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v2

    .line 482
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 484
    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/auditude/ads/util/AuditudeUtil;->setAssetURI(Ljava/lang/String;)V

    .line 485
    invoke-virtual {v2}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 489
    invoke-static {v4}, Lcom/auditude/ads/util/AuditudeUtil;->setAssetURI(Ljava/lang/String;)V

    .line 493
    :cond_0
    return-void

    .line 485
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    .line 487
    const/4 v3, 0x0

    invoke-virtual {v0, v3, v4, v1}, Lcom/auditude/ads/model/tracking/TrackingUrl;->log(ZLjava/util/HashMap;I)V

    goto :goto_1

    :cond_2
    move v1, v0

    goto :goto_0
.end method

.method private onAdProgress(Lcom/auditude/ads/view/AdViewEvent;)V
    .locals 8

    .prologue
    const/4 v0, 0x0

    const/high16 v7, 0x42c80000    # 100.0f

    const/high16 v6, 0x42960000    # 75.0f

    const/high16 v5, 0x42480000    # 50.0f

    const/high16 v4, 0x41c80000    # 25.0f

    .line 416
    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v1

    invoke-interface {v1}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v1

    instance-of v1, v1, Lcom/auditude/ads/model/Asset;

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    :cond_0
    check-cast v0, Lcom/auditude/ads/model/Asset;

    move-object v2, v0

    .line 417
    :goto_0
    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getView()Lcom/auditude/ads/view/IAdView;

    move-result-object v0

    if-nez v0, :cond_3

    .line 465
    :cond_1
    return-void

    :cond_2
    move-object v2, v0

    .line 416
    goto :goto_0

    .line 419
    :cond_3
    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getView()Lcom/auditude/ads/view/IAdView;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/view/IAdView;->getDuration()I

    move-result v0

    .line 420
    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getView()Lcom/auditude/ads/view/IAdView;

    move-result-object v1

    invoke-interface {v1}, Lcom/auditude/ads/view/IAdView;->getPosition()I

    move-result v3

    .line 424
    if-gtz v0, :cond_8

    const/4 v0, 0x0

    move v1, v0

    .line 428
    :goto_1
    cmpg-float v0, v1, v4

    if-gez v0, :cond_9

    .line 430
    const-string v0, "start"

    const/4 v4, 0x0

    const-string v5, "percent"

    invoke-direct {p0, v4, v5}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v4

    invoke-direct {p0, v2, v0, v4}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 449
    :cond_4
    :goto_2
    const-string v0, "progress"

    invoke-virtual {v2, v0}, Lcom/auditude/ads/model/Asset;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v0

    .line 450
    if-eqz v0, :cond_1

    .line 452
    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    .line 454
    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingUrl;->isLogged()Z

    move-result v4

    if-nez v4, :cond_5

    .line 456
    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingUrl;->getOffsetIsPercent()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingUrl;->getOffset()I

    move-result v4

    int-to-float v4, v4

    cmpl-float v4, v1, v4

    if-gez v4, :cond_7

    :cond_6
    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingUrl;->getOffsetIsPercent()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_5

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingUrl;->getOffset()I

    move-result v4

    if-lt v3, v4, :cond_5

    .line 458
    :cond_7
    invoke-virtual {p0}, Lcom/auditude/ads/reporting/ReportingHelper;->currentPodState()Ljava/util/HashMap;

    move-result-object v4

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v5

    const-string v6, "percent"

    invoke-direct {p0, v5, v6}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/auditude/ads/util/ObjectUtil;->merge(Ljava/util/HashMap;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v4

    .line 459
    const/4 v5, 0x1

    invoke-virtual {v0, v5, v4}, Lcom/auditude/ads/model/tracking/TrackingUrl;->log(ZLjava/util/HashMap;)V

    goto :goto_3

    .line 424
    :cond_8
    mul-int/lit8 v1, v3, 0x64

    div-int v0, v1, v0

    int-to-float v0, v0

    move v1, v0

    goto :goto_1

    .line 432
    :cond_9
    cmpl-float v0, v1, v4

    if-ltz v0, :cond_a

    cmpg-float v0, v1, v5

    if-gez v0, :cond_a

    .line 434
    const-string v0, "firstquartile"

    const/16 v4, 0x19

    const-string v5, "percent"

    invoke-direct {p0, v4, v5}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v4

    invoke-direct {p0, v2, v0, v4}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;)V

    goto :goto_2

    .line 436
    :cond_a
    cmpl-float v0, v1, v5

    if-ltz v0, :cond_b

    cmpg-float v0, v1, v6

    if-gez v0, :cond_b

    .line 438
    const-string v0, "midpoint"

    const/16 v4, 0x32

    const-string v5, "percent"

    invoke-direct {p0, v4, v5}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v4

    invoke-direct {p0, v2, v0, v4}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;)V

    goto/16 :goto_2

    .line 440
    :cond_b
    cmpl-float v0, v1, v6

    if-ltz v0, :cond_c

    cmpg-float v0, v1, v7

    if-gez v0, :cond_c

    .line 442
    const-string v0, "thirdquartile"

    const/16 v4, 0x4b

    const-string v5, "percent"

    invoke-direct {p0, v4, v5}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v4

    invoke-direct {p0, v2, v0, v4}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;)V

    goto/16 :goto_2

    .line 444
    :cond_c
    cmpl-float v0, v1, v7

    if-ltz v0, :cond_4

    .line 446
    const-string v0, "complete"

    const/16 v4, 0x64

    const-string v5, "percent"

    invoke-direct {p0, v4, v5}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v4

    invoke-direct {p0, v2, v0, v4}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;)V

    goto/16 :goto_2
.end method

.method private onAdSkip(Lcom/auditude/ads/view/AdViewEvent;)V
    .locals 3

    .prologue
    .line 408
    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 410
    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Asset;

    const-string v1, "skip"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 412
    :cond_0
    return-void
.end method

.method private onAdStart(Lcom/auditude/ads/view/AdViewEvent;)V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 376
    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/Asset;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    :goto_0
    check-cast v0, Lcom/auditude/ads/model/Asset;

    .line 379
    :goto_1
    instance-of v2, v0, Lcom/auditude/ads/model/IOnPageAsset;

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getFormat()Ljava/lang/String;

    move-result-object v2

    const-string v3, "onpage"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 386
    :goto_2
    return-void

    :cond_0
    move-object v0, v1

    .line 376
    goto :goto_0

    :cond_1
    move-object v0, v1

    goto :goto_1

    .line 383
    :cond_2
    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/auditude/ads/util/AuditudeUtil;->setAssetURI(Ljava/lang/String;)V

    .line 384
    const-string v2, "creativeview"

    invoke-direct {p0, v0, v2, v1}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 385
    const-string v1, "start"

    const/4 v2, 0x0

    const-string v3, "percent"

    invoke-direct {p0, v2, v3}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;)V

    goto :goto_2
.end method

.method private onAdViewEvent(Lcom/auditude/ads/view/AdViewEvent;)V
    .locals 2

    .prologue
    .line 597
    if-nez p1, :cond_0

    .line 622
    :goto_0
    return-void

    .line 599
    :cond_0
    invoke-static {}, Lcom/auditude/ads/reporting/ReportingHelper;->$SWITCH_TABLE$com$auditude$ads$view$AdViewEvent$AdViewEventType()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getType()Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 602
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/auditude/ads/reporting/ReportingHelper;->onAdStart(Lcom/auditude/ads/view/AdViewEvent;)V

    goto :goto_0

    .line 605
    :pswitch_2
    invoke-direct {p0, p1}, Lcom/auditude/ads/reporting/ReportingHelper;->onAdProgress(Lcom/auditude/ads/view/AdViewEvent;)V

    goto :goto_0

    .line 608
    :pswitch_3
    invoke-direct {p0, p1}, Lcom/auditude/ads/reporting/ReportingHelper;->onAdComplete(Lcom/auditude/ads/view/AdViewEvent;)V

    goto :goto_0

    .line 611
    :pswitch_4
    invoke-direct {p0, p1}, Lcom/auditude/ads/reporting/ReportingHelper;->onAdClick(Lcom/auditude/ads/view/AdViewEvent;)V

    goto :goto_0

    .line 614
    :pswitch_5
    invoke-direct {p0, p1}, Lcom/auditude/ads/reporting/ReportingHelper;->onAdError(Lcom/auditude/ads/view/AdViewEvent;)V

    goto :goto_0

    .line 617
    :pswitch_6
    invoke-direct {p0, p1}, Lcom/auditude/ads/reporting/ReportingHelper;->onAdSkip(Lcom/auditude/ads/view/AdViewEvent;)V

    goto :goto_0

    .line 599
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_6
    .end packed-switch
.end method

.method private onErrorEvent(Lcom/auditude/ads/event/PlayerErrorEvent;)V
    .locals 3

    .prologue
    .line 549
    iget-object v0, p1, Lcom/auditude/ads/event/PlayerErrorEvent;->exception:Lcom/auditude/ads/exception/PlayerException;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    if-nez v0, :cond_1

    .line 562
    :cond_0
    :goto_0
    return-void

    .line 551
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    const-string v1, "playererror"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/tracking/Submissions;->getSubmissionById(Ljava/lang/String;)Lcom/auditude/ads/model/tracking/Submission;

    move-result-object v0

    .line 552
    if-nez v0, :cond_2

    .line 554
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AdSettings;->getDomain()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/auditude/ads/reporting/ReportingHelper;->getErrorSubmissionUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "playererror"

    invoke-static {v0, v1}, Lcom/auditude/ads/model/tracking/Submission;->newSubmission(Ljava/lang/String;Ljava/lang/String;)Lcom/auditude/ads/model/tracking/Submission;

    move-result-object v0

    .line 558
    :cond_2
    if-eqz v0, :cond_0

    .line 560
    const/4 v1, 0x1

    iget-object v2, p1, Lcom/auditude/ads/event/PlayerErrorEvent;->exception:Lcom/auditude/ads/exception/PlayerException;

    invoke-virtual {v2}, Lcom/auditude/ads/exception/PlayerException;->toParams()Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/auditude/ads/model/tracking/Submission;->log(ZLjava/util/HashMap;)V

    goto :goto_0
.end method

.method private onParBegin(Lcom/auditude/ads/event/SMILEvent;)V
    .locals 1

    .prologue
    .line 214
    invoke-virtual {p1}, Lcom/auditude/ads/event/SMILEvent;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->par:Lcom/auditude/ads/model/smil/Par;

    .line 215
    return-void
.end method

.method private onParEnd(Lcom/auditude/ads/event/SMILEvent;)V
    .locals 1

    .prologue
    .line 219
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->par:Lcom/auditude/ads/model/smil/Par;

    .line 220
    return-void
.end method

.method private onSMILEvent(Lcom/auditude/ads/event/SMILEvent;)V
    .locals 2

    .prologue
    .line 576
    invoke-static {}, Lcom/auditude/ads/reporting/ReportingHelper;->$SWITCH_TABLE$com$auditude$ads$event$SMILEvent$SMILEventType()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/auditude/ads/event/SMILEvent;->getType()Lcom/auditude/ads/event/SMILEvent$SMILEventType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/event/SMILEvent$SMILEventType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 593
    :goto_0
    return-void

    .line 579
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/auditude/ads/reporting/ReportingHelper;->onSequenceBegin(Lcom/auditude/ads/event/SMILEvent;)V

    goto :goto_0

    .line 582
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/auditude/ads/reporting/ReportingHelper;->onSequenceEnd(Lcom/auditude/ads/event/SMILEvent;)V

    goto :goto_0

    .line 585
    :pswitch_2
    invoke-direct {p0, p1}, Lcom/auditude/ads/reporting/ReportingHelper;->onParBegin(Lcom/auditude/ads/event/SMILEvent;)V

    goto :goto_0

    .line 588
    :pswitch_3
    invoke-direct {p0, p1}, Lcom/auditude/ads/reporting/ReportingHelper;->onParEnd(Lcom/auditude/ads/event/SMILEvent;)V

    goto :goto_0

    .line 576
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private onSequenceBegin(Lcom/auditude/ads/event/SMILEvent;)V
    .locals 4

    .prologue
    .line 113
    invoke-virtual {p1}, Lcom/auditude/ads/event/SMILEvent;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    .line 115
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    if-eqz v0, :cond_0

    .line 117
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->getType()Lcom/auditude/ads/model/smil/SmilElementType;

    move-result-object v0

    sget-object v1, Lcom/auditude/ads/model/smil/SmilElementType;->LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    if-eq v0, v1, :cond_1

    .line 122
    new-instance v0, Lcom/auditude/ads/util/TimeoutUtil;

    invoke-direct {v0, p1}, Lcom/auditude/ads/util/TimeoutUtil;-><init>(Ljava/lang/Object;)V

    .line 123
    invoke-virtual {v0, p0}, Lcom/auditude/ads/util/TimeoutUtil;->addTimeoutCompleteListener(Lcom/auditude/ads/util/TimeoutUtil$TimeoutCompleteListener;)V

    .line 125
    iget-object v1, p0, Lcom/auditude/ads/reporting/ReportingHelper;->pendingTimeouts:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 126
    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v2, v3}, Lcom/auditude/ads/util/TimeoutUtil;->Begin(J)V

    .line 135
    :cond_0
    :goto_0
    return-void

    .line 130
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    const-string v1, "start"

    invoke-virtual {p1}, Lcom/auditude/ads/event/SMILEvent;->getAdvancePattern()Z

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/auditude/ads/reporting/ReportingHelper;->logSequenceProgress(Lcom/auditude/ads/model/smil/Sequence;Ljava/lang/String;Z)V

    .line 132
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    const-string v1, "start"

    const/4 v2, 0x0

    const-string v3, "percent"

    invoke-direct {p0, v2, v3}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;)V

    goto :goto_0
.end method

.method private onSequenceEnd(Lcom/auditude/ads/event/SMILEvent;)V
    .locals 4

    .prologue
    .line 181
    invoke-virtual {p1}, Lcom/auditude/ads/event/SMILEvent;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 183
    invoke-virtual {p1}, Lcom/auditude/ads/event/SMILEvent;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v0

    const-string v1, "complete"

    invoke-virtual {p1}, Lcom/auditude/ads/event/SMILEvent;->getAdvancePattern()Z

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/auditude/ads/reporting/ReportingHelper;->logSequenceProgress(Lcom/auditude/ads/model/smil/Sequence;Ljava/lang/String;Z)V

    .line 184
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    const-string v1, "complete"

    const/16 v2, 0x64

    const-string v3, "percent"

    invoke-direct {p0, v2, v3}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 187
    :cond_0
    invoke-virtual {p1}, Lcom/auditude/ads/event/SMILEvent;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v0

    iget-object v1, p0, Lcom/auditude/ads/reporting/ReportingHelper;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    if-ne v0, v1, :cond_1

    .line 189
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    .line 191
    :cond_1
    return-void
.end method


# virtual methods
.method public final currentAdState()Ljava/util/HashMap;
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 108
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->getState()Ljava/util/HashMap;

    move-result-object v0

    :goto_0
    iget-object v2, p0, Lcom/auditude/ads/reporting/ReportingHelper;->par:Lcom/auditude/ads/model/smil/Par;

    if-eqz v2, :cond_0

    iget-object v1, p0, Lcom/auditude/ads/reporting/ReportingHelper;->par:Lcom/auditude/ads/model/smil/Par;

    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Par;->getState()Ljava/util/HashMap;

    move-result-object v1

    :cond_0
    invoke-static {v0, v1}, Lcom/auditude/ads/util/ObjectUtil;->merge(Ljava/util/HashMap;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v0

    return-object v0

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method

.method public final currentPodState()Ljava/util/HashMap;
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 103
    invoke-direct {p0}, Lcom/auditude/ads/reporting/ReportingHelper;->getSubmissionState()Ljava/util/HashMap;

    move-result-object v2

    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->getState()Ljava/util/HashMap;

    move-result-object v0

    :goto_0
    iget-object v3, p0, Lcom/auditude/ads/reporting/ReportingHelper;->par:Lcom/auditude/ads/model/smil/Par;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lcom/auditude/ads/reporting/ReportingHelper;->par:Lcom/auditude/ads/model/smil/Par;

    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Par;->getState()Ljava/util/HashMap;

    move-result-object v1

    :cond_0
    invoke-static {v0, v1}, Lcom/auditude/ads/util/ObjectUtil;->merge(Ljava/util/HashMap;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/auditude/ads/util/ObjectUtil;->merge(Ljava/util/HashMap;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v0

    return-object v0

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method

.method public final dispose()V
    .locals 2

    .prologue
    .line 631
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->api:Lcom/auditude/ads/core/APIBridge;

    const-string v1, "adViewEvent"

    invoke-virtual {v0, v1, p0}, Lcom/auditude/ads/core/APIBridge;->removeEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 632
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->api:Lcom/auditude/ads/core/APIBridge;

    const-string v1, "smilEvent"

    invoke-virtual {v0, v1, p0}, Lcom/auditude/ads/core/APIBridge;->removeEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 633
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->api:Lcom/auditude/ads/core/APIBridge;

    const-string v1, "playerError"

    invoke-virtual {v0, v1, p0}, Lcom/auditude/ads/core/APIBridge;->removeEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 635
    invoke-virtual {p0}, Lcom/auditude/ads/reporting/ReportingHelper;->reset()V

    .line 636
    return-void
.end method

.method public final getSubmissions()Lcom/auditude/ads/model/tracking/Submissions;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    return-object v0
.end method

.method public final init()V
    .locals 1

    .prologue
    .line 65
    iget-boolean v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->isInitialized:Z

    if-nez v0, :cond_0

    .line 67
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->isInitialized:Z

    .line 71
    :cond_0
    invoke-virtual {p0}, Lcom/auditude/ads/reporting/ReportingHelper;->reset()V

    .line 72
    return-void
.end method

.method public onAdClick(Lcom/auditude/ads/model/smil/Ref;)V
    .locals 7

    .prologue
    const/4 v5, 0x0

    .line 265
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPrimaryAsset()Lcom/auditude/ads/model/Asset;

    move-result-object v0

    .line 266
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 268
    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v1

    instance-of v1, v1, Lcom/auditude/ads/model/Click;

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v1

    :goto_0
    check-cast v1, Lcom/auditude/ads/model/Click;

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v2

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v3

    const-string v4, "click"

    const/4 v6, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/Sequence;Lcom/auditude/ads/model/smil/Par;Ljava/lang/String;Ljava/util/HashMap;Z)V

    .line 270
    :cond_0
    return-void

    :cond_1
    move-object v1, v5

    .line 268
    goto :goto_0
.end method

.method public onAdComplete(Lcom/auditude/ads/model/smil/Ref;)V
    .locals 6

    .prologue
    .line 259
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPrimaryAsset()Lcom/auditude/ads/model/Asset;

    move-result-object v1

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v2

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v3

    const-string v4, "complete"

    const/16 v0, 0x64

    const-string v5, "percent"

    invoke-direct {p0, v0, v5}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/Sequence;Lcom/auditude/ads/model/smil/Par;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 260
    return-void
.end method

.method public onAdError(Lcom/auditude/ads/model/smil/Ref;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 305
    if-eqz p1, :cond_3

    .line 307
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPrimaryAsset()Lcom/auditude/ads/model/Asset;

    move-result-object v0

    .line 308
    if-eqz v0, :cond_0

    .line 311
    const-string v1, "vasterror"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/Asset;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v1

    .line 312
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 314
    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/auditude/ads/util/AuditudeUtil;->setAssetURI(Ljava/lang/String;)V

    .line 315
    invoke-virtual {v1}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_4

    .line 319
    invoke-static {v4}, Lcom/auditude/ads/util/AuditudeUtil;->setAssetURI(Ljava/lang/String;)V

    .line 323
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    if-eqz v0, :cond_3

    .line 325
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    const-string v1, "playererror"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/tracking/Submissions;->getSubmissionById(Ljava/lang/String;)Lcom/auditude/ads/model/tracking/Submission;

    move-result-object v0

    .line 326
    if-nez v0, :cond_1

    .line 328
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AdSettings;->getDomain()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/auditude/ads/reporting/ReportingHelper;->getErrorSubmissionUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "playererror"

    invoke-static {v0, v1}, Lcom/auditude/ads/model/tracking/Submission;->newSubmission(Ljava/lang/String;Ljava/lang/String;)Lcom/auditude/ads/model/tracking/Submission;

    move-result-object v0

    .line 330
    :cond_1
    if-eqz v0, :cond_3

    .line 332
    new-instance v1, Lcom/auditude/ads/exception/AssetException;

    const/16 v2, 0x46b

    const-string v3, "asset failed to load"

    invoke-direct {v1, v2, v3}, Lcom/auditude/ads/exception/AssetException;-><init>(ILjava/lang/String;)V

    .line 333
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getAd()Lcom/auditude/ads/model/Ad;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getAd()Lcom/auditude/ads/model/Ad;

    move-result-object v2

    invoke-virtual {v2}, Lcom/auditude/ads/model/Ad;->getID()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/auditude/ads/exception/AssetException;->adId:Ljava/lang/String;

    .line 334
    :cond_2
    const/4 v2, 0x1

    invoke-virtual {v1}, Lcom/auditude/ads/exception/AssetException;->toParams()Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/auditude/ads/model/tracking/Submission;->log(ZLjava/util/HashMap;)V

    .line 339
    :cond_3
    return-void

    .line 315
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    .line 317
    const/4 v2, 0x0

    const/16 v3, 0x190

    invoke-virtual {v0, v2, v4, v3}, Lcom/auditude/ads/model/tracking/TrackingUrl;->log(ZLjava/util/HashMap;I)V

    goto :goto_0
.end method

.method public onAdProgress(Lcom/auditude/ads/model/smil/Ref;II)V
    .locals 7

    .prologue
    const/high16 v6, 0x42c80000    # 100.0f

    const/high16 v5, 0x42960000    # 75.0f

    const/high16 v4, 0x42480000    # 50.0f

    const/high16 v3, 0x41c80000    # 25.0f

    .line 274
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPrimaryAsset()Lcom/auditude/ads/model/Asset;

    move-result-object v1

    .line 275
    if-nez v1, :cond_1

    .line 301
    :cond_0
    :goto_0
    return-void

    .line 280
    :cond_1
    if-gtz p2, :cond_2

    const/4 v0, 0x0

    .line 282
    :goto_1
    cmpg-float v2, v0, v3

    if-gez v2, :cond_3

    .line 284
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v2

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v3

    const-string v4, "start"

    const/4 v0, 0x0

    const-string v5, "percent"

    invoke-direct {p0, v0, v5}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/Sequence;Lcom/auditude/ads/model/smil/Par;Ljava/lang/String;Ljava/util/HashMap;)V

    goto :goto_0

    .line 280
    :cond_2
    mul-int/lit8 v0, p3, 0x64

    div-int/2addr v0, p2

    int-to-float v0, v0

    goto :goto_1

    .line 286
    :cond_3
    cmpl-float v2, v0, v3

    if-ltz v2, :cond_4

    cmpg-float v2, v0, v4

    if-gez v2, :cond_4

    .line 288
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v2

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v3

    const-string v4, "firstquartile"

    const/16 v0, 0x19

    const-string v5, "percent"

    invoke-direct {p0, v0, v5}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/Sequence;Lcom/auditude/ads/model/smil/Par;Ljava/lang/String;Ljava/util/HashMap;)V

    goto :goto_0

    .line 290
    :cond_4
    cmpl-float v2, v0, v4

    if-ltz v2, :cond_5

    cmpg-float v2, v0, v5

    if-gez v2, :cond_5

    .line 291
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v2

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v3

    const-string v4, "midpoint"

    const/16 v0, 0x32

    const-string v5, "percent"

    invoke-direct {p0, v0, v5}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/Sequence;Lcom/auditude/ads/model/smil/Par;Ljava/lang/String;Ljava/util/HashMap;)V

    goto :goto_0

    .line 293
    :cond_5
    cmpl-float v2, v0, v5

    if-ltz v2, :cond_6

    cmpg-float v2, v0, v6

    if-gez v2, :cond_6

    .line 295
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v2

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v3

    const-string v4, "thirdquartile"

    const/16 v0, 0x4b

    const-string v5, "percent"

    invoke-direct {p0, v0, v5}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/Sequence;Lcom/auditude/ads/model/smil/Par;Ljava/lang/String;Ljava/util/HashMap;)V

    goto/16 :goto_0

    .line 297
    :cond_6
    cmpl-float v0, v0, v6

    if-ltz v0, :cond_0

    .line 299
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v2

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v3

    const-string v4, "complete"

    const/16 v0, 0x64

    const-string v5, "percent"

    invoke-direct {p0, v0, v5}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/Sequence;Lcom/auditude/ads/model/smil/Par;Ljava/lang/String;Ljava/util/HashMap;)V

    goto/16 :goto_0
.end method

.method public onAdStart(Lcom/auditude/ads/model/smil/Ref;)V
    .locals 6

    .prologue
    .line 247
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPrimaryAsset()Lcom/auditude/ads/model/Asset;

    move-result-object v1

    .line 249
    instance-of v0, v1, Lcom/auditude/ads/model/IOnPageAsset;

    if-eqz v0, :cond_0

    invoke-virtual {v1}, Lcom/auditude/ads/model/Asset;->getFormat()Ljava/lang/String;

    move-result-object v0

    const-string v2, "onpage"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 255
    :goto_0
    return-void

    .line 253
    :cond_0
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v2

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v3

    const-string v4, "creativeview"

    const/4 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/Sequence;Lcom/auditude/ads/model/smil/Par;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 254
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v2

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v3

    const-string v4, "start"

    const/4 v0, 0x0

    const-string v5, "percent"

    invoke-direct {p0, v0, v5}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/Sequence;Lcom/auditude/ads/model/smil/Par;Ljava/lang/String;Ljava/util/HashMap;)V

    goto :goto_0
.end method

.method public onEvent(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .prologue
    .line 533
    const-string v0, "adViewEvent"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    instance-of v0, p2, Lcom/auditude/ads/view/AdViewEvent;

    if-eqz v0, :cond_1

    .line 535
    check-cast p2, Lcom/auditude/ads/view/AdViewEvent;

    invoke-direct {p0, p2}, Lcom/auditude/ads/reporting/ReportingHelper;->onAdViewEvent(Lcom/auditude/ads/view/AdViewEvent;)V

    .line 545
    :cond_0
    :goto_0
    return-void

    .line 537
    :cond_1
    const-string v0, "smilEvent"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    instance-of v0, p2, Lcom/auditude/ads/event/SMILEvent;

    if-eqz v0, :cond_2

    .line 539
    check-cast p2, Lcom/auditude/ads/event/SMILEvent;

    invoke-direct {p0, p2}, Lcom/auditude/ads/reporting/ReportingHelper;->onSMILEvent(Lcom/auditude/ads/event/SMILEvent;)V

    goto :goto_0

    .line 541
    :cond_2
    const-string v0, "playerError"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    instance-of v0, p2, Lcom/auditude/ads/event/PlayerErrorEvent;

    if-eqz v0, :cond_0

    .line 543
    check-cast p2, Lcom/auditude/ads/event/PlayerErrorEvent;

    invoke-direct {p0, p2}, Lcom/auditude/ads/reporting/ReportingHelper;->onErrorEvent(Lcom/auditude/ads/event/PlayerErrorEvent;)V

    goto :goto_0
.end method

.method public onSequenceBegin(Lcom/auditude/ads/model/smil/Ref;)V
    .locals 1

    .prologue
    .line 139
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 141
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/auditude/ads/reporting/ReportingHelper;->onSequenceBegin(Lcom/auditude/ads/model/smil/Sequence;)V

    .line 143
    :cond_0
    return-void
.end method

.method public onSequenceBegin(Lcom/auditude/ads/model/smil/Sequence;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 147
    if-eqz p1, :cond_0

    .line 149
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Sequence;->getType()Lcom/auditude/ads/model/smil/SmilElementType;

    move-result-object v0

    sget-object v1, Lcom/auditude/ads/model/smil/SmilElementType;->LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    if-eq v0, v1, :cond_1

    .line 151
    const-string v0, "start"

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/auditude/ads/reporting/ReportingHelper;->logSequenceProgress(Lcom/auditude/ads/model/smil/Sequence;Ljava/lang/String;Z)V

    .line 159
    :cond_0
    :goto_0
    return-void

    .line 155
    :cond_1
    const-string v0, "start"

    invoke-direct {p0, p1, v0, v2}, Lcom/auditude/ads/reporting/ReportingHelper;->logSequenceProgress(Lcom/auditude/ads/model/smil/Sequence;Ljava/lang/String;Z)V

    .line 156
    const-string v0, "start"

    const-string v1, "percent"

    invoke-direct {p0, v2, v1}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;)V

    goto :goto_0
.end method

.method public onSequenceEnd(Lcom/auditude/ads/model/smil/Ref;)V
    .locals 1

    .prologue
    .line 195
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 197
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/auditude/ads/reporting/ReportingHelper;->onSequenceEnd(Lcom/auditude/ads/model/smil/Sequence;)V

    .line 199
    :cond_0
    return-void
.end method

.method public onSequenceEnd(Lcom/auditude/ads/model/smil/Sequence;)V
    .locals 3

    .prologue
    .line 203
    if-eqz p1, :cond_0

    .line 205
    const-string v1, "complete"

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Sequence;->getType()Lcom/auditude/ads/model/smil/SmilElementType;

    move-result-object v0

    sget-object v2, Lcom/auditude/ads/model/smil/SmilElementType;->LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    if-ne v0, v2, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-direct {p0, p1, v1, v0}, Lcom/auditude/ads/reporting/ReportingHelper;->logSequenceProgress(Lcom/auditude/ads/model/smil/Sequence;Ljava/lang/String;Z)V

    .line 206
    const-string v0, "complete"

    const/16 v1, 0x64

    const-string v2, "percent"

    invoke-direct {p0, v1, v2}, Lcom/auditude/ads/reporting/ReportingHelper;->getProgressState(ILjava/lang/String;)Ljava/util/HashMap;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/auditude/ads/reporting/ReportingHelper;->logAdTrackingUrl(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 208
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Sequence;->resetTrackingEvents()V

    .line 210
    :cond_0
    return-void

    .line 205
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onTimeoutComplete(Lcom/auditude/ads/util/TimeoutUtil;)V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 163
    if-eqz p1, :cond_1

    .line 165
    invoke-virtual {p1, v1}, Lcom/auditude/ads/util/TimeoutUtil;->addTimeoutCompleteListener(Lcom/auditude/ads/util/TimeoutUtil$TimeoutCompleteListener;)V

    .line 166
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->pendingTimeouts:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 168
    invoke-virtual {p1}, Lcom/auditude/ads/util/TimeoutUtil;->getIsCanceled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/auditude/ads/util/TimeoutUtil;->getData()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/event/SMILEvent;

    if-eqz v0, :cond_0

    .line 170
    invoke-virtual {p1}, Lcom/auditude/ads/util/TimeoutUtil;->getData()Ljava/lang/Object;

    move-result-object v0

    .line 171
    instance-of v2, v0, Lcom/auditude/ads/event/SMILEvent;

    if-eqz v2, :cond_2

    :goto_0
    check-cast v0, Lcom/auditude/ads/event/SMILEvent;

    .line 172
    invoke-virtual {v0}, Lcom/auditude/ads/event/SMILEvent;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v1

    const-string v2, "start"

    invoke-virtual {v0}, Lcom/auditude/ads/event/SMILEvent;->getAdvancePattern()Z

    move-result v0

    invoke-direct {p0, v1, v2, v0}, Lcom/auditude/ads/reporting/ReportingHelper;->logSequenceProgress(Lcom/auditude/ads/model/smil/Sequence;Ljava/lang/String;Z)V

    .line 175
    :cond_0
    invoke-virtual {p1}, Lcom/auditude/ads/util/TimeoutUtil;->dispose()V

    .line 177
    :cond_1
    return-void

    :cond_2
    move-object v0, v1

    .line 171
    goto :goto_0
.end method

.method public final reset()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 76
    iput-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    .line 77
    iput-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    .line 78
    iput-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->par:Lcom/auditude/ads/model/smil/Par;

    .line 80
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->pendingTimeouts:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 88
    iget-object v0, p0, Lcom/auditude/ads/reporting/ReportingHelper;->pendingTimeouts:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 89
    return-void

    .line 80
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/util/TimeoutUtil;

    .line 82
    if-eqz v0, :cond_0

    .line 84
    invoke-virtual {v0}, Lcom/auditude/ads/util/TimeoutUtil;->dispose()V

    goto :goto_0
.end method

.method public final setSubmissions(Lcom/auditude/ads/model/tracking/Submissions;)V
    .locals 0

    .prologue
    .line 98
    iput-object p1, p0, Lcom/auditude/ads/reporting/ReportingHelper;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    .line 99
    return-void
.end method
