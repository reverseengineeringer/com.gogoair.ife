.class final Lcom/gogoair/ife/drm/DRMHelper$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/ave/drm/DRMLicenseAcquiredCallback;


# instance fields
.field final synthetic val$listener:Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;)V
    .locals 0

    .prologue
    .line 388
    iput-object p1, p0, Lcom/gogoair/ife/drm/DRMHelper$4;->val$listener:Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public LicenseAcquired(Lcom/adobe/ave/drm/DRMLicense;)V
    .locals 3

    .prologue
    .line 390
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "[DRMPLAYER]::DRMHelper"

    const-string v2, "license acquired."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$4;->val$listener:Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;

    if-eqz v0, :cond_0

    .line 392
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$4;->val$listener:Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;

    invoke-interface {v0, p1}, Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;->onAcquired(Lcom/adobe/ave/drm/DRMLicense;)V

    .line 394
    :cond_0
    return-void
.end method
