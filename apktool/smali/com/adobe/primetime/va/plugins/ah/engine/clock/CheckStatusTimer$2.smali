.class Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;)V
    .locals 0

    .prologue
    .line 89
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 92
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;

    iget-object v1, v1, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;->_logTag:Ljava/lang/String;

    const-string v2, "#_getSettings()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    new-instance v1, Lcom/adobe/primetime/core/Event;

    const-string v2, "clock:check_status.tick"

    invoke-direct {v1, v2, v3}, Lcom/adobe/primetime/core/Event;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/radio/Channel;->trigger(Lcom/adobe/primetime/core/Event;)V

    .line 96
    return-object v3
.end method
