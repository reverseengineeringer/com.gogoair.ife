.class Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;
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
    .line 128
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 131
    check-cast p1, Lcom/adobe/primetime/core/Event;

    .line 132
    invoke-virtual {p1}, Lcom/adobe/primetime/core/Event;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 135
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_isConfigured:Z
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$700(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 136
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logTag:Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "#_onFilterReportAvailable() > Unable to send request: not configured."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    :cond_0
    :goto_0
    return-object v8

    .line 141
    :cond_1
    const-string v1, "report"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;

    .line 142
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_serializer:Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$800(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->serializeReport(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;)Ljava/util/HashMap;

    move-result-object v0

    .line 144
    new-instance v1, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$1;

    invoke-direct {v1, p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$1;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;Ljava/util/HashMap;)V

    .line 155
    new-instance v2, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$2;

    invoke-direct {v2, p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$2;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;Ljava/util/HashMap;)V

    .line 166
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_trackingServer:Ljava/lang/String;
    invoke-static {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$200(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "serializedOutput"

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 167
    new-instance v3, Lcom/adobe/primetime/core/URLLoader$URLRequest;

    sget-object v4, Lcom/adobe/primetime/core/URLLoader$HttpMethod;->GET:Lcom/adobe/primetime/core/URLLoader$HttpMethod;

    invoke-direct {v3, v0, v4}, Lcom/adobe/primetime/core/URLLoader$URLRequest;-><init>(Ljava/lang/String;Lcom/adobe/primetime/core/URLLoader$HttpMethod;)V

    .line 169
    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logTag:Ljava/lang/String;
    invoke-static {v5}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "_onFilterReportAvailable() > "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v5, v0}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_quietMode:Z
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$600(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/adobe/mobile/Config;->getPrivacyStatus()Lcom/adobe/mobile/MobilePrivacyStatus;

    move-result-object v0

    sget-object v4, Lcom/adobe/mobile/MobilePrivacyStatus;->MOBILE_PRIVACY_STATUS_OPT_OUT:Lcom/adobe/mobile/MobilePrivacyStatus;

    if-eq v0, v4, :cond_0

    .line 174
    new-instance v0, Lcom/adobe/primetime/core/URLLoader;

    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/adobe/primetime/core/URLLoader;-><init>(Lcom/adobe/primetime/core/ILogger;)V

    .line 175
    const-string v4, "success"

    invoke-virtual {v0, v4, v2}, Lcom/adobe/primetime/core/URLLoader;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 176
    const-string v2, "error"

    invoke-virtual {v0, v2, v1}, Lcom/adobe/primetime/core/URLLoader;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 177
    invoke-virtual {v0, v3}, Lcom/adobe/primetime/core/URLLoader;->load(Lcom/adobe/primetime/core/URLLoader$URLRequest;)V

    goto/16 :goto_0
.end method
