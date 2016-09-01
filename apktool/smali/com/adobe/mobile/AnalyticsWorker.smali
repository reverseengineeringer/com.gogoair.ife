.class final Lcom/adobe/mobile/AnalyticsWorker;
.super Lcom/adobe/mobile/AbstractDatabaseBacking;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/mobile/AnalyticsWorker$ReferrerTimeoutTask;,
        Lcom/adobe/mobile/AnalyticsWorker$Hit;,
        Lcom/adobe/mobile/AnalyticsWorker$WorkerThreadRunner;
    }
.end annotation


# static fields
.field private static final CONNECTION_TIMEOUT_MSEC:I = 0x1388

.field private static final TIMESTAMP_DISABLED_WAIT_THRESHOLD:I = 0x3c

.field private static _instance:Lcom/adobe/mobile/AnalyticsWorker;

.field private static final _instanceMutex:Ljava/lang/Object;

.field private static volatile analyticsGetBaseURL_pred:Z

.field private static final backgroundMutex:Ljava/lang/Object;

.field private static baseURL:Ljava/lang/String;

.field private static bgThreadActive:Z

.field private static networkAvailable:Z

.field private static final randomGen:Ljava/security/SecureRandom;

.field private static final referrerTimerMutex:Ljava/lang/Object;


# instance fields
.field private _preparedInsertStatement:Landroid/database/sqlite/SQLiteStatement;

.field private lastHitTimestamp:J

.field private numberOfUnsentHits:J

.field private referrerTask:Ljava/util/TimerTask;

.field private referrerTimer:Ljava/util/Timer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 47
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    sput-object v0, Lcom/adobe/mobile/AnalyticsWorker;->randomGen:Ljava/security/SecureRandom;

    .line 48
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/adobe/mobile/AnalyticsWorker;->backgroundMutex:Ljava/lang/Object;

    .line 49
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/adobe/mobile/AnalyticsWorker;->referrerTimerMutex:Ljava/lang/Object;

    .line 50
    sput-boolean v1, Lcom/adobe/mobile/AnalyticsWorker;->networkAvailable:Z

    .line 64
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/mobile/AnalyticsWorker;->_instance:Lcom/adobe/mobile/AnalyticsWorker;

    .line 65
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/adobe/mobile/AnalyticsWorker;->_instanceMutex:Ljava/lang/Object;

    .line 247
    sput-boolean v1, Lcom/adobe/mobile/AnalyticsWorker;->bgThreadActive:Z

    .line 383
    const/4 v0, 0x1

    sput-boolean v0, Lcom/adobe/mobile/AnalyticsWorker;->analyticsGetBaseURL_pred:Z

    return-void
.end method

.method protected constructor <init>()V
    .locals 3

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/adobe/mobile/AbstractDatabaseBacking;-><init>()V

    .line 57
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->_preparedInsertStatement:Landroid/database/sqlite/SQLiteStatement;

    .line 77
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->lastHitTimestamp:J

    .line 78
    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getCacheDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "ADBMobileDataCache.sqlite"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/adobe/mobile/AnalyticsWorker;->initDatabaseBacking(Ljava/io/File;)V

    .line 80
    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->isWearableApp()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 82
    const/4 v0, 0x1

    sput-boolean v0, Lcom/adobe/mobile/AnalyticsWorker;->networkAvailable:Z

    .line 86
    :goto_0
    invoke-virtual {p0}, Lcom/adobe/mobile/AnalyticsWorker;->getTrackingQueueSize()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->numberOfUnsentHits:J

    .line 87
    return-void

    .line 84
    :cond_0
    invoke-virtual {p0}, Lcom/adobe/mobile/AnalyticsWorker;->startNotifier()V

    goto :goto_0
.end method

.method static synthetic access$000()Z
    .locals 1

    .prologue
    .line 37
    sget-boolean v0, Lcom/adobe/mobile/AnalyticsWorker;->networkAvailable:Z

    return v0
.end method

.method static synthetic access$002(Z)Z
    .locals 0

    .prologue
    .line 37
    sput-boolean p0, Lcom/adobe/mobile/AnalyticsWorker;->networkAvailable:Z

    return p0
.end method

.method static synthetic access$100(Lcom/adobe/mobile/AnalyticsWorker;)Lcom/adobe/mobile/AnalyticsWorker$Hit;
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/adobe/mobile/AnalyticsWorker;->getFirstHitInQueue()Lcom/adobe/mobile/AnalyticsWorker$Hit;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/mobile/AnalyticsWorker;)J
    .locals 2

    .prologue
    .line 37
    iget-wide v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->lastHitTimestamp:J

    return-wide v0
.end method

.method static synthetic access$202(Lcom/adobe/mobile/AnalyticsWorker;J)J
    .locals 1

    .prologue
    .line 37
    iput-wide p1, p0, Lcom/adobe/mobile/AnalyticsWorker;->lastHitTimestamp:J

    return-wide p1
.end method

.method static synthetic access$300(Lcom/adobe/mobile/AnalyticsWorker;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/mobile/AbstractDatabaseBacking$CorruptedDatabaseException;
        }
    .end annotation

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/adobe/mobile/AnalyticsWorker;->deleteHit(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    invoke-static {}, Lcom/adobe/mobile/AnalyticsWorker;->getBaseURL()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500()Ljava/security/SecureRandom;
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lcom/adobe/mobile/AnalyticsWorker;->randomGen:Ljava/security/SecureRandom;

    return-object v0
.end method

.method static synthetic access$602(Z)Z
    .locals 0

    .prologue
    .line 37
    sput-boolean p0, Lcom/adobe/mobile/AnalyticsWorker;->bgThreadActive:Z

    return p0
.end method

.method private bringOnline()V
    .locals 4

    .prologue
    .line 370
    sget-boolean v0, Lcom/adobe/mobile/AnalyticsWorker;->bgThreadActive:Z

    if-nez v0, :cond_0

    .line 372
    const/4 v0, 0x1

    sput-boolean v0, Lcom/adobe/mobile/AnalyticsWorker;->bgThreadActive:Z

    .line 373
    sget-object v1, Lcom/adobe/mobile/AnalyticsWorker;->backgroundMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 374
    :try_start_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v2, Lcom/adobe/mobile/AnalyticsWorker$WorkerThreadRunner;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/adobe/mobile/AnalyticsWorker$WorkerThreadRunner;-><init>(Lcom/adobe/mobile/AnalyticsWorker$1;)V

    invoke-direct {v0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 375
    monitor-exit v1

    .line 377
    :cond_0
    return-void

    .line 375
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private deleteHit(Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/mobile/AbstractDatabaseBacking$CorruptedDatabaseException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 459
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 460
    :cond_0
    const-string v0, "Analytics - Unable to delete hit due to an invalid parameter"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/adobe/mobile/StaticMethods;->logDebugFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 481
    :goto_0
    return-void

    .line 464
    :cond_1
    iget-object v1, p0, Lcom/adobe/mobile/AnalyticsWorker;->dbMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 466
    :try_start_0
    iget-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->database:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "HITS"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ID="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 467
    iget-wide v2, p0, Lcom/adobe/mobile/AnalyticsWorker;->numberOfUnsentHits:J

    const-wide/16 v4, 0x1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lcom/adobe/mobile/AnalyticsWorker;->numberOfUnsentHits:J
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 480
    :goto_1
    :try_start_1
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 469
    :catch_0
    move-exception v0

    .line 470
    :try_start_2
    const-string v2, "Analytics - Unable to delete hit due to an unopened database (%s)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1

    .line 472
    :catch_1
    move-exception v0

    .line 473
    const-string v2, "Analytics - Unable to delete hit due to a sql error (%s)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Landroid/database/SQLException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 474
    new-instance v2, Lcom/adobe/mobile/AbstractDatabaseBacking$CorruptedDatabaseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to delete, database probably corrupted ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/database/SQLException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ")"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/adobe/mobile/AbstractDatabaseBacking$CorruptedDatabaseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 476
    :catch_2
    move-exception v0

    .line 477
    const-string v2, "Analytics - Unable to delete hit due to an unexpected error (%s)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 478
    new-instance v2, Lcom/adobe/mobile/AbstractDatabaseBacking$CorruptedDatabaseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected exception, database probably corrupted ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ")"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/adobe/mobile/AbstractDatabaseBacking$CorruptedDatabaseException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method

.method private static getBaseURL()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 385
    sget-boolean v0, Lcom/adobe/mobile/AnalyticsWorker;->analyticsGetBaseURL_pred:Z

    if-eqz v0, :cond_0

    .line 386
    sput-boolean v3, Lcom/adobe/mobile/AnalyticsWorker;->analyticsGetBaseURL_pred:Z

    .line 388
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/adobe/mobile/MobileConfig;->getInstance()Lcom/adobe/mobile/MobileConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mobile/MobileConfig;->getSSL()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "https://"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 389
    invoke-static {}, Lcom/adobe/mobile/MobileConfig;->getInstance()Lcom/adobe/mobile/MobileConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/mobile/MobileConfig;->getTrackingServer()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/b/ss/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 390
    invoke-static {}, Lcom/adobe/mobile/MobileConfig;->getInstance()Lcom/adobe/mobile/MobileConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/mobile/MobileConfig;->getReportSuiteIds()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mobile/StaticMethods;->URLEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/0/JAVA-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "4.5.3-AN"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/s"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/mobile/AnalyticsWorker;->baseURL:Ljava/lang/String;

    .line 393
    const-string v0, "Analytics - Setting base request URL(%s)"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    sget-object v2, Lcom/adobe/mobile/AnalyticsWorker;->baseURL:Ljava/lang/String;

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/adobe/mobile/StaticMethods;->logDebugFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 396
    :cond_0
    sget-object v0, Lcom/adobe/mobile/AnalyticsWorker;->baseURL:Ljava/lang/String;

    return-object v0

    .line 388
    :cond_1
    const-string v0, "http://"

    goto :goto_0
.end method

.method private getFirstHitInQueue()Lcom/adobe/mobile/AnalyticsWorker$Hit;
    .locals 11

    .prologue
    const/4 v9, 0x0

    .line 484
    .line 486
    iget-object v10, p0, Lcom/adobe/mobile/AnalyticsWorker;->dbMutex:Ljava/lang/Object;

    monitor-enter v10

    .line 491
    :try_start_0
    iget-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->database:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "HITS"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "ID"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "URL"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "TIMESTAMP"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "ID ASC"

    const-string v8, "1"

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v1

    .line 493
    :try_start_1
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 494
    new-instance v2, Lcom/adobe/mobile/AnalyticsWorker$Hit;

    invoke-direct {v2}, Lcom/adobe/mobile/AnalyticsWorker$Hit;-><init>()V
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 497
    const/4 v0, 0x0

    :try_start_2
    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/adobe/mobile/AnalyticsWorker$Hit;->identifier:Ljava/lang/String;

    .line 498
    const/4 v0, 0x1

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/adobe/mobile/AnalyticsWorker$Hit;->urlFragment:Ljava/lang/String;

    .line 499
    const/4 v0, 0x2

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    iput-wide v4, v2, Lcom/adobe/mobile/AnalyticsWorker$Hit;->timestamp:J
    :try_end_2
    .catch Landroid/database/SQLException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-object v9, v2

    .line 511
    :cond_0
    if-eqz v1, :cond_1

    .line 512
    :try_start_3
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 515
    :cond_1
    :goto_0
    monitor-exit v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 516
    return-object v9

    .line 502
    :catch_0
    move-exception v0

    move-object v1, v9

    .line 504
    :goto_1
    :try_start_4
    const-string v2, "Analytics - Unable to read from database (%s)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 511
    if-eqz v1, :cond_1

    .line 512
    :try_start_5
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 515
    :catchall_0
    move-exception v0

    monitor-exit v10
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v0

    .line 506
    :catch_1
    move-exception v0

    move-object v2, v9

    .line 508
    :goto_2
    :try_start_6
    const-string v1, "Analytics - Unknown error reading from database (%s)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v4

    invoke-static {v1, v3}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 511
    if-eqz v9, :cond_3

    .line 512
    :try_start_7
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    move-object v9, v2

    goto :goto_0

    .line 511
    :catchall_1
    move-exception v0

    :goto_3
    if-eqz v9, :cond_2

    .line 512
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 511
    :catchall_2
    move-exception v0

    move-object v9, v1

    goto :goto_3

    .line 506
    :catch_2
    move-exception v0

    move-object v2, v9

    move-object v9, v1

    goto :goto_2

    :catch_3
    move-exception v0

    move-object v9, v1

    goto :goto_2

    .line 502
    :catch_4
    move-exception v0

    goto :goto_1

    :catch_5
    move-exception v0

    move-object v9, v2

    goto :goto_1

    :cond_3
    move-object v9, v2

    goto :goto_0
.end method

.method protected static networkConnectivity(Landroid/content/Context;)Z
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 570
    .line 573
    if-eqz p0, :cond_0

    .line 575
    :try_start_0
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 577
    if-eqz v0, :cond_3

    .line 579
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 581
    if-eqz v0, :cond_2

    .line 583
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_0
    move v1, v0

    .line 606
    :cond_0
    :goto_1
    return v1

    :cond_1
    move v0, v2

    .line 583
    goto :goto_0

    .line 588
    :cond_2
    :try_start_1
    const-string v0, "Analytics - Unable to determine connectivity status due to there being no default network currently active"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0, v3}, Lcom/adobe/mobile/StaticMethods;->logWarningFormat(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    move v0, v2

    goto :goto_0

    .line 592
    :cond_3
    :try_start_2
    const-string v0, "Analytics - Unable to determine connectivity status due to the system service requested being unrecognized"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0, v3}, Lcom/adobe/mobile/StaticMethods;->logWarningFormat(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    .line 596
    :catch_0
    move-exception v0

    move-object v3, v0

    move v0, v1

    .line 597
    :goto_2
    const-string v4, "Analytics - Unable to determine connectivity status due to an unexpected error (%s)"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/NullPointerException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v4, v1}, Lcom/adobe/mobile/StaticMethods;->logWarningFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    move v1, v0

    .line 604
    goto :goto_1

    .line 599
    :catch_1
    move-exception v0

    move-object v3, v0

    move v0, v1

    .line 600
    :goto_3
    const-string v4, "Analytics - Unable to access connectivity status due to a security error (%s)"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/SecurityException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v4, v1}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    move v1, v0

    .line 604
    goto :goto_1

    .line 602
    :catch_2
    move-exception v0

    move-object v3, v0

    move v0, v1

    .line 603
    :goto_4
    const-string v4, "Analytics - Unable to access connectivity status due to an unexpected error (%s)"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v4, v1}, Lcom/adobe/mobile/StaticMethods;->logWarningFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    move v1, v0

    goto :goto_1

    .line 602
    :catch_3
    move-exception v0

    move-object v3, v0

    move v0, v2

    goto :goto_4

    .line 599
    :catch_4
    move-exception v0

    move-object v3, v0

    move v0, v2

    goto :goto_3

    .line 596
    :catch_5
    move-exception v0

    move-object v3, v0

    move v0, v2

    goto :goto_2
.end method

.method public static sharedInstance()Lcom/adobe/mobile/AnalyticsWorker;
    .locals 2

    .prologue
    .line 67
    sget-object v1, Lcom/adobe/mobile/AnalyticsWorker;->_instanceMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 68
    :try_start_0
    sget-object v0, Lcom/adobe/mobile/AnalyticsWorker;->_instance:Lcom/adobe/mobile/AnalyticsWorker;

    if-nez v0, :cond_0

    .line 69
    new-instance v0, Lcom/adobe/mobile/AnalyticsWorker;

    invoke-direct {v0}, Lcom/adobe/mobile/AnalyticsWorker;-><init>()V

    sput-object v0, Lcom/adobe/mobile/AnalyticsWorker;->_instance:Lcom/adobe/mobile/AnalyticsWorker;

    .line 72
    :cond_0
    sget-object v0, Lcom/adobe/mobile/AnalyticsWorker;->_instance:Lcom/adobe/mobile/AnalyticsWorker;

    monitor-exit v1

    return-object v0

    .line 73
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private updateHitInDatabase(Lcom/adobe/mobile/AnalyticsWorker$Hit;)V
    .locals 6

    .prologue
    .line 520
    iget-object v1, p0, Lcom/adobe/mobile/AnalyticsWorker;->dbMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 522
    :try_start_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 524
    const-string v2, "URL"

    iget-object v3, p1, Lcom/adobe/mobile/AnalyticsWorker$Hit;->urlFragment:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 526
    iget-object v2, p0, Lcom/adobe/mobile/AnalyticsWorker;->database:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "HITS"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p1, Lcom/adobe/mobile/AnalyticsWorker$Hit;->identifier:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v0, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 535
    :goto_0
    :try_start_1
    monitor-exit v1

    .line 536
    return-void

    .line 528
    :catch_0
    move-exception v0

    .line 530
    const-string v2, "Analytics - Unable to update url in database (%s)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Landroid/database/SQLException;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 535
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 532
    :catch_1
    move-exception v0

    .line 533
    :try_start_2
    const-string v2, "Analytics - Unknown error updating url in database (%s)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method


# virtual methods
.method protected clearTrackingQueue()V
    .locals 5

    .prologue
    .line 205
    iget-object v1, p0, Lcom/adobe/mobile/AnalyticsWorker;->dbMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 207
    :try_start_0
    iget-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->database:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "HITS"

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 208
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/adobe/mobile/AnalyticsWorker;->numberOfUnsentHits:J
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    :goto_0
    :try_start_1
    monitor-exit v1

    .line 220
    return-void

    .line 210
    :catch_0
    move-exception v0

    .line 211
    const-string v2, "Analytics - Unable to clear tracking queue due to an unopened database (%s)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 219
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 213
    :catch_1
    move-exception v0

    .line 214
    :try_start_2
    const-string v2, "Analytics - Unable to clear tracking queue due to a sql error (%s)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Landroid/database/SQLException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 216
    :catch_2
    move-exception v0

    .line 217
    const-string v2, "Analytics - Unable to clear tracking queue due to an unexpected error (%s)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method protected forceKick()V
    .locals 1

    .prologue
    .line 200
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/mobile/AnalyticsWorker;->kick(Z)V

    .line 201
    return-void
.end method

.method protected getTrackingQueueSize()J
    .locals 7

    .prologue
    .line 224
    const-wide/16 v2, 0x0

    .line 225
    iget-object v4, p0, Lcom/adobe/mobile/AnalyticsWorker;->dbMutex:Ljava/lang/Object;

    monitor-enter v4

    .line 227
    :try_start_0
    iget-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->database:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "HITS"

    invoke-static {v0, v1}, Landroid/database/DatabaseUtils;->queryNumEntries(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v0

    .line 238
    :goto_0
    :try_start_1
    monitor-exit v4

    .line 239
    return-wide v0

    .line 229
    :catch_0
    move-exception v0

    .line 230
    const-string v1, "Analytics - Unable to get tracking queue size due to an unopened database (%s)"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v6

    invoke-static {v1, v5}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    move-wide v0, v2

    .line 237
    goto :goto_0

    .line 232
    :catch_1
    move-exception v0

    .line 233
    const-string v1, "Analytics - Unable to get tracking queue size due to a sql error (%s)"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v0}, Landroid/database/SQLException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v6

    invoke-static {v1, v5}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    move-wide v0, v2

    .line 237
    goto :goto_0

    .line 235
    :catch_2
    move-exception v0

    .line 236
    const-string v1, "Analytics - Unable to get tracking queue size due to an unexpected error (%s)"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v6

    invoke-static {v1, v5}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    move-wide v0, v2

    goto :goto_0

    .line 238
    :catchall_0
    move-exception v0

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method protected initializeDatabase()V
    .locals 4

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 423
    :try_start_0
    iget-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->database:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "CREATE TABLE IF NOT EXISTS HITS (ID INTEGER PRIMARY KEY AUTOINCREMENT, URL TEXT, TIMESTAMP INTEGER)"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 434
    :goto_0
    return-void

    .line 425
    :catch_0
    move-exception v0

    .line 426
    const-string v1, "Analytics - Unable to create database due to an invalid path (%s)"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 428
    :catch_1
    move-exception v0

    .line 429
    const-string v1, "Analytics - Unable to create database due to a sql error (%s)"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/database/SQLException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 431
    :catch_2
    move-exception v0

    .line 432
    const-string v1, "Analytics - Unable to create database due to an unexpected error (%s)"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method protected kick(Z)V
    .locals 8

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 157
    invoke-static {}, Lcom/adobe/mobile/MobileConfig;->getInstance()Lcom/adobe/mobile/MobileConfig;

    move-result-object v3

    .line 160
    invoke-static {}, Lcom/adobe/mobile/ReferrerHandler;->getReferrerProcessed()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {v3}, Lcom/adobe/mobile/MobileConfig;->getReferrerTimeout()I

    move-result v0

    if-lez v0, :cond_2

    .line 162
    sget-object v1, Lcom/adobe/mobile/AnalyticsWorker;->referrerTimerMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 163
    :try_start_0
    iget-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->referrerTask:Ljava/util/TimerTask;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 165
    :try_start_1
    new-instance v0, Lcom/adobe/mobile/AnalyticsWorker$ReferrerTimeoutTask;

    invoke-direct {v0, p0, p1}, Lcom/adobe/mobile/AnalyticsWorker$ReferrerTimeoutTask;-><init>(Lcom/adobe/mobile/AnalyticsWorker;Z)V

    iput-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->referrerTask:Ljava/util/TimerTask;

    .line 166
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->referrerTimer:Ljava/util/Timer;

    .line 167
    iget-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->referrerTimer:Ljava/util/Timer;

    iget-object v2, p0, Lcom/adobe/mobile/AnalyticsWorker;->referrerTask:Ljava/util/TimerTask;

    invoke-static {}, Lcom/adobe/mobile/MobileConfig;->getInstance()Lcom/adobe/mobile/MobileConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/mobile/MobileConfig;->getReferrerTimeout()I

    move-result v3

    mul-int/lit16 v3, v3, 0x3e8

    int-to-long v4, v3

    invoke-virtual {v0, v2, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 172
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v1

    .line 197
    :cond_1
    :goto_1
    return-void

    .line 168
    :catch_0
    move-exception v0

    .line 169
    const-string v2, "Analytics - Error creating referrer timer (%s)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 172
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 174
    :cond_2
    iget-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->referrerTimer:Ljava/util/Timer;

    if-eqz v0, :cond_3

    .line 176
    sget-object v4, Lcom/adobe/mobile/AnalyticsWorker;->referrerTimerMutex:Ljava/lang/Object;

    monitor-enter v4

    .line 178
    :try_start_3
    iget-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->referrerTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 182
    :goto_2
    const/4 v0, 0x0

    :try_start_4
    iput-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->referrerTask:Ljava/util/TimerTask;

    .line 183
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 187
    :cond_3
    invoke-virtual {v3}, Lcom/adobe/mobile/MobileConfig;->getPrivacyStatus()Lcom/adobe/mobile/MobilePrivacyStatus;

    move-result-object v0

    sget-object v4, Lcom/adobe/mobile/MobilePrivacyStatus;->MOBILE_PRIVACY_STATUS_OPT_IN:Lcom/adobe/mobile/MobilePrivacyStatus;

    if-ne v0, v4, :cond_1

    .line 192
    invoke-virtual {v3}, Lcom/adobe/mobile/MobileConfig;->getOfflineTrackingEnabled()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-wide v4, p0, Lcom/adobe/mobile/AnalyticsWorker;->numberOfUnsentHits:J

    invoke-virtual {v3}, Lcom/adobe/mobile/MobileConfig;->getBatchLimit()I

    move-result v0

    int-to-long v6, v0

    cmp-long v0, v4, v6

    if-lez v0, :cond_6

    :cond_4
    move v0, v2

    .line 194
    :goto_3
    if-nez v0, :cond_5

    if-eqz p1, :cond_1

    .line 195
    :cond_5
    invoke-direct {p0}, Lcom/adobe/mobile/AnalyticsWorker;->bringOnline()V

    goto :goto_1

    .line 179
    :catch_1
    move-exception v0

    .line 180
    :try_start_5
    const-string v5, "Analytics - Error cancelling referrer timer (%s)"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v6, v7

    invoke-static {v5, v6}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_2

    .line 183
    :catchall_1
    move-exception v0

    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v0

    :cond_6
    move v0, v1

    .line 192
    goto :goto_3
.end method

.method protected kickWithReferrerData(Ljava/util/Map;)V
    .locals 3

    .prologue
    .line 137
    invoke-direct {p0}, Lcom/adobe/mobile/AnalyticsWorker;->getFirstHitInQueue()Lcom/adobe/mobile/AnalyticsWorker$Hit;

    move-result-object v0

    .line 139
    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/adobe/mobile/AnalyticsWorker$Hit;->urlFragment:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 140
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, v0, Lcom/adobe/mobile/AnalyticsWorker$Hit;->urlFragment:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 141
    invoke-static {p1, v1}, Lcom/adobe/mobile/StaticMethods;->serializeToQueryString(Ljava/util/Map;Ljava/lang/StringBuilder;)V

    .line 142
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/mobile/AnalyticsWorker$Hit;->urlFragment:Ljava/lang/String;

    .line 145
    invoke-direct {p0, v0}, Lcom/adobe/mobile/AnalyticsWorker;->updateHitInDatabase(Lcom/adobe/mobile/AnalyticsWorker$Hit;)V

    .line 148
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/adobe/mobile/ReferrerHandler;->setReferrerProcessed(Z)V

    .line 152
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/mobile/AnalyticsWorker;->kick(Z)V

    .line 153
    return-void
.end method

.method protected postReset()V
    .locals 2

    .prologue
    .line 454
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->numberOfUnsentHits:J

    .line 455
    return-void
.end method

.method protected preMigrate()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 405
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getCacheDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "ADBMobileDataCache.sqlite"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 406
    new-instance v1, Ljava/io/File;

    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getCacheDirectory()Ljava/io/File;

    move-result-object v2

    const-string v3, "ADBMobileDataCache.sqlite"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 409
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 411
    :try_start_0
    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 412
    const-string v0, "Analytics - Unable to migrate old hits db, creating new hits db (move file returned false)"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/adobe/mobile/StaticMethods;->logWarningFormat(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 418
    :cond_0
    :goto_0
    return-void

    .line 414
    :catch_0
    move-exception v0

    .line 415
    const-string v1, "Analytics - Unable to migrate old hits db, creating new hits db (%s)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v4

    invoke-static {v1, v2}, Lcom/adobe/mobile/StaticMethods;->logWarningFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method protected prepareStatements()V
    .locals 4

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 439
    :try_start_0
    iget-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->database:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "INSERT INTO HITS (URL, TIMESTAMP) VALUES (?, ?)"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->_preparedInsertStatement:Landroid/database/sqlite/SQLiteStatement;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 450
    :goto_0
    return-void

    .line 441
    :catch_0
    move-exception v0

    .line 442
    const-string v1, "Analytics - Unable to create database due to an invalid path (%s)"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 444
    :catch_1
    move-exception v0

    .line 445
    const-string v1, "Analytics - Unable to create database due to a sql error (%s)"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/database/SQLException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 447
    :catch_2
    move-exception v0

    .line 448
    const-string v1, "Analytics - Unable to create database due to an unexpected error (%s)"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method protected queue(Ljava/lang/String;J)V
    .locals 8

    .prologue
    const/4 v6, 0x0

    .line 94
    invoke-static {}, Lcom/adobe/mobile/MobileConfig;->getInstance()Lcom/adobe/mobile/MobileConfig;

    move-result-object v0

    .line 95
    if-nez v0, :cond_0

    .line 96
    const-string v0, "Analytics - Cannot send hit, MobileConfig is null (this really shouldn\'t happen)"

    new-array v1, v6, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 133
    :goto_0
    return-void

    .line 100
    :cond_0
    invoke-virtual {v0}, Lcom/adobe/mobile/MobileConfig;->getPrivacyStatus()Lcom/adobe/mobile/MobilePrivacyStatus;

    move-result-object v0

    sget-object v1, Lcom/adobe/mobile/MobilePrivacyStatus;->MOBILE_PRIVACY_STATUS_OPT_OUT:Lcom/adobe/mobile/MobilePrivacyStatus;

    if-ne v0, v1, :cond_1

    .line 101
    const-string v0, "Analytics - Ignoring hit due to privacy status being opted out"

    new-array v1, v6, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/adobe/mobile/StaticMethods;->logDebugFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 106
    :cond_1
    iget-object v1, p0, Lcom/adobe/mobile/AnalyticsWorker;->dbMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 109
    :try_start_0
    iget-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->_preparedInsertStatement:Landroid/database/sqlite/SQLiteStatement;

    const/4 v2, 0x1

    invoke-virtual {v0, v2, p1}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 110
    iget-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->_preparedInsertStatement:Landroid/database/sqlite/SQLiteStatement;

    const/4 v2, 0x2

    invoke-virtual {v0, v2, p2, p3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 113
    iget-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->_preparedInsertStatement:Landroid/database/sqlite/SQLiteStatement;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 115
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/mobile/StaticMethods;->updateLastKnownTimestamp(Ljava/lang/Long;)V

    .line 117
    iget-wide v2, p0, Lcom/adobe/mobile/AnalyticsWorker;->numberOfUnsentHits:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/adobe/mobile/AnalyticsWorker;->numberOfUnsentHits:J

    .line 120
    iget-object v0, p0, Lcom/adobe/mobile/AnalyticsWorker;->_preparedInsertStatement:Landroid/database/sqlite/SQLiteStatement;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->clearBindings()V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 132
    invoke-virtual {p0, v6}, Lcom/adobe/mobile/AnalyticsWorker;->kick(Z)V

    goto :goto_0

    .line 122
    :catch_0
    move-exception v0

    .line 123
    :try_start_2
    const-string v2, "Analytics - Unable to insert url (%s)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 124
    invoke-virtual {p0, v0}, Lcom/adobe/mobile/AnalyticsWorker;->resetDatabase(Ljava/lang/Exception;)V

    goto :goto_1

    .line 130
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 126
    :catch_1
    move-exception v0

    .line 127
    :try_start_3
    const-string v2, "Analytics - Unknown error while inserting url (%s)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 128
    invoke-virtual {p0, v0}, Lcom/adobe/mobile/AnalyticsWorker;->resetDatabase(Ljava/lang/Exception;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1
.end method

.method protected startNotifier()V
    .locals 6

    .prologue
    .line 541
    new-instance v2, Landroid/content/IntentFilter;

    const-string v0, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v2, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 543
    const/4 v1, 0x0

    .line 545
    :try_start_0
    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getSharedContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    :try_end_0
    .catch Lcom/adobe/mobile/StaticMethods$NullContextException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 550
    :goto_0
    if-nez v0, :cond_0

    .line 566
    :goto_1
    return-void

    .line 546
    :catch_0
    move-exception v0

    .line 547
    const-string v3, "Analytics - Error registering network receiver (%s)"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v0}, Lcom/adobe/mobile/StaticMethods$NullContextException;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v5

    invoke-static {v3, v4}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    move-object v0, v1

    goto :goto_0

    .line 552
    :cond_0
    new-instance v1, Lcom/adobe/mobile/AnalyticsWorker$1;

    invoke-direct {v1, p0}, Lcom/adobe/mobile/AnalyticsWorker$1;-><init>(Lcom/adobe/mobile/AnalyticsWorker;)V

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    goto :goto_1
.end method
