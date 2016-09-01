.class Lcom/gogoair/ife/views/PlayerActivity$7$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;


# instance fields
.field final synthetic this$1:Lcom/gogoair/ife/views/PlayerActivity$7;

.field final synthetic val$drmMetadata:Lcom/adobe/ave/drm/DRMMetadata;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity$7;Lcom/adobe/ave/drm/DRMMetadata;)V
    .locals 0

    .prologue
    .line 501
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$7$3;->this$1:Lcom/gogoair/ife/views/PlayerActivity$7;

    iput-object p2, p0, Lcom/gogoair/ife/views/PlayerActivity$7$3;->val$drmMetadata:Lcom/adobe/ave/drm/DRMMetadata;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAuthenticationComplete([B)V
    .locals 3

    .prologue
    .line 517
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "#onAuthenticationComplete:Auth successful. Launching content."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 518
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$7$3;->this$1:Lcom/gogoair/ife/views/PlayerActivity$7;

    iget-object v0, v0, Lcom/gogoair/ife/views/PlayerActivity$7;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->drmManager:Lcom/adobe/ave/drm/DRMManager;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$2900(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/ave/drm/DRMManager;

    move-result-object v0

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$7$3;->val$drmMetadata:Lcom/adobe/ave/drm/DRMMetadata;

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity$7$3;->this$1:Lcom/gogoair/ife/views/PlayerActivity$7;

    iget-object v2, v2, Lcom/gogoair/ife/views/PlayerActivity$7;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->licenseAcquisitionListener:Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;
    invoke-static {v2}, Lcom/gogoair/ife/views/PlayerActivity;->access$2600(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/gogoair/ife/drm/DRMHelper;->acquireLicense(Lcom/adobe/ave/drm/DRMManager;Lcom/adobe/ave/drm/DRMMetadata;Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;)V

    .line 519
    return-void
.end method

.method public onAuthenticationError(JJLjava/lang/Exception;)V
    .locals 7

    .prologue
    .line 510
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "#onAuthenticationError:DRM authentication failed. "

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

    .line 511
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "ERROR"

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->INDIV_AUTH_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    invoke-virtual {v2}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->getValue()I

    move-result v2

    long-to-int v3, p1

    iget-object v4, p0, Lcom/gogoair/ife/views/PlayerActivity$7$3;->this$1:Lcom/gogoair/ife/views/PlayerActivity$7;

    iget-object v4, v4, Lcom/gogoair/ife/views/PlayerActivity$7;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v4}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v4

    invoke-virtual {v4}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getAppData()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Indiv auth failed."

    invoke-virtual/range {v0 .. v5}, Lcom/gogoair/ife/utils/GVLogger;->logASP(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    .line 512
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$7$3;->this$1:Lcom/gogoair/ife/views/PlayerActivity$7;

    invoke-virtual {v0}, Lcom/gogoair/ife/views/PlayerActivity$7;->setupPlayer()V

    .line 513
    return-void
.end method

.method public onAuthenticationStart()V
    .locals 3

    .prologue
    .line 505
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "#onAuthenticationStart:DRM authentication started."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 506
    return-void
.end method
