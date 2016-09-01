.class Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;
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
    .line 582
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 585
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$200(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    move-result-object v4

    monitor-enter v4

    .line 586
    :try_start_0
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "#_onApiSeekComplete()"

    invoke-interface {v2, v3, v5}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 588
    check-cast p1, Lcom/adobe/primetime/core/Event;

    .line 589
    invoke-virtual {p1}, Lcom/adobe/primetime/core/Event;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 591
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const-string v5, "_onApiSeekComplete"

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_checkCall(Ljava/lang/String;)Z
    invoke-static {v3, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$300(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    monitor-exit v4

    .line 673
    :goto_0
    return-object v10

    .line 593
    :cond_0
    const/4 v3, 0x1

    new-array v5, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v6, "playhead"

    aput-object v6, v5, v3

    .line 594
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_inputDataValidator:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$400(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;

    move-result-object v6

    move-object v0, v2

    check-cast v0, Ljava/util/HashMap;

    move-object v3, v0

    invoke-virtual {v6, v3, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;->validateFields(Ljava/util/HashMap;[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 595
    monitor-exit v4

    goto :goto_0

    .line 674
    :catchall_0
    move-exception v2

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 598
    :cond_1
    :try_start_1
    const-string v3, "isInAd"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 599
    const/4 v3, 0x4

    new-array v5, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v6, "adId"

    aput-object v6, v5, v3

    const/4 v3, 0x1

    const-string v6, "adPosition"

    aput-object v6, v5, v3

    const/4 v3, 0x2

    const-string v6, "podPosition"

    aput-object v6, v5, v3

    const/4 v3, 0x3

    const-string v6, "podPlayerName"

    aput-object v6, v5, v3

    .line 600
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_inputDataValidator:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$400(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;

    move-result-object v6

    move-object v0, v2

    check-cast v0, Ljava/util/HashMap;

    move-object v3, v0

    invoke-virtual {v6, v3, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;->validateFields(Ljava/util/HashMap;[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 601
    monitor-exit v4

    goto :goto_0

    .line 604
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

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

    move-result-object v5

    .line 607
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedAdData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1300(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    move-result-object v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    .line 608
    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedAdData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1300(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->getPodId()Ljava/lang/String;

    move-result-object v3

    if-ne v3, v5, :cond_4

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    .line 609
    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedAdData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1300(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->getPodPosition()Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0xa

    invoke-static {v3, v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v6

    const-string v3, "adPosition"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    cmp-long v3, v6, v8

    if-nez v3, :cond_4

    .line 611
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    iget-object v5, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedAdData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;
    invoke-static {v5}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1300(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setAdData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;)V

    .line 612
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v5, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedAdData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;
    invoke-static {v5}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1300(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->getAdId()Ljava/lang/String;

    move-result-object v5

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_activeAssetId:Ljava/lang/String;
    invoke-static {v3, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1002(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 633
    :cond_3
    :goto_1
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    const-string v5, "ad"

    invoke-virtual {v3, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setType(Ljava/lang/String;)V

    .line 641
    :goto_2
    const-string v3, "isInChapter"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 642
    const/4 v3, 0x3

    new-array v5, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v6, "chapterPosition"

    aput-object v6, v5, v3

    const/4 v3, 0x1

    const-string v6, "chapterLength"

    aput-object v6, v5, v3

    const/4 v3, 0x2

    const-string v6, "chapterOffset"

    aput-object v6, v5, v3

    .line 643
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_inputDataValidator:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$400(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;

    move-result-object v6

    move-object v0, v2

    check-cast v0, Ljava/util/HashMap;

    move-object v3, v0

    invoke-virtual {v6, v3, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;->validateFields(Ljava/util/HashMap;[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 644
    monitor-exit v4

    goto/16 :goto_0

    .line 614
    :cond_4
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getAdData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    move-result-object v3

    if-nez v3, :cond_3

    .line 615
    iget-object v6, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const-string v3, "adId"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_activeAssetId:Ljava/lang/String;
    invoke-static {v6, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1002(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 618
    new-instance v6, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    invoke-direct {v6}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;-><init>()V

    .line 619
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_activeAssetId:Ljava/lang/String;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1000(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setAdId(Ljava/lang/String;)V

    .line 620
    const-string v3, "adName"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v6, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setAdName(Ljava/lang/String;)V

    .line 621
    const-string v3, "adLength"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->longValue()J

    move-result-wide v8

    long-to-double v8, v8

    invoke-virtual {v6, v8, v9}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setAdLength(D)V

    .line 622
    invoke-virtual {v6, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setPodId(Ljava/lang/String;)V

    .line 623
    const-string v3, "podPlayerName"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v6, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setResolver(Ljava/lang/String;)V

    .line 624
    const-string v3, "podPosition"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setPodPosition(Ljava/lang/String;)V

    .line 625
    const-string v3, "podName"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setPodName(Ljava/lang/String;)V

    .line 626
    const-string v3, "podSecond"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->longValue()J

    move-result-wide v8

    long-to-double v8, v8

    invoke-virtual {v6, v8, v9}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setPodOffset(D)V

    .line 627
    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_generateSessionId()Ljava/lang/String;
    invoke-static {}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1100()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setSid(Ljava/lang/String;)V

    .line 629
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    invoke-virtual {v3, v6}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setAdData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;)V

    goto/16 :goto_1

    .line 635
    :cond_5
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setAdData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;)V

    .line 636
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    const-string v5, "main"

    invoke-virtual {v3, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setType(Ljava/lang/String;)V

    .line 638
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v5, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v5, v5, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    invoke-virtual {v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getVideoId()Ljava/lang/String;

    move-result-object v5

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_activeAssetId:Ljava/lang/String;
    invoke-static {v3, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1002(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;)Ljava/lang/String;

    goto/16 :goto_2

    .line 648
    :cond_6
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedChapterData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1400(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    move-result-object v3

    if-eqz v3, :cond_8

    const-string v3, "chapterPosition"

    .line 649
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedChapterData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1400(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->getPosition()J

    move-result-wide v8

    cmp-long v3, v6, v8

    if-nez v3, :cond_8

    .line 651
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v2, v2, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedChapterData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1400(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setChapterData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;)V

    .line 670
    :cond_7
    :goto_3
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const/4 v3, 0x0

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedAdData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;
    invoke-static {v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1302(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    .line 671
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const/4 v3, 0x0

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedChapterData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;
    invoke-static {v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1402(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    .line 673
    monitor-exit v4

    goto/16 :goto_0

    .line 653
    :cond_8
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getChapterData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    move-result-object v3

    if-nez v3, :cond_7

    .line 655
    new-instance v5, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    invoke-direct {v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;-><init>()V

    .line 656
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v6, v6, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    invoke-virtual {v6}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getVideoId()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/adobe/primetime/utils/MD5;->hash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, "_"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, "chapterPosition"

    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setId(Ljava/lang/String;)V

    .line 657
    const-string v3, "chapterName"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v5, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setName(Ljava/lang/String;)V

    .line 658
    const-string v3, "chapterLength"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setLength(D)V

    .line 659
    const-string v3, "chapterPosition"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setPosition(J)V

    .line 660
    const-string v3, "chapterOffset"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-virtual {v5, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setOffset(D)V

    .line 661
    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_generateSessionId()Ljava/lang/String;
    invoke-static {}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1100()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setSid(Ljava/lang/String;)V

    .line 663
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v2, v2, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    invoke-virtual {v2, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setChapterData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;)V

    goto/16 :goto_3

    .line 666
    :cond_9
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v2, v2, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setChapterData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_3
.end method
