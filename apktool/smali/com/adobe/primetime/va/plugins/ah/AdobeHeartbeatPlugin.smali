.class public Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;
.super Lcom/adobe/primetime/core/plugin/BasePlugin;
.source "SourceFile"


# static fields
.field private static final AA_AD_START:Ljava/lang/String; = "sc_ad_start"

.field private static final AA_START:Ljava/lang/String; = "aa_start"

.field private static final ADOBE_ANALYTICS_PLUGIN:Ljava/lang/String; = "adobe-analytics"

.field private static final ADOBE_HEARTBEAT_PLUGIN:Ljava/lang/String; = "adobe-heartbeat"

.field private static final AD_COMPLETE:Ljava/lang/String; = "ad_complete"

.field private static final AD_START:Ljava/lang/String; = "ad_start"

.field private static final BITRATE_CHANGE:Ljava/lang/String; = "bitrate_change"

.field private static final BUFFER_COMPLETE:Ljava/lang/String; = "buffer_complete"

.field private static final BUFFER_START:Ljava/lang/String; = "buffer_start"

.field private static final CHAPTER_COMPLETE:Ljava/lang/String; = "chapter_complete"

.field private static final CHAPTER_START:Ljava/lang/String; = "chapter_start"

.field private static final CLOCK_SERVICE:Ljava/lang/String; = "service.clock"

.field private static final CMD_DISABLE_REPORTING_TIMER:Ljava/lang/String; = "clock:reporting.pause"

.field private static final CMD_ENABLE_CHECK_STATUS_TIMER:Ljava/lang/String; = "clock:check_status.resume"

.field private static final ERROR:Ljava/lang/String; = "error"

.field private static final ERROR_SOURCE_HEARTBEAT:Ljava/lang/String; = "sourceErrorHeartbeat"

.field private static EVENT_API_AA_AD_START:Ljava/lang/String; = null

.field private static EVENT_API_AA_START:Ljava/lang/String; = null

.field private static EVENT_API_AD_COMPLETE:Ljava/lang/String; = null

.field private static EVENT_API_AD_START:Ljava/lang/String; = null

.field private static EVENT_API_BITRATE_CHANGE:Ljava/lang/String; = null

.field private static EVENT_API_BUFFER_START:Ljava/lang/String; = null

.field private static EVENT_API_CHAPTER_COMPLETE:Ljava/lang/String; = null

.field private static EVENT_API_CHAPTER_START:Ljava/lang/String; = null

.field private static EVENT_API_CONFIG:Ljava/lang/String; = null

.field private static EVENT_API_PAUSE:Ljava/lang/String; = null

.field private static EVENT_API_PLAY:Ljava/lang/String; = null

.field private static EVENT_API_QUANTUM_END:Ljava/lang/String; = null

.field private static EVENT_API_SEEK_COMPLETE:Ljava/lang/String; = null

.field private static EVENT_API_SEEK_START:Ljava/lang/String; = null

.field private static EVENT_API_TRACK_ERROR:Ljava/lang/String; = null

.field private static EVENT_API_TRACK_INTERNAL_ERROR:Ljava/lang/String; = null

.field private static EVENT_API_VIDEO_COMPLETE:Ljava/lang/String; = null

.field private static EVENT_API_VIDEO_LOAD:Ljava/lang/String; = null

.field private static EVENT_API_VIDEO_START:Ljava/lang/String; = null

.field private static EVENT_API_VIDEO_UNLOAD:Ljava/lang/String; = null

.field private static final EVENT_CLOCK_CHECK_STATUS_GET_SETTINGS:Ljava/lang/String; = "clock:check_status.get_settings"

.field private static final HEARTBEAT_CHANNEL:Ljava/lang/String; = "heartbeat-channel"

.field private static final KEY_CHECK_STATUS_SERVER:Ljava/lang/String; = "check_status_server"

.field private static final KEY_ERROR_ID:Ljava/lang/String; = "error_id"

.field private static final KEY_PUBLISHER:Ljava/lang/String; = "publisher"

.field private static final KEY_QUIET_MODE:Ljava/lang/String; = "quiet_mode"

.field private static final KEY_RESET:Ljava/lang/String; = "reset"

.field private static final KEY_SOURCE:Ljava/lang/String; = "source"

.field private static final KEY_SSL:Ljava/lang/String; = "ssl"

.field private static final KEY_TRACKING_SERVER:Ljava/lang/String; = "tracking_server"

.field private static final NAME:Ljava/lang/String; = "adobe-heartbeat"

.field private static final PAUSE:Ljava/lang/String; = "pause"

.field private static final PLAY:Ljava/lang/String; = "play"

.field private static final PLAYER_PLUGIN:Ljava/lang/String; = "player"

.field private static final SEEK_COMPLETE:Ljava/lang/String; = "seek_complete"

.field private static final SEEK_START:Ljava/lang/String; = "seek_start"

.field private static final TIMER_REPORTING:Ljava/lang/String; = "heartbeat.reporting"

.field private static final TIMER_REPORTING_TICK:Ljava/lang/String; = "heartbeat.reporting.tick"

.field private static final TRACK_ERROR:Ljava/lang/String; = "track_error"

.field private static final VIDEO_COMPLETE:Ljava/lang/String; = "video_complete"

.field private static final VIDEO_LOAD:Ljava/lang/String; = "video_load"

.field private static final VIDEO_START:Ljava/lang/String; = "video_start"

.field private static final VIDEO_UNLOAD:Ljava/lang/String; = "video_unload"

.field private static final VIDEO_UNLOADED:Ljava/lang/String; = "video_unloaded"


# instance fields
.field private _channel:Lcom/adobe/primetime/core/radio/Channel;

.field private _clock:Lcom/adobe/primetime/va/plugins/ah/engine/clock/Clock;

.field private _cmdAdComplete:Lcom/adobe/primetime/core/ICallback;

.field private _cmdAdStart:Lcom/adobe/primetime/core/ICallback;

.field private _cmdAnalyticsAdStart:Lcom/adobe/primetime/core/ICallback;

.field private _cmdAnalyticsError:Lcom/adobe/primetime/core/ICallback;

.field private _cmdAnalyticsStart:Lcom/adobe/primetime/core/ICallback;

.field private _cmdBitrateChange:Lcom/adobe/primetime/core/ICallback;

.field private _cmdBufferComplete:Lcom/adobe/primetime/core/ICallback;

.field private _cmdBufferStart:Lcom/adobe/primetime/core/ICallback;

.field private _cmdChapterComplete:Lcom/adobe/primetime/core/ICallback;

.field private _cmdChapterStart:Lcom/adobe/primetime/core/ICallback;

.field private _cmdClockReportingTick:Lcom/adobe/primetime/core/ICallback;

.field private _cmdPause:Lcom/adobe/primetime/core/ICallback;

.field private _cmdPlay:Lcom/adobe/primetime/core/ICallback;

.field private _cmdSeekComplete:Lcom/adobe/primetime/core/ICallback;

.field private _cmdSeekStart:Lcom/adobe/primetime/core/ICallback;

.field private _cmdTrackError:Lcom/adobe/primetime/core/ICallback;

.field private _cmdVideoComplete:Lcom/adobe/primetime/core/ICallback;

.field private _cmdVideoLoad:Lcom/adobe/primetime/core/ICallback;

.field private _cmdVideoStart:Lcom/adobe/primetime/core/ICallback;

.field private _cmdVideoUnload:Lcom/adobe/primetime/core/ICallback;

.field private _config:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;

.field private _context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

.field private _delegate:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginDelegate;

.field private _errorInfo:Lcom/adobe/primetime/va/ErrorInfo;

.field private _filter:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

.field private _isBuffering:Z

.field private _isConfigured:Z

.field private _isPaused:Z

.field private _isSeeking:Z

.field private _isTrackingSessionActive:Z

.field private _network:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

.field private _onError:Lcom/adobe/primetime/core/ICallback;

.field private _radio:Lcom/adobe/primetime/core/radio/Radio;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 86
    const-string v0, "api:aa_start"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_AA_START:Ljava/lang/String;

    .line 87
    const-string v0, "api:aa_ad_start"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_AA_AD_START:Ljava/lang/String;

    .line 88
    const-string v0, "api:config"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_CONFIG:Ljava/lang/String;

    .line 89
    const-string v0, "api:video_load"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_VIDEO_LOAD:Ljava/lang/String;

    .line 90
    const-string v0, "api:video_unload"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_VIDEO_UNLOAD:Ljava/lang/String;

    .line 91
    const-string v0, "api:video_start"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_VIDEO_START:Ljava/lang/String;

    .line 92
    const-string v0, "api:video_complete"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_VIDEO_COMPLETE:Ljava/lang/String;

    .line 93
    const-string v0, "api:ad_start"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_AD_START:Ljava/lang/String;

    .line 94
    const-string v0, "api:ad_complete"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_AD_COMPLETE:Ljava/lang/String;

    .line 95
    const-string v0, "api:play"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_PLAY:Ljava/lang/String;

    .line 96
    const-string v0, "api:pause"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_PAUSE:Ljava/lang/String;

    .line 97
    const-string v0, "api:buffer_start"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_BUFFER_START:Ljava/lang/String;

    .line 98
    const-string v0, "api:seek_start"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_SEEK_START:Ljava/lang/String;

    .line 99
    const-string v0, "api:seek_complete"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_SEEK_COMPLETE:Ljava/lang/String;

    .line 100
    const-string v0, "api:chapter_start"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_CHAPTER_START:Ljava/lang/String;

    .line 101
    const-string v0, "api:chapter_complete"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_CHAPTER_COMPLETE:Ljava/lang/String;

    .line 102
    const-string v0, "api:track_error"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_TRACK_ERROR:Ljava/lang/String;

    .line 103
    const-string v0, "api:track_internal_error"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_TRACK_INTERNAL_ERROR:Ljava/lang/String;

    .line 104
    const-string v0, "api:bitrate_change"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_BITRATE_CHANGE:Ljava/lang/String;

    .line 105
    const-string v0, "api:quantum_end"

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_QUANTUM_END:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginDelegate;)V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 141
    const-string v0, "adobe-heartbeat"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/core/plugin/BasePlugin;-><init>(Ljava/lang/String;)V

    .line 257
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$1;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$1;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdAnalyticsError:Lcom/adobe/primetime/core/ICallback;

    .line 274
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$2;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$2;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdAnalyticsStart:Lcom/adobe/primetime/core/ICallback;

    .line 285
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$3;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$3;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdAnalyticsAdStart:Lcom/adobe/primetime/core/ICallback;

    .line 296
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$4;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$4;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdVideoLoad:Lcom/adobe/primetime/core/ICallback;

    .line 325
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$5;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$5;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdVideoUnload:Lcom/adobe/primetime/core/ICallback;

    .line 343
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$6;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$6;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdVideoStart:Lcom/adobe/primetime/core/ICallback;

    .line 355
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$7;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$7;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdVideoComplete:Lcom/adobe/primetime/core/ICallback;

    .line 366
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$8;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$8;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdPlay:Lcom/adobe/primetime/core/ICallback;

    .line 382
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$9;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$9;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdPause:Lcom/adobe/primetime/core/ICallback;

    .line 397
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$10;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$10;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdAdStart:Lcom/adobe/primetime/core/ICallback;

    .line 412
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$11;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$11;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdAdComplete:Lcom/adobe/primetime/core/ICallback;

    .line 436
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$12;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$12;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdBufferStart:Lcom/adobe/primetime/core/ICallback;

    .line 450
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$13;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$13;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdBufferComplete:Lcom/adobe/primetime/core/ICallback;

    .line 465
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$14;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$14;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdSeekStart:Lcom/adobe/primetime/core/ICallback;

    .line 483
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$15;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$15;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdSeekComplete:Lcom/adobe/primetime/core/ICallback;

    .line 500
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$16;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$16;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdChapterStart:Lcom/adobe/primetime/core/ICallback;

    .line 511
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$17;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$17;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdChapterComplete:Lcom/adobe/primetime/core/ICallback;

    .line 523
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$18;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$18;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdBitrateChange:Lcom/adobe/primetime/core/ICallback;

    .line 535
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$19;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$19;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdTrackError:Lcom/adobe/primetime/core/ICallback;

    .line 547
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$20;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$20;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdClockReportingTick:Lcom/adobe/primetime/core/ICallback;

    .line 563
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$21;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$21;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_onError:Lcom/adobe/primetime/core/ICallback;

    .line 143
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isConfigured:Z

    .line 144
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isTrackingSessionActive:Z

    .line 146
    new-instance v0, Lcom/adobe/primetime/core/radio/Radio;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-direct {v0, v1}, Lcom/adobe/primetime/core/radio/Radio;-><init>(Lcom/adobe/primetime/core/ILogger;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_radio:Lcom/adobe/primetime/core/radio/Radio;

    .line 147
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_radio:Lcom/adobe/primetime/core/radio/Radio;

    const-string v1, "heartbeat-channel"

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/radio/Radio;->channel(Ljava/lang/String;)Lcom/adobe/primetime/core/radio/Channel;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    .line 149
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_delegate:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginDelegate;

    .line 152
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;-><init>(Lcom/adobe/primetime/core/radio/Channel;Lcom/adobe/primetime/core/ILogger;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    .line 153
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;-><init>(Lcom/adobe/primetime/core/radio/Channel;Lcom/adobe/primetime/core/ILogger;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_filter:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    .line 154
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;-><init>(Lcom/adobe/primetime/core/radio/Channel;Lcom/adobe/primetime/core/ILogger;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_network:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    .line 156
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_setupDataResolver()V

    .line 157
    return-void
.end method

.method private _registerBehaviours()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 620
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v1, Lcom/adobe/primetime/core/Trigger;

    const-string v2, "player"

    const-string v3, "video_load"

    invoke-direct {v1, v2, v3}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "handleVideoLoad"

    invoke-virtual {v0, v1, p0, v2, v4}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 622
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v1, Lcom/adobe/primetime/core/Trigger;

    const-string v2, "player"

    const-string v3, "video_unload"

    invoke-direct {v1, v2, v3}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "handleVideoUnload"

    invoke-virtual {v0, v1, p0, v2, v4}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 624
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 625
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.id"

    const-string v4, "videoId"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 626
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.name"

    const-string v4, "videoName"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 627
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.length"

    const-string v4, "videoLength"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 628
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playhead"

    const-string v4, "playhead"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 629
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playerName"

    const-string v4, "playerName"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 630
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.streamType"

    const-string v4, "streamType"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 631
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.fps"

    const-string v4, "fps"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 632
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.droppedFrames"

    const-string v4, "droppedFrames"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 633
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.bitrate"

    const-string v4, "bitrate"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 634
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.startupTime"

    const-string v4, "startupTime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 635
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "rsid"

    const-string v4, "rsid"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 636
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "tracking_server"

    const-string v4, "trackingServer"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 637
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "channel"

    const-string v4, "channel"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 638
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "meta.video.*"

    const-string v4, "metaVideo"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 639
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "ssl"

    const-string v4, "useSsl"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 640
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-heartbeat"

    const-string v3, "publisher"

    const-string v4, "publisher"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 641
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-heartbeat"

    const-string v3, "sdk"

    const-string v4, "sdk"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 642
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-heartbeat"

    const-string v3, "ovp"

    const-string v4, "ovp"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 643
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-heartbeat"

    const-string v3, "version"

    const-string v4, "version"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 644
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-heartbeat"

    const-string v3, "api_level"

    const-string v4, "apiLvl"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 645
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "player"

    const-string v4, "video_start"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleVideoStart"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 647
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 648
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.fps"

    const-string v4, "fps"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 649
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.droppedFrames"

    const-string v4, "droppedFrames"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 650
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.bitrate"

    const-string v4, "bitrate"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 651
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.startupTime"

    const-string v4, "startupTime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 652
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "player"

    const-string v4, "video_complete"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleVideoComplete"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 654
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 655
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playhead"

    const-string v4, "playhead"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 656
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.fps"

    const-string v4, "fps"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 657
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.droppedFrames"

    const-string v4, "droppedFrames"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 658
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.bitrate"

    const-string v4, "bitrate"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 659
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.startupTime"

    const-string v4, "startupTime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 660
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "player"

    const-string v4, "play"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handlePlay"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 662
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 663
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playhead"

    const-string v4, "playhead"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 664
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.fps"

    const-string v4, "fps"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 665
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.droppedFrames"

    const-string v4, "droppedFrames"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 666
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.bitrate"

    const-string v4, "bitrate"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 667
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.startupTime"

    const-string v4, "startupTime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 668
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "player"

    const-string v4, "pause"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handlePause"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 670
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 671
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playhead"

    const-string v4, "playhead"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 672
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "ad.id"

    const-string v4, "adId"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 673
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "ad.name"

    const-string v4, "adName"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 674
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "ad.length"

    const-string v4, "adLength"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 675
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "ad.position"

    const-string v4, "adPosition"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 676
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "pod.name"

    const-string v4, "podName"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 677
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "pod.playerName"

    const-string v4, "podPlayerName"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 678
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "pod.position"

    const-string v4, "podPosition"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 679
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "pod.startTime"

    const-string v4, "podSecond"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 680
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.fps"

    const-string v4, "fps"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 681
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.droppedFrames"

    const-string v4, "droppedFrames"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 682
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.bitrate"

    const-string v4, "bitrate"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 683
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.startupTime"

    const-string v4, "startupTime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 684
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "meta.video.*"

    const-string v4, "metaVideo"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 685
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "meta.ad.*"

    const-string v4, "metaAd"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 686
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "player"

    const-string v4, "ad_start"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleAdStart"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 688
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 689
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playhead"

    const-string v4, "playhead"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 690
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "ad.isInAdBreak"

    const-string v4, "isInAdBreak"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 691
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.fps"

    const-string v4, "fps"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 692
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.droppedFrames"

    const-string v4, "droppedFrames"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 693
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.bitrate"

    const-string v4, "bitrate"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 694
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.startupTime"

    const-string v4, "startupTime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 695
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "player"

    const-string v4, "ad_complete"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleAdComplete"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 697
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 698
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playhead"

    const-string v4, "playhead"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 699
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.fps"

    const-string v4, "fps"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 700
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.droppedFrames"

    const-string v4, "droppedFrames"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 701
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.bitrate"

    const-string v4, "bitrate"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 702
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.startupTime"

    const-string v4, "startupTime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 703
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "player"

    const-string v4, "buffer_start"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleBufferStart"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 705
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 706
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playhead"

    const-string v4, "playhead"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 707
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.fps"

    const-string v4, "fps"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 708
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.droppedFrames"

    const-string v4, "droppedFrames"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 709
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.bitrate"

    const-string v4, "bitrate"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 710
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.startupTime"

    const-string v4, "startupTime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 711
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "player"

    const-string v4, "buffer_complete"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleBufferComplete"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 713
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 714
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playhead"

    const-string v4, "playhead"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 715
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "player"

    const-string v4, "seek_start"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleSeekStart"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 717
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 718
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playhead"

    const-string v4, "playhead"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 719
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "ad.isInAd"

    const-string v4, "isInAd"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 720
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "ad.id"

    const-string v4, "adId"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 721
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "ad.position"

    const-string v4, "adPosition"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 722
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "pod.playerName"

    const-string v4, "podPlayerName"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 723
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "pod.position"

    const-string v4, "podPosition"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 724
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "chapter.isInChapter"

    const-string v4, "isInChapter"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 725
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "chapter.position"

    const-string v4, "chapterPosition"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 726
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "chapter.name"

    const-string v4, "chapterName"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 727
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "chapter.length"

    const-string v4, "chapterLength"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 728
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "chapter.startTime"

    const-string v4, "chapterOffset"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 729
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.fps"

    const-string v4, "fps"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 730
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.droppedFrames"

    const-string v4, "droppedFrames"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 731
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.bitrate"

    const-string v4, "bitrate"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 732
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.startupTime"

    const-string v4, "startupTime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 733
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "player"

    const-string v4, "seek_complete"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleSeekComplete"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 735
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 736
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playhead"

    const-string v4, "playhead"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 737
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "chapter.position"

    const-string v4, "chapterPosition"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 738
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "chapter.name"

    const-string v4, "chapterName"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 739
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "chapter.length"

    const-string v4, "chapterLength"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 740
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "chapter.startTime"

    const-string v4, "chapterOffset"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 741
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.fps"

    const-string v4, "fps"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 742
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.droppedFrames"

    const-string v4, "droppedFrames"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 743
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.bitrate"

    const-string v4, "bitrate"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 744
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.startupTime"

    const-string v4, "startupTime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 745
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "meta.video.*"

    const-string v4, "metaVideo"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 746
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "meta.chapter.*"

    const-string v4, "metaChapter"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 747
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "player"

    const-string v4, "chapter_start"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleChapterStart"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 749
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 750
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playhead"

    const-string v4, "playhead"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 751
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.fps"

    const-string v4, "fps"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 752
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.droppedFrames"

    const-string v4, "droppedFrames"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 753
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.bitrate"

    const-string v4, "bitrate"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 754
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.startupTime"

    const-string v4, "startupTime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 755
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "player"

    const-string v4, "chapter_complete"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleChapterComplete"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 757
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 758
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playhead"

    const-string v4, "playhead"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 759
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.fps"

    const-string v4, "fps"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 760
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.droppedFrames"

    const-string v4, "droppedFrames"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 761
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.bitrate"

    const-string v4, "bitrate"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 762
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.startupTime"

    const-string v4, "startupTime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 763
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "player"

    const-string v4, "bitrate_change"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleBitrateChange"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 765
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 766
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "player"

    const-string v4, "track_error"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleTrackError"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 768
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 769
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playhead"

    const-string v4, "playhead"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 770
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.fps"

    const-string v4, "fps"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 771
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.droppedFrames"

    const-string v4, "droppedFrames"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 772
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.bitrate"

    const-string v4, "bitrate"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 773
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.startupTime"

    const-string v4, "startupTime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 774
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "service.clock"

    const-string v4, "heartbeat.reporting.tick"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleClockReportingTick"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 777
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 778
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "adobe-analytics"

    const-string v4, "error"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleAnalyticsError"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 780
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 781
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "vid"

    const-string v4, "vid"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 782
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "aid"

    const-string v4, "aid"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 783
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "mid"

    const-string v4, "mid"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 784
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "userId.id"

    const-string v4, "dpid"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 785
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "puuid.id"

    const-string v4, "dpuuid"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 786
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playhead"

    const-string v4, "playhead"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 787
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.fps"

    const-string v4, "fps"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 788
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.droppedFrames"

    const-string v4, "droppedFrames"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 789
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.bitrate"

    const-string v4, "bitrate"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 790
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.startupTime"

    const-string v4, "startupTime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 791
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "adobe-analytics"

    const-string v4, "aa_start"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleAnalyticsStart"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 793
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 794
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playhead"

    const-string v4, "playhead"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 795
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.fps"

    const-string v4, "fps"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 796
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.droppedFrames"

    const-string v4, "droppedFrames"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 797
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.bitrate"

    const-string v4, "bitrate"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 798
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "qos.startupTime"

    const-string v4, "startupTime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 799
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "adobe-analytics"

    const-string v4, "sc_ad_start"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleAnalyticsAdStart"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 800
    return-void
.end method

.method private _registerCommands()V
    .locals 3

    .prologue
    .line 596
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleAnalyticsError"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdAnalyticsError:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 597
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleAnalyticsStart"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdAnalyticsStart:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 598
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleAnalyticsAdStart"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdAnalyticsAdStart:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 599
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleVideoLoad"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdVideoLoad:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 600
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleVideoUnload"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdVideoUnload:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 601
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleVideoStart"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdVideoStart:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 602
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleVideoComplete"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdVideoComplete:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 603
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handlePlay"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdPlay:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 604
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handlePause"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdPause:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 605
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleAdStart"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdAdStart:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 606
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleAdComplete"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdAdComplete:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 607
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleBufferStart"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdBufferStart:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 608
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleBufferComplete"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdBufferComplete:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 609
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleSeekStart"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdSeekStart:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 610
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleSeekComplete"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdSeekComplete:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 611
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleChapterStart"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdChapterStart:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 612
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleChapterComplete"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdChapterComplete:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 613
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleBitrateChange"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdBitrateChange:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 614
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleTrackError"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdTrackError:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 615
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleClockReportingTick"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_cmdClockReportingTick:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 616
    return-void
.end method

.method private _resumePlaybackIfPossible(Ljava/lang/Object;)V
    .locals 3

    .prologue
    .line 889
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;

    if-eqz v0, :cond_1

    .line 895
    :cond_0
    :goto_0
    return-void

    .line 892
    :cond_1
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isPaused:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isSeeking:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isBuffering:Z

    if-nez v0, :cond_0

    .line 893
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    new-instance v1, Lcom/adobe/primetime/core/Event;

    sget-object v2, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_PLAY:Ljava/lang/String;

    invoke-direct {v1, v2, p1}, Lcom/adobe/primetime/core/Event;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/radio/Channel;->trigger(Lcom/adobe/primetime/core/Event;)V

    goto :goto_0
.end method

.method private _setupDataResolver()V
    .locals 3

    .prologue
    .line 806
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 808
    const-string v1, "version"

    new-instance v2, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$22;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$22;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 814
    const-string v1, "api_level"

    new-instance v2, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$23;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$23;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 820
    const-string v1, "tracking_server"

    new-instance v2, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$24;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$24;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 826
    const-string v1, "publisher"

    new-instance v2, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$25;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$25;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 832
    const-string v1, "quiet_mode"

    new-instance v2, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$26;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$26;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 838
    const-string v1, "ovp"

    new-instance v2, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$27;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$27;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 845
    const-string v1, "sdk"

    new-instance v2, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$28;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$28;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 852
    const-string v1, "is_primetime"

    new-instance v2, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$29;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$29;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 859
    const-string v1, "psdk_version"

    new-instance v2, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$30;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$30;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 868
    new-instance v1, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$31;

    invoke-direct {v1, p0, v0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$31;-><init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Ljava/util/Map;)V

    iput-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_dataResolver:Ljava/lang/Object;

    .line 885
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)Lcom/adobe/primetime/va/ErrorInfo;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;

    return-object v0
.end method

.method static synthetic access$002(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Lcom/adobe/primetime/va/ErrorInfo;)Lcom/adobe/primetime/va/ErrorInfo;
    .locals 0

    .prologue
    .line 42
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;

    return-object p1
.end method

.method static synthetic access$100(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 42
    invoke-virtual {p0, p1, p2}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$1002(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Z)Z
    .locals 0

    .prologue
    .line 42
    iput-boolean p1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isBuffering:Z

    return p1
.end method

.method static synthetic access$1100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_VIDEO_LOAD:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_VIDEO_START:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1300()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_VIDEO_COMPLETE:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_resumePlaybackIfPossible(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$1500()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_PAUSE:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1600()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_AD_START:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1700()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_AD_COMPLETE:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1800()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_BUFFER_START:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1900()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_SEEK_START:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginDelegate;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_delegate:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginDelegate;

    return-object v0
.end method

.method static synthetic access$2000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_SEEK_COMPLETE:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_CHAPTER_START:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_CHAPTER_COMPLETE:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2300()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_BITRATE_CHANGE:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2400()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_TRACK_ERROR:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2500()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_QUANTUM_END:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2600()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_TRACK_INTERNAL_ERROR:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 42
    invoke-virtual {p0, p1, p2}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$2800(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_config:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;

    return-object v0
.end method

.method static synthetic access$300()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_AA_START:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)Lcom/adobe/primetime/core/radio/Channel;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    return-object v0
.end method

.method static synthetic access$500()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_AA_AD_START:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)Z
    .locals 1

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isTrackingSessionActive:Z

    return v0
.end method

.method static synthetic access$602(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Z)Z
    .locals 0

    .prologue
    .line 42
    iput-boolean p1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isTrackingSessionActive:Z

    return p1
.end method

.method static synthetic access$700()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_VIDEO_UNLOAD:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$802(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Z)Z
    .locals 0

    .prologue
    .line 42
    iput-boolean p1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isPaused:Z

    return p1
.end method

.method static synthetic access$902(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Z)Z
    .locals 0

    .prologue
    .line 42
    iput-boolean p1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isSeeking:Z

    return p1
.end method


# virtual methods
.method protected _canProcess()Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 240
    iget-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isConfigured:Z

    if-nez v1, :cond_0

    .line 241
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_logTag:Ljava/lang/String;

    const-string v3, "_canProcess() > Plugin not configured."

    invoke-interface {v1, v2, v3}, Lcom/adobe/primetime/core/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    :goto_0
    return v0

    .line 245
    :cond_0
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;

    if-eqz v1, :cond_1

    .line 246
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_logTag:Ljava/lang/String;

    const-string v3, "_canProcess() > Plugin in ERROR state."

    invoke-interface {v1, v2, v3}, Lcom/adobe/primetime/core/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 250
    :cond_1
    invoke-super {p0}, Lcom/adobe/primetime/core/plugin/BasePlugin;->_canProcess()Z

    move-result v0

    goto :goto_0
.end method

.method protected _teardown()V
    .locals 3

    .prologue
    .line 226
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#_teardown()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->destroy()V

    .line 230
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_clock:Lcom/adobe/primetime/va/plugins/ah/engine/clock/Clock;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Clock;->destroy()V

    .line 231
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_filter:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->destroy()V

    .line 232
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_network:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->destroy()V

    .line 235
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_radio:Lcom/adobe/primetime/core/radio/Radio;

    invoke-virtual {v0}, Lcom/adobe/primetime/core/radio/Radio;->shutdown()V

    .line 236
    return-void
.end method

.method public bootstrap(Lcom/adobe/primetime/core/plugin/PluginManager;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 205
    invoke-super {p0, p1}, Lcom/adobe/primetime/core/plugin/BasePlugin;->bootstrap(Lcom/adobe/primetime/core/plugin/PluginManager;)V

    .line 208
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "error"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_onError:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 211
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Clock;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Clock;-><init>(Lcom/adobe/primetime/core/plugin/PluginManager;Lcom/adobe/primetime/core/radio/Channel;Lcom/adobe/primetime/core/ILogger;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_clock:Lcom/adobe/primetime/va/plugins/ah/engine/clock/Clock;

    .line 214
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "clock:check_status.resume"

    invoke-virtual {v0, v1, v4}, Lcom/adobe/primetime/core/radio/Channel;->command(Ljava/lang/String;Ljava/lang/Object;)V

    .line 215
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    new-instance v1, Lcom/adobe/primetime/core/Event;

    const-string v2, "clock:check_status.get_settings"

    invoke-direct {v1, v2, v4}, Lcom/adobe/primetime/core/Event;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/radio/Channel;->trigger(Lcom/adobe/primetime/core/Event;)V

    .line 217
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_registerCommands()V

    .line 218
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_registerBehaviours()V

    .line 219
    return-void
.end method

.method public configure(Lcom/adobe/primetime/core/plugin/IPluginConfig;)V
    .locals 4

    .prologue
    .line 164
    if-nez p1, :cond_0

    .line 165
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference tp the configuration data cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 168
    :cond_0
    instance-of v0, p1, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;

    if-nez v0, :cond_1

    .line 169
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Expected config data to be instance of AdobeHeartbeatPluginConfig."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 172
    :cond_1
    check-cast p1, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;

    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_config:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;

    .line 173
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_config:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;

    iget-boolean v0, v0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->debugLogging:Z

    if-eqz v0, :cond_2

    .line 174
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-interface {v0}, Lcom/adobe/primetime/core/ILogger;->enable()V

    .line 179
    :goto_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_logTag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "#configure({trackingServer="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_config:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;

    .line 180
    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->getTrackingServer()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", publisher="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_config:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;

    .line 181
    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->getPublisher()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", quietMode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_config:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;

    iget-boolean v3, v3, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->quietMode:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", ssl="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_config:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;

    iget-boolean v3, v3, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->ssl:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "})"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 179
    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_config:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->getTrackingServer()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/settings/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 189
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 190
    const-string v2, "tracking_server"

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_config:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->getTrackingServer()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    const-string v2, "check_status_server"

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    const-string v0, "publisher"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_config:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->getPublisher()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    const-string v0, "quiet_mode"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_config:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;

    iget-boolean v2, v2, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->quietMode:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    const-string v0, "ssl"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_config:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;

    iget-boolean v2, v2, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->ssl:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    new-instance v2, Lcom/adobe/primetime/core/Event;

    sget-object v3, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_CONFIG:Ljava/lang/String;

    invoke-direct {v2, v3, v1}, Lcom/adobe/primetime/core/Event;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Lcom/adobe/primetime/core/radio/Channel;->trigger(Lcom/adobe/primetime/core/Event;)V

    .line 199
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isConfigured:Z

    .line 200
    return-void

    .line 176
    :cond_2
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-interface {v0}, Lcom/adobe/primetime/core/ILogger;->disable()V

    goto/16 :goto_0
.end method
