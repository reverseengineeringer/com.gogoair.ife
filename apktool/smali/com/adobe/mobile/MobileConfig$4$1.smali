.class Lcom/adobe/mobile/MobileConfig$4$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;


# instance fields
.field final synthetic this$1:Lcom/adobe/mobile/MobileConfig$4;


# direct methods
.method constructor <init>(Lcom/adobe/mobile/MobileConfig$4;)V
    .locals 0

    .prologue
    .line 543
    iput-object p1, p0, Lcom/adobe/mobile/MobileConfig$4$1;->this$1:Lcom/adobe/mobile/MobileConfig$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(ZLjava/io/File;)V
    .locals 1

    .prologue
    .line 546
    iget-object v0, p0, Lcom/adobe/mobile/MobileConfig$4$1;->this$1:Lcom/adobe/mobile/MobileConfig$4;

    iget-object v0, v0, Lcom/adobe/mobile/MobileConfig$4;->this$0:Lcom/adobe/mobile/MobileConfig;

    invoke-virtual {v0, p2}, Lcom/adobe/mobile/MobileConfig;->updateMessagesData(Ljava/io/File;)V

    .line 547
    iget-object v0, p0, Lcom/adobe/mobile/MobileConfig$4$1;->this$1:Lcom/adobe/mobile/MobileConfig$4;

    iget-object v0, v0, Lcom/adobe/mobile/MobileConfig$4;->this$0:Lcom/adobe/mobile/MobileConfig;

    # invokes: Lcom/adobe/mobile/MobileConfig;->loadMessageImages()V
    invoke-static {v0}, Lcom/adobe/mobile/MobileConfig;->access$100(Lcom/adobe/mobile/MobileConfig;)V

    .line 550
    iget-object v0, p0, Lcom/adobe/mobile/MobileConfig$4$1;->this$1:Lcom/adobe/mobile/MobileConfig$4;

    iget-object v0, v0, Lcom/adobe/mobile/MobileConfig$4;->this$0:Lcom/adobe/mobile/MobileConfig;

    # invokes: Lcom/adobe/mobile/MobileConfig;->updateBlacklist()V
    invoke-static {v0}, Lcom/adobe/mobile/MobileConfig;->access$200(Lcom/adobe/mobile/MobileConfig;)V

    .line 551
    return-void
.end method
