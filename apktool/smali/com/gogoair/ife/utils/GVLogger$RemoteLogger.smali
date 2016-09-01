.class Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gogoair/ife/utils/GVLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RemoteLogger"
.end annotation


# instance fields
.field private isAccountingGrade:Ljava/lang/Boolean;

.field private listener:Lcom/gogoair/ife/utils/GVLogger$RemoteLoggerListener;

.field private final postData:Ljava/lang/String;

.field private final requestMethod:Ljava/lang/String;

.field private responseData:Ljava/lang/String;

.field final synthetic this$0:Lcom/gogoair/ife/utils/GVLogger;


# direct methods
.method public constructor <init>(Lcom/gogoair/ife/utils/GVLogger;Ljava/lang/String;Lcom/gogoair/ife/utils/GVLogger$RemoteLoggerListener;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 141
    iput-object p1, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->this$0:Lcom/gogoair/ife/utils/GVLogger;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 139
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->isAccountingGrade:Ljava/lang/Boolean;

    .line 142
    iput-object p3, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->listener:Lcom/gogoair/ife/utils/GVLogger$RemoteLoggerListener;

    .line 143
    iput-object p2, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->requestMethod:Ljava/lang/String;

    .line 144
    iput-object p4, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->isAccountingGrade:Ljava/lang/Boolean;

    .line 145
    iput-object p5, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->postData:Ljava/lang/String;

    .line 146
    return-void
.end method

.method public constructor <init>(Lcom/gogoair/ife/utils/GVLogger;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 148
    iput-object p1, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->this$0:Lcom/gogoair/ife/utils/GVLogger;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 139
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->isAccountingGrade:Ljava/lang/Boolean;

    .line 149
    iput-object p2, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->requestMethod:Ljava/lang/String;

    .line 150
    iput-object p3, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->postData:Ljava/lang/String;

    .line 151
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 6

    .prologue
    .line 155
    const/4 v1, 0x0

    .line 157
    :try_start_0
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v2, "GVLogger"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Logging it to: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x0

    aget-object v4, p1, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    new-instance v0, Ljava/net/URL;

    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-direct {v0, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 159
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    const v1, 0x186a0

    :try_start_1
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 162
    const v1, 0x249f0

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 163
    iget-object v1, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->requestMethod:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 164
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 165
    iget-object v1, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->isAccountingGrade:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 166
    const-string v1, "Content-Type"

    const-string v2, "application/json"

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    :cond_0
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    .line 170
    new-instance v2, Ljava/io/BufferedWriter;

    new-instance v3, Ljava/io/OutputStreamWriter;

    const-string v4, "UTF-8"

    invoke-direct {v3, v1, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 171
    iget-object v3, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->postData:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 172
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->flush()V

    .line 173
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->close()V

    .line 174
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 176
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    const/16 v2, 0xc8

    if-lt v1, v2, :cond_4

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    const/16 v2, 0x12b

    if-gt v1, v2, :cond_4

    .line 177
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v1

    const-string v2, "GVLogger"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Logged to remote: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->postData:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 179
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 181
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 182
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    .line 192
    :catch_0
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    .line 193
    :goto_1
    :try_start_2
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 194
    invoke-virtual {v0}, Ljava/io/IOException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->responseData:Ljava/lang/String;

    .line 195
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    .line 197
    if-eqz v1, :cond_1

    .line 198
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_1
    :goto_2
    return-object v0

    .line 184
    :cond_2
    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 185
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->responseData:Ljava/lang/String;

    .line 186
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result-object v1

    .line 197
    if-eqz v0, :cond_3

    .line 198
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_3
    move-object v0, v1

    goto :goto_2

    .line 188
    :cond_4
    :try_start_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Server returned with response code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->responseData:Ljava/lang/String;

    .line 189
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result-object v1

    .line 197
    if-eqz v0, :cond_5

    .line 198
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_5
    move-object v0, v1

    goto :goto_2

    .line 197
    :catchall_0
    move-exception v0

    :goto_3
    if-eqz v1, :cond_6

    .line 198
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_6
    throw v0

    .line 197
    :catchall_1
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_3

    .line 192
    :catch_1
    move-exception v0

    goto :goto_1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 133
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->doInBackground([Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 2

    .prologue
    .line 205
    iget-object v0, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->listener:Lcom/gogoair/ife/utils/GVLogger$RemoteLoggerListener;

    if-eqz v0, :cond_0

    .line 206
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 207
    iget-object v0, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->listener:Lcom/gogoair/ife/utils/GVLogger$RemoteLoggerListener;

    iget-object v1, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->responseData:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/gogoair/ife/utils/GVLogger$RemoteLoggerListener;->onLogSuccess(Ljava/lang/String;)V

    .line 212
    :cond_0
    :goto_0
    return-void

    .line 209
    :cond_1
    iget-object v0, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->listener:Lcom/gogoair/ife/utils/GVLogger$RemoteLoggerListener;

    iget-object v1, p0, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->responseData:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/gogoair/ife/utils/GVLogger$RemoteLoggerListener;->onLogFailure(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 133
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/gogoair/ife/utils/GVLogger$RemoteLogger;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method
