.class public final Lcom/auditude/ads/util/PingUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final CATEGORY:Ljava/lang/String; = "Ping"

.field private static final NETWORK_TIMEOUT:Ljava/lang/Integer;

.field private static POOL_NUM:I

.field private static REDIRECT_LIMIT:I

.field private static _executor:Ljava/util/concurrent/ExecutorService;

.field private static volatile _executor_pred:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x5

    .line 38
    const/16 v0, 0x2710

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/auditude/ads/util/PingUtil;->NETWORK_TIMEOUT:Ljava/lang/Integer;

    .line 39
    sput v1, Lcom/auditude/ads/util/PingUtil;->POOL_NUM:I

    .line 40
    sput v1, Lcom/auditude/ads/util/PingUtil;->REDIRECT_LIMIT:I

    .line 43
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/auditude/ads/util/PingUtil;->_executor_pred:Ljava/lang/Boolean;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static _requestConnect(Ljava/lang/String;)Ljava/net/HttpURLConnection;
    .locals 4

    .prologue
    .line 173
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 175
    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    const-string v2, "https"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 176
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .line 177
    new-instance v1, Lorg/apache/http/conn/ssl/StrictHostnameVerifier;

    invoke-direct {v1}, Lorg/apache/http/conn/ssl/StrictHostnameVerifier;-><init>()V

    invoke-virtual {v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 188
    :goto_0
    return-object v0

    .line 180
    :cond_0
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 182
    :catch_0
    move-exception v0

    .line 183
    const-string v0, "Ping"

    invoke-static {v0}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Pinging Url: MalformedURL "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    .line 188
    :goto_1
    const/4 v0, 0x0

    goto :goto_0

    .line 184
    :catch_1
    move-exception v0

    .line 185
    const-string v1, "Ping"

    invoke-static {v1}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Pinging Url: Exception opening url ("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method static synthetic access$0(Ljava/lang/String;)Ljava/net/HttpURLConnection;
    .locals 1

    .prologue
    .line 170
    invoke-static {p0}, Lcom/auditude/ads/util/PingUtil;->_requestConnect(Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lcom/auditude/ads/util/PingUtil;->NETWORK_TIMEOUT:Ljava/lang/Integer;

    return-object v0
.end method

.method static synthetic access$2(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    invoke-static {p0, p1}, Lcom/auditude/ads/util/PingUtil;->getAbsoluteUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static final getAbsoluteUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .prologue
    .line 132
    const-string v0, ""

    .line 133
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 135
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, "http"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 167
    :goto_0
    return-object p1

    .line 139
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 143
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 144
    new-instance v2, Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Ljava/net/URL;->getPort()I

    move-result v1

    invoke-direct {v2, v3, v4, v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 145
    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p1

    goto :goto_0

    .line 146
    :catch_0
    move-exception v1

    .line 147
    const-string v1, "Ping"

    invoke-static {v1}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v1

    const-string v2, "Pinging Url: Exception when building redirect url."

    invoke-interface {v1, v2}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    :cond_1
    :goto_1
    move-object p1, v0

    .line 167
    goto :goto_0

    .line 154
    :cond_2
    :try_start_1
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 155
    invoke-virtual {v2}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 156
    const-string v3, "/"

    invoke-virtual {v1, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    .line 157
    if-gez v3, :cond_3

    const-string v1, "/"

    .line 158
    :goto_2
    new-instance v3, Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2}, Ljava/net/URL;->getPort()I

    move-result v2

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v4, v5, v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 159
    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 157
    :cond_3
    const/4 v4, 0x0

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    goto :goto_2

    .line 161
    :catch_1
    move-exception v1

    .line 163
    const-string v1, "Ping"

    invoke-static {v1}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v1

    const-string v2, "Pinging Url: Exception when building redirect url."

    invoke-interface {v1, v2}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method private static declared-synchronized getExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 2

    .prologue
    .line 46
    const-class v1, Lcom/auditude/ads/util/PingUtil;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/auditude/ads/util/PingUtil;->_executor_pred:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    sget v0, Lcom/auditude/ads/util/PingUtil;->POOL_NUM:I

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/auditude/ads/util/PingUtil;->_executor:Ljava/util/concurrent/ExecutorService;

    .line 49
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/auditude/ads/util/PingUtil;->_executor_pred:Ljava/lang/Boolean;

    .line 51
    :cond_0
    sget-object v0, Lcom/auditude/ads/util/PingUtil;->_executor:Ljava/util/concurrent/ExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 46
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static final pingUrl(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 56
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/auditude/ads/util/PingUtil;->pingUrl(Ljava/lang/String;I)V

    .line 57
    return-void
.end method

.method public static final pingUrl(Ljava/lang/String;I)V
    .locals 2

    .prologue
    .line 62
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AdSettings;->getUserAgent()Ljava/lang/String;

    move-result-object v0

    .line 63
    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 65
    const-string v0, "http.agent"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 68
    :cond_0
    invoke-static {p0, v0, p1}, Lcom/auditude/ads/util/PingUtil;->pingUrlHttpURLConnection(Ljava/lang/String;Ljava/lang/String;I)V

    .line 69
    return-void
.end method

.method private static final pingUrlHttpURLConnection(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 3

    .prologue
    .line 73
    sget v0, Lcom/auditude/ads/util/PingUtil;->REDIRECT_LIMIT:I

    if-ge p2, v0, :cond_0

    .line 75
    invoke-static {}, Lcom/auditude/ads/util/PingUtil;->getExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/auditude/ads/util/PingUtil$1;

    invoke-direct {v1, p2, p0, p1}, Lcom/auditude/ads/util/PingUtil$1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 128
    :goto_0
    return-void

    .line 126
    :cond_0
    const-string v0, "Ping"

    invoke-static {v0}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Too many redirects. Abandon Url: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    goto :goto_0
.end method
