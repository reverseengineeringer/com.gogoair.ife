.class Lcom/auditude/ads/loader/DataLoader$1;
.super Landroid/os/Handler;
.source "SourceFile"


# instance fields
.field final synthetic this$0:Lcom/auditude/ads/loader/DataLoader;


# direct methods
.method constructor <init>(Lcom/auditude/ads/loader/DataLoader;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/auditude/ads/loader/DataLoader$1;->this$0:Lcom/auditude/ads/loader/DataLoader;

    .line 36
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .prologue
    .line 40
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 59
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 46
    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 47
    iget-object v1, p0, Lcom/auditude/ads/loader/DataLoader$1;->this$0:Lcom/auditude/ads/loader/DataLoader;

    # getter for: Lcom/auditude/ads/loader/DataLoader;->listener:Lcom/auditude/ads/loader/DataLoader$DataLoaderListener;
    invoke-static {v1}, Lcom/auditude/ads/loader/DataLoader;->access$0(Lcom/auditude/ads/loader/DataLoader;)Lcom/auditude/ads/loader/DataLoader$DataLoaderListener;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 49
    iget-object v1, p0, Lcom/auditude/ads/loader/DataLoader$1;->this$0:Lcom/auditude/ads/loader/DataLoader;

    # getter for: Lcom/auditude/ads/loader/DataLoader;->listener:Lcom/auditude/ads/loader/DataLoader$DataLoaderListener;
    invoke-static {v1}, Lcom/auditude/ads/loader/DataLoader;->access$0(Lcom/auditude/ads/loader/DataLoader;)Lcom/auditude/ads/loader/DataLoader$DataLoaderListener;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/auditude/ads/loader/DataLoader$DataLoaderListener;->onRequestComplete(Ljava/lang/String;)V

    goto :goto_0

    .line 54
    :pswitch_2
    iget-object v1, p0, Lcom/auditude/ads/loader/DataLoader$1;->this$0:Lcom/auditude/ads/loader/DataLoader;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Exception;

    invoke-static {v1, v0}, Lcom/auditude/ads/loader/DataLoader;->access$1(Lcom/auditude/ads/loader/DataLoader;Ljava/lang/Throwable;)V

    .line 55
    iget-object v0, p0, Lcom/auditude/ads/loader/DataLoader$1;->this$0:Lcom/auditude/ads/loader/DataLoader;

    iget-object v1, p0, Lcom/auditude/ads/loader/DataLoader$1;->this$0:Lcom/auditude/ads/loader/DataLoader;

    # getter for: Lcom/auditude/ads/loader/DataLoader;->error:Ljava/lang/Throwable;
    invoke-static {v1}, Lcom/auditude/ads/loader/DataLoader;->access$2(Lcom/auditude/ads/loader/DataLoader;)Ljava/lang/Throwable;

    move-result-object v1

    # invokes: Lcom/auditude/ads/loader/DataLoader;->notifyRequestFailed(Ljava/lang/Throwable;)V
    invoke-static {v0, v1}, Lcom/auditude/ads/loader/DataLoader;->access$3(Lcom/auditude/ads/loader/DataLoader;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 40
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
