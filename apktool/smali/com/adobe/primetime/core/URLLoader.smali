.class public Lcom/adobe/primetime/core/URLLoader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/primetime/core/URLLoader$URLRequest;,
        Lcom/adobe/primetime/core/URLLoader$HttpMethod;
    }
.end annotation


# static fields
.field private static final CHANNEL_URL_LOADER:Ljava/lang/String; = "channel_url_loader"

.field private static final NETWORK_TIMEOUT:Ljava/lang/Integer;

.field public static final SERVER_RESPONSE:Ljava/lang/String; = "server_response"

.field private static _executor:Ljava/util/concurrent/ExecutorService;

.field private static volatile _executor_pred:Z

.field private static volatile getDefaultUserAgent_pred:Z

.field private static volatile getPlatform_pred:Z

.field private static platform:Ljava/lang/String;

.field private static userAgent:Ljava/lang/String;


# instance fields
.field private final _channel:Lcom/adobe/primetime/core/radio/Channel;

.field private _logTag:Ljava/lang/String;

.field private _logger:Lcom/adobe/primetime/core/ILogger;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 37
    const/16 v0, 0x7530

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/adobe/primetime/core/URLLoader;->NETWORK_TIMEOUT:Ljava/lang/Integer;

    .line 48
    sput-boolean v1, Lcom/adobe/primetime/core/URLLoader;->_executor_pred:Z

    .line 235
    sput-object v2, Lcom/adobe/primetime/core/URLLoader;->platform:Ljava/lang/String;

    .line 236
    sput-boolean v1, Lcom/adobe/primetime/core/URLLoader;->getPlatform_pred:Z

    .line 250
    sput-object v2, Lcom/adobe/primetime/core/URLLoader;->userAgent:Ljava/lang/String;

    .line 251
    sput-boolean v1, Lcom/adobe/primetime/core/URLLoader;->getDefaultUserAgent_pred:Z

    return-void
.end method

.method public constructor <init>(Lcom/adobe/primetime/core/ILogger;)V
    .locals 3

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    if-nez p1, :cond_0

    .line 105
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to logger cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 107
    :cond_0
    iput-object p1, p0, Lcom/adobe/primetime/core/URLLoader;->_logger:Lcom/adobe/primetime/core/ILogger;

    .line 108
    const-class v0, Lcom/adobe/primetime/core/URLLoader;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/core/URLLoader;->_logTag:Ljava/lang/String;

    .line 110
    new-instance v0, Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "channel_url_loader"

    iget-object v2, p0, Lcom/adobe/primetime/core/URLLoader;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/core/radio/Channel;-><init>(Ljava/lang/String;Lcom/adobe/primetime/core/ILogger;)V

    iput-object v0, p0, Lcom/adobe/primetime/core/URLLoader;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    .line 112
    return-void
.end method

.method private _handleConnectionError(Ljava/lang/String;)V
    .locals 7

    .prologue
    .line 186
    iget-object v0, p0, Lcom/adobe/primetime/core/URLLoader;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/core/URLLoader;->_logTag:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Lcom/adobe/primetime/core/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    iget-object v0, p0, Lcom/adobe/primetime/core/URLLoader;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    new-instance v1, Lcom/adobe/primetime/core/Event;

    const-string v2, "error"

    new-instance v3, Lcom/adobe/primetime/va/ErrorInfo;

    const-string v4, "error"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Internal Error: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/adobe/primetime/va/ErrorInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v1, v2, v3}, Lcom/adobe/primetime/core/Event;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/radio/Channel;->trigger(Lcom/adobe/primetime/core/Event;)V

    .line 188
    return-void
.end method

.method private _inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 6

    .prologue
    .line 209
    if-nez p1, :cond_0

    .line 210
    const/4 v0, 0x0

    .line 229
    :goto_0
    return-object v0

    .line 213
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 215
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v0, Ljava/io/InputStreamReader;

    const-string v3, "UTF-8"

    invoke-direct {v0, p1, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v2, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 219
    :goto_1
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 220
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 223
    :catchall_0
    move-exception v0

    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    throw v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 225
    :catch_0
    move-exception v0

    .line 226
    iget-object v2, p0, Lcom/adobe/primetime/core/URLLoader;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v3, p0, Lcom/adobe/primetime/core/URLLoader;->_logTag:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "#load() - Exception while reading from stream("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/IOException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ")"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v3, v0}, Lcom/adobe/primetime/core/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    :goto_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 223
    :cond_1
    :try_start_3
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2
.end method

.method private _requestConnect(Ljava/lang/String;)Ljava/net/HttpURLConnection;
    .locals 5

    .prologue
    .line 192
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 194
    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    const-string v2, "https"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 195
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .line 196
    new-instance v1, Lorg/apache/http/conn/ssl/StrictHostnameVerifier;

    invoke-direct {v1}, Lorg/apache/http/conn/ssl/StrictHostnameVerifier;-><init>()V

    invoke-virtual {v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 205
    :goto_0
    return-object v0

    .line 199
    :cond_0
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 201
    :catch_0
    move-exception v0

    .line 202
    iget-object v1, p0, Lcom/adobe/primetime/core/URLLoader;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v2, p0, Lcom/adobe/primetime/core/URLLoader;->_logTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "#load() -  Exception opening URL("

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

    invoke-interface {v1, v2, v0}, Lcom/adobe/primetime/core/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/adobe/primetime/core/URLLoader;Ljava/lang/String;)Ljava/net/HttpURLConnection;
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/adobe/primetime/core/URLLoader;->_requestConnect(Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/adobe/primetime/core/URLLoader;->NETWORK_TIMEOUT:Ljava/lang/Integer;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/primetime/core/URLLoader;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/adobe/primetime/core/URLLoader;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/primetime/core/URLLoader;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/adobe/primetime/core/URLLoader;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/primetime/core/URLLoader;Ljava/io/InputStream;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/adobe/primetime/core/URLLoader;->_inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/primetime/core/URLLoader;)Lcom/adobe/primetime/core/radio/Channel;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/adobe/primetime/core/URLLoader;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/primetime/core/URLLoader;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/adobe/primetime/core/URLLoader;->_handleConnectionError(Ljava/lang/String;)V

    return-void
.end method

.method private static getAndroidVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 247
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    return-object v0
.end method

.method protected static declared-synchronized getDefaultUserAgent()Ljava/lang/String;
    .locals 3

    .prologue
    .line 254
    const-class v1, Lcom/adobe/primetime/core/URLLoader;

    monitor-enter v1

    :try_start_0
    sget-boolean v0, Lcom/adobe/primetime/core/URLLoader;->getDefaultUserAgent_pred:Z

    if-eqz v0, :cond_0

    .line 255
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Mozilla/5.0 (Linux; U; Android "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/adobe/primetime/core/URLLoader;->getAndroidVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "; en-US"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "; "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 256
    invoke-static {}, Lcom/adobe/primetime/core/URLLoader;->getPlatform()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " Build/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Landroid/os/Build;->ID:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/primetime/core/URLLoader;->userAgent:Ljava/lang/String;

    .line 257
    const/4 v0, 0x0

    sput-boolean v0, Lcom/adobe/primetime/core/URLLoader;->getDefaultUserAgent_pred:Z

    .line 259
    :cond_0
    sget-object v0, Lcom/adobe/primetime/core/URLLoader;->userAgent:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 254
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static declared-synchronized getExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 2

    .prologue
    .line 51
    const-class v1, Lcom/adobe/primetime/core/URLLoader;

    monitor-enter v1

    :try_start_0
    sget-boolean v0, Lcom/adobe/primetime/core/URLLoader;->_executor_pred:Z

    if-eqz v0, :cond_0

    .line 52
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/adobe/primetime/core/URLLoader;->_executor:Ljava/util/concurrent/ExecutorService;

    .line 53
    const/4 v0, 0x0

    sput-boolean v0, Lcom/adobe/primetime/core/URLLoader;->_executor_pred:Z

    .line 55
    :cond_0
    sget-object v0, Lcom/adobe/primetime/core/URLLoader;->_executor:Ljava/util/concurrent/ExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 51
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method protected static declared-synchronized getPlatform()Ljava/lang/String;
    .locals 2

    .prologue
    .line 239
    const-class v1, Lcom/adobe/primetime/core/URLLoader;

    monitor-enter v1

    :try_start_0
    sget-boolean v0, Lcom/adobe/primetime/core/URLLoader;->getPlatform_pred:Z

    if-eqz v0, :cond_0

    .line 240
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sput-object v0, Lcom/adobe/primetime/core/URLLoader;->platform:Ljava/lang/String;

    .line 241
    const/4 v0, 0x0

    sput-boolean v0, Lcom/adobe/primetime/core/URLLoader;->getPlatform_pred:Z

    .line 243
    :cond_0
    sget-object v0, Lcom/adobe/primetime/core/URLLoader;->platform:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 239
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public load(Lcom/adobe/primetime/core/URLLoader$URLRequest;)V
    .locals 2

    .prologue
    .line 122
    invoke-static {}, Lcom/adobe/primetime/core/URLLoader;->getExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/adobe/primetime/core/URLLoader$1;

    invoke-direct {v1, p0, p1}, Lcom/adobe/primetime/core/URLLoader$1;-><init>(Lcom/adobe/primetime/core/URLLoader;Lcom/adobe/primetime/core/URLLoader$URLRequest;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 180
    return-void
.end method

.method public on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/adobe/primetime/core/URLLoader;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    invoke-virtual {v0, p1, p2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 119
    return-void
.end method
