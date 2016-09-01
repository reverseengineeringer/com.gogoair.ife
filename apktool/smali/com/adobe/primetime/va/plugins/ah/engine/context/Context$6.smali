.class Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;
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
    .line 320
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    .prologue
    const/4 v10, 0x0

    .line 323
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$200(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    move-result-object v11

    monitor-enter v11

    .line 324
    :try_start_0
    check-cast p1, Lcom/adobe/primetime/core/Event;

    .line 325
    invoke-virtual {p1}, Lcom/adobe/primetime/core/Event;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 327
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;
    invoke-static {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "#_onApiVideoStart(id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "videoId"

    .line 328
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", name="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "videoName"

    .line 329
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", length="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "videoLength"

    .line 330
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", type="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "streamType"

    .line 331
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", playerName="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "playerName"

    .line 332
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 327
    invoke-interface {v3, v4, v5}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const-string v4, "_onApiVideoStart"

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_checkCall(Ljava/lang/String;)Z
    invoke-static {v3, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$300(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    monitor-exit v11

    .line 388
    :goto_0
    return-object v10

    .line 337
    :cond_0
    const/4 v3, 0x5

    new-array v4, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v5, "videoId"

    aput-object v5, v4, v3

    const/4 v3, 0x1

    const-string v5, "streamType"

    aput-object v5, v4, v3

    const/4 v3, 0x2

    const-string v5, "videoLength"

    aput-object v5, v4, v3

    const/4 v3, 0x3

    const-string v5, "playhead"

    aput-object v5, v4, v3

    const/4 v3, 0x4

    const-string v5, "playerName"

    aput-object v5, v4, v3

    .line 338
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_inputDataValidator:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$400(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;

    move-result-object v5

    move-object v0, v2

    check-cast v0, Ljava/util/HashMap;

    move-object v3, v0

    invoke-virtual {v5, v3, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;->validateFields(Ljava/util/HashMap;[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 339
    monitor-exit v11

    goto :goto_0

    .line 389
    :catchall_0
    move-exception v2

    monitor-exit v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 342
    :cond_1
    :try_start_1
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_adobeAnalyticsData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;

    const-string v3, "rsid"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->setReportSuiteId(Ljava/lang/String;)V

    .line 343
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_adobeAnalyticsData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;

    const-string v3, "trackingServer"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->setTrackingServer(Ljava/lang/String;)V

    .line 344
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_adobeAnalyticsData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;

    const-string v3, "useSsl"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->setSsl(Ljava/lang/Boolean;)V

    .line 346
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_serviceProviderData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;

    const-string v3, "ovp"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setOvp(Ljava/lang/String;)V

    .line 347
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_serviceProviderData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;

    const-string v3, "sdk"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setSdk(Ljava/lang/String;)V

    .line 348
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_serviceProviderData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;

    const-string v3, "channel"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setChannel(Ljava/lang/String;)V

    .line 349
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_serviceProviderData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;

    const-string v3, "version"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setLibVersion(Ljava/lang/String;)V

    .line 350
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_serviceProviderData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;

    const-string v3, "apiLvl"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->longValue()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setApiLevel(J)V

    .line 352
    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const-string v3, "videoId"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_activeAssetId:Ljava/lang/String;
    invoke-static {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1002(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 354
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_serviceProviderData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;

    const-string v3, "playerName"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setPlayerName(Ljava/lang/String;)V

    .line 356
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_activeAssetId:Ljava/lang/String;
    invoke-static {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1000(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setVideoId(Ljava/lang/String;)V

    .line 357
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    const-string v3, "videoLength"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setDuration(D)V

    .line 358
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    const-string v4, "main"

    invoke-virtual {v3, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setType(Ljava/lang/String;)V

    .line 359
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    const-string v3, "publisher"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setPublisher(Ljava/lang/String;)V

    .line 360
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    const-string v3, "videoName"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setName(Ljava/lang/String;)V

    .line 362
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_streamData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;

    const-string v3, "streamType"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;->setType(Ljava/lang/String;)V

    .line 365
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_sessionData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_generateSessionId()Ljava/lang/String;
    invoke-static {}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1100()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;->setSessionId(Ljava/lang/String;)V

    .line 368
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_updateQoSInfo(Ljava/util/Map;)V
    invoke-static {v3, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$500(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/util/Map;)V

    .line 371
    const-string v3, "_eventData"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 372
    const-string v3, "_eventData"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Ljava/util/HashMap;

    if-eqz v3, :cond_2

    .line 374
    const-string v3, "_eventData"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 375
    const-string v4, "callback"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/primetime/core/ICallback;

    move-object v9, v3

    .line 380
    :goto_1
    new-instance v3, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;
    invoke-static {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$200(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    move-result-object v4

    const-string v5, "start"

    const-string v6, "playhead"

    .line 382
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Double;

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    const-string v8, "metaVideo"

    .line 383
    invoke-interface {v2, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-direct/range {v3 .. v9}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;DLjava/lang/Object;Lcom/adobe/primetime/core/ICallback;)V

    .line 386
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_sendHit(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V
    invoke-static {v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$700(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V

    .line 388
    monitor-exit v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    :cond_2
    move-object v9, v10

    goto :goto_1
.end method
