.class Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;
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
    .line 1079
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .prologue
    const/4 v9, 0x0

    .line 1082
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$200(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    move-result-object v4

    monitor-enter v4

    .line 1083
    :try_start_0
    check-cast p1, Lcom/adobe/primetime/core/Event;

    .line 1084
    invoke-virtual {p1}, Lcom/adobe/primetime/core/Event;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 1086
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v3

    iget-object v5, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;
    invoke-static {v5}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "#_onApiQuantumEnd(interval="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v7, v7, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v8, "reporting_interval"

    .line 1087
    invoke-virtual {v7, v8}, Lcom/adobe/primetime/core/radio/Channel;->request(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1086
    invoke-interface {v3, v5, v6}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 1090
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const-string v5, "_onApiQuantumEnd"

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_checkCall(Ljava/lang/String;)Z
    invoke-static {v3, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$300(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    monitor-exit v4

    .line 1109
    :goto_0
    return-object v9

    .line 1092
    :cond_0
    const/4 v3, 0x1

    new-array v5, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v6, "playhead"

    aput-object v6, v5, v3

    .line 1093
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_inputDataValidator:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$400(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;

    move-result-object v6

    move-object v0, v2

    check-cast v0, Ljava/util/HashMap;

    move-object v3, v0

    invoke-virtual {v6, v3, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;->validateFields(Ljava/util/HashMap;[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1094
    monitor-exit v4

    goto :goto_0

    .line 1110
    :catchall_0
    move-exception v2

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 1098
    :cond_1
    :try_start_1
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1600(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v5

    const-string v3, "playhead"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setPlayhead(D)V

    .line 1100
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_updateQoSInfo(Ljava/util/Map;)V
    invoke-static {v3, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$500(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/util/Map;)V

    .line 1102
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1600(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->getBitrate()J

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setBitrate(J)V

    .line 1103
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1600(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->getFps()D

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setFps(D)V

    .line 1104
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1600(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->getDroppedFrames()J

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setDroppedFrames(J)V

    .line 1105
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1600(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->getStartupTime()J

    move-result-wide v6

    neg-long v6, v6

    invoke-virtual {v2, v6, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setStartupTime(J)V

    .line 1107
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1600(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    move-result-object v3

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_sendHit(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V
    invoke-static {v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$700(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V

    .line 1109
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0
.end method
