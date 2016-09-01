.class final Lcom/adobe/primetime/va/service/clock/TimerDescriptor;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private _createdTimeStamp:J

.field private _interval:D

.field private _isActive:Z

.field private _name:Ljava/lang/String;

.field private _nextTickTimeStamp:J

.field private _repeatCount:I

.field private _tick:I


# direct methods
.method constructor <init>(Ljava/lang/String;DI)V
    .locals 2

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-wide p2, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_interval:D

    .line 35
    iput-object p1, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_name:Ljava/lang/String;

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_isActive:Z

    .line 37
    iput p4, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_repeatCount:I

    .line 39
    invoke-virtual {p0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->reset()V

    .line 40
    return-void
.end method

.method private _updateNextTickTimeStamp()V
    .locals 6

    .prologue
    .line 88
    iget-wide v0, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_createdTimeStamp:J

    iget-wide v2, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_interval:D

    const-wide v4, 0x408f400000000000L    # 1000.0

    mul-double/2addr v2, v4

    iget v4, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_tick:I

    add-int/lit8 v4, v4, 0x1

    int-to-double v4, v4

    mul-double/2addr v2, v4

    double-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_nextTickTimeStamp:J

    .line 89
    return-void
.end method


# virtual methods
.method public getInterval()D
    .locals 2

    .prologue
    .line 59
    iget-wide v0, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_interval:D

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public getRepeatCount()I
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_repeatCount:I

    return v0
.end method

.method public getTick()I
    .locals 1

    .prologue
    .line 67
    iget v0, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_tick:I

    return v0
.end method

.method public isActive(Z)V
    .locals 0

    .prologue
    .line 55
    iput-boolean p1, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_isActive:Z

    .line 56
    return-void
.end method

.method public isActive()Z
    .locals 1

    .prologue
    .line 51
    iget-boolean v0, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_isActive:Z

    return v0
.end method

.method public reset()V
    .locals 2

    .prologue
    .line 71
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_tick:I

    .line 72
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_createdTimeStamp:J

    .line 73
    invoke-direct {p0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_updateNextTickTimeStamp()V

    .line 74
    return-void
.end method

.method public setRepeatCount(I)V
    .locals 0

    .prologue
    .line 47
    iput p1, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_repeatCount:I

    .line 48
    return-void
.end method

.method public shouldTick()Z
    .locals 8

    .prologue
    .line 77
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    .line 78
    long-to-double v0, v0

    iget-wide v2, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_nextTickTimeStamp:J

    long-to-double v2, v2

    sget-wide v4, Lcom/adobe/primetime/va/service/clock/TimerManager;->TIMER_BASE_INTERVAL:D

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    div-double/2addr v4, v6

    sub-double/2addr v2, v4

    cmpl-double v0, v0, v2

    if-lez v0, :cond_0

    .line 79
    iget v0, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_tick:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_tick:I

    .line 80
    invoke-direct {p0}, Lcom/adobe/primetime/va/service/clock/TimerDescriptor;->_updateNextTickTimeStamp()V

    .line 81
    const/4 v0, 0x1

    .line 84
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
