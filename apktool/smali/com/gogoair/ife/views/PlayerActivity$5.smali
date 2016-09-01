.class Lcom/gogoair/ife/views/PlayerActivity$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/views/PlayerActivity;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 343
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$5;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAcquired(Lcom/adobe/ave/drm/DRMLicense;)V
    .locals 6

    .prologue
    .line 359
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "License acquired: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "INFO"

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->DRM_LICENSE_SUCCESS:Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    invoke-virtual {v2}, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->getValue()I

    move-result v2

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/gogoair/ife/views/PlayerActivity$5;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v4}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v4

    invoke-virtual {v4}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getAppData()Ljava/lang/String;

    move-result-object v4

    const-string v5, "DRM License Response Succeeded"

    invoke-virtual/range {v0 .. v5}, Lcom/gogoair/ife/utils/GVLogger;->logASP(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    .line 361
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$5;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$5;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v0

    if-nez v0, :cond_2

    .line 362
    :cond_0
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "MediaPlayer is null!"

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    :cond_1
    :goto_0
    return-void

    .line 366
    :cond_2
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$5;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayerItem;->isProtected()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 367
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Begin playback: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 368
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$5;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-virtual {v0}, Lcom/gogoair/ife/views/PlayerActivity;->start()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/String;J)V
    .locals 6

    .prologue
    .line 352
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "License acquisition error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 353
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "ERROR"

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->DRM_LICENSE_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    invoke-virtual {v2}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->getValue()I

    move-result v2

    long-to-int v3, p2

    iget-object v4, p0, Lcom/gogoair/ife/views/PlayerActivity$5;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v4}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v4

    invoke-virtual {v4}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getAppData()Ljava/lang/String;

    move-result-object v4

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lcom/gogoair/ife/utils/GVLogger;->logASP(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    .line 354
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$5;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    sget-object v1, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->DRM_LICENSE_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    long-to-int v2, p2

    int-to-long v2, v2

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->goToLandingPage(Lcom/gogoair/ife/utils/Constants$GVErrorCode;J)V
    invoke-static {v0, v1, v2, v3}, Lcom/gogoair/ife/views/PlayerActivity;->access$2200(Lcom/gogoair/ife/views/PlayerActivity;Lcom/gogoair/ife/utils/Constants$GVErrorCode;J)V

    .line 355
    return-void
.end method

.method public onStart()V
    .locals 3

    .prologue
    .line 347
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "Started license acquisition"

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 348
    return-void
.end method
