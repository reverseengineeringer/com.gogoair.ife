.class Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;

.field final synthetic val$payload:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 144
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$1;->this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;

    iput-object p2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$1;->val$payload:Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 147
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$1;->this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$1;->this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;

    iget-object v1, v1, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logTag:Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "#_onFilterReportAvailable() > Failed to send heartbeat report."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$1;->val$payload:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$1;->val$payload:Ljava/util/HashMap;

    const-string v1, "callback"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$1;->val$payload:Ljava/util/HashMap;

    const-string v1, "callback"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/ICallback;

    invoke-interface {v0, v3}, Lcom/adobe/primetime/core/ICallback;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    :cond_0
    return-object v3
.end method
