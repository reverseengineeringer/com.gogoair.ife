.class Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;)V
    .locals 0

    .prologue
    .line 179
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .prologue
    .line 182
    check-cast p1, Lcom/adobe/primetime/core/Event;

    .line 185
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    new-instance v1, Lcom/adobe/primetime/core/Event;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "clock:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".tick"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/primetime/core/Event;->getData()Ljava/lang/Object;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/adobe/primetime/core/Event;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/radio/Channel;->trigger(Lcom/adobe/primetime/core/Event;)V

    .line 187
    const/4 v0, 0x0

    return-object v0
.end method
