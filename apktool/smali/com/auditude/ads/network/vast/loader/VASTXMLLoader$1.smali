.class Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;
.super Landroid/os/Handler;
.source "SourceFile"


# instance fields
.field final synthetic this$0:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

.field private final synthetic val$that:Lcom/auditude/ads/util/event/IEventListener;


# direct methods
.method constructor <init>(Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;Lcom/auditude/ads/util/event/IEventListener;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;->this$0:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    iput-object p2, p0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;->val$that:Lcom/auditude/ads/util/event/IEventListener;

    .line 52
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7

    .prologue
    .line 56
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 81
    :goto_0
    :pswitch_0
    return-void

    .line 62
    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 64
    iget-object v1, p0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;->this$0:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    new-instance v2, Lcom/auditude/ads/network/vast/loader/VASTDocumentProcessor;

    iget-object v3, p0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;->this$0:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    # getter for: Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->maxNumWrapperRedirects:I
    invoke-static {v3}, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->access$0(Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;)I

    move-result v3

    iget-object v4, p0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;->this$0:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    # getter for: Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->mimeTypes:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->access$1(Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;)Ljava/util/ArrayList;

    move-result-object v4

    iget-object v5, p0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;->this$0:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    # getter for: Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->vastAssetRepackagerInfo:Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackagerInfo;
    invoke-static {v5}, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->access$2(Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;)Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackagerInfo;

    move-result-object v5

    iget-object v6, p0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;->this$0:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    # getter for: Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->fallbackOnInvalidCreative:Ljava/lang/Boolean;
    invoke-static {v6}, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->access$3(Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;)Ljava/lang/Boolean;

    move-result-object v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/auditude/ads/network/vast/loader/VASTDocumentProcessor;-><init>(ILjava/util/ArrayList;Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackagerInfo;Ljava/lang/Boolean;)V

    invoke-static {v1, v2}, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->access$4(Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;Lcom/auditude/ads/network/vast/loader/VASTDocumentProcessor;)V

    .line 65
    iget-object v1, p0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;->this$0:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    # getter for: Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->processor:Lcom/auditude/ads/network/vast/loader/VASTDocumentProcessor;
    invoke-static {v1}, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->access$5(Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;)Lcom/auditude/ads/network/vast/loader/VASTDocumentProcessor;

    move-result-object v1

    const-string v2, "processComplete"

    iget-object v3, p0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;->val$that:Lcom/auditude/ads/util/event/IEventListener;

    invoke-virtual {v1, v2, v3}, Lcom/auditude/ads/network/vast/loader/VASTDocumentProcessor;->addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 66
    iget-object v1, p0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;->this$0:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    # getter for: Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->processor:Lcom/auditude/ads/network/vast/loader/VASTDocumentProcessor;
    invoke-static {v1}, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->access$5(Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;)Lcom/auditude/ads/network/vast/loader/VASTDocumentProcessor;

    move-result-object v1

    const-string v2, "processFailed"

    iget-object v3, p0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;->val$that:Lcom/auditude/ads/util/event/IEventListener;

    invoke-virtual {v1, v2, v3}, Lcom/auditude/ads/network/vast/loader/VASTDocumentProcessor;->addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 67
    const/4 v2, 0x0

    .line 68
    iget-object v1, p0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;->val$that:Lcom/auditude/ads/util/event/IEventListener;

    check-cast v1, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    iget-object v1, v1, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->State:Ljava/lang/Object;

    instance-of v1, v1, Lcom/auditude/ads/network/vast/model/VASTAd;

    if-eqz v1, :cond_0

    .line 70
    iget-object v1, p0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;->val$that:Lcom/auditude/ads/util/event/IEventListener;

    check-cast v1, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    iget-object v1, v1, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->State:Ljava/lang/Object;

    check-cast v1, Lcom/auditude/ads/network/vast/model/VASTAd;

    .line 72
    :goto_1
    iget-object v2, p0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;->this$0:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    # getter for: Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->processor:Lcom/auditude/ads/network/vast/loader/VASTDocumentProcessor;
    invoke-static {v2}, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->access$5(Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;)Lcom/auditude/ads/network/vast/loader/VASTDocumentProcessor;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lcom/auditude/ads/network/vast/loader/VASTDocumentProcessor;->process(Ljava/lang/String;Lcom/auditude/ads/network/vast/model/VASTAd;)V

    goto :goto_0

    .line 76
    :pswitch_2
    iget-object v1, p0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;->this$0:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Exception;

    invoke-static {v1, v0}, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->access$6(Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;Ljava/lang/Throwable;)V

    .line 77
    iget-object v0, p0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader$1;->this$0:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    # invokes: Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->notifyRequestFailed()V
    invoke-static {v0}, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->access$7(Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;)V

    goto :goto_0

    :cond_0
    move-object v1, v2

    goto :goto_1

    .line 56
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
