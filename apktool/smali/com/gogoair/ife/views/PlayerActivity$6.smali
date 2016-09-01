.class Lcom/gogoair/ife/views/PlayerActivity$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/mediacore/MediaPlayer$DRMEventListener;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/views/PlayerActivity;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 386
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$6;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDRMMetadata(Lcom/adobe/mediacore/DRMMetadataInfo;)V
    .locals 6

    .prologue
    .line 390
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DRM metadata available: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 392
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$6;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getDRMManager()Lcom/adobe/ave/drm/DRMManager;

    move-result-object v0

    .line 394
    if-nez v0, :cond_0

    .line 395
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player#onDRMMetadata"

    const-string v2, "DRMManager is null."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 436
    :goto_0
    return-void

    .line 399
    :cond_0
    if-nez p1, :cond_1

    .line 400
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player#onDRMMetadata"

    const-string v2, "DrmMetadataInfo is null."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 408
    :cond_1
    invoke-virtual {p1}, Lcom/adobe/mediacore/DRMMetadataInfo;->getDRMMetadata()Lcom/adobe/ave/drm/DRMMetadata;

    move-result-object v1

    const-string v2, ""

    const-string v3, ""

    iget-object v4, p0, Lcom/gogoair/ife/views/PlayerActivity$6;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v4}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v4

    invoke-virtual {v4}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getToken()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/gogoair/ife/views/PlayerActivity$6$1;

    invoke-direct {v5, p0, p1, v0}, Lcom/gogoair/ife/views/PlayerActivity$6$1;-><init>(Lcom/gogoair/ife/views/PlayerActivity$6;Lcom/adobe/mediacore/DRMMetadataInfo;Lcom/adobe/ave/drm/DRMManager;)V

    invoke-static/range {v0 .. v5}, Lcom/gogoair/ife/drm/DRMHelper;->performDrmAuthentication(Lcom/adobe/ave/drm/DRMManager;Lcom/adobe/ave/drm/DRMMetadata;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;)V

    goto :goto_0
.end method
