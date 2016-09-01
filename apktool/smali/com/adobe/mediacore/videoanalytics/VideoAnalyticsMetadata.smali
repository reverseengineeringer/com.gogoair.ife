.class public final Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;
.super Lcom/adobe/mediacore/metadata/MetadataNode;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$ChapterMetadataBlock;,
        Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$AdMetadataBlock;,
        Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$VideoMetadataBlock;
    }
.end annotation


# static fields
.field private static final AA_AD_METADATA_KEY:Ljava/lang/String; = "aaAdMetadata"

.field private static final AA_CHAPTER_METADATA_KEY:Ljava/lang/String; = "aaChapterMetadata"

.field private static final AA_VIDEO_METADATA_KEY:Ljava/lang/String; = "aaVideoMetadata"

.field private static final APP_VERSION_KEY:Ljava/lang/String; = "appVersion"

.field private static final CHANNEL_KEY:Ljava/lang/String; = "channelName"

.field private static final CHAPTER_DATA_KEY:Ljava/lang/String; = "chapterData"

.field private static final ENABLE_CHAPTER_TRACKING:Ljava/lang/String; = "enableChapterTracking"

.field private static final ENABLE_SSL:Ljava/lang/String; = "enableSSL"

.field private static final PLAYER_NAME_KEY:Ljava/lang/String; = "playerName"

.field private static final PUBLISHER_KEY:Ljava/lang/String; = "publisher"

.field private static final TRACKING_SERVER_KEY:Ljava/lang/String; = "trackingServer"

.field private static final VIDEO_ID_KEY:Ljava/lang/String; = "videoId"

.field private static final VIDEO_NAME_KEY:Ljava/lang/String; = "videoName"


# instance fields
.field public debugLogging:Ljava/lang/Boolean;

.field public quietMode:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/adobe/mediacore/metadata/MetadataNode;-><init>()V

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->debugLogging:Ljava/lang/Boolean;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->quietMode:Ljava/lang/Boolean;

    return-void
.end method


# virtual methods
.method public getAdMetadataBlock()Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$AdMetadataBlock;
    .locals 1

    const-string v0, "aaAdMetadata"

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$AdMetadataBlock;

    return-object v0
.end method

.method public getAppVersion()Ljava/lang/String;
    .locals 1

    const-string v0, "appVersion"

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getChannel()Ljava/lang/String;
    .locals 1

    const-string v0, "channelName"

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getChapterMetadataBlock()Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$ChapterMetadataBlock;
    .locals 1

    const-string v0, "aaChapterMetadata"

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$ChapterMetadataBlock;

    return-object v0
.end method

.method public getChapters()Ljava/util/List;
    .locals 1

    const-string v0, "chapterData"

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->containsObject(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "chapterData"

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getEnableChapterTracking()Ljava/lang/Boolean;
    .locals 1

    const-string v0, "enableChapterTracking"

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public getPlayerName()Ljava/lang/String;
    .locals 1

    const-string v0, "playerName"

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPublisher()Ljava/lang/String;
    .locals 1

    const-string v0, "publisher"

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTrackingServer()Ljava/lang/String;
    .locals 1

    const-string v0, "trackingServer"

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUseSSL()Ljava/lang/Boolean;
    .locals 1

    const-string v0, "enableSSL"

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public getVideoId()Ljava/lang/String;
    .locals 1

    const-string v0, "videoId"

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVideoMetadataBlock()Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$VideoMetadataBlock;
    .locals 1

    const-string v0, "aaVideoMetadata"

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$VideoMetadataBlock;

    return-object v0
.end method

.method public getVideoName()Ljava/lang/String;
    .locals 1

    const-string v0, "videoName"

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setAdMetadataBlock(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$AdMetadataBlock;)V
    .locals 1

    const-string v0, "aaAdMetadata"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->setObject(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setAppVersion(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The parameter \'appVersion\' cannot be null or empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const-string v0, "appVersion"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setChannel(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The parameter \'channel\' cannot be null or empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const-string v0, "channelName"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setChapterMetadataBlock(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$ChapterMetadataBlock;)V
    .locals 1

    const-string v0, "aaChapterMetadata"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->setObject(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setChapters(Ljava/util/List;)V
    .locals 2

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The parameter \'chapters\' cannot be null or empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const-string v0, "chapterData"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->setObject(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setEnableChapterTracking(Ljava/lang/Boolean;)V
    .locals 2

    const-string v0, "enableChapterTracking"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setPlayerName(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The parameter \'playerName\' cannot be null or empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const-string v0, "playerName"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setPublisher(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The parameter \'publisher\' cannot be null or empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const-string v0, "publisher"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setTrackingServer(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The parameter \'trackingServer\' cannot be null or empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const-string v0, "trackingServer"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setUseSSL(Ljava/lang/Boolean;)V
    .locals 2

    const-string v0, "enableSSL"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setVideoId(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The parameter \'videoId\' cannot be null or empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const-string v0, "videoId"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public setVideoMetadataBlock(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata$VideoMetadataBlock;)V
    .locals 1

    const-string v0, "aaVideoMetadata"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->setObject(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setVideoName(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The parameter \'videoName\' cannot be null or empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const-string v0, "videoName"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
