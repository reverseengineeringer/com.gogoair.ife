.class public Lcom/auditude/ads/util/log/LogLogger;
.super Lcom/auditude/ads/util/event/EventDispatcher;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/util/log/ILogger;


# instance fields
.field private category:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/auditude/ads/util/event/EventDispatcher;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/auditude/ads/util/log/LogLogger;->category:Ljava/lang/String;

    .line 13
    return-void
.end method

.method private getLogData(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    if-nez p1, :cond_0

    const-string p1, ""

    .line 88
    :goto_0
    return-object p1

    .line 87
    :cond_0
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_1

    check-cast p1, Ljava/lang/String;

    goto :goto_0

    .line 88
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method


# virtual methods
.method public debug(Ljava/lang/Object;)V
    .locals 4

    .prologue
    .line 49
    const-string v0, "log"

    new-instance v1, Lcom/auditude/ads/util/log/LogEvent;

    invoke-direct {p0, p1}, Lcom/auditude/ads/util/log/LogLogger;->getLogData(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/auditude/ads/util/log/LogLevel;->DEBUG:Lcom/auditude/ads/util/log/LogLevel;

    invoke-direct {v1, p0, v2, v3}, Lcom/auditude/ads/util/log/LogEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Ljava/lang/Object;Lcom/auditude/ads/util/log/LogLevel;)V

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/util/log/LogLogger;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 50
    return-void
.end method

.method public error(Ljava/lang/Object;)V
    .locals 4

    .prologue
    .line 57
    const-string v0, "log"

    new-instance v1, Lcom/auditude/ads/util/log/LogEvent;

    invoke-direct {p0, p1}, Lcom/auditude/ads/util/log/LogLogger;->getLogData(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/auditude/ads/util/log/LogLevel;->ERROR:Lcom/auditude/ads/util/log/LogLevel;

    invoke-direct {v1, p0, v2, v3}, Lcom/auditude/ads/util/log/LogEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Ljava/lang/Object;Lcom/auditude/ads/util/log/LogLevel;)V

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/util/log/LogLogger;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 58
    return-void
.end method

.method public fatal(Ljava/lang/Object;)V
    .locals 4

    .prologue
    .line 65
    const-string v0, "log"

    new-instance v1, Lcom/auditude/ads/util/log/LogEvent;

    invoke-direct {p0, p1}, Lcom/auditude/ads/util/log/LogLogger;->getLogData(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/auditude/ads/util/log/LogLevel;->FATAL:Lcom/auditude/ads/util/log/LogLevel;

    invoke-direct {v1, p0, v2, v3}, Lcom/auditude/ads/util/log/LogEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Ljava/lang/Object;Lcom/auditude/ads/util/log/LogLevel;)V

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/util/log/LogLogger;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 66
    return-void
.end method

.method public getCategory()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/auditude/ads/util/log/LogLogger;->category:Ljava/lang/String;

    return-object v0
.end method

.method public info(Ljava/lang/Object;)V
    .locals 4

    .prologue
    .line 73
    const-string v0, "log"

    new-instance v1, Lcom/auditude/ads/util/log/LogEvent;

    invoke-direct {p0, p1}, Lcom/auditude/ads/util/log/LogLogger;->getLogData(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/auditude/ads/util/log/LogLevel;->INFO:Lcom/auditude/ads/util/log/LogLevel;

    invoke-direct {v1, p0, v2, v3}, Lcom/auditude/ads/util/log/LogEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Ljava/lang/Object;Lcom/auditude/ads/util/log/LogLevel;)V

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/util/log/LogLogger;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 74
    return-void
.end method

.method public log(Lcom/auditude/ads/util/log/LogLevel;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 35
    invoke-virtual {p1}, Lcom/auditude/ads/util/log/LogLevel;->getVerbosity()I

    move-result v0

    sget-object v1, Lcom/auditude/ads/util/log/LogLevel;->DEBUG:Lcom/auditude/ads/util/log/LogLevel;

    invoke-virtual {v1}, Lcom/auditude/ads/util/log/LogLevel;->getVerbosity()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 37
    const-string v0, "Logging at level ALL is not allowed"

    .line 38
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 41
    :cond_0
    const-string v0, "log"

    new-instance v1, Lcom/auditude/ads/util/log/LogEvent;

    invoke-direct {v1, p0, p2, p1}, Lcom/auditude/ads/util/log/LogEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Ljava/lang/Object;Lcom/auditude/ads/util/log/LogLevel;)V

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/util/log/LogLogger;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 42
    return-void
.end method

.method public warn(Ljava/lang/Object;)V
    .locals 4

    .prologue
    .line 81
    const-string v0, "log"

    new-instance v1, Lcom/auditude/ads/util/log/LogEvent;

    invoke-direct {p0, p1}, Lcom/auditude/ads/util/log/LogLogger;->getLogData(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/auditude/ads/util/log/LogLevel;->WARN:Lcom/auditude/ads/util/log/LogLevel;

    invoke-direct {v1, p0, v2, v3}, Lcom/auditude/ads/util/log/LogEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Ljava/lang/Object;Lcom/auditude/ads/util/log/LogLevel;)V

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/util/log/LogLogger;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 82
    return-void
.end method
