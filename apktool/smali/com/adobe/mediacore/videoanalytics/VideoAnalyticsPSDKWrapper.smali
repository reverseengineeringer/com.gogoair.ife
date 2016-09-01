.class public Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
.super Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginDelegate;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$6;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String;

.field private static final UDPATE_TIMER_PERIOD:J = 0x1f4L

.field private static final _logger:Lcom/adobe/mediacore/logging/Logger;


# instance fields
.field private _adBreakIndex:Ljava/lang/Long;

.field private _adBreakInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;

.field private _adIndex:Ljava/lang/Long;

.field private _adInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;

.field private _analyticsPlugin:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

.field private _bitrate:Ljava/lang/Long;

.field private _chapterBoundaryOffset:Ljava/lang/Long;

.field private _chapterInfo:Lcom/adobe/primetime/va/plugins/videoplayer/ChapterInfo;

.field private _chapters:Ljava/util/List;

.field private _currentChapter:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;

.field private _currentTime:Ljava/lang/Double;

.field private _customChaptersSet:Ljava/lang/Boolean;

.field private _defaultChaptersSet:Ljava/lang/Boolean;

.field private _handler:Landroid/os/Handler;

.field private _inAd:Ljava/lang/Boolean;

.field private _internalTimer:Ljava/lang/Runnable;

.field private _internalTimerRunning:Ljava/lang/Boolean;

.field private _isContentLoaded:Ljava/lang/Boolean;

.field private _isSeeking:Ljava/lang/Boolean;

.field private _player:Lcom/adobe/mediacore/MediaPlayer;

.field private _playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

.field private _previousState:Lcom/adobe/mediacore/MediaPlayer$PlayerState;

.field private _previousTime:Ljava/lang/Double;

.field private _qosProvider:Lcom/adobe/mediacore/qos/QOSProvider;

.field private _shouldStopInternalTimer:Ljava/lang/Boolean;

.field private _videoInfo:Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;

.field private adPlaybackEventListener:Lcom/adobe/mediacore/MediaPlayer$AdPlaybackEventListener;

.field private final onVideoComplete:Lcom/adobe/primetime/core/ICallback;

.field private playbackEventListener:Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

.field private qosEventListener:Lcom/adobe/mediacore/MediaPlayer$QOSEventListener;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[PSDK-VA]::"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/adobe/mediacore/logging/Log;->getLogger(Ljava/lang/String;)Lcom/adobe/mediacore/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/adobe/mediacore/MediaPlayer;)V
    .locals 3

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginDelegate;-><init>()V

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_shouldStopInternalTimer:Ljava/lang/Boolean;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_internalTimerRunning:Ljava/lang/Boolean;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isContentLoaded:Ljava/lang/Boolean;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isSeeking:Ljava/lang/Boolean;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_customChaptersSet:Ljava/lang/Boolean;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_defaultChaptersSet:Ljava/lang/Boolean;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_inAd:Ljava/lang/Boolean;

    const-wide/16 v0, 0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterBoundaryOffset:Ljava/lang/Long;

    const-wide/16 v0, -0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_bitrate:Ljava/lang/Long;

    new-instance v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$2;

    invoke-direct {v0, p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$2;-><init>(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->onVideoComplete:Lcom/adobe/primetime/core/ICallback;

    new-instance v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;

    invoke-direct {v0, p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$3;-><init>(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->playbackEventListener:Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    new-instance v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;

    invoke-direct {v0, p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$4;-><init>(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->qosEventListener:Lcom/adobe/mediacore/MediaPlayer$QOSEventListener;

    new-instance v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;

    invoke-direct {v0, p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$5;-><init>(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->adPlaybackEventListener:Lcom/adobe/mediacore/MediaPlayer$AdPlaybackEventListener;

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Context instance cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    if-nez p2, :cond_1

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#PlayerPlugin"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "The provided media player cannot be null."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iput-object p2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-direct {p0, p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->attachPlayerToQosProvider(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->setUpTimer()V

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->addEventListeners()V

    return-void
.end method

.method static synthetic access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isContentLoaded:Ljava/lang/Boolean;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Double;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_previousTime:Ljava/lang/Double;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentChapter:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;

    return-object v0
.end method

.method static synthetic access$102(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Double;)Ljava/lang/Double;
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_previousTime:Ljava/lang/Double;

    return-object p1
.end method

.method static synthetic access$1100()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1200()Lcom/adobe/mediacore/logging/Logger;
    .locals 1

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;J)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->updateCurrentChapter(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;J)V

    return-void
.end method

.method static synthetic access$1400(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_analyticsPlugin:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/mediacore/qos/QOSProvider;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_qosProvider:Lcom/adobe/mediacore/qos/QOSProvider;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Long;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_bitrate:Ljava/lang/Long;

    return-object v0
.end method

.method static synthetic access$1702(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_bitrate:Ljava/lang/Long;

    return-object p1
.end method

.method static synthetic access$1800(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V
    .locals 0

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->handleStatusPlaying()V

    return-void
.end method

.method static synthetic access$1900(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_shouldStopInternalTimer:Ljava/lang/Boolean;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Double;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_internalTimer:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$202(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Double;)Ljava/lang/Double;
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;

    return-object p1
.end method

.method static synthetic access$2100(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V
    .locals 0

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->beginTracking()V

    return-void
.end method

.method static synthetic access$2300(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/mediacore/MediaPlayer$PlayerState;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_previousState:Lcom/adobe/mediacore/MediaPlayer$PlayerState;

    return-object v0
.end method

.method static synthetic access$2302(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Lcom/adobe/mediacore/MediaPlayer$PlayerState;)Lcom/adobe/mediacore/MediaPlayer$PlayerState;
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_previousState:Lcom/adobe/mediacore/MediaPlayer$PlayerState;

    return-object p1
.end method

.method static synthetic access$2400(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/core/ICallback;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->onVideoComplete:Lcom/adobe/primetime/core/ICallback;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V
    .locals 0

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->closeVideo()V

    return-void
.end method

.method static synthetic access$2600(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Lcom/adobe/mediacore/MediaPlayerNotification;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->onMediaError(Lcom/adobe/mediacore/MediaPlayerNotification;)V

    return-void
.end method

.method static synthetic access$2700(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V
    .locals 0

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->resetCurrentChapter()V

    return-void
.end method

.method static synthetic access$2800(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Long;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adBreakIndex:Ljava/lang/Long;

    return-object v0
.end method

.method static synthetic access$2802(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adBreakIndex:Ljava/lang/Long;

    return-object p1
.end method

.method static synthetic access$2900(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Long;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adIndex:Ljava/lang/Long;

    return-object v0
.end method

.method static synthetic access$2902(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adIndex:Ljava/lang/Long;

    return-object p1
.end method

.method static synthetic access$300(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/mediacore/MediaPlayer;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$3000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adBreakInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;

    return-object v0
.end method

.method static synthetic access$3002(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;)Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adBreakInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;

    return-object p1
.end method

.method static synthetic access$3100(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;

    return-object v0
.end method

.method static synthetic access$3102(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;)Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;

    return-object p1
.end method

.method static synthetic access$400(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_videoInfo:Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Double;
    .locals 1

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->playhead()Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/util/List;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapters:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$700(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isSeeking:Ljava/lang/Boolean;

    return-object v0
.end method

.method static synthetic access$702(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isSeeking:Ljava/lang/Boolean;

    return-object p1
.end method

.method static synthetic access$800(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_inAd:Ljava/lang/Boolean;

    return-object v0
.end method

.method static synthetic access$802(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_inAd:Ljava/lang/Boolean;

    return-object p1
.end method

.method static synthetic access$900(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)Ljava/lang/Long;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterBoundaryOffset:Ljava/lang/Long;

    return-object v0
.end method

.method private addEventListeners()V
    .locals 3

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$Event;->AD_PLAYBACK:Lcom/adobe/mediacore/MediaPlayer$Event;

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->adPlaybackEventListener:Lcom/adobe/mediacore/MediaPlayer$AdPlaybackEventListener;

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/MediaPlayer;->addEventListener(Lcom/adobe/mediacore/MediaPlayer$Event;Lcom/adobe/mediacore/MediaPlayer$EventListener;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$Event;->QOS:Lcom/adobe/mediacore/MediaPlayer$Event;

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->qosEventListener:Lcom/adobe/mediacore/MediaPlayer$QOSEventListener;

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/MediaPlayer;->addEventListener(Lcom/adobe/mediacore/MediaPlayer$Event;Lcom/adobe/mediacore/MediaPlayer$EventListener;)V

    :cond_0
    return-void
.end method

.method private attachPlayerToQosProvider(Landroid/content/Context;)V
    .locals 3

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#attachMediaPlayer"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Attach mediaplayer."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_qosProvider:Lcom/adobe/mediacore/qos/QOSProvider;

    if-nez v0, :cond_0

    new-instance v0, Lcom/adobe/mediacore/qos/QOSProvider;

    invoke-direct {v0, p1}, Lcom/adobe/mediacore/qos/QOSProvider;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_qosProvider:Lcom/adobe/mediacore/qos/QOSProvider;

    :cond_0
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_qosProvider:Lcom/adobe/mediacore/qos/QOSProvider;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/qos/QOSProvider;->attachMediaPlayer(Lcom/adobe/mediacore/MediaPlayer;)V

    return-void
.end method

.method private beginTracking()V
    .locals 4

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#beginTracking"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Open video."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isContentLoaded:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adBreakIndex:Ljava/lang/Long;

    new-instance v0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;

    invoke-direct {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;-><init>()V

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_videoInfo:Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_videoInfo:Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoId(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;->id:Ljava/lang/String;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_videoInfo:Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoName(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;->name:Ljava/lang/String;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_videoInfo:Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getPlayerName(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;->playerName:Ljava/lang/String;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_videoInfo:Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getMainAssetDuration(Lcom/adobe/mediacore/MediaPlayer;)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;->length:Ljava/lang/Double;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_videoInfo:Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->playhead()Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;->playhead:Ljava/lang/Double;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_videoInfo:Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayerItem;->isLive()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "live"

    :goto_1
    iput-object v0, v1, Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;->streamType:Ljava/lang/String;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isContentLoaded:Ljava/lang/Boolean;

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isSeeking:Ljava/lang/Boolean;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_analyticsPlugin:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->setVideoMetadata(Ljava/util/Map;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->trackVideoLoad()V

    goto/16 :goto_0

    :cond_1
    const-string v0, "vod"

    goto :goto_1
.end method

.method private closeVideo()V
    .locals 4

    const/4 v3, 0x0

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#closeVideo"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Close video."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isContentLoaded:Ljava/lang/Boolean;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_customChaptersSet:Ljava/lang/Boolean;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isSeeking:Ljava/lang/Boolean;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->trackVideoUnload()V

    return-void
.end method

.method private createInternalTimer()V
    .locals 1

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_handler:Landroid/os/Handler;

    new-instance v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;

    invoke-direct {v0, p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper$1;-><init>(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;)V

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_internalTimer:Ljava/lang/Runnable;

    return-void
.end method

.method private detachPlayerFromQoSProvider()V
    .locals 3

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#detachMediaPlayer"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Detach mediaplayer."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_qosProvider:Lcom/adobe/mediacore/qos/QOSProvider;

    invoke-virtual {v0}, Lcom/adobe/mediacore/qos/QOSProvider;->detachMediaPlayer()V

    :cond_0
    return-void
.end method

.method private handleStatusPlaying()V
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getChapterTrackingEnabled(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->updateDefaultChapters()V

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->updateCustomChapters()V

    :cond_0
    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->beginTracking()V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isSeeking:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->trackPlay()V

    :cond_1
    return-void
.end method

.method private onMediaError(Lcom/adobe/mediacore/MediaPlayerNotification;)V
    .locals 4

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#onMediaError"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MediaplayerNotification: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/mediacore/MediaPlayerNotification;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/adobe/mediacore/MediaPlayerNotification;->getCode()Lcom/adobe/mediacore/MediaPlayerNotification$NotificationCode;

    move-result-object v1

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayerNotification$NotificationCode;->getCode()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/adobe/mediacore/MediaPlayerNotification;->getInnerNotification()Lcom/adobe/mediacore/MediaPlayerNotification;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/adobe/mediacore/MediaPlayerNotification;->getCode()Lcom/adobe/mediacore/MediaPlayerNotification$NotificationCode;

    move-result-object v2

    invoke-interface {v2}, Lcom/adobe/mediacore/MediaPlayerNotification$NotificationCode;->getCode()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/adobe/mediacore/MediaPlayerNotification;->getInnerNotification()Lcom/adobe/mediacore/MediaPlayerNotification;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->trackVideoPlayerError(Ljava/lang/String;)V

    return-void
.end method

.method private playhead()Ljava/lang/Double;
    .locals 4

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_isContentLoaded:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#_playhead()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "playhead="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;

    :goto_0
    return-object v0

    :cond_0
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto :goto_0
.end method

.method private removeEventListeners()V
    .locals 3

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$Event;->AD_PLAYBACK:Lcom/adobe/mediacore/MediaPlayer$Event;

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->adPlaybackEventListener:Lcom/adobe/mediacore/MediaPlayer$AdPlaybackEventListener;

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/MediaPlayer;->removeEventListener(Lcom/adobe/mediacore/MediaPlayer$Event;Lcom/adobe/mediacore/MediaPlayer$EventListener;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$Event;->QOS:Lcom/adobe/mediacore/MediaPlayer$Event;

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->qosEventListener:Lcom/adobe/mediacore/MediaPlayer$QOSEventListener;

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/MediaPlayer;->removeEventListener(Lcom/adobe/mediacore/MediaPlayer$Event;Lcom/adobe/mediacore/MediaPlayer$EventListener;)V

    :cond_0
    return-void
.end method

.method private resetCurrentChapter()V
    .locals 12

    const-wide/16 v10, -0x1

    const/4 v2, 0x0

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "#resetCurrentChapter"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "Reset current chapter."

    invoke-interface {v0, v1, v3}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapters:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    const-wide/16 v4, 0x0

    cmpl-double v0, v0, v4

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getPlaybackRange()Lcom/adobe/mediacore/utils/TimeRange;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/mediacore/utils/TimeRange;->getEnd()J

    move-result-wide v4

    invoke-interface {v0, v4, v5}, Lcom/adobe/mediacore/MediaPlayer;->convertToLocalTime(J)J

    move-result-wide v0

    long-to-double v0, v0

    sget-object v3, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->PSDK_TIME_SCALE:Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    div-double/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    iget-object v3, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterBoundaryOffset:Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    long-to-double v6, v6

    sub-double/2addr v0, v6

    cmpl-double v0, v4, v0

    if-lez v0, :cond_1

    invoke-direct {p0, v2, v10, v11}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->updateCurrentChapter(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;J)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const/4 v0, 0x0

    move v1, v0

    :goto_1
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_3

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapters:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;

    iget-object v3, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->getStartTime()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    iget-object v3, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterBoundaryOffset:Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    long-to-double v8, v8

    add-double/2addr v6, v8

    cmpl-double v3, v4, v6

    if-lez v3, :cond_2

    iget-object v3, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentTime:Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->getEndTime()Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    iget-object v3, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterBoundaryOffset:Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    long-to-double v8, v8

    sub-double/2addr v6, v8

    cmpg-double v3, v4, v6

    if-gez v3, :cond_2

    :goto_2
    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentChapter:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;

    if-eq v0, v1, :cond_0

    invoke-direct {p0, v2, v10, v11}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->updateCurrentChapter(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;J)V

    goto :goto_0

    :cond_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    :cond_3
    move-object v0, v2

    goto :goto_2
.end method

.method private setUpTimer()V
    .locals 0

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->createInternalTimer()V

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->startInternalTimer()V

    return-void
.end method

.method private startInternalTimer()V
    .locals 4

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#startInternalTimer"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Start timer."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_internalTimerRunning:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_shouldStopInternalTimer:Ljava/lang/Boolean;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_internalTimerRunning:Ljava/lang/Boolean;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_internalTimer:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method private stopInternalTimer()V
    .locals 3

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#stopInternalTimer"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Stop timer."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_shouldStopInternalTimer:Ljava/lang/Boolean;

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_internalTimerRunning:Ljava/lang/Boolean;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_internalTimer:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method private updateCurrentChapter(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;J)V
    .locals 6

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_currentChapter:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;

    new-instance v0, Lcom/adobe/primetime/va/plugins/videoplayer/ChapterInfo;

    invoke-direct {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/ChapterInfo;-><init>()V

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterInfo:Lcom/adobe/primetime/va/plugins/videoplayer/ChapterInfo;

    if-eqz p1, :cond_0

    const-wide/16 v0, -0x1

    cmp-long v0, p2, v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterInfo:Lcom/adobe/primetime/va/plugins/videoplayer/ChapterInfo;

    invoke-virtual {p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/ChapterInfo;->name:Ljava/lang/String;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterInfo:Lcom/adobe/primetime/va/plugins/videoplayer/ChapterInfo;

    invoke-virtual {p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->getEndTime()Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-virtual {p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->getStartTime()Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    sub-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/ChapterInfo;->length:Ljava/lang/Double;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterInfo:Lcom/adobe/primetime/va/plugins/videoplayer/ChapterInfo;

    invoke-virtual {p1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->getStartTime()Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/ChapterInfo;->startTime:Ljava/lang/Double;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterInfo:Lcom/adobe/primetime/va/plugins/videoplayer/ChapterInfo;

    const-wide/16 v2, 0x1

    add-long/2addr v2, p2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/ChapterInfo;->position:Ljava/lang/Long;

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterInfo:Lcom/adobe/primetime/va/plugins/videoplayer/ChapterInfo;

    goto :goto_0
.end method

.method private updateCustomChapters()V
    .locals 3

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#updateChapterMetadata"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Update chapter metadata"

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_customChaptersSet:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getChapters(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#updateChapterMetadata"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Override default chapters."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getChapters(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapters:Ljava/util/List;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_customChaptersSet:Ljava/lang/Boolean;

    :cond_0
    return-void
.end method

.method private updateDefaultChapters()V
    .locals 14

    const-wide/16 v12, 0x0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_customChaptersSet:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_defaultChaptersSet:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapters:Ljava/util/List;

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getPlaybackRange()Lcom/adobe/mediacore/utils/TimeRange;

    move-result-object v3

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-virtual {v3}, Lcom/adobe/mediacore/utils/TimeRange;->getBegin()J

    move-result-wide v4

    invoke-interface {v0, v4, v5}, Lcom/adobe/mediacore/MediaPlayer;->convertToLocalTime(J)J

    move-result-wide v0

    long-to-double v0, v0

    sget-object v4, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->PSDK_TIME_SCALE:Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    div-double/2addr v0, v4

    iget-object v4, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-virtual {v3}, Lcom/adobe/mediacore/utils/TimeRange;->getEnd()J

    move-result-wide v6

    invoke-interface {v4, v6, v7}, Lcom/adobe/mediacore/MediaPlayer;->convertToLocalTime(J)J

    move-result-wide v4

    long-to-double v4, v4

    sget-object v3, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->PSDK_TIME_SCALE:Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    div-double v6, v4, v6

    iget-object v3, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v3}, Lcom/adobe/mediacore/MediaPlayer;->getTimeline()Lcom/adobe/mediacore/timeline/Timeline;

    move-result-object v3

    invoke-interface {v3}, Lcom/adobe/mediacore/timeline/Timeline;->timelineMarkers()Ljava/util/Iterator;

    move-result-object v5

    move v4, v2

    move-wide v2, v0

    :cond_2
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/timeline/TimelineMarker;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_player:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v0}, Lcom/adobe/mediacore/timeline/TimelineMarker;->getTime()J

    move-result-wide v8

    invoke-interface {v1, v8, v9}, Lcom/adobe/mediacore/MediaPlayer;->convertToLocalTime(J)J

    move-result-wide v0

    long-to-double v0, v0

    sget-object v8, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->PSDK_TIME_SCALE:Ljava/lang/Double;

    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    div-double/2addr v0, v8

    sub-double v8, v0, v2

    cmpl-double v8, v8, v12

    if-eqz v8, :cond_2

    new-instance v8, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;

    invoke-direct {v8, v2, v3, v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;-><init>(DD)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "chapter_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v2, v4, 0x1

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v3}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->setName(Ljava/lang/String;)V

    sget-object v3, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v9, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v9, "#extractDefaultChapters"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "New chapter: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v8}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v3, v4, v9}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapters:Ljava/util/List;

    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v4, v2

    move-wide v2, v0

    goto :goto_1

    :cond_3
    sub-double v0, v2, v6

    cmpl-double v0, v0, v12

    if-eqz v0, :cond_4

    sub-double v0, v6, v2

    iget-object v5, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterBoundaryOffset:Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    long-to-double v8, v8

    cmpl-double v0, v0, v8

    if-ltz v0, :cond_4

    new-instance v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;

    invoke-direct {v0, v2, v3, v6, v7}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;-><init>(DD)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "chapter_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int/lit8 v2, v4, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->setName(Ljava/lang/String;)V

    sget-object v1, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "#extractDefaultChapters"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "New chapter: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapters:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_defaultChaptersSet:Ljava/lang/Boolean;

    goto/16 :goto_0
.end method


# virtual methods
.method public endSession()V
    .locals 0

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->closeVideo()V

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->stopInternalTimer()V

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->removeEventListeners()V

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->detachPlayerFromQoSProvider()V

    return-void
.end method

.method public getAdBreakInfo()Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adBreakInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdBreakInfo;

    return-object v0
.end method

.method public getAdInfo()Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_adInfo:Lcom/adobe/primetime/va/plugins/videoplayer/AdInfo;

    return-object v0
.end method

.method public getChapterInfo()Lcom/adobe/primetime/va/plugins/videoplayer/ChapterInfo;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_chapterInfo:Lcom/adobe/primetime/va/plugins/videoplayer/ChapterInfo;

    return-object v0
.end method

.method public getPlaybackEventListener()Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->playbackEventListener:Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    return-object v0
.end method

.method public getQoSInfo()Lcom/adobe/primetime/va/plugins/videoplayer/QoSInfo;
    .locals 5

    new-instance v0, Lcom/adobe/primetime/va/plugins/videoplayer/QoSInfo;

    invoke-direct {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/QoSInfo;-><init>()V

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_qosProvider:Lcom/adobe/mediacore/qos/QOSProvider;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_qosProvider:Lcom/adobe/mediacore/qos/QOSProvider;

    invoke-virtual {v1}, Lcom/adobe/mediacore/qos/QOSProvider;->getPlaybackInformation()Lcom/adobe/mediacore/qos/PlaybackInformation;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/mediacore/qos/PlaybackInformation;->getBitrate()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/QoSInfo;->bitrate:Ljava/lang/Long;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_qosProvider:Lcom/adobe/mediacore/qos/QOSProvider;

    invoke-virtual {v1}, Lcom/adobe/mediacore/qos/QOSProvider;->getPlaybackInformation()Lcom/adobe/mediacore/qos/PlaybackInformation;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/mediacore/qos/PlaybackInformation;->getFrameRate()F

    move-result v1

    float-to-double v2, v1

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/QoSInfo;->fps:Ljava/lang/Double;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_qosProvider:Lcom/adobe/mediacore/qos/QOSProvider;

    invoke-virtual {v1}, Lcom/adobe/mediacore/qos/QOSProvider;->getPlaybackInformation()Lcom/adobe/mediacore/qos/PlaybackInformation;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/mediacore/qos/PlaybackInformation;->getDroppedFrameCount()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/QoSInfo;->droppedFrames:Ljava/lang/Long;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_qosProvider:Lcom/adobe/mediacore/qos/QOSProvider;

    invoke-virtual {v1}, Lcom/adobe/mediacore/qos/QOSProvider;->getPlaybackInformation()Lcom/adobe/mediacore/qos/PlaybackInformation;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/mediacore/qos/PlaybackInformation;->getTimeToStart()J

    move-result-wide v2

    long-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/QoSInfo;->startupTime:Ljava/lang/Double;

    :cond_0
    sget-object v1, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "#dataResolver"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Get qos info: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/adobe/primetime/va/plugins/videoplayer/QoSInfo;->bitrate:Ljava/lang/Long;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/adobe/primetime/va/plugins/videoplayer/QoSInfo;->fps:Ljava/lang/Double;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/adobe/primetime/va/plugins/videoplayer/QoSInfo;->droppedFrames:Ljava/lang/Long;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/adobe/primetime/va/plugins/videoplayer/QoSInfo;->startupTime:Ljava/lang/Double;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public getVideoInfo()Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_videoInfo:Lcom/adobe/primetime/va/plugins/videoplayer/VideoInfo;

    return-object v0
.end method

.method public setAnalyticsPlugin(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_analyticsPlugin:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    return-void
.end method

.method public setPlayerPlugin(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    return-void
.end method
