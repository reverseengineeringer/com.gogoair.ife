.class Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)V
    .locals 0

    .prologue
    .line 101
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .prologue
    .line 104
    check-cast p1, Lcom/adobe/primetime/core/Event;

    .line 105
    invoke-virtual {p1}, Lcom/adobe/primetime/core/Event;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 107
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logTag:Ljava/lang/String;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "#_onApiConfig(sb_server="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "tracking_server"

    .line 108
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", check_status_server="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "check_status_server"

    .line 109
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", publisher="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "publisher"

    .line 110
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", quiet_mode="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "quiet_mode"

    .line 111
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", ssl="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "ssl"

    .line 112
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 107
    invoke-interface {v1, v2, v3}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    const-string v1, "tracking_server"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "ssl"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_updateRequestProtocol(Ljava/lang/String;Z)Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$300(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_trackingServer:Ljava/lang/String;
    invoke-static {v3, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$202(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;Ljava/lang/String;)Ljava/lang/String;

    .line 116
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    const-string v1, "check_status_server"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "ssl"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_updateRequestProtocol(Ljava/lang/String;Z)Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$300(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_checkStatusServer:Ljava/lang/String;
    invoke-static {v3, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$402(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;Ljava/lang/String;)Ljava/lang/String;

    .line 118
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    const-string v1, "publisher"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_publisher:Ljava/lang/String;
    invoke-static {v2, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$502(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;Ljava/lang/String;)Ljava/lang/String;

    .line 119
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    const-string v2, "quiet_mode"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_quietMode:Z
    invoke-static {v1, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$602(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;Z)Z

    .line 122
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    const/4 v1, 0x1

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_isConfigured:Z
    invoke-static {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$702(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;Z)Z

    .line 124
    const/4 v0, 0x0

    return-object v0
.end method
