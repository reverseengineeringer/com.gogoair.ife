.class Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$15;
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
    .line 816
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$15;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    .prologue
    const/4 v10, 0x0

    .line 819
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$15;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$200(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    move-result-object v11

    monitor-enter v11

    .line 820
    :try_start_0
    check-cast p1, Lcom/adobe/primetime/core/Event;

    .line 822
    invoke-virtual {p1}, Lcom/adobe/primetime/core/Event;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 824
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$15;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$15;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;
    invoke-static {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "#_onApiChapterStart(name="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "chapterName"

    .line 825
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", length="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "chapterLength"

    .line 826
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", position="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "chapterPosition"

    .line 827
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", chapter_offset="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "chapterOffset"

    .line 828
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 824
    invoke-interface {v3, v4, v5}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 831
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$15;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const-string v4, "_onApiChapterStart"

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_checkCall(Ljava/lang/String;)Z
    invoke-static {v3, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$300(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    monitor-exit v11

    .line 894
    :goto_0
    return-object v10

    .line 833
    :cond_0
    const/4 v3, 0x4

    new-array v4, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v5, "playhead"

    aput-object v5, v4, v3

    const/4 v3, 0x1

    const-string v5, "chapterPosition"

    aput-object v5, v4, v3

    const/4 v3, 0x2

    const-string v5, "chapterOffset"

    aput-object v5, v4, v3

    const/4 v3, 0x3

    const-string v5, "chapterLength"

    aput-object v5, v4, v3

    .line 834
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$15;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_inputDataValidator:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$400(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;

    move-result-object v5

    move-object v0, v2

    check-cast v0, Ljava/util/HashMap;

    move-object v3, v0

    invoke-virtual {v5, v3, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;->validateFields(Ljava/util/HashMap;[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 835
    monitor-exit v11

    goto :goto_0

    .line 895
    :catchall_0
    move-exception v2

    monitor-exit v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 839
    :cond_1
    :try_start_1
    new-instance v4, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    invoke-direct {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;-><init>()V

    .line 840
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$15;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

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

    const-string v5, "chapterPosition"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setId(Ljava/lang/String;)V

    .line 841
    const-string v3, "chapterName"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setName(Ljava/lang/String;)V

    .line 842
    const-string v3, "chapterLength"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setLength(D)V

    .line 843
    const-string v3, "chapterPosition"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setPosition(J)V

    .line 844
    const-string v3, "chapterOffset"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setOffset(D)V

    .line 845
    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_generateSessionId()Ljava/lang/String;
    invoke-static {}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$1100()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setSid(Ljava/lang/String;)V

    .line 847
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$15;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    invoke-virtual {v3, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setChapterData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;)V

    .line 849
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$15;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_updateQoSInfo(Ljava/util/Map;)V
    invoke-static {v3, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$500(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/util/Map;)V

    .line 852
    const-string v3, "metaVideo"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 854
    const-string v3, "metaVideo"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 855
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8, v3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 858
    :goto_1
    const-string v3, "metaChapter"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 860
    const-string v3, "metaChapter"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 862
    if-eqz v8, :cond_3

    .line 863
    invoke-virtual {v8, v3}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 870
    :cond_2
    :goto_2
    const-string v3, "_eventData"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 871
    const-string v3, "_eventData"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Ljava/util/HashMap;

    if-eqz v3, :cond_4

    .line 873
    const-string v3, "_eventData"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 874
    const-string v4, "callback"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/primetime/core/ICallback;

    move-object v9, v3

    .line 880
    :goto_3
    new-instance v3, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$15;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;
    invoke-static {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$200(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    move-result-object v4

    const-string v5, "chapter_start"

    const-string v6, "playhead"

    .line 882
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-direct/range {v3 .. v9}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;DLjava/lang/Object;Lcom/adobe/primetime/core/ICallback;)V

    .line 888
    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getAssetDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v2

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setAdData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;)V

    .line 890
    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getAssetDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v2

    const-string v4, "main"

    invoke-virtual {v2, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setType(Ljava/lang/String;)V

    .line 892
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$15;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_sendHit(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V
    invoke-static {v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$700(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V

    .line 894
    monitor-exit v11

    goto/16 :goto_0

    .line 865
    :cond_3
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8, v3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :cond_4
    move-object v9, v10

    goto :goto_3

    :cond_5
    move-object v8, v10

    goto :goto_1
.end method
