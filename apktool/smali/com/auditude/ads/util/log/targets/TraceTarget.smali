.class public Lcom/auditude/ads/util/log/targets/TraceTarget;
.super Lcom/auditude/ads/util/log/targets/AbstractTarget;
.source "SourceFile"


# instance fields
.field public fieldSeparator:Ljava/lang/String;

.field public includeCategory:Ljava/lang/Boolean;

.field public includeDate:Ljava/lang/Boolean;

.field public includeLevel:Ljava/lang/Boolean;

.field public includeTime:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 1

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/auditude/ads/util/log/targets/AbstractTarget;-><init>()V

    .line 30
    const-string v0, " "

    iput-object v0, p0, Lcom/auditude/ads/util/log/targets/TraceTarget;->fieldSeparator:Ljava/lang/String;

    .line 21
    iput-object p1, p0, Lcom/auditude/ads/util/log/targets/TraceTarget;->includeTime:Ljava/lang/Boolean;

    .line 22
    iput-object p2, p0, Lcom/auditude/ads/util/log/targets/TraceTarget;->includeDate:Ljava/lang/Boolean;

    .line 23
    iput-object p3, p0, Lcom/auditude/ads/util/log/targets/TraceTarget;->includeCategory:Ljava/lang/Boolean;

    .line 24
    iput-object p4, p0, Lcom/auditude/ads/util/log/targets/TraceTarget;->includeLevel:Ljava/lang/Boolean;

    .line 25
    return-void
.end method

.method private padTime(ILjava/lang/Boolean;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 121
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 123
    const/16 v0, 0xa

    if-ge p1, v0, :cond_0

    .line 125
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "00"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 138
    :goto_0
    return-object v0

    .line 127
    :cond_0
    const/16 v0, 0x64

    if-ge p1, v0, :cond_1

    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "0"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 133
    :cond_1
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 138
    :cond_2
    const/16 v0, 0x9

    if-le p1, v0, :cond_3

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "0"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public logEvent(Lcom/auditude/ads/util/log/LogEvent;)V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 64
    const-string v0, ""

    .line 65
    iget-object v1, p0, Lcom/auditude/ads/util/log/targets/TraceTarget;->includeDate:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/auditude/ads/util/log/targets/TraceTarget;->includeTime:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 67
    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 68
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 70
    iget-object v2, p0, Lcom/auditude/ads/util/log/targets/TraceTarget;->includeDate:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 73
    const/4 v2, 0x5

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 74
    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/auditude/ads/util/log/targets/TraceTarget;->fieldSeparator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 76
    :cond_1
    iget-object v2, p0, Lcom/auditude/ads/util/log/targets/TraceTarget;->includeTime:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 78
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v0, 0xb

    invoke-virtual {v1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-direct {p0, v0, v3}, Lcom/auditude/ads/util/log/targets/TraceTarget;->padTime(ILjava/lang/Boolean;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 79
    const/16 v2, 0xc

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/auditude/ads/util/log/targets/TraceTarget;->padTime(ILjava/lang/Boolean;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 80
    const/16 v2, 0xd

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/auditude/ads/util/log/targets/TraceTarget;->padTime(ILjava/lang/Boolean;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 81
    const/16 v2, 0xe

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/auditude/ads/util/log/targets/TraceTarget;->padTime(ILjava/lang/Boolean;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/auditude/ads/util/log/targets/TraceTarget;->fieldSeparator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    .line 86
    :goto_0
    invoke-virtual {p1}, Lcom/auditude/ads/util/log/LogEvent;->getOwner()Lcom/auditude/ads/util/event/IEventDispatcher;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/util/log/ILogger;

    invoke-interface {v0}, Lcom/auditude/ads/util/log/ILogger;->getCategory()Ljava/lang/String;

    move-result-object v0

    .line 87
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p1, Lcom/auditude/ads/util/log/LogEvent;->data:Ljava/lang/Object;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 89
    iget-object v2, p1, Lcom/auditude/ads/util/log/LogEvent;->level:Lcom/auditude/ads/util/log/LogLevel;

    invoke-virtual {v2}, Lcom/auditude/ads/util/log/LogLevel;->getVerbosity()I

    move-result v2

    .line 90
    sget-object v3, Lcom/auditude/ads/util/log/LogLevel;->ERROR:Lcom/auditude/ads/util/log/LogLevel;

    invoke-virtual {v3}, Lcom/auditude/ads/util/log/LogLevel;->getVerbosity()I

    move-result v3

    if-ne v2, v3, :cond_2

    .line 92
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    :goto_1
    return-void

    .line 94
    :cond_2
    sget-object v3, Lcom/auditude/ads/util/log/LogLevel;->WARN:Lcom/auditude/ads/util/log/LogLevel;

    invoke-virtual {v3}, Lcom/auditude/ads/util/log/LogLevel;->getVerbosity()I

    move-result v3

    if-ne v2, v3, :cond_3

    .line 96
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 98
    :cond_3
    sget-object v3, Lcom/auditude/ads/util/log/LogLevel;->INFO:Lcom/auditude/ads/util/log/LogLevel;

    invoke-virtual {v3}, Lcom/auditude/ads/util/log/LogLevel;->getVerbosity()I

    move-result v3

    if-ne v2, v3, :cond_4

    .line 100
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 102
    :cond_4
    sget-object v3, Lcom/auditude/ads/util/log/LogLevel;->DEBUG:Lcom/auditude/ads/util/log/LogLevel;

    invoke-virtual {v3}, Lcom/auditude/ads/util/log/LogLevel;->getVerbosity()I

    move-result v3

    if-ne v2, v3, :cond_5

    .line 104
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 106
    :cond_5
    sget-object v3, Lcom/auditude/ads/util/log/LogLevel;->FATAL:Lcom/auditude/ads/util/log/LogLevel;

    invoke-virtual {v3}, Lcom/auditude/ads/util/log/LogLevel;->getVerbosity()I

    move-result v3

    if-ne v2, v3, :cond_6

    .line 108
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 112
    :cond_6
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_7
    move-object v1, v0

    goto :goto_0
.end method
