.class Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V
    .locals 0

    .prologue
    .line 303
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$5;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 306
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$5;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$5;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "#_onApiVideoUnload()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$5;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isTrackingSessionActive:Z
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$900(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 309
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$5;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$5;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "#_onApiVideoUnload() > No active tracking session."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    :goto_0
    return-object v3

    .line 314
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$5;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isTrackingSessionActive:Z
    invoke-static {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$902(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Z)Z

    goto :goto_0
.end method
