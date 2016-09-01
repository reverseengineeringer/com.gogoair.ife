.class final Lcom/adobe/mobile/AudienceManagerWorker;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/mobile/AudienceManagerWorker$SubmitSignalTask;
    }
.end annotation


# static fields
.field private static final AUDIENCE_MANAGER_CUSTOMER_DATA_PREFIX:Ljava/lang/String; = "c_"

.field private static final AUDIENCE_MANAGER_DATA_PROVIDER_ID_KEY:Ljava/lang/String; = "d_dpid"

.field private static final AUDIENCE_MANAGER_DATA_PROVIDER_USER_ID_KEY:Ljava/lang/String; = "d_dpuuid"

.field private static final AUDIENCE_MANAGER_JSON_COOKIE_NAME_KEY:Ljava/lang/String; = "cn"

.field private static final AUDIENCE_MANAGER_JSON_COOKIE_VALUE_KEY:Ljava/lang/String; = "cv"

.field private static final AUDIENCE_MANAGER_JSON_DESTS_KEY:Ljava/lang/String; = "dests"

.field private static final AUDIENCE_MANAGER_JSON_STUFF_KEY:Ljava/lang/String; = "stuff"

.field private static final AUDIENCE_MANAGER_JSON_URL_KEY:Ljava/lang/String; = "c"

.field private static final AUDIENCE_MANAGER_JSON_USER_ID_KEY:Ljava/lang/String; = "uuid"

.field private static final AUDIENCE_MANAGER_SHARED_PREFS_PROFILE_KEY:Ljava/lang/String; = "AAMUserProfile"

.field private static final AUDIENCE_MANAGER_SHARED_PREFS_USER_ID_KEY:Ljava/lang/String; = "AAMUserId"

.field private static final AUDIENCE_MANAGER_URL_PREFIX:Ljava/lang/String; = "http://%s/event?"

.field private static final AUDIENCE_MANAGER_URL_SUFFIX:Ljava/lang/String; = "&d_ptfm=android&d_dst=1&d_rtbd=json"

.field private static final AUDIENCE_MANAGER_USER_ID_KEY:Ljava/lang/String; = "d_uuid"

.field private static volatile UrlPrefix_pred:Z

.field private static volatile VisitorProfile_pred:Z

.field private static _dpid:Ljava/lang/String;

.field private static _dpuuid:Ljava/lang/String;

.field private static _urlPrefix:Ljava/lang/String;

.field private static _visitorProfile:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 52
    sput-object v0, Lcom/adobe/mobile/AudienceManagerWorker;->_dpid:Ljava/lang/String;

    .line 53
    sput-object v0, Lcom/adobe/mobile/AudienceManagerWorker;->_dpuuid:Ljava/lang/String;

    .line 54
    sput-object v0, Lcom/adobe/mobile/AudienceManagerWorker;->_visitorProfile:Ljava/util/HashMap;

    .line 59
    sput-boolean v1, Lcom/adobe/mobile/AudienceManagerWorker;->VisitorProfile_pred:Z

    .line 436
    sput-object v0, Lcom/adobe/mobile/AudienceManagerWorker;->_urlPrefix:Ljava/lang/String;

    .line 437
    sput-boolean v1, Lcom/adobe/mobile/AudienceManagerWorker;->UrlPrefix_pred:Z

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 144
    return-void
.end method

.method private static BuildSchemaRequest(Ljava/util/Map;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 278
    invoke-static {}, Lcom/adobe/mobile/AudienceManagerWorker;->GetUrlPrefix()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 279
    const/4 v0, 0x0

    .line 283
    :goto_0
    return-object v0

    .line 282
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/adobe/mobile/AudienceManagerWorker;->GetUrlPrefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/adobe/mobile/AudienceManagerWorker;->GetCustomUrlVariables(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/adobe/mobile/AudienceManagerWorker;->GetDataProviderUrlVariables()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&d_ptfm=android&d_dst=1&d_rtbd=json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 283
    const-string v1, "?&"

    const-string v2, "?"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static GetCustomUrlVariables(Ljava/util/Map;)Ljava/lang/String;
    .locals 6

    .prologue
    .line 287
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_1

    .line 288
    :cond_0
    const-string v0, ""

    .line 311
    :goto_0
    return-object v0

    .line 291
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v0, 0x400

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 293
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 294
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 295
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 298
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_2

    if-eqz v4, :cond_2

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_2

    .line 302
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v5, Ljava/lang/String;

    if-ne v0, v5, :cond_2

    .line 303
    const-string v0, "&"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, "c_"

    .line 304
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 305
    invoke-static {v1}, Lcom/adobe/mobile/AudienceManagerWorker;->SanitizeUrlVariableName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mobile/StaticMethods;->URLEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    .line 306
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 307
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mobile/StaticMethods;->URLEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 311
    :cond_3
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static GetDataProviderUrlVariables()Ljava/lang/String;
    .locals 3

    .prologue
    .line 321
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 324
    invoke-static {}, Lcom/adobe/mobile/MobileConfig;->getInstance()Lcom/adobe/mobile/MobileConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/mobile/MobileConfig;->getVisitorIdServiceEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 325
    invoke-static {}, Lcom/adobe/mobile/VisitorIDService;->sharedInstance()Lcom/adobe/mobile/VisitorIDService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/mobile/VisitorIDService;->getAAMParameterString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    :cond_0
    invoke-static {}, Lcom/adobe/mobile/AudienceManagerWorker;->GetUUID()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 330
    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "d_uuid"

    .line 331
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "="

    .line 332
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 333
    invoke-static {}, Lcom/adobe/mobile/AudienceManagerWorker;->GetUUID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    :cond_1
    sget-object v1, Lcom/adobe/mobile/AudienceManagerWorker;->_dpid:Ljava/lang/String;

    if-eqz v1, :cond_2

    sget-object v1, Lcom/adobe/mobile/AudienceManagerWorker;->_dpid:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    sget-object v1, Lcom/adobe/mobile/AudienceManagerWorker;->_dpuuid:Ljava/lang/String;

    if-eqz v1, :cond_2

    sget-object v1, Lcom/adobe/mobile/AudienceManagerWorker;->_dpuuid:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    .line 338
    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "d_dpid"

    .line 339
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "="

    .line 340
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/adobe/mobile/AudienceManagerWorker;->_dpid:Ljava/lang/String;

    .line 341
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&"

    .line 342
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "d_dpuuid"

    .line 343
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "="

    .line 344
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/adobe/mobile/AudienceManagerWorker;->_dpuuid:Ljava/lang/String;

    .line 345
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static GetDpid()Ljava/lang/String;
    .locals 4

    .prologue
    .line 117
    new-instance v0, Ljava/util/concurrent/FutureTask;

    new-instance v1, Lcom/adobe/mobile/AudienceManagerWorker$3;

    invoke-direct {v1}, Lcom/adobe/mobile/AudienceManagerWorker$3;-><init>()V

    invoke-direct {v0, v1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 124
    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getAudienceExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 127
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    :goto_0
    return-object v0

    .line 128
    :catch_0
    move-exception v0

    .line 129
    const-string v1, "Audience Manager - Unable to get Dpid (%s)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 130
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static GetDpuuid()Ljava/lang/String;
    .locals 4

    .prologue
    .line 99
    new-instance v0, Ljava/util/concurrent/FutureTask;

    new-instance v1, Lcom/adobe/mobile/AudienceManagerWorker$2;

    invoke-direct {v1}, Lcom/adobe/mobile/AudienceManagerWorker$2;-><init>()V

    invoke-direct {v0, v1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 106
    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getAudienceExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 109
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    :goto_0
    return-object v0

    .line 110
    :catch_0
    move-exception v0

    .line 111
    const-string v1, "Audience Manager - Unable to get Dpid (%s)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 112
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static GetUUID()Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 368
    :try_start_0
    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "AAMUserId"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lcom/adobe/mobile/StaticMethods$NullContextException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 373
    :goto_0
    return-object v0

    .line 369
    :catch_0
    move-exception v1

    .line 370
    const-string v2, "Audience Manager - Error getting uuid from shared preferences (%s)."

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v1}, Lcom/adobe/mobile/StaticMethods$NullContextException;->getMessage()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v3, v4

    invoke-static {v2, v3}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private static GetUrlPrefix()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 439
    sget-boolean v0, Lcom/adobe/mobile/AudienceManagerWorker;->UrlPrefix_pred:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/adobe/mobile/MobileConfig;->getInstance()Lcom/adobe/mobile/MobileConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mobile/MobileConfig;->mobileUsingAudienceManager()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 440
    sput-boolean v3, Lcom/adobe/mobile/AudienceManagerWorker;->UrlPrefix_pred:Z

    .line 441
    const-string v0, "http://%s/event?"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {}, Lcom/adobe/mobile/MobileConfig;->getInstance()Lcom/adobe/mobile/MobileConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/mobile/MobileConfig;->getAamServer()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/mobile/AudienceManagerWorker;->_urlPrefix:Ljava/lang/String;

    .line 444
    :cond_0
    sget-object v0, Lcom/adobe/mobile/AudienceManagerWorker;->_urlPrefix:Ljava/lang/String;

    return-object v0
.end method

.method public static GetVisitorProfile()Ljava/util/HashMap;
    .locals 4

    .prologue
    .line 61
    new-instance v0, Ljava/util/concurrent/FutureTask;

    new-instance v1, Lcom/adobe/mobile/AudienceManagerWorker$1;

    invoke-direct {v1}, Lcom/adobe/mobile/AudienceManagerWorker$1;-><init>()V

    invoke-direct {v0, v1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 88
    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getAudienceExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 91
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    :goto_0
    return-object v0

    .line 92
    :catch_0
    move-exception v0

    .line 93
    const-string v1, "Audience Manager - Unable to retrieve Visitor Profile"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 94
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static ProcessDestsArray(Lorg/json/JSONObject;)V
    .locals 7

    .prologue
    const/4 v1, 0x0

    .line 400
    :try_start_0
    const-string v0, "dests"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    move v0, v1

    .line 401
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 402
    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 403
    const-string v4, "c"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 404
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_0

    .line 405
    const/4 v4, 0x0

    const/16 v5, 0x1388

    const-string v6, "Audience Manager"

    invoke-static {v3, v4, v5, v6}, Lcom/adobe/mobile/RequestHandler;->sendGenericRequest(Ljava/lang/String;Ljava/util/Map;ILjava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 401
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 409
    :catch_0
    move-exception v0

    .line 410
    const-string v2, "Audience Manager - No destination in response (%s)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v1

    invoke-static {v2, v3}, Lcom/adobe/mobile/StaticMethods;->logDebugFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 412
    :cond_1
    return-void
.end method

.method private static ProcessStuffArray(Lorg/json/JSONObject;)Ljava/util/HashMap;
    .locals 7

    .prologue
    const/4 v1, 0x0

    .line 415
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 418
    :try_start_0
    const-string v0, "stuff"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    move v0, v1

    .line 421
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v0, v4, :cond_1

    .line 422
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 423
    if-eqz v4, :cond_0

    .line 424
    const-string v5, "cn"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "cv"

    .line 425
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 424
    invoke-virtual {v2, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 421
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 429
    :catch_0
    move-exception v0

    .line 430
    const-string v3, "Audience Manager - No \'stuff\' array in response (%s)"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v0}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v1

    invoke-static {v3, v4}, Lcom/adobe/mobile/StaticMethods;->logDebugFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 433
    :cond_1
    return-object v2
.end method

.method public static Reset()V
    .locals 2

    .prologue
    .line 262
    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getAudienceExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/adobe/mobile/AudienceManagerWorker$5;

    invoke-direct {v1}, Lcom/adobe/mobile/AudienceManagerWorker$5;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 269
    return-void
.end method

.method private static SanitizeUrlVariableName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 316
    const-string v0, "."

    const-string v1, "_"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static SetDpidAndDpuuid(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 135
    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getAudienceExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/adobe/mobile/AudienceManagerWorker$4;

    invoke-direct {v1, p0, p1}, Lcom/adobe/mobile/AudienceManagerWorker$4;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 142
    return-void
.end method

.method private static SetUUID(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 353
    :try_start_0
    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getSharedPreferencesEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 354
    if-nez p0, :cond_0

    .line 355
    const-string v1, "AAMUserId"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 360
    :goto_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 364
    :goto_1
    return-void

    .line 357
    :cond_0
    const-string v1, "AAMUserId"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_0
    .catch Lcom/adobe/mobile/StaticMethods$NullContextException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 361
    :catch_0
    move-exception v0

    .line 362
    const-string v1, "Audience Manager - Error updating uuid in shared preferences (%s)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v0}, Lcom/adobe/mobile/StaticMethods$NullContextException;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1
.end method

.method private static SetVisitorProfile(Ljava/util/Map;)V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 378
    sput-boolean v3, Lcom/adobe/mobile/AudienceManagerWorker;->VisitorProfile_pred:Z

    .line 380
    :try_start_0
    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getSharedPreferencesEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 381
    if-eqz p0, :cond_0

    .line 382
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 383
    const-string v2, "AAMUserProfile"

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 384
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    sput-object v1, Lcom/adobe/mobile/AudienceManagerWorker;->_visitorProfile:Ljava/util/HashMap;

    .line 390
    :goto_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 395
    :goto_1
    return-void

    .line 386
    :cond_0
    const-string v1, "AAMUserProfile"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 387
    const/4 v1, 0x0

    sput-object v1, Lcom/adobe/mobile/AudienceManagerWorker;->_visitorProfile:Ljava/util/HashMap;
    :try_end_0
    .catch Lcom/adobe/mobile/StaticMethods$NullContextException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 392
    :catch_0
    move-exception v0

    .line 393
    const-string v1, "Audience Manager - Error updating visitor profile (%s)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/adobe/mobile/StaticMethods$NullContextException;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/adobe/mobile/StaticMethods;->logErrorFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public static SubmitSignal(Ljava/util/Map;Lcom/adobe/mobile/AudienceManager$AudienceManagerCallback;)V
    .locals 2

    .prologue
    .line 258
    invoke-static {}, Lcom/adobe/mobile/StaticMethods;->getAudienceExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/adobe/mobile/AudienceManagerWorker$SubmitSignalTask;

    invoke-direct {v1, p0, p1}, Lcom/adobe/mobile/AudienceManagerWorker$SubmitSignalTask;-><init>(Ljava/util/Map;Lcom/adobe/mobile/AudienceManager$AudienceManagerCallback;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 259
    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .prologue
    .line 23
    sget-boolean v0, Lcom/adobe/mobile/AudienceManagerWorker;->VisitorProfile_pred:Z

    return v0
.end method

.method static synthetic access$002(Z)Z
    .locals 0

    .prologue
    .line 23
    sput-boolean p0, Lcom/adobe/mobile/AudienceManagerWorker;->VisitorProfile_pred:Z

    return p0
.end method

.method static synthetic access$100()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/adobe/mobile/AudienceManagerWorker;->_visitorProfile:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$102(Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 0

    .prologue
    .line 23
    sput-object p0, Lcom/adobe/mobile/AudienceManagerWorker;->_visitorProfile:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/adobe/mobile/AudienceManagerWorker;->_dpuuid:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$202(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .prologue
    .line 23
    sput-object p0, Lcom/adobe/mobile/AudienceManagerWorker;->_dpuuid:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/adobe/mobile/AudienceManagerWorker;->_dpid:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$302(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .prologue
    .line 23
    sput-object p0, Lcom/adobe/mobile/AudienceManagerWorker;->_dpid:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Ljava/util/Map;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    invoke-static {p0}, Lcom/adobe/mobile/AudienceManagerWorker;->BuildSchemaRequest(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 23
    invoke-static {p0}, Lcom/adobe/mobile/AudienceManagerWorker;->ProcessDestsArray(Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$600(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 23
    invoke-static {p0}, Lcom/adobe/mobile/AudienceManagerWorker;->SetUUID(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lorg/json/JSONObject;)Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 23
    invoke-static {p0}, Lcom/adobe/mobile/AudienceManagerWorker;->ProcessStuffArray(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$800(Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 23
    invoke-static {p0}, Lcom/adobe/mobile/AudienceManagerWorker;->SetVisitorProfile(Ljava/util/Map;)V

    return-void
.end method
