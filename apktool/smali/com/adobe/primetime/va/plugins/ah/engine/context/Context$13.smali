.class Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;
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
    .line 678
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    .prologue
    const/4 v10, 0x0

    .line 681
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$200(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    move-result-object v11

    monitor-enter v11

    .line 682
    :try_start_0
    check-cast p1, Lcom/adobe/primetime/core/Event;

    .line 683
    invoke-virtual {p1}, Lcom/adobe/primetime/core/Event;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 685
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;
    invoke-static {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "#_onApiAdStart(id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "adId"

    .line 686
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", player_name="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "podPlayerName"

    .line 687
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", parent_name="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v6, v6, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    .line 688
    invoke-virtual {v6}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getVideoId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", pod_pos="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "adPosition"

    .line 689
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 685
    invoke-interface {v3, v4, v5}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 692
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const-string v4, "_onApiAdStart"

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_checkCall(Ljava/lang/String;)Z
    invoke-static {v3, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$300(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    monitor-exit v11

    .line 758
    :goto_0
    return-object v10

    .line 694
    :cond_0
    const/4 v3, 0x5

    new-array v4, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v5, "playhead"

    aput-object v5, v4, v3

    const/4 v3, 0x1

    const-string v5, "podPosition"

    aput-object v5, v4, v3

    const/4 v3, 0x2

    const-string v5, "podPlayerName"

    aput-object v5, v4, v3

    const/4 v3, 0x3

    const-string v5, "adId"

    aput-object v5, v4, v3

    const/4 v3, 0x4

    const-string v5, "adPosition"

    aput-object v5, v4, v3

    .line 695
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_inputDataValidator:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$400(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;

    move-result-object v5

    move-object v0, v2

    check-cast v0, Ljava/util/HashMap;

    move-object v3, v0

    invoke-virtual {v5, v3, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;->validateFields(Ljava/util/HashMap;[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 696
    monitor-exit v11

    goto :goto_0

    .line 759
    :catchall_0
    move-exception v2

    monitor-exit v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 699
    :cond_1
    :try_start_1
    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const-string v3, "adId"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_activeAssetId:Ljava/lang/String;
    invoke-static {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1002(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 702
    new-instance v4, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    invoke-direct {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;-><init>()V

    .line 703
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_activeAssetId:Ljava/lang/String;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1000(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setAdId(Ljava/lang/String;)V

    .line 704
    const-string v3, "adName"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setAdName(Ljava/lang/String;)V

    .line 705
    const-string v3, "adLength"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->longValue()J

    move-result-wide v6

    long-to-double v6, v6

    invoke-virtual {v4, v6, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setAdLength(D)V

    .line 706
    const-string v3, "podPlayerName"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setResolver(Ljava/lang/String;)V

    .line 707
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v5, v5, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    invoke-virtual {v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getVideoId()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/adobe/primetime/utils/MD5;->hash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "_"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "podPosition"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setPodId(Ljava/lang/String;)V

    .line 708
    const-string v3, "adPosition"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setPodPosition(Ljava/lang/String;)V

    .line 709
    const-string v3, "podName"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setPodName(Ljava/lang/String;)V

    .line 710
    const-string v3, "podSecond"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->longValue()J

    move-result-wide v6

    long-to-double v6, v6

    invoke-virtual {v4, v6, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setPodOffset(D)V

    .line 712
    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_generateSessionId()Ljava/lang/String;
    invoke-static {}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1100()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setSid(Ljava/lang/String;)V

    .line 714
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    invoke-virtual {v3, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setAdData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;)V

    .line 717
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    const-string v4, "ad"

    invoke-virtual {v3, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setType(Ljava/lang/String;)V

    .line 720
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_updateQoSInfo(Ljava/util/Map;)V
    invoke-static {v3, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$500(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/util/Map;)V

    .line 723
    const-string v3, "metaVideo"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 725
    const-string v3, "metaVideo"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 726
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8, v3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 729
    :goto_1
    const-string v3, "metaAd"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 731
    const-string v3, "metaAd"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 733
    if-eqz v8, :cond_3

    .line 734
    invoke-virtual {v8, v3}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 741
    :cond_2
    :goto_2
    const-string v3, "_eventData"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 742
    const-string v3, "_eventData"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Ljava/util/HashMap;

    if-eqz v3, :cond_4

    .line 744
    const-string v3, "_eventData"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 745
    const-string v4, "callback"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/primetime/core/ICallback;

    move-object v9, v3

    .line 750
    :goto_3
    new-instance v3, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;
    invoke-static {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$200(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    move-result-object v4

    const-string v5, "start"

    const-string v6, "playhead"

    .line 752
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-direct/range {v3 .. v9}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;DLjava/lang/Object;Lcom/adobe/primetime/core/ICallback;)V

    .line 756
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_sendHit(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V
    invoke-static {v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$700(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V

    .line 758
    monitor-exit v11

    goto/16 :goto_0

    .line 736
    :cond_3
    invoke-virtual {v3}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v8, v3

    goto :goto_2

    :cond_4
    move-object v9, v10

    goto :goto_3

    :cond_5
    move-object v8, v10

    goto :goto_1
.end method
