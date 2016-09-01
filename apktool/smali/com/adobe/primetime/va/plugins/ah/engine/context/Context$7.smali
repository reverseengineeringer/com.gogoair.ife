.class Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V
    .locals 0

    .prologue
    .line 393
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$7;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .prologue
    const/4 v8, 0x0

    .line 396
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$7;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$200(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    move-result-object v9

    monitor-enter v9

    .line 397
    :try_start_0
    check-cast p1, Lcom/adobe/primetime/core/Event;

    .line 398
    invoke-virtual {p1}, Lcom/adobe/primetime/core/Event;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 400
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$7;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$7;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "#_onApiVideoComplete()"

    invoke-interface {v1, v2, v3}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$7;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const-string v2, "_onApiVideoComplete"

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_checkCall(Ljava/lang/String;)Z
    invoke-static {v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$300(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    monitor-exit v9

    .line 426
    :goto_0
    return-object v8

    .line 405
    :cond_0
    const-string v1, "_eventData"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 406
    const-string v1, "_eventData"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/util/HashMap;

    if-eqz v1, :cond_1

    .line 408
    const-string v1, "_eventData"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 409
    const-string v1, "callback"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/ICallback;

    move-object v7, v0

    .line 415
    :goto_1
    new-instance v1, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$7;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$200(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    move-result-object v2

    const-string v3, "complete"

    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$7;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    .line 417
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getDuration()D

    move-result-wide v4

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;DLjava/lang/Object;Lcom/adobe/primetime/core/ICallback;)V

    .line 421
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$7;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_sendHit(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V
    invoke-static {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$700(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V

    .line 424
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$7;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const/4 v1, 0x1

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isVideoComplete:Z
    invoke-static {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1202(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Z)Z

    .line 426
    monitor-exit v9

    goto :goto_0

    .line 427
    :catchall_0
    move-exception v0

    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_1
    move-object v7, v8

    goto :goto_1
.end method
