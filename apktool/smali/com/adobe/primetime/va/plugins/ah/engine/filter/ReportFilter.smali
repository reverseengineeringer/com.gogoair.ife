.class public Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final CMD_ENABLE_FLUSH_FILTER_TIMER:Ljava/lang/String; = "clock:flush_filter.resume"

.field private static final EVENT_CLOCK_FLUSH_FILTER_TICK:Ljava/lang/String; = "clock:flush_filter.tick"

.field private static final EVENT_CONTEXT_REPORT_AVAILABLE:Ljava/lang/String; = "context:report_available"

.field private static final EVENT_FILTER_REPORT_AVAILABLE:Ljava/lang/String; = "filter:data_available"

.field private static final KEY_REPEAT_COUNT:Ljava/lang/String; = "repeat_count"

.field private static final KEY_REPORT:Ljava/lang/String; = "report"

.field private static final KEY_RESET:Ljava/lang/String; = "reset"

.field private static final PLAY_EVENT_DURATION_THRESHOLD:J = 0xfaL

.field private static final REQ_SESSION_ID:Ljava/lang/String; = "session_id"


# instance fields
.field private _bufferReport:Lcom/adobe/primetime/core/ICallback;

.field private _channel:Lcom/adobe/primetime/core/radio/Channel;

.field private _flushBufferReport:Lcom/adobe/primetime/core/ICallback;

.field private _isBufferingInProgress:Z

.field private _isDestroyed:Z

.field private _logTag:Ljava/lang/String;

.field private _logger:Lcom/adobe/primetime/core/ILogger;

.field private _onClockFlushFilterTick:Lcom/adobe/primetime/core/ICallback;

.field private _onContextReportAvailable:Lcom/adobe/primetime/core/ICallback;

.field private _reportBuffer:Ljava/util/Map;

.field private _tsHistory:Ljava/util/Map;

.field private _workQueue:Lcom/adobe/primetime/core/radio/CommandQueue;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/core/radio/Channel;Lcom/adobe/primetime/core/ILogger;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$1;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$1;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_bufferReport:Lcom/adobe/primetime/core/ICallback;

    .line 143
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$2;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$2;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_flushBufferReport:Lcom/adobe/primetime/core/ICallback;

    .line 218
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$3;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$3;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_onContextReportAvailable:Lcom/adobe/primetime/core/ICallback;

    .line 237
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$4;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$4;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_onClockFlushFilterTick:Lcom/adobe/primetime/core/ICallback;

    .line 63
    if-nez p1, :cond_0

    .line 64
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the channel object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_0
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    .line 68
    if-nez p2, :cond_1

    .line 69
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the logger object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_1
    const-class v0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_logTag:Ljava/lang/String;

    .line 72
    iput-object p2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_logger:Lcom/adobe/primetime/core/ILogger;

    .line 74
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_isDestroyed:Z

    .line 75
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_isBufferingInProgress:Z

    .line 76
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_reportBuffer:Ljava/util/Map;

    .line 77
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_tsHistory:Ljava/util/Map;

    .line 78
    new-instance v0, Lcom/adobe/primetime/core/radio/CommandQueue;

    invoke-direct {v0}, Lcom/adobe/primetime/core/radio/CommandQueue;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_workQueue:Lcom/adobe/primetime/core/radio/CommandQueue;

    .line 80
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_installEventListeners()V

    .line 81
    return-void
.end method

.method private static _filterInBandReports(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 5

    .prologue
    .line 341
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 343
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;

    .line 344
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "play"

    if-eq v3, v4, :cond_1

    .line 345
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "buffer"

    if-eq v3, v4, :cond_1

    .line 346
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "start"

    if-ne v3, v4, :cond_0

    .line 348
    :cond_1
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 351
    :cond_2
    return-object v1
.end method

.method private static _filterPauseReports(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 5

    .prologue
    .line 266
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 268
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;

    .line 269
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "pause"

    if-eq v3, v4, :cond_0

    .line 270
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 274
    :cond_1
    return-object v1
.end method

.method private static _filterPlayReports(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 8

    .prologue
    .line 314
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 316
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;

    .line 317
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "play"

    if-ne v3, v4, :cond_2

    .line 319
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getDuration()J

    move-result-wide v4

    const-wide/16 v6, 0xfa

    cmp-long v3, v4, v6

    if-lez v3, :cond_1

    .line 320
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 324
    :cond_1
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getDuration()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-nez v3, :cond_0

    .line 325
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getAssetData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "main"

    if-ne v3, v4, :cond_0

    .line 328
    invoke-static {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_filterInBandReports(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v3

    .line 329
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v4

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ne v4, v3, :cond_0

    .line 330
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 334
    :cond_2
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 337
    :cond_3
    return-object v1
.end method

.method private static _filterStartReports(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 10

    .prologue
    const-wide/16 v8, -0x1

    const/4 v2, -0x1

    .line 283
    .line 285
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 287
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v1, v2

    move v3, v2

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;

    .line 288
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getType()Ljava/lang/String;

    move-result-object v6

    const-string v7, "start"

    if-ne v6, v7, :cond_3

    .line 289
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getAssetData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getType()Ljava/lang/String;

    move-result-object v6

    const-string v7, "main"

    if-ne v6, v7, :cond_1

    .line 290
    if-ne v3, v2, :cond_0

    .line 291
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 292
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v3, v0, -0x1

    move v0, v1

    move v1, v3

    :goto_1
    move v3, v1

    move v1, v0

    .line 309
    goto :goto_0

    .line 294
    :cond_0
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v6

    invoke-virtual {v6, v8, v9}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setPrevTs(J)V

    .line 295
    invoke-virtual {v4, v3, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move v0, v1

    move v1, v3

    goto :goto_1

    .line 298
    :cond_1
    if-ne v1, v2, :cond_2

    .line 299
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 300
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    move v0, v1

    move v1, v3

    goto :goto_1

    .line 302
    :cond_2
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v6

    invoke-virtual {v6, v8, v9}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setPrevTs(J)V

    .line 303
    invoke-virtual {v4, v1, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move v0, v1

    move v1, v3

    goto :goto_1

    .line 307
    :cond_3
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v0, v1

    move v1, v3

    goto :goto_1

    .line 310
    :cond_4
    return-object v4
.end method

.method private _installEventListeners()V
    .locals 3

    .prologue
    .line 253
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "context:report_available"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_onContextReportAvailable:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 254
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "clock:flush_filter.tick"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_onClockFlushFilterTick:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 255
    return-void
.end method

.method private _uninstallEventListeners()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 258
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    invoke-virtual {v0, v1, v1, p0}, Lcom/adobe/primetime/core/radio/Channel;->off(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 259
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Z
    .locals 1

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_isDestroyed:Z

    return v0
.end method

.method static synthetic access$100(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Ljava/util/Map;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_reportBuffer:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Lcom/adobe/primetime/core/radio/CommandQueue;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_workQueue:Lcom/adobe/primetime/core/radio/CommandQueue;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Lcom/adobe/primetime/core/ICallback;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_flushBufferReport:Lcom/adobe/primetime/core/ICallback;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Z
    .locals 1

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_isBufferingInProgress:Z

    return v0
.end method

.method static synthetic access$202(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;Z)Z
    .locals 0

    .prologue
    .line 36
    iput-boolean p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_isBufferingInProgress:Z

    return p1
.end method

.method static synthetic access$300(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Lcom/adobe/primetime/core/radio/Channel;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    return-object v0
.end method

.method static synthetic access$400(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 36
    invoke-static {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_filterPauseReports(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 36
    invoke-static {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_filterStartReports(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 36
    invoke-static {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_filterPlayReports(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;Ljava/util/ArrayList;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->computePrevTsValues(Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$800(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Ljava/util/Map;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_tsHistory:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$900(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Lcom/adobe/primetime/core/ICallback;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_bufferReport:Lcom/adobe/primetime/core/ICallback;

    return-object v0
.end method

.method private computePrevTsValues(Ljava/util/ArrayList;)V
    .locals 8

    .prologue
    .line 197
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;

    .line 199
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getSessionData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;->getSessionId()Ljava/lang/String;

    move-result-object v2

    .line 201
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_tsHistory:Ljava/util/Map;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 202
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_tsHistory:Ljava/util/Map;

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "."

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 205
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getAssetData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getType()Ljava/lang/String;

    move-result-object v1

    const-string v5, "ad"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 206
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getAssetData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getAdData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->getAdId()Ljava/lang/String;

    move-result-object v1

    .line 207
    :goto_1
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 209
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_tsHistory:Ljava/util/Map;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 210
    invoke-virtual {v1, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 211
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_tsHistory:Ljava/util/Map;

    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setPrevTs(J)V

    .line 214
    :cond_1
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getTs()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v1, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 207
    :cond_2
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getAssetData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getVideoId()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 216
    :cond_3
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .prologue
    .line 87
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_isDestroyed:Z

    if-eqz v0, :cond_0

    .line 99
    :goto_0
    return-void

    .line 91
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_logTag:Ljava/lang/String;

    const-string v2, "#destroy()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_uninstallEventListeners()V

    .line 95
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_workQueue:Lcom/adobe/primetime/core/radio/CommandQueue;

    invoke-virtual {v0}, Lcom/adobe/primetime/core/radio/CommandQueue;->cancelAllCommands()V

    .line 96
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_reportBuffer:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 97
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_tsHistory:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 98
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_isBufferingInProgress:Z

    goto :goto_0
.end method
