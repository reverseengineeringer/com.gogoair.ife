.class Lcom/adobe/mobile/AnalyticsWorker$WorkerThreadRunner;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/mobile/AnalyticsWorker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WorkerThreadRunner"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 248
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/mobile/AnalyticsWorker$1;)V
    .locals 0

    .prologue
    .line 248
    invoke-direct {p0}, Lcom/adobe/mobile/AnalyticsWorker$WorkerThreadRunner;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    const/4 v12, 0x1

    const/4 v1, 0x0

    .line 251
    invoke-static {}, Lcom/adobe/mobile/AnalyticsWorker;->sharedInstance()Lcom/adobe/mobile/AnalyticsWorker;

    move-result-object v2

    .line 254
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 257
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 259
    const-string v0, "Accept-Language"

    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getDefaultAcceptLanguage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    const-string v0, "User-Agent"

    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getDefaultUserAgent()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    :cond_0
    :goto_0
    invoke-static {}, Lcom/adobe/mobile/MobileConfig;->getInstance()Lcom/adobe/mobile/MobileConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mobile/MobileConfig;->getPrivacyStatus()Lcom/adobe/mobile/MobilePrivacyStatus;

    move-result-object v0

    sget-object v4, Lcom/adobe/mobile/MobilePrivacyStatus;->MOBILE_PRIVACY_STATUS_OPT_IN:Lcom/adobe/mobile/MobilePrivacyStatus;

    if-ne v0, v4, :cond_1

    # getter for: Lcom/adobe/mobile/AnalyticsWorker;->networkAvailable:Z
    invoke-static {}, Lcom/adobe/mobile/AnalyticsWorker;->access$000()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 265
    # invokes: Lcom/adobe/mobile/AnalyticsWorker;->getFirstHitInQueue()Lcom/adobe/mobile/AnalyticsWorker$Hit;
    invoke-static {v2}, Lcom/adobe/mobile/AnalyticsWorker;->access$100(Lcom/adobe/mobile/AnalyticsWorker;)Lcom/adobe/mobile/AnalyticsWorker$Hit;

    move-result-object v4

    .line 267
    if-nez v4, :cond_2

    .line 365
    :cond_1
    :goto_1
    # setter for: Lcom/adobe/mobile/AnalyticsWorker;->bgThreadActive:Z
    invoke-static {v1}, Lcom/adobe/mobile/AnalyticsWorker;->access$602(Z)Z

    .line 366
    return-void

    .line 272
    :cond_2
    invoke-static {}, Lcom/adobe/mobile/MobileConfig;->getInstance()Lcom/adobe/mobile/MobileConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mobile/MobileConfig;->getOfflineTrackingEnabled()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 274
    iget-wide v6, v4, Lcom/adobe/mobile/AnalyticsWorker$Hit;->timestamp:J

    # getter for: Lcom/adobe/mobile/AnalyticsWorker;->lastHitTimestamp:J
    invoke-static {v2}, Lcom/adobe/mobile/AnalyticsWorker;->access$200(Lcom/adobe/mobile/AnalyticsWorker;)J

    move-result-wide v8

    sub-long/2addr v6, v8

    .line 277
    const-wide/16 v8, 0x0

    cmp-long v0, v6, v8

    if-gez v0, :cond_3

    .line 279
    # getter for: Lcom/adobe/mobile/AnalyticsWorker;->lastHitTimestamp:J
    invoke-static {v2}, Lcom/adobe/mobile/AnalyticsWorker;->access$200(Lcom/adobe/mobile/AnalyticsWorker;)J

    move-result-wide v6

    const-wide/16 v8, 0x1

    add-long/2addr v6, v8

    .line 280
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "&ts="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v8, v4, Lcom/adobe/mobile/AnalyticsWorker$Hit;->timestamp:J

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 281
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "&ts="

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 283
    iget-object v8, v4, Lcom/adobe/mobile/AnalyticsWorker$Hit;->urlFragment:Ljava/lang/String;

    invoke-virtual {v8, v0, v5}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v4, Lcom/adobe/mobile/AnalyticsWorker$Hit;->urlFragment:Ljava/lang/String;

    .line 285
    const-string v0, "Analytics - Adjusting out of order hit timestamp(%d->%d)"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    iget-wide v8, v4, Lcom/adobe/mobile/AnalyticsWorker$Hit;->timestamp:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v5, v1

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v5, v12

    invoke-static {v0, v5}, Lcom/adobe/mobile/StaticMethods;->logDebugFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 287
    iput-wide v6, v4, Lcom/adobe/mobile/AnalyticsWorker$Hit;->timestamp:J

    .line 310
    :cond_3
    iget-object v0, v4, Lcom/adobe/mobile/AnalyticsWorker$Hit;->urlFragment:Ljava/lang/String;

    .line 312
    const-string v5, "ndh"

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 313
    const/16 v5, 0x3f

    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 316
    :cond_4
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    # invokes: Lcom/adobe/mobile/AnalyticsWorker;->getBaseURL()Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mobile/AnalyticsWorker;->access$400()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    # getter for: Lcom/adobe/mobile/AnalyticsWorker;->randomGen:Ljava/security/SecureRandom;
    invoke-static {}, Lcom/adobe/mobile/AnalyticsWorker;->access$500()Ljava/security/SecureRandom;

    move-result-object v6

    const v7, 0x5f5e100

    invoke-virtual {v6, v7}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x1388

    invoke-static {v5, v0, v3, v6}, Lcom/adobe/mobile/RequestHandler;->sendAnalyticsRequest(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;I)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 320
    :try_start_0
    iget-object v0, v4, Lcom/adobe/mobile/AnalyticsWorker$Hit;->identifier:Ljava/lang/String;

    # invokes: Lcom/adobe/mobile/AnalyticsWorker;->deleteHit(Ljava/lang/String;)V
    invoke-static {v2, v0}, Lcom/adobe/mobile/AnalyticsWorker;->access$300(Lcom/adobe/mobile/AnalyticsWorker;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/adobe/mobile/AbstractDatabaseBacking$CorruptedDatabaseException; {:try_start_0 .. :try_end_0} :catch_1

    .line 326
    iget-wide v4, v4, Lcom/adobe/mobile/AnalyticsWorker$Hit;->timestamp:J

    # setter for: Lcom/adobe/mobile/AnalyticsWorker;->lastHitTimestamp:J
    invoke-static {v2, v4, v5}, Lcom/adobe/mobile/AnalyticsWorker;->access$202(Lcom/adobe/mobile/AnalyticsWorker;J)J

    goto/16 :goto_0

    .line 291
    :cond_5
    iget-wide v6, v4, Lcom/adobe/mobile/AnalyticsWorker$Hit;->timestamp:J

    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getTimeSince1970()J

    move-result-wide v8

    const-wide/16 v10, 0x3c

    sub-long/2addr v8, v10

    cmp-long v0, v6, v8

    if-gez v0, :cond_3

    .line 297
    :try_start_1
    iget-object v0, v4, Lcom/adobe/mobile/AnalyticsWorker$Hit;->identifier:Ljava/lang/String;

    # invokes: Lcom/adobe/mobile/AnalyticsWorker;->deleteHit(Ljava/lang/String;)V
    invoke-static {v2, v0}, Lcom/adobe/mobile/AnalyticsWorker;->access$300(Lcom/adobe/mobile/AnalyticsWorker;Ljava/lang/String;)V
    :try_end_1
    .catch Lcom/adobe/mobile/AbstractDatabaseBacking$CorruptedDatabaseException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 298
    :catch_0
    move-exception v0

    .line 299
    invoke-static {}, Lcom/adobe/mobile/AnalyticsWorker;->sharedInstance()Lcom/adobe/mobile/AnalyticsWorker;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/adobe/mobile/AnalyticsWorker;->resetDatabase(Ljava/lang/Exception;)V

    goto/16 :goto_1

    .line 321
    :catch_1
    move-exception v0

    .line 322
    invoke-static {}, Lcom/adobe/mobile/AnalyticsWorker;->sharedInstance()Lcom/adobe/mobile/AnalyticsWorker;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/adobe/mobile/AnalyticsWorker;->resetDatabase(Ljava/lang/Exception;)V

    goto/16 :goto_1

    .line 332
    :cond_6
    const-string v0, "Analytics - Unable to send hit"

    new-array v5, v1, [Ljava/lang/Object;

    invoke-static {v0, v5}, Lcom/adobe/mobile/StaticMethods;->logWarningFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 334
    invoke-static {}, Lcom/adobe/mobile/MobileConfig;->getInstance()Lcom/adobe/mobile/MobileConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mobile/MobileConfig;->getOfflineTrackingEnabled()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 337
    const-wide/16 v4, 0x1e

    .line 338
    const-string v0, "Analytics - Network error, imposing internal cooldown(%d seconds)"

    new-array v6, v12, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {v0, v6}, Lcom/adobe/mobile/StaticMethods;->logDebugFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    move v0, v1

    .line 355
    :goto_2
    int-to-long v6, v0

    cmp-long v6, v6, v4

    if-gez v6, :cond_0

    :try_start_2
    # getter for: Lcom/adobe/mobile/AnalyticsWorker;->networkAvailable:Z
    invoke-static {}, Lcom/adobe/mobile/AnalyticsWorker;->access$000()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 356
    const-wide/16 v6, 0x3e8

    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 355
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 343
    :cond_7
    :try_start_3
    iget-object v0, v4, Lcom/adobe/mobile/AnalyticsWorker$Hit;->identifier:Ljava/lang/String;

    # invokes: Lcom/adobe/mobile/AnalyticsWorker;->deleteHit(Ljava/lang/String;)V
    invoke-static {v2, v0}, Lcom/adobe/mobile/AnalyticsWorker;->access$300(Lcom/adobe/mobile/AnalyticsWorker;Ljava/lang/String;)V
    :try_end_3
    .catch Lcom/adobe/mobile/AbstractDatabaseBacking$CorruptedDatabaseException; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_0

    .line 344
    :catch_2
    move-exception v0

    .line 345
    invoke-static {}, Lcom/adobe/mobile/AnalyticsWorker;->sharedInstance()Lcom/adobe/mobile/AnalyticsWorker;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/adobe/mobile/AnalyticsWorker;->resetDatabase(Ljava/lang/Exception;)V

    goto/16 :goto_1

    .line 359
    :catch_3
    move-exception v0

    .line 360
    const-string v4, "Analytics - Background Thread Interrupted(%s)"

    new-array v5, v12, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v1

    invoke-static {v4, v5}, Lcom/adobe/mobile/StaticMethods;->logWarningFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_0
.end method
