.class final Lcom/gogoair/ife/drm/DRMHelper$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/ave/drm/DRMOperationErrorCallback;


# instance fields
.field final synthetic val$listener:Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;)V
    .locals 0

    .prologue
    .line 381
    iput-object p1, p0, Lcom/gogoair/ife/drm/DRMHelper$3;->val$listener:Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OperationError(JJLjava/lang/Exception;)V
    .locals 3

    .prologue
    .line 383
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "[DRMPLAYER]::DRMHelper"

    const-string v2, "Acquiring license. ERROR"

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 384
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$3;->val$listener:Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;

    if-eqz v0, :cond_0

    .line 385
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$3;->val$listener:Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error while loading license: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " 0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p3, p4}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1, p2}, Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;->onError(Ljava/lang/String;J)V

    .line 387
    :cond_0
    return-void
.end method
