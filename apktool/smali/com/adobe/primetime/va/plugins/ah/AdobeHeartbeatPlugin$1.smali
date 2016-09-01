.class Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V
    .locals 0

    .prologue
    .line 257
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 261
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$000(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)Lcom/adobe/primetime/va/ErrorInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 270
    :cond_0
    :goto_0
    return-object v4

    .line 263
    :cond_1
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    new-instance v1, Lcom/adobe/primetime/va/ErrorInfo;

    const-string v2, "Internal error"

    const-string v3, "AdobeHeartbeatPlugin is in ERROR state."

    invoke-direct {v1, v2, v3}, Lcom/adobe/primetime/va/ErrorInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    # setter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;
    invoke-static {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$002(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Lcom/adobe/primetime/va/ErrorInfo;)Lcom/adobe/primetime/va/ErrorInfo;

    .line 264
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    const-string v1, "error"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$000(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)Lcom/adobe/primetime/va/ErrorInfo;

    move-result-object v2

    # invokes: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V
    invoke-static {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$100(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Ljava/lang/String;Ljava/lang/Object;)V

    .line 266
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_delegate:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginDelegate;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$200(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginDelegate;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 267
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_delegate:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginDelegate;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$200(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginDelegate;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$000(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)Lcom/adobe/primetime/va/ErrorInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginDelegate;->onError(Lcom/adobe/primetime/va/ErrorInfo;)V

    goto :goto_0
.end method
