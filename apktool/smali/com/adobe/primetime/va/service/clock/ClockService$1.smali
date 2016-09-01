.class Lcom/adobe/primetime/va/service/clock/ClockService$1;
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
    .line 87
    iput-object p1, p0, Lcom/adobe/primetime/va/service/clock/ClockService$1;->this$0:Lcom/adobe/primetime/va/service/clock/ClockService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .prologue
    .line 90
    move-object v0, p1

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "repeat_count"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "repeat_count"

    .line 91
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    move v2, v0

    .line 93
    :goto_0
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/ClockService$1;->this$0:Lcom/adobe/primetime/va/service/clock/ClockService;

    # getter for: Lcom/adobe/primetime/va/service/clock/ClockService;->_timerManager:Lcom/adobe/primetime/va/service/clock/TimerManager;
    invoke-static {v0}, Lcom/adobe/primetime/va/service/clock/ClockService;->access$000(Lcom/adobe/primetime/va/service/clock/ClockService;)Lcom/adobe/primetime/va/service/clock/TimerManager;

    move-result-object v3

    move-object v0, p1

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "name"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    check-cast p1, Ljava/util/HashMap;

    const-string v1, "interval"

    .line 94
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    .line 93
    invoke-virtual {v3, v0, v4, v5, v2}, Lcom/adobe/primetime/va/service/clock/TimerManager;->createTimer(Ljava/lang/String;DI)V

    .line 95
    const/4 v0, 0x0

    return-object v0

    .line 91
    :cond_0
    const/4 v0, -0x1

    move v2, v0

    goto :goto_0
.end method
