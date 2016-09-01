.class public final Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$2;,
        Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeHeartbeatDelegate;,
        Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeHeartbeatPluginDelegate;,
        Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeAnalyticsPluginDelegate;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String;

.field private static final _logger:Lcom/adobe/mediacore/logging/Logger;


# instance fields
.field private _aaPlugin:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

.field private _ahPlugin:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

.field private _context:Landroid/content/Context;

.field private _extensions:Ljava/util/List;

.field private _heartbeat:Lcom/adobe/primetime/va/Heartbeat;

.field private _heartbeatConfigured:Z

.field private _mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

.field private final _playbackListener:Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

.field private _playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

.field private _playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[PSDK-VA]::"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->LOG_TAG:Ljava/lang/String;

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->LOG_TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/adobe/mediacore/logging/Log;->getLogger(Ljava/lang/String;)Lcom/adobe/mediacore/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_logger:Lcom/adobe/mediacore/logging/Logger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;-><init>(Landroid/content/Context;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;

    invoke-direct {v0, p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$1;-><init>(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)V

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playbackListener:Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Context instance cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_context:Landroid/content/Context;

    iput-object p2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_extensions:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200()Lcom/adobe/mediacore/logging/Logger;
    .locals 1

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_logger:Lcom/adobe/mediacore/logging/Logger;

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)V
    .locals 0

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->configure()V

    return-void
.end method

.method static synthetic access$400(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    return-object v0
.end method

.method private configure()V
    .locals 3

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_heartbeatConfigured:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getVideoAnalyticsMetadata(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsMetadata;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->configureAdobeAnalyticsPlugin()V

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->configureAdobeHearbeatPlugin()V

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->configureVideoPlayerPlugin()V

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->configureHeartbeat()V

    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_heartbeatConfigured:Z

    :cond_0
    return-void

    :cond_1
    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#configure"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "VideoHeartbeat error: VideoAnalyticsMetadata not set on player item"

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private configureAdobeAnalyticsPlugin()V
    .locals 2

    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    new-instance v1, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeAnalyticsPluginDelegate;

    invoke-direct {v1, p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeAnalyticsPluginDelegate;-><init>(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)V

    invoke-direct {v0, v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginDelegate;)V

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_aaPlugin:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;

    invoke-direct {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;-><init>()V

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getChannel(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;->channel:Ljava/lang/String;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getDebugLoggingSetting(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;->debugLogging:Z

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_aaPlugin:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    invoke-virtual {v1, v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->configure(Lcom/adobe/primetime/core/plugin/IPluginConfig;)V

    return-void
.end method

.method private configureAdobeHearbeatPlugin()V
    .locals 3

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    new-instance v1, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeHeartbeatPluginDelegate;

    invoke-direct {v1, p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeHeartbeatPluginDelegate;-><init>(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)V

    invoke-direct {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginDelegate;)V

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_ahPlugin:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getHeartbeatTrackingServer(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v2}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v2

    invoke-static {v2}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getHeartbeatPublisher(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getAppVersion(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->sdk:Ljava/lang/String;

    invoke-static {}, Lcom/adobe/mediacore/Version;->getVersion()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->__psdkVersion:Ljava/lang/String;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->__isPrimetime:Z

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getDebugLoggingSetting(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->debugLogging:Z

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getQuietModeSetting(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->quietMode:Z

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getUseSSLSetting(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->ssl:Z

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_ahPlugin:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    invoke-virtual {v1, v0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->configure(Lcom/adobe/primetime/core/plugin/IPluginConfig;)V

    return-void
.end method

.method private configureHeartbeat()V
    .locals 3

    new-instance v0, Lcom/adobe/primetime/va/Heartbeat;

    new-instance v1, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeHeartbeatDelegate;

    invoke-direct {v1, p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeHeartbeatDelegate;-><init>(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)V

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->getPlugins()Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/Heartbeat;-><init>(Lcom/adobe/primetime/va/HeartbeatDelegate;Ljava/util/List;)V

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_heartbeat:Lcom/adobe/primetime/va/Heartbeat;

    new-instance v0, Lcom/adobe/primetime/va/HeartbeatConfig;

    invoke-direct {v0}, Lcom/adobe/primetime/va/HeartbeatConfig;-><init>()V

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getDebugLoggingSetting(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, v0, Lcom/adobe/primetime/va/HeartbeatConfig;->debugLogging:Z

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_heartbeat:Lcom/adobe/primetime/va/Heartbeat;

    invoke-virtual {v1, v0}, Lcom/adobe/primetime/va/Heartbeat;->configure(Lcom/adobe/primetime/va/HeartbeatConfig;)V

    return-void
.end method

.method private configureVideoPlayerPlugin()V
    .locals 3

    new-instance v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_context:Landroid/content/Context;

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;-><init>(Landroid/content/Context;Lcom/adobe/mediacore/MediaPlayer;)V

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    new-instance v0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    invoke-direct {v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginDelegate;)V

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->setPlayerPlugin(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_aaPlugin:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->setAnalyticsPlugin(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    new-instance v0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginConfig;

    invoke-direct {v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginConfig;-><init>()V

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKPlayerUtils;->getDebugLoggingSetting(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, v0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginConfig;->debugLogging:Z

    iget-object v1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    invoke-virtual {v1, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->configure(Lcom/adobe/primetime/core/plugin/IPluginConfig;)V

    return-void
.end method

.method private getPlugins()Ljava/util/List;
    .locals 4

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_aaPlugin:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_aaPlugin:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_ahPlugin:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_extensions:Ljava/util/List;

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_extensions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_2

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_extensions:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsExtension;

    iget-object v3, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v3}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsExtension;->getExtension(Lcom/adobe/mediacore/MediaPlayerItem;)Lcom/adobe/primetime/core/plugin/IPlugin;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_2
    return-object v2
.end method


# virtual methods
.method public attachMediaPlayer(Lcom/adobe/mediacore/MediaPlayer;)V
    .locals 3

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The provided media player cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#attachMediaPlayer"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Attach mediaplayer."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->detachMediaPlayer()V

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$Event;->PLAYBACK:Lcom/adobe/mediacore/MediaPlayer$Event;

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playbackListener:Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/MediaPlayer;->addEventListener(Lcom/adobe/mediacore/MediaPlayer$Event;Lcom/adobe/mediacore/MediaPlayer$EventListener;)V

    invoke-direct {p0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->configure()V

    return-void
.end method

.method public detachMediaPlayer()V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#detachMediaPlayer"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Detach mediaplayer."

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$Event;->PLAYBACK:Lcom/adobe/mediacore/MediaPlayer$Event;

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playbackListener:Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/MediaPlayer;->removeEventListener(Lcom/adobe/mediacore/MediaPlayer$Event;Lcom/adobe/mediacore/MediaPlayer$EventListener;)V

    :cond_0
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    invoke-virtual {v0}, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;->endSession()V

    iput-object v3, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerWrapper:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsPSDKWrapper;

    :cond_1
    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_heartbeat:Lcom/adobe/primetime/va/Heartbeat;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_heartbeat:Lcom/adobe/primetime/va/Heartbeat;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/Heartbeat;->destroy()V

    iput-object v3, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_heartbeat:Lcom/adobe/primetime/va/Heartbeat;

    :cond_2
    iput-object v3, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_playerPlugin:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;

    iput-object v3, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_ahPlugin:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    iput-object v3, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_aaPlugin:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    iput-object v3, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;->_heartbeatConfigured:Z

    return-void
.end method
