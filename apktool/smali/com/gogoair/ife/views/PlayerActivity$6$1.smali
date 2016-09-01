.class Lcom/gogoair/ife/views/PlayerActivity$6$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;


# instance fields
.field final synthetic this$1:Lcom/gogoair/ife/views/PlayerActivity$6;

.field final synthetic val$drmManager:Lcom/adobe/ave/drm/DRMManager;

.field final synthetic val$drmMetadataInfo:Lcom/adobe/mediacore/DRMMetadataInfo;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity$6;Lcom/adobe/mediacore/DRMMetadataInfo;Lcom/adobe/ave/drm/DRMManager;)V
    .locals 0

    .prologue
    .line 408
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$6$1;->this$1:Lcom/gogoair/ife/views/PlayerActivity$6;

    iput-object p2, p0, Lcom/gogoair/ife/views/PlayerActivity$6$1;->val$drmMetadataInfo:Lcom/adobe/mediacore/DRMMetadataInfo;

    iput-object p3, p0, Lcom/gogoair/ife/views/PlayerActivity$6$1;->val$drmManager:Lcom/adobe/ave/drm/DRMManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAuthenticationComplete([B)V
    .locals 6

    .prologue
    .line 431
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Auth successful for DRM metadata at ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/gogoair/ife/views/PlayerActivity$6$1;->val$drmMetadataInfo:Lcom/adobe/mediacore/DRMMetadataInfo;

    .line 432
    invoke-virtual {v3}, Lcom/adobe/mediacore/DRMMetadataInfo;->getPrefetchTimestamp()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 431
    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 433
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$6$1;->val$drmManager:Lcom/adobe/ave/drm/DRMManager;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$6$1;->val$drmMetadataInfo:Lcom/adobe/mediacore/DRMMetadataInfo;

    invoke-virtual {v1}, Lcom/adobe/mediacore/DRMMetadataInfo;->getDRMMetadata()Lcom/adobe/ave/drm/DRMMetadata;

    move-result-object v1

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity$6$1;->this$1:Lcom/gogoair/ife/views/PlayerActivity$6;

    iget-object v2, v2, Lcom/gogoair/ife/views/PlayerActivity$6;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->licenseAcquisitionListener:Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;
    invoke-static {v2}, Lcom/gogoair/ife/views/PlayerActivity;->access$2600(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/gogoair/ife/drm/DRMHelper;->acquireLicense(Lcom/adobe/ave/drm/DRMManager;Lcom/adobe/ave/drm/DRMMetadata;Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;)V

    .line 434
    return-void
.end method

.method public onAuthenticationError(JJLjava/lang/Exception;)V
    .locals 5

    .prologue
    .line 419
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DRM authentication failed. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p3, p4}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 420
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/gogoair/ife/views/PlayerActivity$6$1$1;

    invoke-direct {v1, p0, p1, p2, p5}, Lcom/gogoair/ife/views/PlayerActivity$6$1$1;-><init>(Lcom/gogoair/ife/views/PlayerActivity$6$1;JLjava/lang/Exception;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 427
    return-void
.end method

.method public onAuthenticationStart()V
    .locals 6

    .prologue
    .line 413
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DRM authentication started for DRM metadata at ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/gogoair/ife/views/PlayerActivity$6$1;->val$drmMetadataInfo:Lcom/adobe/mediacore/DRMMetadataInfo;

    .line 414
    invoke-virtual {v3}, Lcom/adobe/mediacore/DRMMetadataInfo;->getPrefetchTimestamp()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 413
    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 415
    return-void
.end method
