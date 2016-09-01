.class Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;
.super Landroid/os/HandlerThread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/primetime/va/service/clock/TimerManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Timer"
.end annotation


# instance fields
.field private _handler:Landroid/os/Handler;

.field private _shouldStop:Z

.field final synthetic this$0:Lcom/adobe/primetime/va/service/clock/TimerManager;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/service/clock/TimerManager;)V
    .locals 3

    .prologue
    .line 66
    iput-object p1, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;->this$0:Lcom/adobe/primetime/va/service/clock/TimerManager;

    .line 67
    const-string v0, "VideoHeartbeatClock"

    invoke-direct {p0, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;->_shouldStop:Z

    .line 68
    invoke-virtual {p0}, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;->start()V

    .line 69
    invoke-virtual {p0}, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;->getLooper()Landroid/os/Looper;

    move-result-object v0

    .line 71
    if-nez v0, :cond_0

    .line 72
    # getter for: Lcom/adobe/primetime/va/service/clock/TimerManager;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {p1}, Lcom/adobe/primetime/va/service/clock/TimerManager;->access$100(Lcom/adobe/primetime/va/service/clock/TimerManager;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    # getter for: Lcom/adobe/primetime/va/service/clock/TimerManager;->_logTag:Ljava/lang/String;
    invoke-static {p1}, Lcom/adobe/primetime/va/service/clock/TimerManager;->access$000(Lcom/adobe/primetime/va/service/clock/TimerManager;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Unable to obtain looper thread."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    :goto_0
    return-void

    .line 76
    :cond_0
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p0}, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;->_handler:Landroid/os/Handler;

    .line 78
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;->_handler:Landroid/os/Handler;

    .line 79
    new-instance v1, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer$1;

    invoke-direct {v1, p0, p1, v0}, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer$1;-><init>(Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;Lcom/adobe/primetime/va/service/clock/TimerManager;Landroid/os/Handler;)V

    .line 88
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method static synthetic access$200(Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;)Z
    .locals 1

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;->_shouldStop:Z

    return v0
.end method


# virtual methods
.method public invalidate()V
    .locals 1

    .prologue
    .line 92
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$Timer;->_shouldStop:Z

    .line 93
    return-void
.end method
