.class public Lcom/auditude/ads/util/http/AsyncHttpConnection;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final BITMAP:I = 0x4

.field private static final DELETE:I = 0x3

.field public static final DID_ERROR:I = 0x1

.field public static final DID_START:I = 0x0

.field public static final DID_SUCCEED:I = 0x2

.field private static final GET:I = 0x0

.field private static final HEAD:I = 0x5

.field private static final POST:I = 0x1

.field private static final PUT:I = 0x2


# instance fields
.field private data:Ljava/lang/String;

.field private handler:Landroid/os/Handler;

.field private httpClient:Lorg/apache/http/client/HttpClient;

.field private isCanceled:Z

.field private method:I

.field private timeout:I

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 56
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    invoke-direct {p0, v0}, Lcom/auditude/ads/util/http/AsyncHttpConnection;-><init>(Landroid/os/Handler;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/os/Handler;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->timeout:I

    .line 52
    iput-boolean v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->isCanceled:Z

    .line 61
    iput-object p1, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->handler:Landroid/os/Handler;

    .line 62
    return-void
.end method

.method private processBitmapEntity(Lorg/apache/http/HttpEntity;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 251
    iget-boolean v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->isCanceled:Z

    if-eqz v0, :cond_0

    .line 256
    :goto_0
    return-void

    .line 253
    :cond_0
    new-instance v0, Lorg/apache/http/entity/BufferedHttpEntity;

    invoke-direct {v0, p1}, Lorg/apache/http/entity/BufferedHttpEntity;-><init>(Lorg/apache/http/HttpEntity;)V

    .line 254
    invoke-virtual {v0}, Lorg/apache/http/entity/BufferedHttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 255
    iget-object v1, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->handler:Landroid/os/Handler;

    const/4 v3, 0x2

    invoke-static {v2, v3, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method

.method private processEntity(Lorg/apache/http/HttpEntity;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 233
    iget-boolean v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->isCanceled:Z

    if-eqz v0, :cond_0

    .line 247
    :goto_0
    return-void

    .line 235
    :cond_0
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 238
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 239
    :goto_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    .line 243
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 245
    iget-object v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->handler:Landroid/os/Handler;

    const/4 v2, 0x2

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v2, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 246
    iget-object v1, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    .line 241
    :cond_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1
.end method


# virtual methods
.method public bitmap(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 111
    const/4 v0, 0x4

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/auditude/ads/util/http/AsyncHttpConnection;->create(ILjava/lang/String;Ljava/lang/String;)V

    .line 112
    return-void
.end method

.method public bitmap(Ljava/lang/String;I)V
    .locals 2

    .prologue
    .line 116
    const/4 v0, 0x4

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1, p2}, Lcom/auditude/ads/util/http/AsyncHttpConnection;->create(ILjava/lang/String;Ljava/lang/String;I)V

    .line 117
    return-void
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 131
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->isCanceled:Z

    .line 132
    return-void
.end method

.method public create(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 76
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/auditude/ads/util/http/AsyncHttpConnection;->create(ILjava/lang/String;Ljava/lang/String;I)V

    .line 77
    return-void
.end method

.method public create(ILjava/lang/String;Ljava/lang/String;I)V
    .locals 1

    .prologue
    .line 66
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->isCanceled:Z

    .line 67
    iput p1, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->method:I

    .line 68
    iput-object p2, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->url:Ljava/lang/String;

    .line 69
    iput-object p3, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->data:Ljava/lang/String;

    .line 70
    iput p4, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->timeout:I

    .line 71
    invoke-static {}, Lcom/auditude/ads/util/http/ConnectionManager;->getInstance()Lcom/auditude/ads/util/http/ConnectionManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/auditude/ads/util/http/ConnectionManager;->push(Ljava/lang/Runnable;)V

    .line 72
    return-void
.end method

.method public delete(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 106
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/auditude/ads/util/http/AsyncHttpConnection;->create(ILjava/lang/String;Ljava/lang/String;)V

    .line 107
    return-void
.end method

.method public get(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 81
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/auditude/ads/util/http/AsyncHttpConnection;->create(ILjava/lang/String;Ljava/lang/String;)V

    .line 82
    return-void
.end method

.method public get(Ljava/lang/String;I)V
    .locals 2

    .prologue
    .line 86
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1, p2}, Lcom/auditude/ads/util/http/AsyncHttpConnection;->create(ILjava/lang/String;Ljava/lang/String;I)V

    .line 87
    return-void
.end method

.method public head(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 121
    const/4 v0, 0x5

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/auditude/ads/util/http/AsyncHttpConnection;->create(ILjava/lang/String;Ljava/lang/String;)V

    .line 122
    return-void
.end method

.method public head(Ljava/lang/String;I)V
    .locals 2

    .prologue
    .line 126
    const/4 v0, 0x5

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1, p2}, Lcom/auditude/ads/util/http/AsyncHttpConnection;->create(ILjava/lang/String;Ljava/lang/String;I)V

    .line 127
    return-void
.end method

.method public post(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 91
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1, p2}, Lcom/auditude/ads/util/http/AsyncHttpConnection;->create(ILjava/lang/String;Ljava/lang/String;)V

    .line 92
    return-void
.end method

.method public post(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1

    .prologue
    .line 96
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/auditude/ads/util/http/AsyncHttpConnection;->create(ILjava/lang/String;Ljava/lang/String;I)V

    .line 97
    return-void
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 101
    const/4 v0, 0x2

    invoke-virtual {p0, v0, p1, p2}, Lcom/auditude/ads/util/http/AsyncHttpConnection;->create(ILjava/lang/String;Ljava/lang/String;)V

    .line 102
    return-void
.end method

.method public run()V
    .locals 7

    .prologue
    const/16 v6, 0x190

    const/4 v5, 0x1

    .line 136
    iget-object v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->handler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 138
    new-instance v1, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v1}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 140
    iget v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->timeout:I

    invoke-static {v1, v0}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 143
    iget v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->timeout:I

    invoke-static {v1, v0}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 146
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AdSettings;->getUserAgent()Ljava/lang/String;

    move-result-object v0

    .line 147
    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 149
    const-string v0, "http.agent"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 152
    :cond_0
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    iput-object v2, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 153
    iget-object v1, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v1}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v1

    const-string v2, "http.protocol.allow-circular-redirects"

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 159
    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 161
    iget-object v1, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v1}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v1

    const-string v2, "http.useragent"

    invoke-interface {v1, v2, v0}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 166
    :cond_1
    const/4 v0, 0x0

    .line 167
    :try_start_0
    iget v1, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->method:I

    packed-switch v1, :pswitch_data_0

    .line 196
    :goto_0
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    .line 198
    iget v2, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->method:I

    const/4 v3, 0x5

    if-ne v2, v3, :cond_4

    .line 201
    if-lt v1, v6, :cond_3

    .line 203
    iget-object v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->handler:Landroid/os/Handler;

    const/4 v1, 0x2

    const-string v2, "false"

    invoke-static {v0, v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 210
    :goto_1
    iget-object v1, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 228
    :cond_2
    :goto_2
    invoke-static {}, Lcom/auditude/ads/util/http/ConnectionManager;->getInstance()Lcom/auditude/ads/util/http/ConnectionManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/auditude/ads/util/http/ConnectionManager;->didComplete(Ljava/lang/Runnable;)V

    .line 229
    return-void

    .line 170
    :pswitch_0
    :try_start_1
    iget-object v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->httpClient:Lorg/apache/http/client/HttpClient;

    new-instance v1, Lorg/apache/http/client/methods/HttpGet;

    iget-object v2, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->url:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/auditude/ads/util/http/ConnectionManager;->getInstance()Lcom/auditude/ads/util/http/ConnectionManager;

    move-result-object v2

    new-instance v3, Ljava/net/URL;

    iget-object v4, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->url:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/auditude/ads/util/http/ConnectionManager;->getLocalContext(Ljava/lang/String;)Lorg/apache/http/protocol/HttpContext;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    goto :goto_0

    .line 173
    :pswitch_1
    new-instance v0, Lorg/apache/http/client/methods/HttpPost;

    iget-object v1, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->url:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 174
    new-instance v1, Lorg/apache/http/entity/StringEntity;

    iget-object v2, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->data:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 175
    iget-object v1, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-static {}, Lcom/auditude/ads/util/http/ConnectionManager;->getInstance()Lcom/auditude/ads/util/http/ConnectionManager;

    move-result-object v2

    new-instance v3, Ljava/net/URL;

    iget-object v4, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->url:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/auditude/ads/util/http/ConnectionManager;->getLocalContext(Ljava/lang/String;)Lorg/apache/http/protocol/HttpContext;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    goto :goto_0

    .line 178
    :pswitch_2
    new-instance v0, Lorg/apache/http/client/methods/HttpPut;

    iget-object v1, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->url:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPut;-><init>(Ljava/lang/String;)V

    .line 179
    new-instance v1, Lorg/apache/http/entity/StringEntity;

    iget-object v2, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->data:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpPut;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 180
    iget-object v1, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v1, v0}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    goto/16 :goto_0

    .line 183
    :pswitch_3
    iget-object v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->httpClient:Lorg/apache/http/client/HttpClient;

    new-instance v1, Lorg/apache/http/client/methods/HttpDelete;

    iget-object v2, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->url:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/apache/http/client/methods/HttpDelete;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    goto/16 :goto_0

    .line 186
    :pswitch_4
    iget-object v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->httpClient:Lorg/apache/http/client/HttpClient;

    new-instance v1, Lorg/apache/http/client/methods/HttpGet;

    iget-object v2, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->url:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 187
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/auditude/ads/util/http/AsyncHttpConnection;->processBitmapEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 224
    :catch_0
    move-exception v0

    .line 226
    iget-object v1, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->handler:Landroid/os/Handler;

    invoke-static {v2, v5, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_2

    .line 190
    :pswitch_5
    :try_start_2
    iget-object v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->httpClient:Lorg/apache/http/client/HttpClient;

    new-instance v1, Lorg/apache/http/client/methods/HttpHead;

    iget-object v2, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->url:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/apache/http/client/methods/HttpHead;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    goto/16 :goto_0

    .line 207
    :cond_3
    iget-object v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->handler:Landroid/os/Handler;

    const/4 v1, 0x2

    const-string v2, "true"

    invoke-static {v0, v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    goto/16 :goto_1

    .line 214
    :cond_4
    if-lt v1, v6, :cond_5

    .line 216
    iget-object v0, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->handler:Landroid/os/Handler;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_2

    .line 218
    :cond_5
    iget v1, p0, Lcom/auditude/ads/util/http/AsyncHttpConnection;->method:I

    const/4 v2, 0x4

    if-ge v1, v2, :cond_2

    .line 220
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/auditude/ads/util/http/AsyncHttpConnection;->processEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_2

    .line 167
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method
