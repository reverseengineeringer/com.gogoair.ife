.class Lcom/gogoair/ife/views/PlayerActivity$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/views/PlayerActivity;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 451
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$7;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadMetadataUrlComplete(ZLcom/adobe/ave/drm/DRMMetadata;)V
    .locals 6

    .prologue
    .line 476
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "#onLoadMetadataUrlComplete:Loaded metadata URL contents. Auth needed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 477
    if-nez p1, :cond_0

    .line 478
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$7;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->drmManager:Lcom/adobe/ave/drm/DRMManager;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$2900(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/ave/drm/DRMManager;

    move-result-object v0

    new-instance v1, Lcom/gogoair/ife/views/PlayerActivity$7$2;

    invoke-direct {v1, p0}, Lcom/gogoair/ife/views/PlayerActivity$7$2;-><init>(Lcom/gogoair/ife/views/PlayerActivity$7;)V

    invoke-static {v0, p2, v1}, Lcom/gogoair/ife/drm/DRMHelper;->acquireLicense(Lcom/adobe/ave/drm/DRMManager;Lcom/adobe/ave/drm/DRMMetadata;Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;)V

    .line 521
    :goto_0
    return-void

    .line 501
    :cond_0
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$7;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->drmManager:Lcom/adobe/ave/drm/DRMManager;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$2900(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/ave/drm/DRMManager;

    move-result-object v0

    const-string v2, ""

    const-string v3, ""

    const-string v4, ""

    new-instance v5, Lcom/gogoair/ife/views/PlayerActivity$7$3;

    invoke-direct {v5, p0, p2}, Lcom/gogoair/ife/views/PlayerActivity$7$3;-><init>(Lcom/gogoair/ife/views/PlayerActivity$7;Lcom/adobe/ave/drm/DRMMetadata;)V

    move-object v1, p2

    invoke-static/range {v0 .. v5}, Lcom/gogoair/ife/drm/DRMHelper;->performDrmAuthentication(Lcom/adobe/ave/drm/DRMManager;Lcom/adobe/ave/drm/DRMMetadata;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;)V

    goto :goto_0
.end method

.method public onLoadMetadataUrlError()V
    .locals 3

    .prologue
    .line 470
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "#onLoadMetadataUrlError:Unable to load DRM metadata: [http://cs.video.gogoinflight.com/media/static/players/ReferencePlayer/onprem.metadata]."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 471
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity$7;->setupPlayer()V

    .line 472
    return-void
.end method

.method public onLoadMetadataUrlStart()V
    .locals 3

    .prologue
    .line 465
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "#onLoadMetadataUrlStart:Loading DRM metadata URL contents."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 466
    return-void
.end method

.method public setupPlayer()V
    .locals 2

    .prologue
    .line 454
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$7;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    new-instance v1, Lcom/gogoair/ife/views/PlayerActivity$7$1;

    invoke-direct {v1, p0}, Lcom/gogoair/ife/views/PlayerActivity$7$1;-><init>(Lcom/gogoair/ife/views/PlayerActivity$7;)V

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/views/PlayerActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 461
    return-void
.end method
