.class Lcom/gogoair/ife/views/PlayerActivity$7$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;


# instance fields
.field final synthetic this$1:Lcom/gogoair/ife/views/PlayerActivity$7;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity$7;)V
    .locals 0

    .prologue
    .line 478
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$7$2;->this$1:Lcom/gogoair/ife/views/PlayerActivity$7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAcquired(Lcom/adobe/ave/drm/DRMLicense;)V
    .locals 4

    .prologue
    .line 494
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Indiv license acquired: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 495
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$7$2;->this$1:Lcom/gogoair/ife/views/PlayerActivity$7;

    invoke-virtual {v0}, Lcom/gogoair/ife/views/PlayerActivity$7;->setupPlayer()V

    .line 496
    return-void
.end method

.method public onError(Ljava/lang/String;J)V
    .locals 6

    .prologue
    .line 487
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Indiv acquisition error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 488
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "ERROR"

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->INDIV_LIC_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    invoke-virtual {v2}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->getValue()I

    move-result v2

    long-to-int v3, p2

    iget-object v4, p0, Lcom/gogoair/ife/views/PlayerActivity$7$2;->this$1:Lcom/gogoair/ife/views/PlayerActivity$7;

    iget-object v4, v4, Lcom/gogoair/ife/views/PlayerActivity$7;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v4}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v4

    invoke-virtual {v4}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getAppData()Ljava/lang/String;

    move-result-object v4

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lcom/gogoair/ife/utils/GVLogger;->logASP(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    .line 489
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$7$2;->this$1:Lcom/gogoair/ife/views/PlayerActivity$7;

    invoke-virtual {v0}, Lcom/gogoair/ife/views/PlayerActivity$7;->setupPlayer()V

    .line 490
    return-void
.end method

.method public onStart()V
    .locals 3

    .prologue
    .line 482
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "Started indiv acquisition"

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 483
    return-void
.end method
