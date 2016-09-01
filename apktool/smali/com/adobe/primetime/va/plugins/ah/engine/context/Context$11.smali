.class Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;
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
    .line 557
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 560
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$200(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    move-result-object v1

    monitor-enter v1

    .line 561
    :try_start_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "#_onApiSeekStart()"

    invoke-interface {v0, v2, v3}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 563
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const-string v2, "_onApiSeekStart"

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_checkCall(Ljava/lang/String;)Z
    invoke-static {v0, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$300(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    monitor-exit v1

    .line 577
    :goto_0
    return-object v4

    .line 567
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v2, v2, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getAdData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    move-result-object v2

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedAdData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;
    invoke-static {v0, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1302(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    .line 568
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v2, v2, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getChapterData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    move-result-object v2

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedChapterData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;
    invoke-static {v0, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1402(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    .line 571
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setAdData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;)V

    .line 572
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    const-string v2, "main"

    invoke-virtual {v0, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setType(Ljava/lang/String;)V

    .line 573
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v2, v2, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getVideoId()Ljava/lang/String;

    move-result-object v2

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_activeAssetId:Ljava/lang/String;
    invoke-static {v0, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1002(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 575
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setChapterData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;)V

    .line 577
    monitor-exit v1

    goto :goto_0

    .line 578
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
