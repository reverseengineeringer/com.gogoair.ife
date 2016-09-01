.class Lcom/adobe/primetime/va/service/clock/ClockService$4;
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
    .line 115
    iput-object p1, p0, Lcom/adobe/primetime/va/service/clock/ClockService$4;->this$0:Lcom/adobe/primetime/va/service/clock/ClockService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .prologue
    .line 118
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/ClockService$4;->this$0:Lcom/adobe/primetime/va/service/clock/ClockService;

    # getter for: Lcom/adobe/primetime/va/service/clock/ClockService;->_timerManager:Lcom/adobe/primetime/va/service/clock/TimerManager;
    invoke-static {v0}, Lcom/adobe/primetime/va/service/clock/ClockService;->access$000(Lcom/adobe/primetime/va/service/clock/ClockService;)Lcom/adobe/primetime/va/service/clock/TimerManager;

    move-result-object v1

    check-cast p1, Ljava/util/HashMap;

    const-string v0, "name"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/adobe/primetime/va/service/clock/TimerManager;->destroyTimer(Ljava/lang/String;)V

    .line 119
    const/4 v0, 0x0

    return-object v0
.end method
