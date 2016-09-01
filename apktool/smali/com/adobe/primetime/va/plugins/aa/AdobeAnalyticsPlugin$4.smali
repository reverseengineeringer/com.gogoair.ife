.class Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V
    .locals 0

    .prologue
    .line 253
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 257
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$000(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/va/ErrorInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 266
    :cond_0
    :goto_0
    return-object v4

    .line 259
    :cond_1
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    new-instance v1, Lcom/adobe/primetime/va/ErrorInfo;

    const-string v2, "Internal error"

    const-string v3, "HeartbeatPlugin is in ERROR state."

    invoke-direct {v1, v2, v3}, Lcom/adobe/primetime/va/ErrorInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    # setter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;
    invoke-static {v0, v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$002(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;Lcom/adobe/primetime/va/ErrorInfo;)Lcom/adobe/primetime/va/ErrorInfo;

    .line 260
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    const-string v1, "error"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$000(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/va/ErrorInfo;

    move-result-object v2

    # invokes: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V
    invoke-static {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$800(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;Ljava/lang/String;Ljava/lang/Object;)V

    .line 262
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_delegate:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginDelegate;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$900(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginDelegate;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 263
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_delegate:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginDelegate;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$900(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginDelegate;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$000(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/va/ErrorInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginDelegate;->onError(Lcom/adobe/primetime/va/ErrorInfo;)V

    goto :goto_0
.end method
