.class Lcom/adobe/primetime/core/radio/CommandQueue$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/core/radio/CommandQueue;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/core/radio/CommandQueue;)V
    .locals 0

    .prologue
    .line 104
    iput-object p1, p0, Lcom/adobe/primetime/core/radio/CommandQueue$1;->this$0:Lcom/adobe/primetime/core/radio/CommandQueue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 107
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue$1;->this$0:Lcom/adobe/primetime/core/radio/CommandQueue;

    # getter for: Lcom/adobe/primetime/core/radio/CommandQueue;->_isSuspended:Z
    invoke-static {v0}, Lcom/adobe/primetime/core/radio/CommandQueue;->access$000(Lcom/adobe/primetime/core/radio/CommandQueue;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    :goto_0
    return-object v1

    .line 109
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue$1;->this$0:Lcom/adobe/primetime/core/radio/CommandQueue;

    # invokes: Lcom/adobe/primetime/core/radio/CommandQueue;->__drain()V
    invoke-static {v0}, Lcom/adobe/primetime/core/radio/CommandQueue;->access$100(Lcom/adobe/primetime/core/radio/CommandQueue;)V

    goto :goto_0
.end method
