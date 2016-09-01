.class public Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginDelegate;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAdBreakInfo()Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;
    .locals 1

    .prologue
    .line 42
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAdInfo()Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;
    .locals 1

    .prologue
    .line 53
    const/4 v0, 0x0

    return-object v0
.end method

.method public getChapterInfo()Lcom/adobe/primetime/va/plugins/videoplayer/ChapterInfo;
    .locals 1

    .prologue
    .line 64
    const/4 v0, 0x0

    return-object v0
.end method

.method public getQoSInfo()Lcom/adobe/primetime/va/plugins/videoplayer/QoSInfo;
    .locals 1

    .prologue
    .line 75
    const/4 v0, 0x0

    return-object v0
.end method

.method public getVideoInfo()Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;
    .locals 2

    .prologue
    .line 31
    new-instance v0, Ljava/lang/IllegalAccessError;

    const-string v1, "Implementation error: Method must be overridden."

    invoke-direct {v0, v1}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v0
.end method
