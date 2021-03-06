.class public Lcom/auditude/ads/util/log/Log;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ALL_LOGGER:Ljava/lang/String; = "log.all"

.field private static NONE:I

.field private static loggers:Ljava/util/HashMap;

.field private static targetLevel:I

.field private static targets:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    const v0, 0x7fffffff

    sput v0, Lcom/auditude/ads/util/log/Log;->NONE:I

    .line 20
    sget v0, Lcom/auditude/ads/util/log/Log;->NONE:I

    sput v0, Lcom/auditude/ads/util/log/Log;->targetLevel:I

    .line 30
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addLogger(Ljava/lang/String;Lcom/auditude/ads/util/log/ILogger;)V
    .locals 2

    .prologue
    .line 128
    if-nez p1, :cond_1

    .line 141
    :cond_0
    return-void

    .line 130
    :cond_1
    sget-object v0, Lcom/auditude/ads/util/log/Log;->loggers:Ljava/util/HashMap;

    if-nez v0, :cond_2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/auditude/ads/util/log/Log;->loggers:Ljava/util/HashMap;

    .line 132
    :cond_2
    sget-object v0, Lcom/auditude/ads/util/log/Log;->loggers:Ljava/util/HashMap;

    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    sget-object v0, Lcom/auditude/ads/util/log/Log;->targets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_0

    .line 138
    sget-object v0, Lcom/auditude/ads/util/log/Log;->targets:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/util/log/targets/ILoggingTarget;

    .line 139
    invoke-interface {v0, p1}, Lcom/auditude/ads/util/log/targets/ILoggingTarget;->addLogger(Lcom/auditude/ads/util/log/ILogger;)Lcom/auditude/ads/util/log/ILogger;

    .line 136
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0
.end method

.method public static addTarget(Lcom/auditude/ads/util/log/targets/ILoggingTarget;)V
    .locals 3

    .prologue
    .line 39
    if-eqz p0, :cond_0

    .line 43
    sget-object v0, Lcom/auditude/ads/util/log/Log;->loggers:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 51
    sget-object v0, Lcom/auditude/ads/util/log/Log;->targets:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    sget v0, Lcom/auditude/ads/util/log/Log;->targetLevel:I

    sget v1, Lcom/auditude/ads/util/log/Log;->NONE:I

    if-ne v0, v1, :cond_2

    .line 55
    invoke-interface {p0}, Lcom/auditude/ads/util/log/targets/ILoggingTarget;->getLevel()Lcom/auditude/ads/util/log/LogLevel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/util/log/LogLevel;->getVerbosity()I

    move-result v0

    sput v0, Lcom/auditude/ads/util/log/Log;->targetLevel:I

    .line 62
    :cond_0
    :goto_1
    return-void

    .line 43
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 45
    sget-object v2, Lcom/auditude/ads/util/log/Log;->loggers:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/util/log/ILogger;

    invoke-interface {p0, v0}, Lcom/auditude/ads/util/log/targets/ILoggingTarget;->addLogger(Lcom/auditude/ads/util/log/ILogger;)Lcom/auditude/ads/util/log/ILogger;

    goto :goto_0

    .line 57
    :cond_2
    invoke-interface {p0}, Lcom/auditude/ads/util/log/targets/ILoggingTarget;->getLevel()Lcom/auditude/ads/util/log/LogLevel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/util/log/LogLevel;->getVerbosity()I

    move-result v0

    sget v1, Lcom/auditude/ads/util/log/Log;->targetLevel:I

    if-ge v0, v1, :cond_0

    .line 59
    invoke-interface {p0}, Lcom/auditude/ads/util/log/targets/ILoggingTarget;->getLevel()Lcom/auditude/ads/util/log/LogLevel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/util/log/LogLevel;->getVerbosity()I

    move-result v0

    sput v0, Lcom/auditude/ads/util/log/Log;->targetLevel:I

    goto :goto_1
.end method

.method public static flush()V
    .locals 1

    .prologue
    .line 151
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/auditude/ads/util/log/Log;->loggers:Ljava/util/HashMap;

    .line 152
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/auditude/ads/util/log/Log;->targets:Ljava/util/ArrayList;

    .line 153
    sget v0, Lcom/auditude/ads/util/log/Log;->NONE:I

    sput v0, Lcom/auditude/ads/util/log/Log;->targetLevel:I

    .line 154
    return-void
.end method

.method public static getLogger()Lcom/auditude/ads/util/log/ILogger;
    .locals 1

    .prologue
    .line 92
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v0

    return-object v0
.end method

.method public static getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;
    .locals 1

    .prologue
    .line 112
    sget-object v0, Lcom/auditude/ads/util/log/Log;->loggers:Ljava/util/HashMap;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/auditude/ads/util/log/Log;->loggers:Ljava/util/HashMap;

    .line 115
    :cond_0
    if-nez p0, :cond_1

    const-string p0, "log.all"

    .line 116
    :cond_1
    sget-object v0, Lcom/auditude/ads/util/log/Log;->loggers:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/util/log/ILogger;

    .line 117
    if-nez v0, :cond_2

    .line 119
    new-instance v0, Lcom/auditude/ads/util/log/LogLogger;

    invoke-direct {v0, p0}, Lcom/auditude/ads/util/log/LogLogger;-><init>(Ljava/lang/String;)V

    .line 120
    invoke-static {p0, v0}, Lcom/auditude/ads/util/log/Log;->addLogger(Ljava/lang/String;Lcom/auditude/ads/util/log/ILogger;)V

    .line 123
    :cond_2
    return-object v0
.end method

.method public static removeTarget(Lcom/auditude/ads/util/log/targets/ILoggingTarget;)V
    .locals 3

    .prologue
    .line 71
    if-eqz p0, :cond_0

    .line 74
    sget-object v0, Lcom/auditude/ads/util/log/Log;->loggers:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 79
    sget-object v0, Lcom/auditude/ads/util/log/Log;->targets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_1
    if-gez v0, :cond_2

    .line 86
    invoke-static {}, Lcom/auditude/ads/util/log/Log;->resetTargetLevel()V

    .line 88
    :cond_0
    return-void

    .line 74
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 76
    sget-object v2, Lcom/auditude/ads/util/log/Log;->loggers:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/util/log/ILogger;

    invoke-interface {p0, v0}, Lcom/auditude/ads/util/log/targets/ILoggingTarget;->removeLogger(Lcom/auditude/ads/util/log/ILogger;)V

    goto :goto_0

    .line 81
    :cond_2
    sget-object v1, Lcom/auditude/ads/util/log/Log;->targets:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-ne p0, v1, :cond_3

    .line 83
    sget-object v1, Lcom/auditude/ads/util/log/Log;->targets:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 79
    :cond_3
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method private static resetTargetLevel()V
    .locals 3

    .prologue
    .line 162
    sget v1, Lcom/auditude/ads/util/log/Log;->NONE:I

    .line 163
    const/4 v0, 0x0

    move v2, v1

    move v1, v0

    :goto_0
    sget-object v0, Lcom/auditude/ads/util/log/Log;->targets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v1, v0, :cond_0

    .line 170
    sput v2, Lcom/auditude/ads/util/log/Log;->targetLevel:I

    .line 171
    return-void

    .line 165
    :cond_0
    sget v0, Lcom/auditude/ads/util/log/Log;->NONE:I

    if-eq v2, v0, :cond_1

    sget-object v0, Lcom/auditude/ads/util/log/Log;->targets:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/util/log/targets/ILoggingTarget;

    invoke-interface {v0}, Lcom/auditude/ads/util/log/targets/ILoggingTarget;->getLevel()Lcom/auditude/ads/util/log/LogLevel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/util/log/LogLevel;->getVerbosity()I

    move-result v0

    if-ge v0, v2, :cond_2

    .line 167
    :cond_1
    sget-object v0, Lcom/auditude/ads/util/log/Log;->targets:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/util/log/targets/ILoggingTarget;

    invoke-interface {v0}, Lcom/auditude/ads/util/log/targets/ILoggingTarget;->getLevel()Lcom/auditude/ads/util/log/LogLevel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/util/log/LogLevel;->getVerbosity()I

    move-result v2

    .line 163
    :cond_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0
.end method
