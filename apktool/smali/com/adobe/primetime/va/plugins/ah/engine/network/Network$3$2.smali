.class Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;)V
    .locals 0

    .prologue
    .line 225
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3$2;->this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .prologue
    .line 228
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3$2;->this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3$2;->this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;

    iget-object v1, v1, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logTag:Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "#_onClockCheckStatusTick() - Failed to obtain the config. settings."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    const/4 v0, 0x0

    return-object v0
.end method
