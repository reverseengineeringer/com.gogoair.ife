.class public Lcom/adobe/mobile/TargetWorker$SendRequestTask;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/mobile/TargetWorker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "SendRequestTask"
.end annotation


# instance fields
.field private callback:Lcom/adobe/mobile/Target$TargetCallback;

.field private lifetimeValue:Ljava/math/BigDecimal;

.field private request:Lcom/adobe/mobile/TargetLocationRequest;


# direct methods
.method private constructor <init>(Lcom/adobe/mobile/TargetLocationRequest;Lcom/adobe/mobile/Target$TargetCallback;)V
    .locals 1

    .prologue
    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    iput-object p1, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->request:Lcom/adobe/mobile/TargetLocationRequest;

    .line 104
    iput-object p2, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->callback:Lcom/adobe/mobile/Target$TargetCallback;

    .line 105
    invoke-static {}, Lcom/adobe/mobile/AnalyticsTrackLifetimeValueIncrease;->getLifetimeValue()Ljava/math/BigDecimal;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->lifetimeValue:Ljava/math/BigDecimal;

    .line 106
    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/mobile/TargetLocationRequest;Lcom/adobe/mobile/Target$TargetCallback;Lcom/adobe/mobile/TargetWorker$1;)V
    .locals 0

    .prologue
    .line 94
    invoke-direct {p0, p1, p2}, Lcom/adobe/mobile/TargetWorker$SendRequestTask;-><init>(Lcom/adobe/mobile/TargetLocationRequest;Lcom/adobe/mobile/Target$TargetCallback;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 110
    iget-object v0, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->lifetimeValue:Ljava/math/BigDecimal;

    if-eqz v0, :cond_0

    .line 112
    const-string v0, "a.ltv.amount"

    iget-object v1, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->lifetimeValue:Ljava/math/BigDecimal;

    invoke-virtual {v1}, Ljava/math/BigDecimal;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/adobe/mobile/TargetWorker;->addPersistentParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->request:Lcom/adobe/mobile/TargetLocationRequest;

    iget-object v0, v0, Lcom/adobe/mobile/TargetLocationRequest;->name:Ljava/lang/String;

    iget-object v1, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->request:Lcom/adobe/mobile/TargetLocationRequest;

    iget-object v1, v1, Lcom/adobe/mobile/TargetLocationRequest;->parameters:Ljava/util/HashMap;

    # invokes: Lcom/adobe/mobile/TargetWorker;->getURLRequestString(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/adobe/mobile/TargetWorker;->access$100(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 118
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_3

    .line 119
    :cond_1
    const-string v0, "Target - LocationRequest requires a name."

    new-array v1, v6, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/adobe/mobile/StaticMethods;->logWarningFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 120
    iget-object v0, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->callback:Lcom/adobe/mobile/Target$TargetCallback;

    if-eqz v0, :cond_2

    .line 121
    iget-object v0, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->callback:Lcom/adobe/mobile/Target$TargetCallback;

    iget-object v1, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->request:Lcom/adobe/mobile/TargetLocationRequest;

    iget-object v1, v1, Lcom/adobe/mobile/TargetLocationRequest;->defaultContent:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/adobe/mobile/Target$TargetCallback;->call(Ljava/lang/Object;)V

    .line 195
    :cond_2
    :goto_0
    return-void

    .line 127
    :cond_3
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    new-instance v2, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v2}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 129
    invoke-static {}, Lcom/adobe/mobile/MobileConfig;->getInstance()Lcom/adobe/mobile/MobileConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/mobile/MobileConfig;->getDefaultLocationTimeout()I

    move-result v3

    .line 131
    mul-int/lit16 v3, v3, 0x3e8

    invoke-static {v2, v3}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 133
    const/16 v3, 0x7d0

    invoke-static {v2, v3}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 135
    new-instance v3, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v3, v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 136
    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v2, v0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 139
    invoke-static {}, Lcom/adobe/mobile/TargetWorker;->loadCookies()V

    .line 140
    # getter for: Lcom/adobe/mobile/TargetWorker;->_cookieMutex:Ljava/lang/Object;
    invoke-static {}, Lcom/adobe/mobile/TargetWorker;->access$200()Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 141
    :try_start_1
    # getter for: Lcom/adobe/mobile/TargetWorker;->_cookies:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mobile/TargetWorker;->access$300()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 142
    const-string v0, "Cookie"

    # getter for: Lcom/adobe/mobile/TargetWorker;->_cookies:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mobile/TargetWorker;->access$300()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v0, v5}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    :cond_4
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 146
    :try_start_2
    invoke-virtual {v3, v2}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 147
    invoke-virtual {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->getCookieStore()Lorg/apache/http/client/CookieStore;

    move-result-object v2

    # invokes: Lcom/adobe/mobile/TargetWorker;->saveCookies(Lorg/apache/http/client/CookieStore;)V
    invoke-static {v2}, Lcom/adobe/mobile/TargetWorker;->access$400(Lorg/apache/http/client/CookieStore;)V

    .line 149
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v2

    .line 150
    invoke-interface {v2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    .line 153
    const/16 v3, 0xc8

    if-ne v2, v3, :cond_7

    .line 154
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 155
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    .line 156
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    const-string v4, "UTF-8"

    invoke-direct {v3, v0, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 159
    :goto_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 160
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 187
    :catch_0
    move-exception v0

    .line 188
    throw v0

    .line 144
    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 189
    :catch_1
    move-exception v0

    .line 190
    const-string v0, "Target - Unable to create HttpURLConnection"

    new-array v1, v6, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/adobe/mobile/StaticMethods;->logWarningFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 191
    iget-object v0, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->callback:Lcom/adobe/mobile/Target$TargetCallback;

    if-eqz v0, :cond_2

    .line 192
    iget-object v0, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->callback:Lcom/adobe/mobile/Target$TargetCallback;

    iget-object v1, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->request:Lcom/adobe/mobile/TargetLocationRequest;

    iget-object v1, v1, Lcom/adobe/mobile/TargetLocationRequest;->defaultContent:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/adobe/mobile/Target$TargetCallback;->call(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 163
    :cond_5
    :try_start_5
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 166
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 167
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6

    .line 168
    const-string v1, "Target - LocationRequest (%s) Result: %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->request:Lcom/adobe/mobile/TargetLocationRequest;

    iget-object v4, v4, Lcom/adobe/mobile/TargetLocationRequest;->name:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/adobe/mobile/StaticMethods;->logDebugFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 169
    iget-object v1, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->callback:Lcom/adobe/mobile/Target$TargetCallback;

    if-eqz v1, :cond_2

    .line 170
    iget-object v1, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->callback:Lcom/adobe/mobile/Target$TargetCallback;

    invoke-interface {v1, v0}, Lcom/adobe/mobile/Target$TargetCallback;->call(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 174
    :cond_6
    const-string v0, "Target - LocationRequest (%s) response was empty"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->request:Lcom/adobe/mobile/TargetLocationRequest;

    iget-object v3, v3, Lcom/adobe/mobile/TargetLocationRequest;->name:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/adobe/mobile/StaticMethods;->logWarningFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 175
    iget-object v0, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->callback:Lcom/adobe/mobile/Target$TargetCallback;

    if-eqz v0, :cond_2

    .line 176
    iget-object v0, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->callback:Lcom/adobe/mobile/Target$TargetCallback;

    iget-object v1, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->request:Lcom/adobe/mobile/TargetLocationRequest;

    iget-object v1, v1, Lcom/adobe/mobile/TargetLocationRequest;->defaultContent:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/adobe/mobile/Target$TargetCallback;->call(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 182
    :cond_7
    const-string v0, "Target - No content found or user didn\'t qualify for campaign for LocationRequest (%s)"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->request:Lcom/adobe/mobile/TargetLocationRequest;

    iget-object v3, v3, Lcom/adobe/mobile/TargetLocationRequest;->name:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/adobe/mobile/StaticMethods;->logWarningFormat(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 183
    iget-object v0, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->callback:Lcom/adobe/mobile/Target$TargetCallback;

    if-eqz v0, :cond_2

    .line 184
    iget-object v0, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->callback:Lcom/adobe/mobile/Target$TargetCallback;

    iget-object v1, p0, Lcom/adobe/mobile/TargetWorker$SendRequestTask;->request:Lcom/adobe/mobile/TargetLocationRequest;

    iget-object v1, v1, Lcom/adobe/mobile/TargetLocationRequest;->defaultContent:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/adobe/mobile/Target$TargetCallback;->call(Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_0
.end method
