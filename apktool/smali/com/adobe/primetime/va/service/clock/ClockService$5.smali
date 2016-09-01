.class Lcom/adobe/primetime/va/service/clock/ClockService$5;
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
    .line 141
    iput-object p1, p0, Lcom/adobe/primetime/va/service/clock/ClockService$5;->this$0:Lcom/adobe/primetime/va/service/clock/ClockService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/ClockService$5;->this$0:Lcom/adobe/primetime/va/service/clock/ClockService;

    # getter for: Lcom/adobe/primetime/va/service/clock/ClockService;->_timerManager:Lcom/adobe/primetime/va/service/clock/TimerManager;
    invoke-static {v0}, Lcom/adobe/primetime/va/service/clock/ClockService;->access$000(Lcom/adobe/primetime/va/service/clock/ClockService;)Lcom/adobe/primetime/va/service/clock/TimerManager;

    move-result-object v0

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/adobe/primetime/va/service/clock/TimerManager;->isTimerPaused(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
