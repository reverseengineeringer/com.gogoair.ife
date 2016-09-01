.class Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# instance fields
.field newNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

.field final synthetic this$0:Lcom/gogoair/ife/utils/GVNetworkManager;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/utils/GVNetworkManager;Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 60
    iput-object p1, p0, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;->this$0:Lcom/gogoair/ife/utils/GVNetworkManager;

    iput-object p2, p0, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 62
    sget-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->unknown:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    iput-object v0, p0, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;->newNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    return-void
.end method

.method private connectsToUrl(Ljava/lang/String;Z)Z
    .locals 8

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 89
    const/4 v3, 0x0

    .line 91
    :try_start_0
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v4, "GVNetworkManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Checking url: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 93
    if-nez p2, :cond_1

    .line 94
    const/4 v4, 0x0

    invoke-static {v4}, Ljava/net/HttpURLConnection;->setFollowRedirects(Z)V

    .line 98
    :goto_0
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/ProtocolException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    const/16 v3, 0x2710

    :try_start_1
    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 100
    const/16 v3, 0x3a98

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 101
    const-string v3, "GET"

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 102
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    const/16 v4, 0xc8

    if-ne v3, v4, :cond_3

    .line 103
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v3

    const-string v4, "GVNetworkManager"

    const-string v5, "Returning true"

    invoke-virtual {v3, v4, v5}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/net/ProtocolException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 111
    if-eqz v0, :cond_0

    .line 112
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_0
    move v0, v1

    .line 114
    :goto_1
    return v0

    .line 96
    :cond_1
    const/4 v4, 0x1

    :try_start_2
    invoke-static {v4}, Ljava/net/HttpURLConnection;->setFollowRedirects(Z)V
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/net/ProtocolException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 106
    :catch_0
    move-exception v0

    move-object v1, v3

    :goto_2
    move-object v3, v1

    .line 107
    :goto_3
    :try_start_3
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 111
    if-eqz v3, :cond_2

    .line 112
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_2
    :goto_4
    move v0, v2

    .line 114
    goto :goto_1

    .line 111
    :cond_3
    if-eqz v0, :cond_2

    .line 112
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_4

    .line 108
    :catch_1
    move-exception v0

    .line 109
    :goto_5
    :try_start_4
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "GVNetworkManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to connect to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v1, v4}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 111
    if-eqz v3, :cond_2

    .line 112
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_4

    .line 111
    :catchall_0
    move-exception v0

    :goto_6
    if-eqz v3, :cond_4

    .line 112
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_4
    throw v0

    .line 111
    :catchall_1
    move-exception v1

    move-object v3, v0

    move-object v0, v1

    goto :goto_6

    .line 108
    :catch_2
    move-exception v1

    move-object v3, v0

    goto :goto_5

    .line 106
    :catch_3
    move-exception v0

    goto :goto_3

    :catch_4
    move-exception v1

    move-object v3, v0

    move-object v0, v1

    goto :goto_3

    :catch_5
    move-exception v1

    move-object v7, v1

    move-object v1, v0

    move-object v0, v7

    goto :goto_2
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 60
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 66
    aget-object v0, p1, v1

    invoke-direct {p0, v0, v1}, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;->connectsToUrl(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    sget-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->in_air:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    iput-object v0, p0, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;->newNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    .line 75
    :goto_0
    const-string v0, "DONE"

    return-object v0

    .line 68
    :cond_0
    aget-object v0, p1, v2

    invoke-direct {p0, v0, v2}, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;->connectsToUrl(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 69
    sget-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->ground:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    iput-object v0, p0, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;->newNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    goto :goto_0

    .line 71
    :cond_1
    sget-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->ground:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    iput-object v0, p0, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;->newNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 60
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 80
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "GVNetworkManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Previous net: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    # getter for: Lcom/gogoair/ife/utils/GVNetworkManager;->currentNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;
    invoke-static {}, Lcom/gogoair/ife/utils/GVNetworkManager;->access$000()Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    # getter for: Lcom/gogoair/ife/utils/GVNetworkManager;->currentNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;
    invoke-static {}, Lcom/gogoair/ife/utils/GVNetworkManager;->access$000()Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    move-result-object v0

    iget-object v1, p0, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;->newNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;->newNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    sget-object v1, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->unknown:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    if-ne v0, v1, :cond_1

    .line 82
    :cond_0
    iget-object v0, p0, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;->newNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    # setter for: Lcom/gogoair/ife/utils/GVNetworkManager;->currentNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;
    invoke-static {v0}, Lcom/gogoair/ife/utils/GVNetworkManager;->access$002(Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;)Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    .line 83
    iget-object v0, p0, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;->newNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    # invokes: Lcom/gogoair/ife/utils/GVNetworkManager;->notifyNetworkChanged(Landroid/content/Context;Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;)V
    invoke-static {v0, v1}, Lcom/gogoair/ife/utils/GVNetworkManager;->access$100(Landroid/content/Context;Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;)V

    .line 85
    :cond_1
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "GVNetworkManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Current net: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    # getter for: Lcom/gogoair/ife/utils/GVNetworkManager;->currentNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;
    invoke-static {}, Lcom/gogoair/ife/utils/GVNetworkManager;->access$000()Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    return-void
.end method
