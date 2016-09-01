.class final Lcom/adobe/mobile/ReferrerHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final REFERRER_FIELDS:[Ljava/lang/String;

.field private static _referrerProcessed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 28
    sput-boolean v3, Lcom/adobe/mobile/ReferrerHandler;->_referrerProcessed:Z

    .line 38
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "utm_source"

    aput-object v2, v0, v1

    const-string v1, "utm_medium"

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string v2, "utm_term"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "utm_content"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "utm_campaign"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "trackingcode"

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/mobile/ReferrerHandler;->REFERRER_FIELDS:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static getReferrerProcessed()Z
    .locals 1

    .prologue
    .line 35
    sget-boolean v0, Lcom/adobe/mobile/ReferrerHandler;->_referrerProcessed:Z

    return v0
.end method

.method public static processIntent(Landroid/content/Intent;)V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v1, 0x0

    .line 48
    if-nez p0, :cond_1

    .line 49
    const-string v0, "Analytics - Unable to process referrer due to an invalid intent parameter"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/adobe/mobile/StaticMethods;->logWarningFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 122
    :cond_0
    :goto_0
    return-void

    .line 53
    :cond_1
    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v2, "com.android.vending.INSTALL_REFERRER"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 54
    const-string v0, "Analytics - Ignoring referrer due to the intent\'s action not being handled by analytics"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/adobe/mobile/StaticMethods;->logDebugFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 60
    :cond_2
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 62
    if-eqz v0, :cond_3

    .line 63
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 71
    :cond_3
    const-string v0, "referrer"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 73
    const-string v2, "Analytics - Received referrer information(%s)"

    new-array v3, v8, [Ljava/lang/Object;

    aput-object v0, v3, v1

    invoke-static {v2, v3}, Lcom/adobe/mobile/StaticMethods;->logDebugFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 75
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_5

    .line 76
    :cond_4
    const-string v0, "Analytics - Ignoring referrer due to the intent\'s referrer string being empty"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/adobe/mobile/StaticMethods;->logDebugFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 80
    :cond_5
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 82
    const-string v3, "&"

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3

    move v0, v1

    :goto_1
    if-ge v0, v4, :cond_7

    aget-object v5, v3, v0

    .line 83
    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 85
    array-length v6, v5

    const/4 v7, 0x2

    if-ne v6, v7, :cond_6

    .line 86
    aget-object v6, v5, v1

    aget-object v5, v5, v8

    invoke-virtual {v2, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 91
    :cond_7
    sget-boolean v0, Lcom/adobe/mobile/Lifecycle;->lifecycleHasRun:Z

    if-eqz v0, :cond_8

    .line 92
    const-string v0, "utm_source"

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "utm_campaign"

    .line 93
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 95
    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getAnalyticsExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/adobe/mobile/ReferrerHandler$1;

    invoke-direct {v1, v2}, Lcom/adobe/mobile/ReferrerHandler$1;-><init>(Ljava/util/HashMap;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 103
    invoke-static {}, Lcom/adobe/mobile/AnalyticsWorker;->sharedInstance()Lcom/adobe/mobile/AnalyticsWorker;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/adobe/mobile/AnalyticsWorker;->kickWithReferrerData(Ljava/util/Map;)V

    goto/16 :goto_0

    .line 107
    :cond_8
    :try_start_1
    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getSharedPreferencesEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 109
    sget-object v4, Lcom/adobe/mobile/ReferrerHandler;->REFERRER_FIELDS:[Ljava/lang/String;

    array-length v5, v4

    move v0, v1

    :goto_2
    if-ge v0, v5, :cond_a

    aget-object v6, v4, v0

    .line 110
    invoke-virtual {v2, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    invoke-virtual {v2, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_9

    .line 111
    invoke-virtual {v2, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 109
    :cond_9
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 114
    :cond_a
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_1
    .catch Lcom/adobe/mobile/StaticMethods$NullContextException; {:try_start_1 .. :try_end_1} :catch_0

    .line 120
    :goto_3
    sput-boolean v8, Lcom/adobe/mobile/ReferrerHandler;->_referrerProcessed:Z

    goto/16 :goto_0

    .line 115
    :catch_0
    move-exception v0

    .line 116
    const-string v2, "Analytics - Error persisting referrer data (%s)"

    new-array v3, v8, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/adobe/mobile/StaticMethods$NullContextException;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v1

    invoke-static {v2, v3}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_3

    .line 66
    :catch_1
    move-exception v0

    goto/16 :goto_0
.end method

.method protected static setReferrerProcessed(Z)V
    .locals 0

    .prologue
    .line 31
    sput-boolean p0, Lcom/adobe/mobile/ReferrerHandler;->_referrerProcessed:Z

    .line 32
    return-void
.end method
