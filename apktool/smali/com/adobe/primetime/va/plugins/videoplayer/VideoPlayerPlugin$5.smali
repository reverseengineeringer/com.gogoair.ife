.class Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)V
    .locals 0

    .prologue
    .line 447
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$5;->this$0:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .prologue
    .line 451
    move-object v0, p1

    check-cast v0, Ljava/util/HashMap;

    .line 452
    const-string v1, "qos"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 453
    check-cast p1, Ljava/util/HashMap;

    const-string v0, "qos"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 458
    :goto_0
    return-object v0

    .line 455
    :cond_0
    const-string v1, "qos"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$5;->this$0:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_delegate:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginDelegate;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->access$000(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginDelegate;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginDelegate;->getQoSInfo()Lcom/adobe/primetime/va/plugins/videoplayer/QoSInfo;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 457
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$5;->this$0:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->access$1000(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$5;->this$0:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->access$900(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Data from delegate > QoSInfo: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    check-cast p1, Ljava/util/HashMap;

    const-string v4, "qos"

    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 458
    const-string v1, "qos"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method
