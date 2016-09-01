.class public Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final CMD_DISABLE_REPORTING_TIMER:Ljava/lang/String; = "clock:reporting.pause"

.field private static final CMD_ENABLE_REPORTING_TIMER:Ljava/lang/String; = "clock:reporting.resume"

.field private static final ERROR_SOURCE_PLAYER:Ljava/lang/String; = "sourceErrorSDK"

.field private static final EVENT_API_AA_AD_START:Ljava/lang/String; = "api:aa_ad_start"

.field private static final EVENT_API_AA_START:Ljava/lang/String; = "api:aa_start"

.field private static final EVENT_API_AD_COMPLETE:Ljava/lang/String; = "api:ad_complete"

.field private static final EVENT_API_AD_START:Ljava/lang/String; = "api:ad_start"

.field private static final EVENT_API_BITRATE_CHANGE:Ljava/lang/String; = "api:bitrate_change"

.field private static final EVENT_API_BUFFER_START:Ljava/lang/String; = "api:buffer_start"

.field private static final EVENT_API_CHAPTER_COMPLETE:Ljava/lang/String; = "api:chapter_complete"

.field private static final EVENT_API_CHAPTER_START:Ljava/lang/String; = "api:chapter_start"

.field private static final EVENT_API_PAUSE:Ljava/lang/String; = "api:pause"

.field private static final EVENT_API_PLAY:Ljava/lang/String; = "api:play"

.field private static final EVENT_API_QUANTUM_END:Ljava/lang/String; = "api:quantum_end"

.field private static final EVENT_API_SEEK_COMPLETE:Ljava/lang/String; = "api:seek_complete"

.field private static final EVENT_API_SEEK_START:Ljava/lang/String; = "api:seek_start"

.field private static final EVENT_API_TRACK_ERROR:Ljava/lang/String; = "api:track_error"

.field private static final EVENT_API_TRACK_INTERNAL_ERROR:Ljava/lang/String; = "api:track_internal_error"

.field private static final EVENT_API_VIDEO_COMPLETE:Ljava/lang/String; = "api:video_complete"

.field private static final EVENT_API_VIDEO_LOAD:Ljava/lang/String; = "api:video_load"

.field private static final EVENT_API_VIDEO_START:Ljava/lang/String; = "api:video_start"

.field private static final EVENT_API_VIDEO_UNLOAD:Ljava/lang/String; = "api:video_unload"

.field private static final EVENT_CONTEXT_REPORT_AVAILABLE:Ljava/lang/String; = "context:report_available"

.field private static final EVENT_NET_CHECK_STATUS_COMPLETE:Ljava/lang/String; = "net:check_status_complete"

.field private static final KEY_CALLBACK:Ljava/lang/String; = "callback"

.field private static final KEY_REPORT:Ljava/lang/String; = "report"

.field private static final KEY_RESET:Ljava/lang/String; = "reset"

.field private static final KEY_TRACK_EXTERNAL_ERRORS:Ljava/lang/String; = "track_external_errors"

.field private static final REQ_REPORTING_INTERVAL:Ljava/lang/String; = "reporting_interval"

.field private static final REQ_SESSION_ID:Ljava/lang/String; = "session_id"


# instance fields
.field private _activeAssetId:Ljava/lang/String;

.field public _adobeAnalyticsData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;

.field public _assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

.field private _autoComputedStartupTime:J

.field public _channel:Lcom/adobe/primetime/core/radio/Channel;

.field private _context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

.field public _cuserData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

.field private _inputDataValidator:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;

.field private _isAnalyticsStarted:Z

.field private _isDestroyed:Z

.field private _isTrackingSessionActive:Z

.field private _isVideoComplete:Z

.field private _lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

.field private _logTag:Ljava/lang/String;

.field private _logger:Lcom/adobe/primetime/core/ILogger;

.field private final _onApiAdComplete:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiAdStart:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiAnalyticsAdStart:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiAnalyticsStart:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiBitrateChange:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiBufferStart:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiChapterComplete:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiChapterStart:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiPause:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiPlay:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiQuantumEnd:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiSeekComplete:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiSeekStart:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiTrackError:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiTrackInternalError:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiVideoComplete:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiVideoLoad:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiVideoStart:Lcom/adobe/primetime/core/ICallback;

.field private final _onApiVideoUnload:Lcom/adobe/primetime/core/ICallback;

.field private final _onNetworkCheckStatusComplete:Lcom/adobe/primetime/core/ICallback;

.field public _qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

.field private _reportFactory:Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;

.field public _serviceProviderData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;

.field public _sessionData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

.field private _stashedAdData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

.field private _stashedChapterData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

.field public _streamData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;

.field private _trackExternalErrors:Z

.field public _userData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/core/radio/Channel;Lcom/adobe/primetime/core/ILogger;)V
    .locals 3

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 178
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$2;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiAnalyticsStart:Lcom/adobe/primetime/core/ICallback;

    .line 243
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$3;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$3;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiAnalyticsAdStart:Lcom/adobe/primetime/core/ICallback;

    .line 287
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$4;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$4;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiVideoLoad:Lcom/adobe/primetime/core/ICallback;

    .line 303
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$5;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$5;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiVideoUnload:Lcom/adobe/primetime/core/ICallback;

    .line 320
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$6;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiVideoStart:Lcom/adobe/primetime/core/ICallback;

    .line 393
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$7;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$7;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiVideoComplete:Lcom/adobe/primetime/core/ICallback;

    .line 431
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$8;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$8;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiPlay:Lcom/adobe/primetime/core/ICallback;

    .line 473
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$9;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$9;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiPause:Lcom/adobe/primetime/core/ICallback;

    .line 515
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$10;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$10;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiBufferStart:Lcom/adobe/primetime/core/ICallback;

    .line 557
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$11;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiSeekStart:Lcom/adobe/primetime/core/ICallback;

    .line 582
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$12;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiSeekComplete:Lcom/adobe/primetime/core/ICallback;

    .line 678
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$13;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiAdStart:Lcom/adobe/primetime/core/ICallback;

    .line 763
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$14;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$14;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiAdComplete:Lcom/adobe/primetime/core/ICallback;

    .line 816
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$15;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$15;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiChapterStart:Lcom/adobe/primetime/core/ICallback;

    .line 899
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$16;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$16;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiChapterComplete:Lcom/adobe/primetime/core/ICallback;

    .line 955
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$17;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$17;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiBitrateChange:Lcom/adobe/primetime/core/ICallback;

    .line 997
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$18;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$18;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiTrackError:Lcom/adobe/primetime/core/ICallback;

    .line 1054
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$19;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$19;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiTrackInternalError:Lcom/adobe/primetime/core/ICallback;

    .line 1079
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$20;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiQuantumEnd:Lcom/adobe/primetime/core/ICallback;

    .line 1114
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$21;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$21;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onNetworkCheckStatusComplete:Lcom/adobe/primetime/core/ICallback;

    .line 109
    if-nez p1, :cond_0

    .line 110
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the channel object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_0
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    .line 114
    if-nez p2, :cond_1

    .line 115
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the logger object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 117
    :cond_1
    const-class v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;

    .line 118
    iput-object p2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;

    .line 120
    iput-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    .line 121
    iput-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_streamData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;

    .line 122
    iput-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    .line 123
    iput-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_sessionData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

    .line 124
    iput-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_cuserData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

    .line 126
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;

    invoke-direct {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_adobeAnalyticsData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;

    .line 127
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;

    invoke-direct {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_serviceProviderData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;

    .line 128
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;

    invoke-direct {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_userData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;

    .line 130
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isAnalyticsStarted:Z

    .line 131
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isTrackingSessionActive:Z

    .line 132
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isVideoComplete:Z

    .line 133
    iput-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_activeAssetId:Ljava/lang/String;

    .line 134
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isDestroyed:Z

    .line 137
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-direct {v0, p0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Lcom/adobe/primetime/core/ILogger;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_reportFactory:Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;

    .line 139
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;

    new-instance v1, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$1;

    invoke-direct {v1, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$1;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    invoke-direct {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;-><init>(Lcom/adobe/primetime/core/ICallback;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_inputDataValidator:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;

    .line 149
    iput-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedChapterData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    .line 150
    iput-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedAdData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    .line 154
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_trackExternalErrors:Z

    .line 156
    iput-object p0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    .line 159
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_installEventListeners()V

    .line 160
    return-void
.end method

.method private _checkCall(Ljava/lang/String;)Z
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 1213
    iget-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isTrackingSessionActive:Z

    if-nez v1, :cond_0

    .line 1214
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "#"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "() > No active tracking session."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    .line 1223
    :goto_0
    return v0

    .line 1218
    :cond_0
    iget-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isVideoComplete:Z

    if-eqz v1, :cond_1

    .line 1219
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "#"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "() > The video content already completed."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1223
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private static _generateSessionId()Ljava/lang/String;
    .locals 4

    .prologue
    .line 1185
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    .line 1186
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const v2, 0x3b9aca00

    invoke-virtual {v0, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private _installEventListeners()V
    .locals 3

    .prologue
    .line 1134
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:aa_start"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiAnalyticsStart:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1135
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:aa_ad_start"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiAnalyticsAdStart:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1136
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:video_load"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiVideoLoad:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1137
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:video_unload"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiVideoUnload:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1138
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:video_start"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiVideoStart:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1139
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:video_complete"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiVideoComplete:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1140
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:ad_start"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiAdStart:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1141
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:ad_complete"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiAdComplete:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1142
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:play"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiPlay:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1143
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:pause"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiPause:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1144
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:buffer_start"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiBufferStart:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1145
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:seek_start"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiSeekStart:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1146
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:seek_complete"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiSeekComplete:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1147
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:chapter_start"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiChapterStart:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1148
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:chapter_complete"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiChapterComplete:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1149
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:bitrate_change"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiBitrateChange:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1150
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:track_error"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiTrackError:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1151
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:track_internal_error"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiTrackInternalError:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1152
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:quantum_end"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onApiQuantumEnd:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1153
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "net:check_status_complete"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_onNetworkCheckStatusComplete:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1155
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "session_id"

    new-instance v2, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$22;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$22;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/primetime/core/radio/Channel;->reply(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 1161
    return-void
.end method

.method private _resetInternalState()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 1168
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;

    const-string v2, "#_resetInternalState()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 1170
    iput-boolean v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isTrackingSessionActive:Z

    .line 1171
    iput-boolean v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isVideoComplete:Z

    .line 1173
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_autoComputedStartupTime:J

    .line 1175
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;

    invoke-direct {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_streamData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;

    .line 1176
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    invoke-direct {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    .line 1177
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

    invoke-direct {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_sessionData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

    .line 1178
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    invoke-direct {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    .line 1180
    iput-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedAdData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    .line 1181
    iput-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedChapterData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    .line 1182
    return-void
.end method

.method private _sendHit(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v0, 0x0

    .line 1228
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 1229
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    .line 1231
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->valueOf(Ljava/lang/String;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    move-result-object v4

    .line 1232
    sget-object v5, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$23;->$SwitchMap$com$adobe$primetime$va$plugins$ah$engine$model$dao$EventDao$TYPE:[I

    invoke-virtual {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->ordinal()I

    move-result v4

    aget v4, v5, v4

    packed-switch v4, :pswitch_data_0

    .line 1330
    invoke-virtual {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->createAndSendReport(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V

    .line 1333
    :cond_0
    :goto_0
    return-void

    .line 1238
    :pswitch_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    if-eqz v0, :cond_2

    .line 1239
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v0

    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getTs()J

    move-result-wide v4

    sub-long v4, v2, v4

    invoke-virtual {v0, v4, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setDuration(J)V

    .line 1240
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setTs(J)V

    .line 1241
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v0

    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getPlayhead()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setPlayhead(D)V

    .line 1243
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v0

    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->getStartupTime()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setStartupTime(J)V

    .line 1244
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v0

    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v2

    iget-boolean v2, v2, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->isStartupTimeOverridden:Z

    iput-boolean v2, v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->isStartupTimeOverridden:Z

    .line 1247
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getType()Ljava/lang/String;

    move-result-object v0

    const-string v2, "start"

    if-ne v0, v2, :cond_1

    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    .line 1248
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getAssetDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getType()Ljava/lang/String;

    move-result-object v0

    const-string v2, "main"

    if-ne v0, v2, :cond_1

    .line 1249
    iget-wide v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_autoComputedStartupTime:J

    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getDuration()J

    move-result-wide v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_autoComputedStartupTime:J

    .line 1252
    :cond_1
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    if-eq p1, v0, :cond_2

    .line 1253
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->createAndSendReport(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V

    .line 1258
    :cond_2
    invoke-virtual {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->createAndSendReport(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V

    .line 1261
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    .line 1264
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 1265
    const-string v0, "reset"

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1266
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v2, "clock:reporting.resume"

    invoke-virtual {v0, v2, v1}, Lcom/adobe/primetime/core/radio/Channel;->command(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1272
    :pswitch_1
    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    if-eqz v4, :cond_3

    .line 1273
    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getTs()J

    move-result-wide v6

    sub-long v6, v2, v6

    invoke-virtual {v4, v6, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setDuration(J)V

    .line 1274
    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setTs(J)V

    .line 1275
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getPlayhead()D

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setPlayhead(D)V

    .line 1277
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->getStartupTime()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setStartupTime(J)V

    .line 1278
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v3

    iget-boolean v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->isStartupTimeOverridden:Z

    iput-boolean v3, v2, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->isStartupTimeOverridden:Z

    .line 1280
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {p0, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->createAndSendReport(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V

    .line 1284
    :cond_3
    invoke-virtual {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->createAndSendReport(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V

    .line 1286
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getAssetDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getType()Ljava/lang/String;

    move-result-object v2

    const-string v3, "main"

    if-ne v2, v3, :cond_4

    .line 1288
    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    .line 1291
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 1292
    const-string v0, "reset"

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1293
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v2, "clock:reporting.pause"

    invoke-virtual {v0, v2, v1}, Lcom/adobe/primetime/core/radio/Channel;->command(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1295
    :cond_4
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getAssetDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getType()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ad"

    if-ne v1, v2, :cond_0

    .line 1297
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getAssetDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setAdData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;)V

    .line 1298
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getAssetDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v0

    const-string v1, "main"

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setType(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1305
    :pswitch_2
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    if-eqz v1, :cond_5

    .line 1306
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v1

    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getTs()J

    move-result-wide v4

    sub-long v4, v2, v4

    invoke-virtual {v1, v4, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setDuration(J)V

    .line 1307
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v1

    invoke-virtual {v1, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setTs(J)V

    .line 1308
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v1

    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getPlayhead()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setPlayhead(D)V

    .line 1310
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v1

    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->getStartupTime()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setStartupTime(J)V

    .line 1311
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v1

    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v2

    iget-boolean v2, v2, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->isStartupTimeOverridden:Z

    iput-boolean v2, v1, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->isStartupTimeOverridden:Z

    .line 1313
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {p0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->createAndSendReport(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V

    .line 1317
    :cond_5
    invoke-virtual {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->createAndSendReport(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V

    .line 1319
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    if-eqz v1, :cond_0

    .line 1320
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getAssetDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v1

    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getType()Ljava/lang/String;

    move-result-object v2

    const-string v3, "chapter_start"

    if-ne v2, v3, :cond_6

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    .line 1321
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getAssetDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getChapterData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;)V

    .line 1320
    :cond_6
    invoke-virtual {v1, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setChapterData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;)V

    .line 1323
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v0

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setDuration(J)V

    .line 1324
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->createAndSendReport(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V

    goto/16 :goto_0

    .line 1232
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method private _uninstallEventListeners()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1164
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    invoke-virtual {v0, v1, v1, p0}, Lcom/adobe/primetime/core/radio/Channel;->off(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 1165
    return-void
.end method

.method private _updateQoSInfo(Ljava/util/Map;)V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 1193
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    const-string v0, "bitrate"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, "bitrate"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    check-cast v0, Ljava/lang/Long;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setBitrate(J)V

    .line 1194
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    const-string v0, "fps"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v0, "fps"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_1
    check-cast v0, Ljava/lang/Double;

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setFps(D)V

    .line 1195
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    const-string v0, "droppedFrames"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string v0, "droppedFrames"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_2
    check-cast v0, Ljava/lang/Long;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setDroppedFrames(J)V

    .line 1200
    const-string v0, "startupTime"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 1201
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    const-string v0, "startupTime"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setStartupTime(J)V

    .line 1205
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->isStartupTimeOverridden:Z

    .line 1210
    :goto_3
    return-void

    .line 1193
    :cond_0
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_0

    .line 1194
    :cond_1
    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto :goto_1

    .line 1195
    :cond_2
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_2

    .line 1207
    :cond_3
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    iget-wide v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_autoComputedStartupTime:J

    invoke-virtual {v0, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setStartupTime(J)V

    .line 1208
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->isStartupTimeOverridden:Z

    goto :goto_3
.end method

.method static synthetic access$000(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_activeAssetId:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1002(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .prologue
    .line 37
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_activeAssetId:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    invoke-static {}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_generateSessionId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1202(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Z)Z
    .locals 0

    .prologue
    .line 37
    iput-boolean p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isVideoComplete:Z

    return p1
.end method

.method static synthetic access$1300(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedAdData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    return-object v0
.end method

.method static synthetic access$1302(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;
    .locals 0

    .prologue
    .line 37
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedAdData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    return-object p1
.end method

.method static synthetic access$1400(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedChapterData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    return-object v0
.end method

.method static synthetic access$1402(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;
    .locals 0

    .prologue
    .line 37
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_stashedChapterData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    return-object p1
.end method

.method static synthetic access$1500(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Z
    .locals 1

    .prologue
    .line 37
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_trackExternalErrors:Z

    return v0
.end method

.method static synthetic access$1502(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Z)Z
    .locals 0

    .prologue
    .line 37
    iput-boolean p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_trackExternalErrors:Z

    return p1
.end method

.method static synthetic access$1600(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_lastInBandItem:Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_checkCall(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_inputDataValidator:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_updateQoSInfo(Ljava/util/Map;)V

    return-void
.end method

.method static synthetic access$600(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Z
    .locals 1

    .prologue
    .line 37
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isAnalyticsStarted:Z

    return v0
.end method

.method static synthetic access$700(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_sendHit(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V

    return-void
.end method

.method static synthetic access$800(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_resetInternalState()V

    return-void
.end method

.method static synthetic access$900(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)Z
    .locals 1

    .prologue
    .line 37
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isTrackingSessionActive:Z

    return v0
.end method

.method static synthetic access$902(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Z)Z
    .locals 0

    .prologue
    .line 37
    iput-boolean p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isTrackingSessionActive:Z

    return p1
.end method


# virtual methods
.method createAndSendReport(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 1336
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_reportFactory:Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;

    invoke-virtual {v0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;->createReportForItem(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;

    move-result-object v0

    .line 1341
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getQosData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v1

    iget-boolean v1, v1, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->isStartupTimeOverridden:Z

    if-nez v1, :cond_0

    .line 1342
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getQosData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v1

    iget-wide v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_autoComputedStartupTime:J

    invoke-virtual {v1, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setStartupTime(J)V

    .line 1346
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 1347
    const-string v2, "report"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1348
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    new-instance v3, Lcom/adobe/primetime/core/Event;

    const-string v4, "context:report_available"

    invoke-direct {v3, v4, v1}, Lcom/adobe/primetime/core/Event;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Lcom/adobe/primetime/core/radio/Channel;->trigger(Lcom/adobe/primetime/core/Event;)V

    .line 1352
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getType()Ljava/lang/String;

    move-result-object v1

    const-string v2, "play"

    if-eq v1, v2, :cond_1

    .line 1353
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getType()Ljava/lang/String;

    move-result-object v1

    const-string v2, "buffer"

    if-eq v1, v2, :cond_1

    .line 1354
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getType()Ljava/lang/String;

    move-result-object v0

    const-string v1, "start"

    if-ne v0, v1, :cond_2

    .line 1357
    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1358
    const-string v1, "reset"

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1359
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v2, "clock:reporting.resume"

    invoke-virtual {v1, v2, v0}, Lcom/adobe/primetime/core/radio/Channel;->command(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1363
    :cond_2
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getType()Ljava/lang/String;

    move-result-object v0

    const-string v1, "api:aa_start"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1364
    iput-boolean v5, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isAnalyticsStarted:Z

    .line 1366
    :cond_3
    return-void
.end method

.method public destroy()V
    .locals 3

    .prologue
    .line 166
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isDestroyed:Z

    if-eqz v0, :cond_0

    .line 173
    :goto_0
    return-void

    .line 167
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_isDestroyed:Z

    .line 169
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_logTag:Ljava/lang/String;

    const-string v2, "#destroy()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_uninstallEventListeners()V

    goto :goto_0
.end method
