.class Lcom/auditude/ads/util/PingUtil$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic val$redirect:I

.field private final synthetic val$url:Ljava/lang/String;

.field private final synthetic val$userAgent:Ljava/lang/String;


# direct methods
.method constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput p1, p0, Lcom/auditude/ads/util/PingUtil$1;->val$redirect:I

    iput-object p2, p0, Lcom/auditude/ads/util/PingUtil$1;->val$url:Ljava/lang/String;

    iput-object p3, p0, Lcom/auditude/ads/util/PingUtil$1;->val$userAgent:Ljava/lang/String;

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v1, 0x0

    .line 78
    const/4 v2, 0x0

    .line 80
    const-string v0, ""

    .line 83
    :try_start_0
    iget-object v3, p0, Lcom/auditude/ads/util/PingUtil$1;->val$url:Ljava/lang/String;

    # invokes: Lcom/auditude/ads/util/PingUtil;->_requestConnect(Ljava/lang/String;)Ljava/net/HttpURLConnection;
    invoke-static {v3}, Lcom/auditude/ads/util/PingUtil;->access$0(Ljava/lang/String;)Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 84
    const/4 v3, 0x0

    :try_start_1
    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 86
    if-eqz v2, :cond_2

    .line 88
    const-string v3, "GET"

    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 89
    # getter for: Lcom/auditude/ads/util/PingUtil;->NETWORK_TIMEOUT:Ljava/lang/Integer;
    invoke-static {}, Lcom/auditude/ads/util/PingUtil;->access$1()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 90
    # getter for: Lcom/auditude/ads/util/PingUtil;->NETWORK_TIMEOUT:Ljava/lang/Integer;
    invoke-static {}, Lcom/auditude/ads/util/PingUtil;->access$1()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 92
    const-string v3, "User-Agent"

    iget-object v4, p0, Lcom/auditude/ads/util/PingUtil$1;->val$userAgent:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    const-string v3, "Connection"

    const-string v4, "close"

    invoke-virtual {v2, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->connect()V

    .line 96
    const-string v3, "Ping"

    invoke-static {v3}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Pinging Url ["

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, p0, Lcom/auditude/ads/util/PingUtil$1;->val$redirect:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/auditude/ads/util/PingUtil$1;->val$url:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    .line 99
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    .line 100
    const/16 v4, 0x12e

    if-eq v3, v4, :cond_0

    const/16 v4, 0x12d

    if-ne v3, v4, :cond_1

    .line 101
    :cond_0
    iget-object v3, p0, Lcom/auditude/ads/util/PingUtil$1;->val$url:Ljava/lang/String;

    const-string v4, "Location"

    invoke-virtual {v2, v4}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    # invokes: Lcom/auditude/ads/util/PingUtil;->getAbsoluteUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v3, v4}, Lcom/auditude/ads/util/PingUtil;->access$2(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 102
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "http"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 103
    const/4 v1, 0x1

    .line 107
    :cond_1
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 116
    :cond_2
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 118
    :cond_3
    if-eqz v1, :cond_4

    .line 119
    const-string v1, "Ping"

    invoke-static {v1}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Redirect to Url ["

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/auditude/ads/util/PingUtil$1;->val$redirect:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    .line 120
    iget v1, p0, Lcom/auditude/ads/util/PingUtil$1;->val$redirect:I

    add-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Lcom/auditude/ads/util/PingUtil;->pingUrl(Ljava/lang/String;I)V

    .line 123
    :cond_4
    :goto_0
    return-void

    .line 109
    :catch_0
    move-exception v3

    .line 110
    :try_start_2
    const-string v3, "Ping"

    invoke-static {v3}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Pinging Url: Timed out sending request to "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/auditude/ads/util/PingUtil$1;->val$url:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 116
    if-eqz v2, :cond_5

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 118
    :cond_5
    if-eqz v1, :cond_4

    .line 119
    const-string v1, "Ping"

    invoke-static {v1}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Redirect to Url ["

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/auditude/ads/util/PingUtil$1;->val$redirect:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    .line 120
    iget v1, p0, Lcom/auditude/ads/util/PingUtil$1;->val$redirect:I

    add-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Lcom/auditude/ads/util/PingUtil;->pingUrl(Ljava/lang/String;I)V

    goto :goto_0

    .line 111
    :catch_1
    move-exception v3

    move-object v7, v3

    move-object v3, v2

    move v2, v1

    move-object v1, v0

    move-object v0, v7

    .line 112
    :goto_1
    :try_start_3
    const-string v4, "Ping"

    invoke-static {v4}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Pinging Url: IOException while sending request, may retry("

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/IOException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ")"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 116
    if-eqz v3, :cond_6

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 118
    :cond_6
    if-eqz v2, :cond_4

    .line 119
    const-string v0, "Ping"

    invoke-static {v0}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Redirect to Url ["

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/auditude/ads/util/PingUtil$1;->val$redirect:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    .line 120
    iget v0, p0, Lcom/auditude/ads/util/PingUtil$1;->val$redirect:I

    add-int/lit8 v0, v0, 0x1

    invoke-static {v1, v0}, Lcom/auditude/ads/util/PingUtil;->pingUrl(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 113
    :catch_2
    move-exception v3

    .line 114
    :try_start_4
    const-string v3, "Ping"

    invoke-static {v3}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Pinging Url: Unable to create HTTP connection to "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/auditude/ads/util/PingUtil$1;->val$url:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 116
    if-eqz v2, :cond_7

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 118
    :cond_7
    if-eqz v1, :cond_4

    .line 119
    const-string v1, "Ping"

    invoke-static {v1}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Redirect to Url ["

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/auditude/ads/util/PingUtil$1;->val$redirect:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    .line 120
    iget v1, p0, Lcom/auditude/ads/util/PingUtil$1;->val$redirect:I

    add-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Lcom/auditude/ads/util/PingUtil;->pingUrl(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 115
    :catchall_0
    move-exception v3

    move-object v7, v3

    move-object v3, v2

    move v2, v1

    move-object v1, v0

    move-object v0, v7

    .line 116
    :goto_2
    if-eqz v3, :cond_8

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 118
    :cond_8
    if-eqz v2, :cond_9

    .line 119
    const-string v2, "Ping"

    invoke-static {v2}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Redirect to Url ["

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p0, Lcom/auditude/ads/util/PingUtil$1;->val$redirect:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    .line 120
    iget v2, p0, Lcom/auditude/ads/util/PingUtil$1;->val$redirect:I

    add-int/lit8 v2, v2, 0x1

    invoke-static {v1, v2}, Lcom/auditude/ads/util/PingUtil;->pingUrl(Ljava/lang/String;I)V

    .line 122
    :cond_9
    throw v0

    .line 115
    :catchall_1
    move-exception v3

    move-object v7, v3

    move-object v3, v2

    move v2, v1

    move-object v1, v0

    move-object v0, v7

    goto :goto_2

    :catchall_2
    move-exception v0

    goto :goto_2

    .line 111
    :catch_3
    move-exception v3

    move-object v7, v3

    move-object v3, v2

    move v2, v1

    move-object v1, v0

    move-object v0, v7

    goto/16 :goto_1
.end method
