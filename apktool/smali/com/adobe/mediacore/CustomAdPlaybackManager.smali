.class public final Lcom/adobe/mediacore/CustomAdPlaybackManager;
.super Ljava/lang/Object;


# static fields
.field private static final LOG_TAG:Ljava/lang/String;

.field private static final _logger:Lcom/adobe/mediacore/logging/Logger;


# instance fields
.field private _complete:Z

.field private _context:Landroid/content/Context;

.field private _currentAd:Lcom/adobe/mediacore/timeline/advertising/Ad;

.field private _currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;

.field private _currentAdIndex:I

.field private _currentTime:J

.field private final _customAdEventListener:Lcom/adobe/mediacore/MediaPlayer$CustomAdEventListener;

.field private _customAdView:Lcom/adobe/mediacore/CustomAdView;

.field private _handler:Landroid/os/Handler;

.field private _isCustomAdPlaying:Z

.field private _lastKnownProgress:I

.field private final _onPauseAtPeriodEndEventListener:Lcom/adobe/mediacore/PauseAtPeriodEndListener;

.field private final _player:Lcom/adobe/mediacore/DefaultMediaPlayer;

.field private final _seekAdjustCompletedListener:Lcom/adobe/mediacore/SeekAdjustCompletedListener;

.field private _startTimeOfSeekOrTrickPlay:J

.field private _videoEngineAdapter:Lcom/adobe/mediacore/VideoEngineAdapter;

.field private final _videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[PSDK]::"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/adobe/mediacore/CustomAdPlaybackManager;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->LOG_TAG:Ljava/lang/String;

    sget-object v0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->LOG_TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/adobe/mediacore/logging/Log;->getLogger(Ljava/lang/String;)Lcom/adobe/mediacore/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_logger:Lcom/adobe/mediacore/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/adobe/mediacore/VideoEngineDispatcher;Lcom/adobe/mediacore/VideoEngineAdapter;Lcom/adobe/mediacore/DefaultMediaPlayer;Landroid/content/Context;)V
    .locals 4

    const/4 v3, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$1;

    invoke-direct {v0, p0}, Lcom/adobe/mediacore/CustomAdPlaybackManager$1;-><init>(Lcom/adobe/mediacore/CustomAdPlaybackManager;)V

    iput-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_seekAdjustCompletedListener:Lcom/adobe/mediacore/SeekAdjustCompletedListener;

    new-instance v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    invoke-direct {v0, p0}, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;-><init>(Lcom/adobe/mediacore/CustomAdPlaybackManager;)V

    iput-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_customAdEventListener:Lcom/adobe/mediacore/MediaPlayer$CustomAdEventListener;

    new-instance v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$3;

    invoke-direct {v0, p0}, Lcom/adobe/mediacore/CustomAdPlaybackManager$3;-><init>(Lcom/adobe/mediacore/CustomAdPlaybackManager;)V

    iput-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_onPauseAtPeriodEndEventListener:Lcom/adobe/mediacore/PauseAtPeriodEndListener;

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Video Engine Dispatcher parameter must not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Video Engine Adapter parameter must not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    if-nez p3, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "MediaPlayer parameter must not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    iput-object p2, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineAdapter:Lcom/adobe/mediacore/VideoEngineAdapter;

    iput-object p1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;

    iput-object p3, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_player:Lcom/adobe/mediacore/DefaultMediaPlayer;

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayerEvent$Type;->PAUSE_AT_PERIOD_END:Lcom/adobe/mediacore/MediaPlayerEvent$Type;

    iget-object v2, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_onPauseAtPeriodEndEventListener:Lcom/adobe/mediacore/PauseAtPeriodEndListener;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/mediacore/VideoEngineDispatcher;->addEventListener(Lcom/adobe/mediacore/MediaPlayerEvent$Type;Lcom/adobe/mediacore/MediaPlayer$EventListener;)V

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$Event;->CUSTOM_AD:Lcom/adobe/mediacore/MediaPlayer$Event;

    iget-object v2, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_customAdEventListener:Lcom/adobe/mediacore/MediaPlayer$CustomAdEventListener;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/mediacore/VideoEngineDispatcher;->addEventListener(Lcom/adobe/mediacore/MediaPlayer$Event;Lcom/adobe/mediacore/MediaPlayer$EventListener;)V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentTime:J

    iput v3, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I

    iput-boolean v3, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_complete:Z

    iput-boolean v3, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_isCustomAdPlaying:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    iput-object p4, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_context:Landroid/content/Context;

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_startTimeOfSeekOrTrickPlay:J

    new-instance v0, Lcom/adobe/mediacore/CustomAdView;

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;

    iget-object v2, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_context:Landroid/content/Context;

    iget-object v3, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_player:Lcom/adobe/mediacore/DefaultMediaPlayer;

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/mediacore/CustomAdView;-><init>(Lcom/adobe/mediacore/VideoEngineDispatcher;Landroid/content/Context;Lcom/adobe/mediacore/MediaPlayer;)V

    iput-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_customAdView:Lcom/adobe/mediacore/CustomAdView;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_handler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/SeekAdjustCompletedListener;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_seekAdjustCompletedListener:Lcom/adobe/mediacore/SeekAdjustCompletedListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/VideoEngineDispatcher;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/adobe/mediacore/CustomAdPlaybackManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_isCustomAdPlaying:Z

    return p1
.end method

.method static synthetic access$1200(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/CustomAdView;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_customAdView:Lcom/adobe/mediacore/CustomAdView;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/adobe/mediacore/CustomAdPlaybackManager;)I
    .locals 1

    iget v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_lastKnownProgress:I

    return v0
.end method

.method static synthetic access$1302(Lcom/adobe/mediacore/CustomAdPlaybackManager;I)I
    .locals 0

    iput p1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_lastKnownProgress:I

    return p1
.end method

.method static synthetic access$1400(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_complete:Z

    return v0
.end method

.method static synthetic access$1500(Lcom/adobe/mediacore/CustomAdPlaybackManager;Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->containCustomAdOnly(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1600(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/DefaultMediaPlayer;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_player:Lcom/adobe/mediacore/DefaultMediaPlayer;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/mediacore/CustomAdPlaybackManager;)J
    .locals 2

    iget-wide v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentTime:J

    return-wide v0
.end method

.method static synthetic access$300(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    return-object v0
.end method

.method static synthetic access$302(Lcom/adobe/mediacore/CustomAdPlaybackManager;Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    return-object p1
.end method

.method static synthetic access$400(Lcom/adobe/mediacore/CustomAdPlaybackManager;)I
    .locals 1

    iget v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I

    return v0
.end method

.method static synthetic access$402(Lcom/adobe/mediacore/CustomAdPlaybackManager;I)I
    .locals 0

    iput p1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I

    return p1
.end method

.method static synthetic access$408(Lcom/adobe/mediacore/CustomAdPlaybackManager;)I
    .locals 2

    iget v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I

    return v0
.end method

.method static synthetic access$500(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/VideoEngineAdapter;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineAdapter:Lcom/adobe/mediacore/VideoEngineAdapter;

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/mediacore/CustomAdPlaybackManager;)J
    .locals 2

    iget-wide v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_startTimeOfSeekOrTrickPlay:J

    return-wide v0
.end method

.method static synthetic access$700(Lcom/adobe/mediacore/CustomAdPlaybackManager;Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->setAdBreak(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$800(Lcom/adobe/mediacore/CustomAdPlaybackManager;Lcom/adobe/mediacore/timeline/advertising/Ad;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->playCustomAd(Lcom/adobe/mediacore/timeline/advertising/Ad;Z)V

    return-void
.end method

.method static synthetic access$900(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/Ad;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAd:Lcom/adobe/mediacore/timeline/advertising/Ad;

    return-object v0
.end method

.method private containCustomAdOnly(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z
    .locals 4

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->adsIterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/timeline/advertising/Ad;

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getType()Lcom/adobe/mediacore/MediaResource$Type;

    move-result-object v0

    sget-object v3, Lcom/adobe/mediacore/MediaResource$Type;->CUSTOM:Lcom/adobe/mediacore/MediaResource$Type;

    if-eq v0, v3, :cond_2

    const/4 v0, 0x0

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_0
    move v1, v0

    :cond_1
    return v1

    :cond_2
    move v0, v1

    goto :goto_1
.end method

.method private playCustomAd(Lcom/adobe/mediacore/timeline/advertising/Ad;Z)V
    .locals 3

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getType()Lcom/adobe/mediacore/MediaResource$Type;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaResource$Type;->CUSTOM:Lcom/adobe/mediacore/MediaResource$Type;

    if-ne v0, v1, :cond_4

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_player:Lcom/adobe/mediacore/DefaultMediaPlayer;

    invoke-virtual {v0}, Lcom/adobe/mediacore/DefaultMediaPlayer;->stopInternalTimer()V

    invoke-virtual {p1}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getPrimaryAsset()Lcom/adobe/mediacore/timeline/advertising/AdAsset;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/AdAsset;->getMediaResource()Lcom/adobe/mediacore/MediaResource;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/MediaResource;->getUrl()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, "http"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, "https"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_0
    if-nez p2, :cond_1

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_player:Lcom/adobe/mediacore/DefaultMediaPlayer;

    invoke-virtual {v1}, Lcom/adobe/mediacore/DefaultMediaPlayer;->pause()V

    :cond_1
    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    invoke-virtual {v1}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->getFirstAd()Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/adobe/mediacore/timeline/advertising/Ad;->equals(Lcom/adobe/mediacore/timeline/advertising/Ad;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;

    iget-object v2, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    invoke-static {v2}, Lcom/adobe/mediacore/AdBreakPlaybackEvent;->createStartEvent(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Lcom/adobe/mediacore/AdBreakPlaybackEvent;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    :cond_2
    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_customAdView:Lcom/adobe/mediacore/CustomAdView;

    invoke-virtual {p1}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getPrimaryAsset()Lcom/adobe/mediacore/timeline/advertising/AdAsset;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/mediacore/timeline/advertising/AdAsset;->getAdParameters()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/adobe/mediacore/CustomAdView;->playCustomAd(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    iput-object p1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAd:Lcom/adobe/mediacore/timeline/advertising/Ad;

    :cond_4
    return-void
.end method

.method private setAdBreak(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z
    .locals 6

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    if-eq p1, v1, :cond_0

    iput-object p1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    iput v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    invoke-virtual {v1}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->size()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    invoke-virtual {v1}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->getFirstAd()Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getType()Lcom/adobe/mediacore/MediaResource$Type;

    move-result-object v1

    sget-object v2, Lcom/adobe/mediacore/MediaResource$Type;->CUSTOM:Lcom/adobe/mediacore/MediaResource$Type;

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_player:Lcom/adobe/mediacore/DefaultMediaPlayer;

    invoke-virtual {v1}, Lcom/adobe/mediacore/DefaultMediaPlayer;->getTrickPlayManager()Lcom/adobe/mediacore/TrickPlayManager;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_player:Lcom/adobe/mediacore/DefaultMediaPlayer;

    invoke-virtual {v1}, Lcom/adobe/mediacore/DefaultMediaPlayer;->getTrickPlayManager()Lcom/adobe/mediacore/TrickPlayManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/mediacore/TrickPlayManager;->trickPlayEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method


# virtual methods
.method public attachSeekListener()V
    .locals 3

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayerEvent$Type;->SEEK_ADJUST_COMPLETED:Lcom/adobe/mediacore/MediaPlayerEvent$Type;

    iget-object v2, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_seekAdjustCompletedListener:Lcom/adobe/mediacore/SeekAdjustCompletedListener;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/mediacore/VideoEngineDispatcher;->addEventListener(Lcom/adobe/mediacore/MediaPlayerEvent$Type;Lcom/adobe/mediacore/MediaPlayer$EventListener;)V

    return-void
.end method

.method public getCustomAdView()Lcom/adobe/mediacore/CustomAdView;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_customAdView:Lcom/adobe/mediacore/CustomAdView;

    return-object v0
.end method

.method public handlePostRoll()V
    .locals 7

    const/4 v6, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineAdapter:Lcom/adobe/mediacore/VideoEngineAdapter;

    invoke-virtual {v0}, Lcom/adobe/mediacore/VideoEngineAdapter;->getTimeline()Lcom/adobe/mediacore/VideoEngineTimeline;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/VideoEngineTimeline;->getLastAdBreak()Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->containCustomAdOnly(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z

    move-result v0

    if-eqz v3, :cond_1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_player:Lcom/adobe/mediacore/DefaultMediaPlayer;

    invoke-virtual {v0}, Lcom/adobe/mediacore/DefaultMediaPlayer;->getTrickPlayManager()Lcom/adobe/mediacore/TrickPlayManager;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_player:Lcom/adobe/mediacore/DefaultMediaPlayer;

    invoke-virtual {v0}, Lcom/adobe/mediacore/DefaultMediaPlayer;->getTrickPlayManager()Lcom/adobe/mediacore/TrickPlayManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/TrickPlayManager;->trickPlayEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0, v3}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->setAdBreak(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z

    iput v2, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I

    invoke-virtual {v3}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->adsIterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/timeline/advertising/Ad;

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getType()Lcom/adobe/mediacore/MediaResource$Type;

    move-result-object v1

    sget-object v3, Lcom/adobe/mediacore/MediaResource$Type;->CUSTOM:Lcom/adobe/mediacore/MediaResource$Type;

    if-ne v1, v3, :cond_0

    iput-boolean v6, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_complete:Z

    invoke-direct {p0, v0, v2}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->playCustomAd(Lcom/adobe/mediacore/timeline/advertising/Ad;Z)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-eqz v3, :cond_5

    invoke-virtual {v3}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->getLastAd()Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getType()Lcom/adobe/mediacore/MediaResource$Type;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaResource$Type;->CUSTOM:Lcom/adobe/mediacore/MediaResource$Type;

    if-ne v0, v1, :cond_5

    invoke-virtual {v3}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->adsIterator()Ljava/util/Iterator;

    move-result-object v4

    invoke-direct {p0, v3}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->setAdBreak(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z

    iput v2, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I

    move v1, v2

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/timeline/advertising/Ad;

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getType()Lcom/adobe/mediacore/MediaResource$Type;

    move-result-object v0

    sget-object v5, Lcom/adobe/mediacore/MediaResource$Type;->CUSTOM:Lcom/adobe/mediacore/MediaResource$Type;

    if-eq v0, v5, :cond_2

    iput v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I

    :cond_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    :cond_3
    invoke-virtual {v3}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->adsIterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v2

    :goto_2
    iget v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I

    if-gt v1, v0, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/timeline/advertising/Ad;

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_2

    :cond_4
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/timeline/advertising/Ad;

    iget v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I

    iput-boolean v6, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_complete:Z

    invoke-direct {p0, v0, v2}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->playCustomAd(Lcom/adobe/mediacore/timeline/advertising/Ad;Z)V

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;

    new-instance v1, Lcom/adobe/mediacore/MediaPlayerEvent;

    sget-object v2, Lcom/adobe/mediacore/MediaPlayerEvent$Type;->POST_ROLL_COMPLETE:Lcom/adobe/mediacore/MediaPlayerEvent$Type;

    invoke-direct {v1, v2}, Lcom/adobe/mediacore/MediaPlayerEvent;-><init>(Lcom/adobe/mediacore/MediaPlayerEvent$Type;)V

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    goto :goto_0
.end method

.method public reset()V
    .locals 5

    const/4 v4, 0x0

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayerEvent$Type;->PAUSE_AT_PERIOD_END:Lcom/adobe/mediacore/MediaPlayerEvent$Type;

    iget-object v2, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_onPauseAtPeriodEndEventListener:Lcom/adobe/mediacore/PauseAtPeriodEndListener;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/mediacore/VideoEngineDispatcher;->removeEventListener(Lcom/adobe/mediacore/MediaPlayerEvent$Type;Lcom/adobe/mediacore/MediaPlayer$EventListener;)V

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$Event;->CUSTOM_AD:Lcom/adobe/mediacore/MediaPlayer$Event;

    iget-object v2, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_customAdEventListener:Lcom/adobe/mediacore/MediaPlayer$CustomAdEventListener;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/mediacore/VideoEngineDispatcher;->removeEventListener(Lcom/adobe/mediacore/MediaPlayer$Event;Lcom/adobe/mediacore/MediaPlayer$EventListener;)V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentTime:J

    iput v4, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I

    iput-boolean v4, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_complete:Z

    iput-boolean v4, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_isCustomAdPlaying:Z

    iput-object v3, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_context:Landroid/content/Context;

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    if-eqz v0, :cond_0

    iput-object v3, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    :cond_0
    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_customAdView:Lcom/adobe/mediacore/CustomAdView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_customAdView:Lcom/adobe/mediacore/CustomAdView;

    invoke-virtual {v0}, Lcom/adobe/mediacore/CustomAdView;->reset()V

    iput-object v3, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_customAdView:Lcom/adobe/mediacore/CustomAdView;

    :cond_1
    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_handler:Landroid/os/Handler;

    if-eqz v0, :cond_2

    iput-object v3, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_handler:Landroid/os/Handler;

    :cond_2
    return-void
.end method

.method public setCurrentTime(J)V
    .locals 11

    const/4 v1, 0x0

    iput-wide p1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentTime:J

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineAdapter:Lcom/adobe/mediacore/VideoEngineAdapter;

    invoke-virtual {v0}, Lcom/adobe/mediacore/VideoEngineAdapter;->getTimeline()Lcom/adobe/mediacore/VideoEngineTimeline;

    move-result-object v0

    iget-wide v2, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentTime:J

    invoke-virtual {v0, v2, v3, v1}, Lcom/adobe/mediacore/VideoEngineTimeline;->getAdForTime(JZ)Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v2

    iget-wide v4, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentTime:J

    const-wide/16 v6, 0x7d0

    invoke-virtual {v0, v4, v5, v6, v7}, Lcom/adobe/mediacore/VideoEngineTimeline;->getAdBreakForTime(JJ)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    move-result-object v0

    if-eqz v2, :cond_1

    if-eqz v0, :cond_1

    invoke-direct {p0, v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->setAdBreak(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z

    move-result v3

    invoke-direct {p0, v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->containCustomAdOnly(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z

    move-result v4

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->getTime()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v0, v6, v8

    if-gtz v0, :cond_2

    const/4 v0, 0x1

    :goto_0
    if-eqz v3, :cond_1

    if-nez v4, :cond_0

    if-eqz v0, :cond_1

    :cond_0
    iput v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I

    invoke-direct {p0, v2, v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->playCustomAd(Lcom/adobe/mediacore/timeline/advertising/Ad;Z)V

    :cond_1
    return-void

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public setStartTimeOfSeekOrTrickPlay(J)V
    .locals 1

    iput-wide p1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_startTimeOfSeekOrTrickPlay:J

    return-void
.end method

.method updateVideoEngineAdapter(Lcom/adobe/mediacore/VideoEngineAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineAdapter:Lcom/adobe/mediacore/VideoEngineAdapter;

    return-void
.end method
