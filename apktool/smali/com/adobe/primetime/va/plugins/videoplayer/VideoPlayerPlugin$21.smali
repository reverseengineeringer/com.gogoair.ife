.class Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$21;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

.field final synthetic val$cachedData:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 621
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$21;->this$0:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    iput-object p2, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$21;->val$cachedData:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .prologue
    .line 624
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$21;->this$0:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->cacheAdInfo:Lcom/adobe/primetime/core/ICallback;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->access$3500(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ICallback;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$21;->val$cachedData:Ljava/util/Map;

    invoke-interface {v0, v1}, Lcom/adobe/primetime/core/ICallback;->call(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;

    .line 625
    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;->position:Ljava/lang/Long;

    .line 626
    :goto_0
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$21;->this$0:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->access$4500(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$21;->this$0:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->access$4400(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Resolving ad.position: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 627
    return-object v0

    .line 625
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
