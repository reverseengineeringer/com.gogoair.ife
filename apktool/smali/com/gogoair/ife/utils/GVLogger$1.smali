.class Lcom/gogoair/ife/utils/GVLogger$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/gogoair/ife/utils/GVLogger$RemoteLoggerListener;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/utils/GVLogger;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$entry:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/utils/GVLogger;Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 85
    iput-object p1, p0, Lcom/gogoair/ife/utils/GVLogger$1;->this$0:Lcom/gogoair/ife/utils/GVLogger;

    iput-object p2, p0, Lcom/gogoair/ife/utils/GVLogger$1;->val$entry:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    iput-object p3, p0, Lcom/gogoair/ife/utils/GVLogger$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private logError(Ljava/lang/String;)V
    .locals 6

    .prologue
    .line 96
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "ERROR"

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->ACC_GRADE_LOG_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    invoke-virtual {v2}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->getValue()I

    move-result v2

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/gogoair/ife/utils/GVLogger$1;->val$entry:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-virtual {v4}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getAppData()Ljava/lang/String;

    move-result-object v4

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lcom/gogoair/ife/utils/GVLogger;->logASP(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    .line 97
    return-void
.end method

.method private logSuccess()V
    .locals 6

    .prologue
    .line 88
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "INFO"

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->ACC_GRADE_LOG_SUCCESS:Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    invoke-virtual {v2}, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->getValue()I

    move-result v2

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/gogoair/ife/utils/GVLogger$1;->val$entry:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-virtual {v4}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getAppData()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Accounting grade log sent successfully."

    invoke-virtual/range {v0 .. v5}, Lcom/gogoair/ife/utils/GVLogger;->logASP(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    .line 89
    new-instance v0, Lcom/gogoair/ife/storage/MediaDb;

    iget-object v1, p0, Lcom/gogoair/ife/utils/GVLogger$1;->val$context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/gogoair/ife/storage/MediaDb;-><init>(Landroid/content/Context;)V

    .line 90
    iget-object v1, p0, Lcom/gogoair/ife/utils/GVLogger$1;->val$entry:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->setPlaybackLogged(Z)V

    .line 91
    iget-object v1, p0, Lcom/gogoair/ife/utils/GVLogger$1;->val$entry:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/storage/MediaDb;->updateLibraryEntry(Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;)V

    .line 92
    invoke-virtual {v0}, Lcom/gogoair/ife/storage/MediaDb;->close()V

    .line 93
    return-void
.end method


# virtual methods
.method public onLogFailure(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 121
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "GVLogger"

    const-string v2, "Accounting grade failed, log to ASP logger"

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to log accounting grade. Following error was returned: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gogoair/ife/utils/GVLogger$1;->logError(Ljava/lang/String;)V

    .line 123
    return-void
.end method

.method public onLogSuccess(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 104
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 105
    const-string v1, "msg"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "msg"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "success"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 106
    invoke-direct {p0}, Lcom/gogoair/ife/utils/GVLogger$1;->logSuccess()V

    .line 117
    :goto_0
    return-void

    .line 107
    :cond_0
    const-string v1, "status"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "status"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "success"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 108
    invoke-direct {p0}, Lcom/gogoair/ife/utils/GVLogger$1;->logSuccess()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 113
    :catch_0
    move-exception v0

    .line 114
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 115
    const-string v0, "Invalid JSON response from server."

    invoke-direct {p0, v0}, Lcom/gogoair/ife/utils/GVLogger$1;->logError(Ljava/lang/String;)V

    goto :goto_0

    .line 110
    :cond_1
    :try_start_1
    const-string v0, "JSONObject error."

    invoke-direct {p0, v0}, Lcom/gogoair/ife/utils/GVLogger$1;->logError(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
