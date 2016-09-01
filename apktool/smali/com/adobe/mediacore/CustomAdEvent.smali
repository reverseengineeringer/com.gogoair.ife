.class Lcom/adobe/mediacore/CustomAdEvent;
.super Lcom/adobe/mediacore/MediaPlayerEvent;


# static fields
.field static final AD_CLICK_HANDLE:Ljava/lang/String; = "adClickThruHandle"

.field static final AD_CLICK_THRU_URL:Ljava/lang/String; = "adClickThruUrl"

.field static final AD_DURATION:Ljava/lang/String; = "duration"

.field static final AD_ERROR_MSG:Ljava/lang/String; = "error"

.field static final AD_REMAINING:Ljava/lang/String; = "remaining"


# instance fields
.field private _adData:Lcom/adobe/mediacore/metadata/Metadata;

.field private final _eventType:Lcom/adobe/mediacore/CustomAdEventType;


# direct methods
.method private constructor <init>(Lcom/adobe/mediacore/CustomAdEventType;)V
    .locals 1

    new-instance v0, Lcom/adobe/mediacore/metadata/MetadataNode;

    invoke-direct {v0}, Lcom/adobe/mediacore/metadata/MetadataNode;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;Lcom/adobe/mediacore/metadata/Metadata;)V

    return-void
.end method

.method private constructor <init>(Lcom/adobe/mediacore/CustomAdEventType;Lcom/adobe/mediacore/metadata/Metadata;)V
    .locals 1

    sget-object v0, Lcom/adobe/mediacore/MediaPlayerEvent$Type;->CUSTOM_AD_EVENT:Lcom/adobe/mediacore/MediaPlayerEvent$Type;

    invoke-direct {p0, v0}, Lcom/adobe/mediacore/MediaPlayerEvent;-><init>(Lcom/adobe/mediacore/MediaPlayerEvent$Type;)V

    iput-object p1, p0, Lcom/adobe/mediacore/CustomAdEvent;->_eventType:Lcom/adobe/mediacore/CustomAdEventType;

    iput-object p2, p0, Lcom/adobe/mediacore/CustomAdEvent;->_adData:Lcom/adobe/mediacore/metadata/Metadata;

    return-void
.end method

.method public static createAdClickThru(Ljava/lang/String;Z)Lcom/adobe/mediacore/CustomAdEvent;
    .locals 3

    new-instance v0, Lcom/adobe/mediacore/metadata/MetadataNode;

    invoke-direct {v0}, Lcom/adobe/mediacore/metadata/MetadataNode;-><init>()V

    const-string v1, "adClickThruUrl"

    invoke-interface {v0, v1, p0}, Lcom/adobe/mediacore/metadata/Metadata;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_0

    const-string v1, "adClickThruHandle"

    const-string v2, "player"

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/metadata/Metadata;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    new-instance v1, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_CLICK_THROUGH:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v1, v2, v0}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;Lcom/adobe/mediacore/metadata/Metadata;)V

    return-object v1
.end method

.method public static createAdDurationChange()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_DURATION_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdError(Ljava/lang/String;)Lcom/adobe/mediacore/CustomAdEvent;
    .locals 3

    new-instance v0, Lcom/adobe/mediacore/metadata/MetadataNode;

    invoke-direct {v0}, Lcom/adobe/mediacore/metadata/MetadataNode;-><init>()V

    const-string v1, "error"

    invoke-interface {v0, v1, p0}, Lcom/adobe/mediacore/metadata/Metadata;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_ERROR:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v1, v2, v0}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;Lcom/adobe/mediacore/metadata/Metadata;)V

    return-object v1
.end method

.method public static createAdExpandedChange()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_EXPANDED_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdImpression()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_IMPRESSION:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdInteraction()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_INTERACTION:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdLinearChange()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_LINEAR_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdPaused()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_PAUSED:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdPlaying()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_PLAYING:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdProgress(FF)Lcom/adobe/mediacore/CustomAdEvent;
    .locals 3

    new-instance v0, Lcom/adobe/mediacore/metadata/MetadataNode;

    invoke-direct {v0}, Lcom/adobe/mediacore/metadata/MetadataNode;-><init>()V

    const-string v1, "duration"

    invoke-static {p0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/metadata/Metadata;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "remaining"

    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/metadata/Metadata;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_PROGRESS:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v1, v2, v0}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;Lcom/adobe/mediacore/metadata/Metadata;)V

    return-object v1
.end method

.method public static createAdSizeChange()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_SIZE_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdSkippableStateChange()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_SKIPPABLE_STATE_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdSkipped()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_SKIPPED:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdStarted()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_STARTED:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdStopped()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_STOPPED:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdUserAcceptInvitation()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_USER_ACCEPT_INVITATION:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdUserClose()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_USER_CLOSE:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdUserMinimize()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_USER_MINIMIZE:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdVideoComplete()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_VIDEO_COMPLETE:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdVideoFirstQuartile()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_FIRST_QUARTILE:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdVideoMidpoint()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_VIDEO_MIDPOINT:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdVideoStart()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_VIDEO_START:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdVideoThirdQuartile()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_THIRD_QUARTILE:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method

.method public static createAdVolumeChange()Lcom/adobe/mediacore/CustomAdEvent;
    .locals 2

    new-instance v0, Lcom/adobe/mediacore/CustomAdEvent;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_VOLUME_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    invoke-direct {v0, v1}, Lcom/adobe/mediacore/CustomAdEvent;-><init>(Lcom/adobe/mediacore/CustomAdEventType;)V

    return-object v0
.end method


# virtual methods
.method public getAdData()Lcom/adobe/mediacore/metadata/Metadata;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdEvent;->_adData:Lcom/adobe/mediacore/metadata/Metadata;

    return-object v0
.end method

.method public getEventType()Lcom/adobe/mediacore/CustomAdEventType;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdEvent;->_eventType:Lcom/adobe/mediacore/CustomAdEventType;

    return-object v0
.end method
