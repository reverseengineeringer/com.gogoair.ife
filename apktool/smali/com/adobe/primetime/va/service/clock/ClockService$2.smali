.class Lcom/adobe/primetime/va/service/clock/ClockService$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/service/clock/ClockService;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/service/clock/ClockService;)V
    .locals 0

    .prologue
    .line 99
    iput-object p1, p0, Lcom/adobe/primetime/va/service/clock/ClockService$2;->this$0:Lcom/adobe/primetime/va/service/clock/ClockService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .prologue
    .line 102
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/ClockService$2;->this$0:Lcom/adobe/primetime/va/service/clock/ClockService;

    # getter for: Lcom/adobe/primetime/va/service/clock/ClockService;->_timerManager:Lcom/adobe/primetime/va/service/clock/TimerManager;
    invoke-static {v0}, Lcom/adobe/primetime/va/service/clock/ClockService;->access$000(Lcom/adobe/primetime/va/service/clock/ClockService;)Lcom/adobe/primetime/va/service/clock/TimerManager;

    move-result-object v2

    move-object v0, p1

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "name"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    check-cast p1, Ljava/util/HashMap;

    const-string v1, "reset"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v2, v0, v1}, Lcom/adobe/primetime/va/service/clock/TimerManager;->pauseTimer(Ljava/lang/String;Z)V

    .line 103
    const/4 v0, 0x0

    return-object v0

    .line 102
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
