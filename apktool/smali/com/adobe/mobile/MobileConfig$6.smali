.class Lcom/adobe/mobile/MobileConfig$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$0:Lcom/adobe/mobile/MobileConfig;


# direct methods
.method constructor <init>(Lcom/adobe/mobile/MobileConfig;)V
    .locals 0

    .prologue
    .line 875
    iput-object p1, p0, Lcom/adobe/mobile/MobileConfig$6;->this$0:Lcom/adobe/mobile/MobileConfig;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/16 v7, 0x2710

    .line 879
    iget-object v0, p0, Lcom/adobe/mobile/MobileConfig$6;->this$0:Lcom/adobe/mobile/MobileConfig;

    # getter for: Lcom/adobe/mobile/MobileConfig;->_inAppMessages:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/adobe/mobile/MobileConfig;->access$300(Lcom/adobe/mobile/MobileConfig;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mobile/MobileConfig$6;->this$0:Lcom/adobe/mobile/MobileConfig;

    # getter for: Lcom/adobe/mobile/MobileConfig;->_inAppMessages:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/adobe/mobile/MobileConfig;->access$300(Lcom/adobe/mobile/MobileConfig;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_1

    .line 880
    :cond_0
    const-string v0, "messageImages"

    invoke-static {v0}, Lcom/adobe/mobile/RemoteDownload;->deleteFilesInDirectory(Ljava/lang/String;)V

    .line 914
    :goto_0
    return-void

    .line 884
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 887
    iget-object v0, p0, Lcom/adobe/mobile/MobileConfig$6;->this$0:Lcom/adobe/mobile/MobileConfig;

    # getter for: Lcom/adobe/mobile/MobileConfig;->_inAppMessages:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/adobe/mobile/MobileConfig;->access$300(Lcom/adobe/mobile/MobileConfig;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mobile/Message;

    .line 889
    iget-object v3, v0, Lcom/adobe/mobile/Message;->assets:Ljava/util/ArrayList;

    if-eqz v3, :cond_2

    iget-object v3, v0, Lcom/adobe/mobile/Message;->assets:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_2

    .line 894
    iget-object v0, v0, Lcom/adobe/mobile/Message;->assets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 895
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_3

    .line 900
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 901
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 902
    const/4 v5, 0x0

    const-string v6, "messageImages"

    invoke-static {v0, v7, v7, v5, v6}, Lcom/adobe/mobile/RemoteDownload;->remoteDownloadSync(Ljava/lang/String;IILcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;Ljava/lang/String;)V

    goto :goto_1

    .line 908
    :cond_4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_5

    .line 909
    const-string v0, "messageImages"

    invoke-static {v0, v1}, Lcom/adobe/mobile/RemoteDownload;->deleteFilesForDirectoryNotInList(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_0

    .line 912
    :cond_5
    const-string v0, "messageImages"

    invoke-static {v0}, Lcom/adobe/mobile/RemoteDownload;->deleteFilesInDirectory(Ljava/lang/String;)V

    goto :goto_0
.end method
