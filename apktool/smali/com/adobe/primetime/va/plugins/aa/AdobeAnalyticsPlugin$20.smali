.class Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$20;
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
    .line 669
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$20;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .prologue
    .line 672
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$20;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    move-object v0, p1

    check-cast v0, Lcom/adobe/primetime/va/ErrorInfo;

    # setter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;
    invoke-static {v1, v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$002(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;Lcom/adobe/primetime/va/ErrorInfo;)Lcom/adobe/primetime/va/ErrorInfo;

    .line 673
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$20;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$2400(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$20;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logTag:Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$2300(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$20;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$000(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/va/ErrorInfo;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/ErrorInfo;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " | "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$20;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$000(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/va/ErrorInfo;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/ErrorInfo;->getDetails()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 675
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$20;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    const-string v1, "error"

    # invokes: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V
    invoke-static {v0, v1, p1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$2500(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;Ljava/lang/String;Ljava/lang/Object;)V

    .line 677
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$20;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_delegate:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginDelegate;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$900(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginDelegate;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 678
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$20;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_delegate:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginDelegate;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$900(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginDelegate;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$20;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$000(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/va/ErrorInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginDelegate;->onError(Lcom/adobe/primetime/va/ErrorInfo;)V

    .line 681
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method
