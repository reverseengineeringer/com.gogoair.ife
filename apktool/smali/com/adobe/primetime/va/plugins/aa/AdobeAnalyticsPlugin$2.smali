.class Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$2;
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
    .line 223
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$2;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 226
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$2;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$200(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$2;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logTag:Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$100(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "#_cmdVideoStart()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$2;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 233
    :goto_0
    return-object v3

    .line 231
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$2;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_workQueue:Lcom/adobe/primetime/core/radio/CommandQueue;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$400(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/core/radio/CommandQueue;

    move-result-object v0

    new-instance v1, Lcom/adobe/primetime/core/radio/Command;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$2;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_executeOpen:Lcom/adobe/primetime/core/ICallback;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$300(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/core/ICallback;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lcom/adobe/primetime/core/radio/Command;-><init>(Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/radio/CommandQueue;->addCommand(Lcom/adobe/primetime/core/radio/Command;)V

    goto :goto_0
.end method
