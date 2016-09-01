.class public Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final EVENT_API_CONFIG:Ljava/lang/String; = "api:config"

.field private static final EVENT_CLOCK_CHECK_STATUS_TICK:Ljava/lang/String; = "clock:check_status.tick"

.field private static final EVENT_FILTER_REPORT_AVAILABLE:Ljava/lang/String; = "filter:data_available"

.field private static final EVENT_NET_CHECK_STATUS_COMPLETE:Ljava/lang/String; = "net:check_status_complete"

.field private static final KEY_CHECK_STATUS_SERVER:Ljava/lang/String; = "check_status_server"

.field private static final KEY_PUBLISHER:Ljava/lang/String; = "publisher"

.field private static final KEY_QUIET_MODE:Ljava/lang/String; = "quiet_mode"

.field private static final KEY_REPORT:Ljava/lang/String; = "report"

.field private static final KEY_SSL:Ljava/lang/String; = "ssl"

.field private static final KEY_TRACKING_SERVER:Ljava/lang/String; = "tracking_server"


# instance fields
.field private final _channel:Lcom/adobe/primetime/core/radio/Channel;

.field private _checkStatusServer:Ljava/lang/String;

.field private _isConfigured:Z

.field private _isDestroyed:Z

.field private _logTag:Ljava/lang/String;

.field private _logger:Lcom/adobe/primetime/core/ILogger;

.field private final _onApiConfig:Lcom/adobe/primetime/core/ICallback;

.field private final _onClockCheckStatusTick:Lcom/adobe/primetime/core/ICallback;

.field private final _onFilterReportAvailable:Lcom/adobe/primetime/core/ICallback;

.field private _publisher:Ljava/lang/String;

.field private _quietMode:Z

.field private final _serializer:Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;

.field private _trackingServer:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/core/radio/Channel;Lcom/adobe/primetime/core/ILogger;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$1;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$1;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_onApiConfig:Lcom/adobe/primetime/core/ICallback;

    .line 128
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_onFilterReportAvailable:Lcom/adobe/primetime/core/ICallback;

    .line 185
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$3;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_onClockCheckStatusTick:Lcom/adobe/primetime/core/ICallback;

    .line 62
    iput-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_publisher:Ljava/lang/String;

    .line 64
    iput-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_trackingServer:Ljava/lang/String;

    .line 65
    iput-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_checkStatusServer:Ljava/lang/String;

    .line 67
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_quietMode:Z

    .line 68
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_isConfigured:Z

    .line 69
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_isDestroyed:Z

    .line 71
    if-nez p1, :cond_0

    .line 72
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the channel object cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 74
    :cond_0
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    .line 76
    if-nez p2, :cond_1

    .line 77
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the logger object cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_1
    iput-object p2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;

    .line 80
    const-class v0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logTag:Ljava/lang/String;

    .line 82
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-direct {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;-><init>(Lcom/adobe/primetime/core/ILogger;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_serializer:Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;

    .line 84
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_installEventListeners()V

    .line 85
    return-void
.end method

.method private _installEventListeners()V
    .locals 3

    .prologue
    .line 269
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "api:config"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_onApiConfig:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 270
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "filter:data_available"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_onFilterReportAvailable:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 271
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "clock:check_status.tick"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_onClockCheckStatusTick:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 272
    return-void
.end method

.method private _uninstallEventListeners()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 276
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    invoke-virtual {v0, v1, v1, p0}, Lcom/adobe/primetime/core/radio/Channel;->off(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 277
    return-void
.end method

.method private static _updateRequestProtocol(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2

    .prologue
    .line 254
    .line 257
    const-string v0, "http://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 258
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 263
    :cond_0
    :goto_0
    if-eqz p1, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1
    return-object v0

    .line 259
    :cond_1
    const-string v0, "https://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 260
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 263
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method static synthetic access$000(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_trackingServer:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$202(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .prologue
    .line 35
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_trackingServer:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$300(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    invoke-static {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_updateRequestProtocol(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_checkStatusServer:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$402(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .prologue
    .line 35
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_checkStatusServer:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$500(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_publisher:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$502(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .prologue
    .line 35
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_publisher:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$600(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Z
    .locals 1

    .prologue
    .line 35
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_quietMode:Z

    return v0
.end method

.method static synthetic access$602(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;Z)Z
    .locals 0

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_quietMode:Z

    return p1
.end method

.method static synthetic access$700(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Z
    .locals 1

    .prologue
    .line 35
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_isConfigured:Z

    return v0
.end method

.method static synthetic access$702(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;Z)Z
    .locals 0

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_isConfigured:Z

    return p1
.end method

.method static synthetic access$800(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_serializer:Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;

    return-object v0
.end method

.method static synthetic access$900(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;)Lcom/adobe/primetime/core/radio/Channel;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    return-object v0
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .prologue
    .line 91
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_isDestroyed:Z

    if-eqz v0, :cond_0

    .line 96
    :goto_0
    return-void

    .line 92
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_isDestroyed:Z

    .line 94
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_logTag:Ljava/lang/String;

    const-string v2, "#destroy()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network;->_uninstallEventListeners()V

    goto :goto_0
.end method
