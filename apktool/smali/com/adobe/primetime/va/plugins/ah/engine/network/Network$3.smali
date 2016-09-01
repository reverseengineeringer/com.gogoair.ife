.class Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;
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
    .line 185
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 189
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_isConfigured:Z
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$700(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 190
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logTag:Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "#_onClockCheckStatusTick() - Unable to send request: not configured."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    :goto_0
    return-object v7

    .line 195
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_publisher:Ljava/lang/String;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$500(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 196
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logTag:Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "#_onClockCheckStatusTick() > Publisher is NULL."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 200
    :cond_1
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3$1;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3$1;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;)V

    .line 225
    new-instance v1, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3$2;

    invoke-direct {v1, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3$2;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;)V

    .line 234
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_publisher:Ljava/lang/String;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$500(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "[^a-zA-Z0-9]+"

    const-string v4, "-"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 235
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_checkStatusServer:Ljava/lang/String;
    invoke-static {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$400(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".xml?r="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 236
    new-instance v3, Lcom/adobe/primetime/core/URLLoader$URLRequest;

    sget-object v4, Lcom/adobe/primetime/core/URLLoader$HttpMethod;->GET:Lcom/adobe/primetime/core/URLLoader$HttpMethod;

    invoke-direct {v3, v2, v4}, Lcom/adobe/primetime/core/URLLoader$URLRequest;-><init>(Ljava/lang/String;Lcom/adobe/primetime/core/URLLoader$HttpMethod;)V

    .line 238
    new-instance v4, Lcom/adobe/primetime/core/URLLoader;

    iget-object v5, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v5}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/adobe/primetime/core/URLLoader;-><init>(Lcom/adobe/primetime/core/ILogger;)V

    .line 240
    const-string v5, "success"

    invoke-virtual {v4, v5, v0}, Lcom/adobe/primetime/core/URLLoader;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 241
    const-string v0, "error"

    invoke-virtual {v4, v0, v1}, Lcom/adobe/primetime/core/URLLoader;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 243
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logTag:Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;

    move-result-object v1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "#_onClockCheckStatusTick() - Get new settings from: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    invoke-virtual {v4, v3}, Lcom/adobe/primetime/core/URLLoader;->load(Lcom/adobe/primetime/core/URLLoader$URLRequest;)V

    goto/16 :goto_0
.end method
