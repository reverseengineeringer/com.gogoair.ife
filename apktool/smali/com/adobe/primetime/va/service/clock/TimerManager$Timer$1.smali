.class Lcom/adobe/primetime/va/service/clock/TimerManager$Timer$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$1:Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$this$0:Lcom/adobe/primetime/va/service/clock/TimerManager;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;Lcom/adobe/primetime/va/service/clock/TimerManager;Landroid/os/Handler;)V
    .locals 0

    .prologue
    .line 79
    iput-object p1, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer$1;->this$1:Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;

    iput-object p2, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer$1;->val$this$0:Lcom/adobe/primetime/va/service/clock/TimerManager;

    iput-object p3, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer$1;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 82
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer$1;->this$1:Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;

    # getter for: Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;->_shouldStop:Z
    invoke-static {v0}, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;->access$200(Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer$1;->this$1:Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;

    iget-object v0, v0, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;->this$0:Lcom/adobe/primetime/va/service/clock/TimerManager;

    # invokes: Lcom/adobe/primetime/va/service/clock/TimerManager;->_onTick()V
    invoke-static {v0}, Lcom/adobe/primetime/va/service/clock/TimerManager;->access$300(Lcom/adobe/primetime/va/service/clock/TimerManager;)V

    .line 84
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer$1;->val$handler:Landroid/os/Handler;

    sget-wide v2, Lcom/adobe/primetime/va/service/clock/TimerManager;->TIMER_BASE_INTERVAL:D

    const-wide v4, 0x408f400000000000L    # 1000.0

    mul-double/2addr v2, v4

    double-to-long v2, v2

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 86
    :cond_0
    return-void
.end method
