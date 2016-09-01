.class Lcom/gogoair/ife/drm/DRMHelper$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/ave/drm/DRMOperationErrorWithErrorObjectCallback;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/drm/DRMHelper$1;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/drm/DRMHelper$1;)V
    .locals 0

    .prologue
    .line 159
    iput-object p1, p0, Lcom/gogoair/ife/drm/DRMHelper$1$1;->this$0:Lcom/gogoair/ife/drm/DRMHelper$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OperationError(JJLjava/lang/Exception;)V
    .locals 5

    .prologue
    .line 161
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "[DRMPLAYER]::DRMHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error loading DRM metadata: "

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

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$1$1;->this$0:Lcom/gogoair/ife/drm/DRMHelper$1;

    iget-object v0, v0, Lcom/gogoair/ife/drm/DRMHelper$1;->val$loadMetadataListener:Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;

    invoke-interface {v0}, Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;->onLoadMetadataUrlError()V

    .line 163
    return-void
.end method

.method public OperationError(Lcom/adobe/ave/drm/DRMError;)V
    .locals 6

    .prologue
    .line 167
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "[DRMPLAYER]::DRMHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error loading DRM metadata: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/ave/drm/DRMError;->getMajorError()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/ave/drm/DRMError;->getMinorError()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$1$1;->this$0:Lcom/gogoair/ife/drm/DRMHelper$1;

    iget-object v0, v0, Lcom/gogoair/ife/drm/DRMHelper$1;->val$loadMetadataListener:Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;

    invoke-interface {v0}, Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;->onLoadMetadataUrlError()V

    .line 169
    return-void
.end method
