.class final Lcom/gogoair/ife/drm/DRMHelper$1;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field final synthetic val$drmManager:Lcom/adobe/ave/drm/DRMManager;

.field final synthetic val$drmMetadataUrl:Ljava/lang/String;

.field final synthetic val$loadMetadataListener:Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;Ljava/lang/String;Lcom/adobe/ave/drm/DRMManager;)V
    .locals 0

    .prologue
    .line 140
    iput-object p1, p0, Lcom/gogoair/ife/drm/DRMHelper$1;->val$loadMetadataListener:Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;

    iput-object p2, p0, Lcom/gogoair/ife/drm/DRMHelper$1;->val$drmMetadataUrl:Ljava/lang/String;

    iput-object p3, p0, Lcom/gogoair/ife/drm/DRMHelper$1;->val$drmManager:Lcom/adobe/ave/drm/DRMManager;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 142
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$1;->val$loadMetadataListener:Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;

    invoke-interface {v0}, Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;->onLoadMetadataUrlStart()V

    .line 144
    const/4 v1, 0x0

    .line 146
    :try_start_0
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$1;->val$drmMetadataUrl:Ljava/lang/String;

    # invokes: Lcom/gogoair/ife/drm/DRMHelper;->getBytesFromURL(Ljava/lang/String;)[B
    invoke-static {v0}, Lcom/gogoair/ife/drm/DRMHelper;->access$000(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 153
    :goto_0
    if-nez v0, :cond_1

    .line 155
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$1;->val$loadMetadataListener:Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;

    invoke-interface {v0}, Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;->onLoadMetadataUrlError()V

    .line 179
    :cond_0
    :goto_1
    return-void

    .line 147
    :catch_0
    move-exception v0

    .line 148
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v2, "[DRMPLAYER]::DRMHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Can\'t load meta data because "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/gogoair/ife/drm/DRMHelper$1;->val$drmMetadataUrl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is not a well formed URL"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/gogoair/ife/utils/GVLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v1

    .line 151
    goto :goto_0

    .line 149
    :catch_1
    move-exception v0

    .line 150
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v2

    const-string v3, "[DRMPLAYER]::DRMHelper"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can\'t load metadata from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/gogoair/ife/drm/DRMHelper$1;->val$drmMetadataUrl:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " because of an IOError: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Lcom/gogoair/ife/utils/GVLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v1

    goto :goto_0

    .line 159
    :cond_1
    iget-object v1, p0, Lcom/gogoair/ife/drm/DRMHelper$1;->val$drmManager:Lcom/adobe/ave/drm/DRMManager;

    new-instance v2, Lcom/gogoair/ife/drm/DRMHelper$1$1;

    invoke-direct {v2, p0}, Lcom/gogoair/ife/drm/DRMHelper$1$1;-><init>(Lcom/gogoair/ife/drm/DRMHelper$1;)V

    invoke-virtual {v1, v0, v2}, Lcom/adobe/ave/drm/DRMManager;->createMetadataFromBytes([BLcom/adobe/ave/drm/DRMOperationErrorCallback;)Lcom/adobe/ave/drm/DRMMetadata;

    move-result-object v0

    .line 173
    # invokes: Lcom/gogoair/ife/drm/DRMHelper;->isAuthNeeded(Lcom/adobe/ave/drm/DRMMetadata;)Z
    invoke-static {v0}, Lcom/gogoair/ife/drm/DRMHelper;->access$100(Lcom/adobe/ave/drm/DRMMetadata;)Z

    move-result v1

    .line 174
    iget-object v2, p0, Lcom/gogoair/ife/drm/DRMHelper$1;->val$loadMetadataListener:Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;

    invoke-interface {v2, v1, v0}, Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;->onLoadMetadataUrlComplete(ZLcom/adobe/ave/drm/DRMMetadata;)V

    .line 175
    if-nez v1, :cond_0

    goto :goto_1
.end method
