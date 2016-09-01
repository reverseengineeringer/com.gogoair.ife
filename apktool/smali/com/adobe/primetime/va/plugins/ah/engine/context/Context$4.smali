.class Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$4;
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
    .line 287
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .prologue
    .line 290
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$200(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    move-result-object v1

    monitor-enter v1

    .line 291
    :try_start_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "#_onApiVideoLoad()"

    invoke-interface {v0, v2, v3}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_resetInternalState()V
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$800(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    .line 296
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    const/4 v2, 0x1

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isTrackingSessionActive:Z
    invoke-static {v0, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->access$902(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Z)Z

    .line 297
    const/4 v0, 0x0

    monitor-exit v1

    return-object v0

    .line 298
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
