.class Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;
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
    .line 178
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    .prologue
    const/4 v10, 0x0

    .line 181
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$200(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    move-result-object v11

    monitor-enter v11

    .line 182
    :try_start_0
    check-cast p1, Lcom/adobe/primetime/core/Event;

    .line 183
    invoke-virtual {p1}, Lcom/adobe/primetime/core/Event;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 185
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;
    invoke-static {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "#_onApiAnalyticsStart"

    invoke-interface {v3, v4, v5}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const-string v4, "_onApiAnalyticsStart"

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_checkCall(Ljava/lang/String;)Z
    invoke-static {v3, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$300(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 188
    monitor-exit v11

    .line 238
    :goto_0
    return-object v10

    .line 191
    :cond_0
    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v5, "playhead"

    aput-object v5, v4, v3

    .line 192
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_inputDataValidator:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$400(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;

    move-result-object v5

    move-object v0, v2

    check-cast v0, Ljava/util/HashMap;

    move-object v3, v0

    invoke-virtual {v5, v3, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;->validateFields(Ljava/util/HashMap;[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 193
    monitor-exit v11

    goto :goto_0

    .line 239
    :catchall_0
    move-exception v2

    monitor-exit v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 196
    :cond_1
    :try_start_1
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_userData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;

    const-string v3, "vid"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->setVisitorId(Ljava/lang/String;)V

    .line 197
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_userData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;

    const-string v3, "aid"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->setAnalyticsVisitorId(Ljava/lang/String;)V

    .line 198
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_userData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;

    const-string v3, "mid"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->setMarketingCloudVisitorId(Ljava/lang/String;)V

    .line 200
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    new-instance v4, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

    invoke-direct {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;-><init>()V

    iput-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_cuserData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

    .line 201
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_cuserData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

    const-string v3, "dpid"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;->setDpid(Ljava/lang/String;)V

    .line 202
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_cuserData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

    const-string v3, "dpuuid"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;->setDpuuid(Ljava/lang/String;)V

    .line 204
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_updateQoSInfo(Ljava/util/Map;)V
    invoke-static {v3, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$500(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/util/Map;)V

    .line 207
    const-string v3, "_eventData"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 208
    const-string v3, "_eventData"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Ljava/util/HashMap;

    if-eqz v3, :cond_3

    .line 210
    const-string v3, "_eventData"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 211
    const-string v4, "callback"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/primetime/core/ICallback;

    move-object v9, v3

    .line 217
    :goto_1
    new-instance v3, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;
    invoke-static {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$200(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    move-result-object v4

    const-string v5, "aa_start"

    const-string v6, "playhead"

    .line 219
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    const/4 v8, 0x0

    invoke-direct/range {v3 .. v9}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;DLjava/lang/Object;Lcom/adobe/primetime/core/ICallback;)V

    .line 225
    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getAssetDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v2

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setAdData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;)V

    .line 227
    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getAssetDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v2

    const-string v4, "main"

    invoke-virtual {v2, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setType(Ljava/lang/String;)V

    .line 229
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isAnalyticsStarted:Z
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$600(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getAssetDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 230
    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getAssetDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v2

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setChapterData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;)V

    .line 234
    :cond_2
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const/4 v4, 0x0

    iput-object v4, v2, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_cuserData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

    .line 236
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_sendHit(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V
    invoke-static {v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$700(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V

    .line 238
    monitor-exit v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    :cond_3
    move-object v9, v10

    goto :goto_1
.end method
