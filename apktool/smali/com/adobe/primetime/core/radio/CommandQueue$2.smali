.class Lcom/adobe/primetime/core/radio/CommandQueue$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/core/radio/CommandQueue;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/core/radio/CommandQueue;)V
    .locals 0

    .prologue
    .line 118
    iput-object p1, p0, Lcom/adobe/primetime/core/radio/CommandQueue$2;->this$0:Lcom/adobe/primetime/core/radio/CommandQueue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 122
    :try_start_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue$2;->this$0:Lcom/adobe/primetime/core/radio/CommandQueue;

    # getter for: Lcom/adobe/primetime/core/radio/CommandQueue;->_delay:J
    invoke-static {v0}, Lcom/adobe/primetime/core/radio/CommandQueue;->access$200(Lcom/adobe/primetime/core/radio/CommandQueue;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    :goto_0
    return-void

    .line 123
    :catch_0
    move-exception v0

    goto :goto_0
.end method
