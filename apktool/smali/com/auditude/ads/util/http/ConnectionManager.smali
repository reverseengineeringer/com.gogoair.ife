.class public Lcom/auditude/ads/util/http/ConnectionManager;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final MAX_CONNECTIONS:I = 0xa

.field private static instance:Lcom/auditude/ads/util/http/ConnectionManager;


# instance fields
.field private active:Ljava/util/ArrayList;

.field private httpContextList:Ljava/util/HashMap;

.field private queue:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/util/http/ConnectionManager;->active:Ljava/util/ArrayList;

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/util/http/ConnectionManager;->queue:Ljava/util/ArrayList;

    .line 25
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/util/http/ConnectionManager;->httpContextList:Ljava/util/HashMap;

    .line 19
    return-void
.end method

.method public static getInstance()Lcom/auditude/ads/util/http/ConnectionManager;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/auditude/ads/util/http/ConnectionManager;->instance:Lcom/auditude/ads/util/http/ConnectionManager;

    if-nez v0, :cond_0

    .line 33
    new-instance v0, Lcom/auditude/ads/util/http/ConnectionManager;

    invoke-direct {v0}, Lcom/auditude/ads/util/http/ConnectionManager;-><init>()V

    sput-object v0, Lcom/auditude/ads/util/http/ConnectionManager;->instance:Lcom/auditude/ads/util/http/ConnectionManager;

    .line 36
    :cond_0
    sget-object v0, Lcom/auditude/ads/util/http/ConnectionManager;->instance:Lcom/auditude/ads/util/http/ConnectionManager;

    return-object v0
.end method

.method private declared-synchronized startNext()V
    .locals 3

    .prologue
    .line 69
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/auditude/ads/util/http/ConnectionManager;->queue:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/auditude/ads/util/http/ConnectionManager;->queue:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    .line 72
    iget-object v1, p0, Lcom/auditude/ads/util/http/ConnectionManager;->queue:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 73
    iget-object v1, p0, Lcom/auditude/ads/util/http/ConnectionManager;->active:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 76
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    :cond_0
    monitor-exit p0

    return-void

    .line 69
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public didComplete(Ljava/lang/Runnable;)V
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/auditude/ads/util/http/ConnectionManager;->active:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 83
    invoke-direct {p0}, Lcom/auditude/ads/util/http/ConnectionManager;->startNext()V

    .line 84
    return-void
.end method

.method public getLocalContext(Ljava/lang/String;)Lorg/apache/http/protocol/HttpContext;
    .locals 4

    .prologue
    .line 41
    iget-object v0, p0, Lcom/auditude/ads/util/http/ConnectionManager;->httpContextList:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 44
    new-instance v1, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v1}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    .line 45
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v2, "applicationContext"

    invoke-virtual {v0, v2}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 46
    if-eqz v0, :cond_1

    .line 48
    const-string v2, "http.cookie-store"

    new-instance v3, Lcom/auditude/ads/util/http/PersistentCookieStore;

    invoke-direct {v3, v0}, Lcom/auditude/ads/util/http/PersistentCookieStore;-><init>(Landroid/content/Context;)V

    invoke-interface {v1, v2, v3}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 54
    :goto_0
    iget-object v0, p0, Lcom/auditude/ads/util/http/ConnectionManager;->httpContextList:Ljava/util/HashMap;

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/util/http/ConnectionManager;->httpContextList:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/protocol/HttpContext;

    .line 57
    const-string v1, "http.cookie-store"

    invoke-interface {v0, v1}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/client/CookieStore;

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-interface {v1, v2}, Lorg/apache/http/client/CookieStore;->clearExpired(Ljava/util/Date;)Z

    .line 58
    return-object v0

    .line 52
    :cond_1
    const-string v0, "http.cookie-store"

    new-instance v2, Lorg/apache/http/impl/client/BasicCookieStore;

    invoke-direct {v2}, Lorg/apache/http/impl/client/BasicCookieStore;-><init>()V

    invoke-interface {v1, v0, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public push(Ljava/lang/Runnable;)V
    .locals 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/auditude/ads/util/http/ConnectionManager;->queue:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    iget-object v0, p0, Lcom/auditude/ads/util/http/ConnectionManager;->active:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    invoke-direct {p0}, Lcom/auditude/ads/util/http/ConnectionManager;->startNext()V

    .line 65
    :cond_0
    return-void
.end method
