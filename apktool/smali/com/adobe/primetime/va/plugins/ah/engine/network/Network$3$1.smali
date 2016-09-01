.class Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3$1;
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
    .line 200
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3$1;->this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .prologue
    .line 203
    check-cast p1, Lcom/adobe/primetime/core/Event;

    .line 204
    invoke-virtual {p1}, Lcom/adobe/primetime/core/Event;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 206
    const-string v1, "server_response"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 208
    if-eqz v0, :cond_1

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 209
    new-instance v1, Lcom/adobe/primetime/va/plugins/ah/engine/network/SettingsParser;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3$1;->this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;

    iget-object v2, v2, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/network/SettingsParser;-><init>(Ljava/lang/String;Lcom/adobe/primetime/core/ILogger;)V

    .line 210
    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/SettingsParser;->parse()Ljava/util/Map;

    move-result-object v0

    .line 212
    if-eqz v0, :cond_0

    .line 213
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3$1;->this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;

    iget-object v1, v1, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_channel:Lcom/adobe/primetime/core/radio/Channel;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$900(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/core/radio/Channel;

    move-result-object v1

    new-instance v2, Lcom/adobe/primetime/core/Event;

    const-string v3, "net:check_status_complete"

    invoke-direct {v2, v3, v0}, Lcom/adobe/primetime/core/Event;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Lcom/adobe/primetime/core/radio/Channel;->trigger(Lcom/adobe/primetime/core/Event;)V

    .line 221
    :goto_0
    const/4 v0, 0x0

    return-object v0

    .line 215
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3$1;->this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3$1;->this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;

    iget-object v1, v1, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logTag:Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "#_onClockCheckStatusTick() > Failed to parse the config. settings."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 218
    :cond_1
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3$1;->this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3$1;->this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;

    iget-object v1, v1, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logTag:Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "#_onClockCheckStatusTick() > Null or empty config. settings.."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
