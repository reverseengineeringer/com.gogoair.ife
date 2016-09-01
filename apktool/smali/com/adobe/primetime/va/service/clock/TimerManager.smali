.class final Lcom/adobe/primetime/va/service/clock/TimerManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/primetime/va/service/clock/TimerManager$TimerHolder;,
        Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;
    }
.end annotation


# static fields
.field private static final REPEAT_FOREVER:I = -0x1

.field static TIMER_BASE_INTERVAL:D


# instance fields
.field private _baseTimer:Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;

.field private _isDestroyed:Z

.field private _logTag:Ljava/lang/String;

.field private _logger:Lcom/adobe/primetime/core/ILogger;

.field private _service:Lcom/adobe/primetime/va/service/clock/ClockService;

.field private _timers:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 31
    const-wide/high16 v0, 0x3fd0000000000000L    # 0.25

    sput-wide v0, Lcom/adobe/primetime/va/service/clock/TimerManager;->TIMER_BASE_INTERVAL:D

    return-void
.end method

.method constructor <init>(Lcom/adobe/primetime/va/service/clock/ClockService;Lcom/adobe/primetime/core/ILogger;)V
    .locals 2

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    if-nez p1, :cond_0

    .line 45
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to ClockService object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_0
    iput-object p1, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_service:Lcom/adobe/primetime/va/service/clock/ClockService;

    .line 49
    if-nez p2, :cond_1

    .line 50
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to logger cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_1
    const-class v0, Lcom/adobe/primetime/va/service/clock/TimerManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_logTag:Ljava/lang/String;

    .line 53
    iput-object p2, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_logger:Lcom/adobe/primetime/core/ILogger;

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_isDestroyed:Z

    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_timers:Ljava/util/Map;

    .line 59
    new-instance v0, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;-><init>(Lcom/adobe/primetime/va/service/clock/TimerManager;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_baseTimer:Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;

    .line 60
    return-void
.end method

.method private _onTick()V
    .locals 11

    .prologue
    .line 164
    iget-boolean v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_isDestroyed:Z

    if-eqz v0, :cond_1

    .line 205
    :cond_0
    :goto_0
    return-void

    .line 166
    :cond_1
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 168
    iget-object v8, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_timers:Ljava/util/Map;

    monitor-enter v8

    .line 169
    :try_start_0
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_timers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_2
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 170
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;

    .line 172
    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->isActive()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 173
    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->shouldTick()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 177
    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->getRepeatCount()I

    move-result v10

    .line 178
    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->getInterval()D

    move-result-wide v2

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    cmpl-double v1, v2, v4

    if-lez v1, :cond_3

    .line 179
    iget-object v1, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v2, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_logTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "#_onTick() > "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 180
    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->getTick()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " | "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->getInterval()D

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " | "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 179
    invoke-interface {v1, v2, v3}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    :cond_3
    if-eqz v10, :cond_4

    .line 185
    new-instance v1, Lcom/adobe/primetime/va/service/clock/TimerManager$TimerHolder;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->getInterval()D

    move-result-wide v4

    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->getTick()I

    move-result v6

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/adobe/primetime/va/service/clock/TimerManager$TimerHolder;-><init>(Lcom/adobe/primetime/va/service/clock/TimerManager;Ljava/lang/String;DI)V

    .line 186
    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 187
    const/4 v1, -0x1

    if-eq v10, v1, :cond_2

    add-int/lit8 v1, v10, -0x1

    invoke-virtual {v0, v10}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->setRepeatCount(I)V

    goto/16 :goto_1

    .line 194
    :catchall_0
    move-exception v0

    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 189
    :cond_4
    :try_start_1
    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/service/clock/TimerManager;->destroyTimer(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 194
    :cond_5
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 197
    if-eqz v7, :cond_0

    .line 198
    const/4 v0, 0x0

    move v1, v0

    :goto_2
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_6

    .line 199
    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/service/clock/TimerManager$TimerHolder;

    .line 200
    iget-object v2, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_service:Lcom/adobe/primetime/va/service/clock/ClockService;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerManager$TimerHolder;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerManager$TimerHolder;->getInterval()D

    move-result-wide v4

    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerManager$TimerHolder;->getTick()I

    move-result v0

    invoke-virtual {v2, v3, v4, v5, v0}, Lcom/adobe/primetime/va/service/clock/ClockService;->onTick(Ljava/lang/String;DI)V

    .line 198
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_2

    .line 203
    :cond_6
    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    goto/16 :goto_0
.end method

.method static synthetic access$000(Lcom/adobe/primetime/va/service/clock/TimerManager;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/primetime/va/service/clock/TimerManager;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/primetime/va/service/clock/TimerManager;)V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/adobe/primetime/va/service/clock/TimerManager;->_onTick()V

    return-void
.end method


# virtual methods
.method protected createTimer(Ljava/lang/String;DI)V
    .locals 4

    .prologue
    .line 97
    iget-object v1, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_timers:Ljava/util/Map;

    monitor-enter v1

    .line 98
    :try_start_0
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_timers:Ljava/util/Map;

    new-instance v2, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;

    invoke-direct {v2, p1, p2, p3, p4}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;-><init>(Ljava/lang/String;DI)V

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    monitor-exit v1

    .line 100
    return-void

    .line 99
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected destroy()V
    .locals 1

    .prologue
    .line 147
    iget-boolean v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_isDestroyed:Z

    if-eqz v0, :cond_0

    .line 153
    :goto_0
    return-void

    .line 148
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_isDestroyed:Z

    .line 150
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_timers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 151
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_baseTimer:Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;->invalidate()V

    .line 152
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_baseTimer:Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;->quit()Z

    goto :goto_0
.end method

.method protected destroyTimer(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 103
    iget-object v1, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_timers:Ljava/util/Map;

    monitor-enter v1

    .line 104
    :try_start_0
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_timers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    monitor-exit v1

    .line 106
    return-void

    .line 105
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected isTimerPaused(Ljava/lang/String;)Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 156
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_timers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;

    .line 157
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->isActive()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method protected pauseTimer(Ljava/lang/String;Z)V
    .locals 5

    .prologue
    .line 128
    iget-object v1, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_timers:Ljava/util/Map;

    monitor-enter v1

    .line 129
    :try_start_0
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v2, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_logTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "#pauseTimer(name="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "reset="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_timers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;

    .line 136
    if-eqz v0, :cond_0

    .line 137
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->isActive(Z)V

    .line 139
    if-eqz p2, :cond_0

    .line 140
    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->reset()V

    .line 143
    :cond_0
    monitor-exit v1

    .line 144
    return-void

    .line 143
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected resumeTimer(Ljava/lang/String;Z)V
    .locals 5

    .prologue
    .line 109
    iget-object v1, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_timers:Ljava/util/Map;

    monitor-enter v1

    .line 110
    :try_start_0
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v2, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_logTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "#resumedTimer(name="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "reset="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager;->_timers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;

    .line 117
    if-eqz v0, :cond_0

    .line 118
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->isActive(Z)V

    .line 120
    if-eqz p2, :cond_0

    .line 121
    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->reset()V

    .line 124
    :cond_0
    monitor-exit v1

    .line 125
    return-void

    .line 124
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
