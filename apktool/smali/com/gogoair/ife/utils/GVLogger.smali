.class public Lcom/gogoair/ife/utils/GVLogger;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/mediacore/logging/Logger;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;,
        Lcom/gogoair/ife/utils/GVLogger$RemoteLoggerListener;
    }
.end annotation


# static fields
.field private static final LOG_STRING_FORMAT:Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "GVLogger"

.field private static adobeLogger:Lcom/gogoair/ife/utils/GVLogger;

.field private static ggvLogger:Lcom/gogoair/ife/utils/GVLogger;

.field private static final sdf:Ljava/text/SimpleDateFormat;


# instance fields
.field private final DEFAULT_MAX_ENTRY_COUNT:I

.field private final logEntries:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private maxEntryCount:I

.field private maxVerbosityLevel:Lcom/adobe/mediacore/logging/Logger$Verbosity;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Android-Gogo Entertainment, v1.4.1.006, id:%s, Model:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", OS-ver:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", Message Code: %s, AppData: %s, Description: %s"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/gogoair/ife/utils/GVLogger;->LOG_STRING_FORMAT:Ljava/lang/String;

    .line 50
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "dd/MM/yyyy HH:mm:ss"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/gogoair/ife/utils/GVLogger;->sdf:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    const/16 v1, 0x3e8

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput v1, p0, Lcom/gogoair/ife/utils/GVLogger;->DEFAULT_MAX_ENTRY_COUNT:I

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/gogoair/ife/utils/GVLogger;->logEntries:Ljava/util/List;

    .line 46
    iput v1, p0, Lcom/gogoair/ife/utils/GVLogger;->maxEntryCount:I

    .line 48
    sget-object v0, Lcom/adobe/mediacore/logging/Logger$Verbosity;->DEBUG:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    iput-object v0, p0, Lcom/gogoair/ife/utils/GVLogger;->maxVerbosityLevel:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    .line 58
    return-void
.end method

.method private addEntry(Lcom/adobe/mediacore/logging/LogEntry;)V
    .locals 2

    .prologue
    .line 298
    iget-object v0, p0, Lcom/gogoair/ife/utils/GVLogger;->logEntries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget v1, p0, Lcom/gogoair/ife/utils/GVLogger;->maxEntryCount:I

    if-lt v0, v1, :cond_0

    .line 299
    iget-object v0, p0, Lcom/gogoair/ife/utils/GVLogger;->logEntries:Ljava/util/List;

    iget-object v1, p0, Lcom/gogoair/ife/utils/GVLogger;->logEntries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 302
    :cond_0
    iget-object v0, p0, Lcom/gogoair/ife/utils/GVLogger;->logEntries:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 303
    return-void
.end method

.method public static declared-synchronized getAdobeLogger()Lcom/gogoair/ife/utils/GVLogger;
    .locals 2

    .prologue
    .line 68
    const-class v1, Lcom/gogoair/ife/utils/GVLogger;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/gogoair/ife/utils/GVLogger;->adobeLogger:Lcom/gogoair/ife/utils/GVLogger;

    if-nez v0, :cond_0

    .line 69
    new-instance v0, Lcom/gogoair/ife/utils/GVLogger;

    invoke-direct {v0}, Lcom/gogoair/ife/utils/GVLogger;-><init>()V

    sput-object v0, Lcom/gogoair/ife/utils/GVLogger;->adobeLogger:Lcom/gogoair/ife/utils/GVLogger;

    .line 71
    :cond_0
    sget-object v0, Lcom/gogoair/ife/utils/GVLogger;->adobeLogger:Lcom/gogoair/ife/utils/GVLogger;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 68
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;
    .locals 2

    .prologue
    .line 61
    const-class v1, Lcom/gogoair/ife/utils/GVLogger;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/gogoair/ife/utils/GVLogger;->ggvLogger:Lcom/gogoair/ife/utils/GVLogger;

    if-nez v0, :cond_0

    .line 62
    new-instance v0, Lcom/gogoair/ife/utils/GVLogger;

    invoke-direct {v0}, Lcom/gogoair/ife/utils/GVLogger;-><init>()V

    sput-object v0, Lcom/gogoair/ife/utils/GVLogger;->ggvLogger:Lcom/gogoair/ife/utils/GVLogger;

    .line 64
    :cond_0
    sget-object v0, Lcom/gogoair/ife/utils/GVLogger;->ggvLogger:Lcom/gogoair/ife/utils/GVLogger;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 61
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private now()Ljava/lang/String;
    .locals 2

    .prologue
    .line 293
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 294
    sget-object v1, Lcom/gogoair/ife/utils/GVLogger;->sdf:Ljava/text/SimpleDateFormat;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lcom/gogoair/ife/utils/GVLogger;->logEntries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 231
    return-void
.end method

.method public d(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 244
    iget-object v0, p0, Lcom/gogoair/ife/utils/GVLogger;->maxVerbosityLevel:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-virtual {v0}, Lcom/adobe/mediacore/logging/Logger$Verbosity;->getLevel()I

    move-result v0

    sget-object v1, Lcom/adobe/mediacore/logging/Logger$Verbosity;->DEBUG:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-virtual {v1}, Lcom/adobe/mediacore/logging/Logger$Verbosity;->getLevel()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 249
    :goto_0
    return-void

    .line 247
    :cond_0
    new-instance v0, Lcom/adobe/mediacore/logging/LogEntry;

    invoke-direct {p0}, Lcom/gogoair/ife/utils/GVLogger;->now()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/adobe/mediacore/logging/Logger$Verbosity;->DEBUG:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-direct {v0, v1, p2, v2, p1}, Lcom/adobe/mediacore/logging/LogEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/mediacore/logging/Logger$Verbosity;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/gogoair/ife/utils/GVLogger;->addEntry(Lcom/adobe/mediacore/logging/LogEntry;)V

    .line 248
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 271
    iget-object v0, p0, Lcom/gogoair/ife/utils/GVLogger;->maxVerbosityLevel:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-virtual {v0}, Lcom/adobe/mediacore/logging/Logger$Verbosity;->getLevel()I

    move-result v0

    sget-object v1, Lcom/adobe/mediacore/logging/Logger$Verbosity;->ERROR:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-virtual {v1}, Lcom/adobe/mediacore/logging/Logger$Verbosity;->getLevel()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 276
    :goto_0
    return-void

    .line 274
    :cond_0
    new-instance v0, Lcom/adobe/mediacore/logging/LogEntry;

    invoke-direct {p0}, Lcom/gogoair/ife/utils/GVLogger;->now()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/adobe/mediacore/logging/Logger$Verbosity;->ERROR:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-direct {v0, v1, p2, v2, p1}, Lcom/adobe/mediacore/logging/LogEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/mediacore/logging/Logger$Verbosity;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/gogoair/ife/utils/GVLogger;->addEntry(Lcom/adobe/mediacore/logging/LogEntry;)V

    .line 275
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 3

    .prologue
    .line 280
    iget-object v0, p0, Lcom/gogoair/ife/utils/GVLogger;->maxVerbosityLevel:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-virtual {v0}, Lcom/adobe/mediacore/logging/Logger$Verbosity;->getLevel()I

    move-result v0

    sget-object v1, Lcom/adobe/mediacore/logging/Logger$Verbosity;->ERROR:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-virtual {v1}, Lcom/adobe/mediacore/logging/Logger$Verbosity;->getLevel()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 285
    :goto_0
    return-void

    .line 283
    :cond_0
    new-instance v0, Lcom/adobe/mediacore/logging/LogEntry;

    invoke-direct {p0}, Lcom/gogoair/ife/utils/GVLogger;->now()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/adobe/mediacore/logging/Logger$Verbosity;->ERROR:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-direct {v0, v1, p2, v2, p1}, Lcom/adobe/mediacore/logging/LogEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/mediacore/logging/Logger$Verbosity;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/gogoair/ife/utils/GVLogger;->addEntry(Lcom/adobe/mediacore/logging/LogEntry;)V

    .line 284
    invoke-static {p1, p2, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public getEntries()Ljava/util/List;
    .locals 2

    .prologue
    .line 222
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 223
    iget-object v1, p0, Lcom/gogoair/ife/utils/GVLogger;->logEntries:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 225
    return-object v0
.end method

.method public i(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 235
    iget-object v0, p0, Lcom/gogoair/ife/utils/GVLogger;->maxVerbosityLevel:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-virtual {v0}, Lcom/adobe/mediacore/logging/Logger$Verbosity;->getLevel()I

    move-result v0

    sget-object v1, Lcom/adobe/mediacore/logging/Logger$Verbosity;->INFO:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-virtual {v1}, Lcom/adobe/mediacore/logging/Logger$Verbosity;->getLevel()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 240
    :goto_0
    return-void

    .line 238
    :cond_0
    new-instance v0, Lcom/adobe/mediacore/logging/LogEntry;

    invoke-direct {p0}, Lcom/gogoair/ife/utils/GVLogger;->now()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/adobe/mediacore/logging/Logger$Verbosity;->INFO:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-direct {v0, v1, p2, v2, p1}, Lcom/adobe/mediacore/logging/LogEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/mediacore/logging/Logger$Verbosity;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/gogoair/ife/utils/GVLogger;->addEntry(Lcom/adobe/mediacore/logging/LogEntry;)V

    .line 239
    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public logASP(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 75
    sget-object v0, Lcom/gogoair/ife/utils/GVLogger;->LOG_STRING_FORMAT:Ljava/lang/String;

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {}, Lcom/gogoair/ife/gogo_vision/GVApplication;->getMacAddress()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    const-string v2, "41%02d%04d"

    new-array v3, v7, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v6

    aput-object p4, v1, v7

    const/4 v2, 0x3

    aput-object p5, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 77
    invoke-static {}, Lcom/gogoair/ife/utils/GVNetworkManager;->getCurrentNetwork()Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    move-result-object v1

    sget-object v2, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->in_air:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    if-ne v1, v2, :cond_0

    .line 78
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "destination=logService&type=player&level="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&msg="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 79
    new-instance v1, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;

    const-string v2, "GET"

    invoke-direct {v1, p0, v2, v0}, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;-><init>(Lcom/gogoair/ife/utils/GVLogger;Ljava/lang/String;Ljava/lang/String;)V

    new-array v0, v6, [Ljava/lang/String;

    const-string v2, "http://airbornemedia.gogoinflight.com/asp/api/log"

    aput-object v2, v0, v5

    invoke-virtual {v1, v0}, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 81
    :cond_0
    return-void
.end method

.method public logAccountingGrade(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;)V
    .locals 7
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v6, 0x1

    .line 85
    new-instance v0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;

    const-string v2, "POST"

    new-instance v3, Lcom/gogoair/ife/utils/GVLogger$1;

    invoke-direct {v3, p0, p4, p1}, Lcom/gogoair/ife/utils/GVLogger$1;-><init>(Lcom/gogoair/ife/utils/GVLogger;Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;Landroid/content/Context;)V

    .line 124
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    move-object v1, p0

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;-><init>(Lcom/gogoair/ife/utils/GVLogger;Ljava/lang/String;Lcom/gogoair/ife/utils/GVLogger$RemoteLoggerListener;Ljava/lang/Boolean;Ljava/lang/String;)V

    new-array v1, v6, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p3, v1, v2

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 125
    return-void
.end method

.method public setCapacity(I)V
    .locals 0

    .prologue
    .line 217
    iput p1, p0, Lcom/gogoair/ife/utils/GVLogger;->maxEntryCount:I

    .line 218
    return-void
.end method

.method public setVerbosityLevel(Lcom/adobe/mediacore/logging/Logger$Verbosity;)V
    .locals 0

    .prologue
    .line 289
    iput-object p1, p0, Lcom/gogoair/ife/utils/GVLogger;->maxVerbosityLevel:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    .line 290
    return-void
.end method

.method public w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 253
    iget-object v0, p0, Lcom/gogoair/ife/utils/GVLogger;->maxVerbosityLevel:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-virtual {v0}, Lcom/adobe/mediacore/logging/Logger$Verbosity;->getLevel()I

    move-result v0

    sget-object v1, Lcom/adobe/mediacore/logging/Logger$Verbosity;->WARN:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-virtual {v1}, Lcom/adobe/mediacore/logging/Logger$Verbosity;->getLevel()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 258
    :goto_0
    return-void

    .line 256
    :cond_0
    new-instance v0, Lcom/adobe/mediacore/logging/LogEntry;

    invoke-direct {p0}, Lcom/gogoair/ife/utils/GVLogger;->now()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/adobe/mediacore/logging/Logger$Verbosity;->WARN:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-direct {v0, v1, p2, v2, p1}, Lcom/adobe/mediacore/logging/LogEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/mediacore/logging/Logger$Verbosity;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/gogoair/ife/utils/GVLogger;->addEntry(Lcom/adobe/mediacore/logging/LogEntry;)V

    .line 257
    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 3

    .prologue
    .line 262
    iget-object v0, p0, Lcom/gogoair/ife/utils/GVLogger;->maxVerbosityLevel:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-virtual {v0}, Lcom/adobe/mediacore/logging/Logger$Verbosity;->getLevel()I

    move-result v0

    sget-object v1, Lcom/adobe/mediacore/logging/Logger$Verbosity;->WARN:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-virtual {v1}, Lcom/adobe/mediacore/logging/Logger$Verbosity;->getLevel()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 267
    :goto_0
    return-void

    .line 265
    :cond_0
    new-instance v0, Lcom/adobe/mediacore/logging/LogEntry;

    invoke-direct {p0}, Lcom/gogoair/ife/utils/GVLogger;->now()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/adobe/mediacore/logging/Logger$Verbosity;->WARN:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-direct {v0, v1, p2, v2, p1}, Lcom/adobe/mediacore/logging/LogEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/mediacore/logging/Logger$Verbosity;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/gogoair/ife/utils/GVLogger;->addEntry(Lcom/adobe/mediacore/logging/LogEntry;)V

    .line 266
    invoke-static {p1, p2, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
