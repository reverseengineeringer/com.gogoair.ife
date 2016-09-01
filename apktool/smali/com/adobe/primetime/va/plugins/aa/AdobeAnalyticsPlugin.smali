.class public Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;
.super Lcom/adobe/primetime/core/plugin/BasePlugin;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$Domain;
    }
.end annotation


# static fields
.field private static final AA_AD_START:Ljava/lang/String; = "sc_ad_start"

.field private static final AA_START:Ljava/lang/String; = "aa_start"

.field private static final ADOBE_ANALYTICS_PLUGIN:Ljava/lang/String; = "adobe-analytics"

.field private static final ADOBE_HEARTBEAT_PLUGIN:Ljava/lang/String; = "adobe-heartbeat"

.field private static final AD_BREAK_INFO:Ljava/lang/String; = "ad_break_info"

.field private static final AD_INFO:Ljava/lang/String; = "ad_info"

.field private static final AD_START:Ljava/lang/String; = "ad_start"

.field private static final ANALYTICS_VISITOR_ID:Ljava/lang/String; = "aid"

.field private static final CHANNEL:Ljava/lang/String; = "channel"

.field private static final DPID:Ljava/lang/String; = "userId.id"

.field private static final DPUUID:Ljava/lang/String; = "puuid.id"

.field private static final IS_PRIMETIME:Ljava/lang/String; = "is_primetime"

.field private static final MARKETING_CLOUD_VISITOR_ID:Ljava/lang/String; = "mid"

.field private static final META:Ljava/lang/String; = "meta"

.field private static final PLAYER_PLUGIN:Ljava/lang/String; = "player"

.field private static final RSID:Ljava/lang/String; = "rsid"

.field private static final SC_CONTENT_TYPE_AD:Ljava/lang/String; = "videoAd"

.field private static final SC_CONTENT_TYPE_VIDEO:Ljava/lang/String; = "video"

.field private static final SC_START:Ljava/lang/String; = "ms_s"

.field private static final SC_START_AD:Ljava/lang/String; = "msa_s"

.field private static final SC_START_AD_PRIMETIME:Ljava/lang/String; = "mspa_s"

.field private static final SC_START_PRIMETIME:Ljava/lang/String; = "msp_s"

.field private static final TRACKING_SERVER:Ljava/lang/String; = "tracking_server"

.field private static final USE_SSL:Ljava/lang/String; = "ssl"

.field private static final VIDEO_INFO:Ljava/lang/String; = "video_info"

.field private static final VIDEO_LOAD:Ljava/lang/String; = "video_load"

.field private static final VIDEO_START:Ljava/lang/String; = "video_start"

.field private static final VISITOR_ID:Ljava/lang/String; = "vid"


# instance fields
.field private _adMetadata:Ljava/util/Map;

.field private _chapterMetadata:Ljava/util/Map;

.field private final _cmdAdStart:Lcom/adobe/primetime/core/ICallback;

.field private final _cmdHeartbeatPluginError:Lcom/adobe/primetime/core/ICallback;

.field private final _cmdVideoLoad:Lcom/adobe/primetime/core/ICallback;

.field private final _cmdVideoStart:Lcom/adobe/primetime/core/ICallback;

.field private _config:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;

.field private _customMetadataKeys:Ljava/util/ArrayList;

.field private _delegate:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginDelegate;

.field private _errorInfo:Lcom/adobe/primetime/va/ErrorInfo;

.field private final _executeOpen:Lcom/adobe/primetime/core/ICallback;

.field private final _executeOpenAd:Lcom/adobe/primetime/core/ICallback;

.field private _inputDataValidator:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;

.field private final _onInvalidInputData:Lcom/adobe/primetime/core/ICallback;

.field private _videoMetadata:Ljava/util/Map;

.field private _visitorIdQueue:Lcom/adobe/primetime/core/radio/CommandQueue;

.field private _workQueue:Lcom/adobe/primetime/core/radio/CommandQueue;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginDelegate;)V
    .locals 2

    .prologue
    .line 101
    const-string v0, "adobe-analytics"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/core/plugin/BasePlugin;-><init>(Ljava/lang/String;)V

    .line 213
    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$1;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$1;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_cmdVideoLoad:Lcom/adobe/primetime/core/ICallback;

    .line 223
    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$2;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$2;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_cmdVideoStart:Lcom/adobe/primetime/core/ICallback;

    .line 238
    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$3;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$3;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_cmdAdStart:Lcom/adobe/primetime/core/ICallback;

    .line 253
    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$4;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$4;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_cmdHeartbeatPluginError:Lcom/adobe/primetime/core/ICallback;

    .line 274
    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$5;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$5;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_executeOpen:Lcom/adobe/primetime/core/ICallback;

    .line 345
    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$6;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$6;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_executeOpenAd:Lcom/adobe/primetime/core/ICallback;

    .line 668
    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$20;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$20;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_onInvalidInputData:Lcom/adobe/primetime/core/ICallback;

    .line 103
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_delegate:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginDelegate;

    .line 105
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_customMetadataKeys:Ljava/util/ArrayList;

    .line 106
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_videoMetadata:Ljava/util/Map;

    .line 107
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_adMetadata:Ljava/util/Map;

    .line 108
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_chapterMetadata:Ljava/util/Map;

    .line 110
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;

    .line 112
    new-instance v0, Lcom/adobe/primetime/core/radio/CommandQueue;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/adobe/primetime/core/radio/CommandQueue;-><init>(Z)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_workQueue:Lcom/adobe/primetime/core/radio/CommandQueue;

    .line 113
    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_onInvalidInputData:Lcom/adobe/primetime/core/ICallback;

    invoke-direct {v0, v1}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;-><init>(Lcom/adobe/primetime/core/ICallback;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_inputDataValidator:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;

    .line 115
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_setupDataResolver()V

    .line 116
    return-void
.end method

.method private _onAppMeasurementReady()V
    .locals 1

    .prologue
    .line 665
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_workQueue:Lcom/adobe/primetime/core/radio/CommandQueue;

    invoke-virtual {v0}, Lcom/adobe/primetime/core/radio/CommandQueue;->resume()V

    .line 666
    return-void
.end method

.method private _prepareAppMeasurement()V
    .locals 3

    .prologue
    .line 636
    new-instance v0, Lcom/adobe/primetime/core/radio/CommandQueue;

    invoke-direct {v0}, Lcom/adobe/primetime/core/radio/CommandQueue;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_visitorIdQueue:Lcom/adobe/primetime/core/radio/CommandQueue;

    .line 637
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_visitorIdQueue:Lcom/adobe/primetime/core/radio/CommandQueue;

    new-instance v1, Lcom/adobe/primetime/core/radio/Command;

    new-instance v2, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$18;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$18;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    invoke-direct {v1, v2}, Lcom/adobe/primetime/core/radio/Command;-><init>(Lcom/adobe/primetime/core/ICallback;)V

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/radio/CommandQueue;->addCommand(Lcom/adobe/primetime/core/radio/Command;)V

    .line 649
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_visitorIdQueue:Lcom/adobe/primetime/core/radio/CommandQueue;

    new-instance v1, Lcom/adobe/primetime/core/radio/Command;

    new-instance v2, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$19;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$19;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    invoke-direct {v1, v2}, Lcom/adobe/primetime/core/radio/Command;-><init>(Lcom/adobe/primetime/core/ICallback;)V

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/radio/CommandQueue;->addCommand(Lcom/adobe/primetime/core/radio/Command;)V

    .line 662
    return-void
.end method

.method private _registerBehaviours()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 594
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v1, Lcom/adobe/primetime/core/Trigger;

    const-string v2, "player"

    const-string v3, "video_load"

    invoke-direct {v1, v2, v3}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "handleVideoLoad"

    invoke-virtual {v0, v1, p0, v2, v5}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 596
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 597
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.id"

    const-string v4, "videoId"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 598
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.name"

    const-string v4, "videoName"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 599
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.length"

    const-string v4, "videoLength"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 600
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playerName"

    const-string v4, "playerName"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 601
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.streamType"

    const-string v4, "streamType"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 602
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-heartbeat"

    const-string v3, "is_primetime"

    const-string v4, "isPrimetime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 603
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "channel"

    const-string v4, "channel"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 604
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "userId.id"

    const-string v4, "dpid"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 605
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "puuid.id"

    const-string v4, "dpuuid"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 606
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "meta.video.*"

    const-string v4, "metaVideo"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 607
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "player"

    const-string v4, "video_start"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleVideoStart"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 609
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 610
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.id"

    const-string v4, "videoId"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 611
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.streamType"

    const-string v4, "streamType"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 612
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playhead"

    const-string v4, "playhead"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 613
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "video.playerName"

    const-string v4, "playerName"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 614
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "ad.id"

    const-string v4, "adId"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 615
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "ad.length"

    const-string v4, "adLength"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 616
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "ad.position"

    const-string v4, "adPosition"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 617
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "ad.name"

    const-string v4, "adName"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 618
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "pod.name"

    const-string v4, "podName"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 619
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "pod.position"

    const-string v4, "podPosition"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 620
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "pod.startTime"

    const-string v4, "podSecond"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 621
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "player"

    const-string v3, "pod.playerName"

    const-string v4, "podPlayerName"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 622
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-heartbeat"

    const-string v3, "is_primetime"

    const-string v4, "isPrimetime"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 623
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "channel"

    const-string v4, "channel"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 624
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "userId.id"

    const-string v4, "dpid"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 625
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "puuid.id"

    const-string v4, "dpuuid"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 626
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "meta.video.*"

    const-string v4, "metaVideo"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 627
    new-instance v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const-string v2, "adobe-analytics"

    const-string v3, "meta.ad.*"

    const-string v4, "metaAd"

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 628
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v2, Lcom/adobe/primetime/core/Trigger;

    const-string v3, "player"

    const-string v4, "ad_start"

    invoke-direct {v2, v3, v4}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "handleAdStart"

    invoke-virtual {v1, v2, p0, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 630
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v1, Lcom/adobe/primetime/core/Trigger;

    const-string v2, "adobe-heartbeat"

    const-string v3, "error"

    invoke-direct {v1, v2, v3}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "handleHeartbeatPluginError"

    invoke-virtual {v0, v1, p0, v2, v5}, Lcom/adobe/primetime/core/plugin/PluginManager;->registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 631
    return-void
.end method

.method private _registerCommands()V
    .locals 3

    .prologue
    .line 585
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleVideoLoad"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_cmdVideoLoad:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 586
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleVideoStart"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_cmdVideoStart:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 587
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleAdStart"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_cmdAdStart:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 588
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "handleHeartbeatPluginError"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_cmdHeartbeatPluginError:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 589
    return-void
.end method

.method private _setupDataResolver()V
    .locals 3

    .prologue
    .line 446
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 448
    const-string v1, "rsid"

    new-instance v2, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$7;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$7;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 455
    const-string v1, "tracking_server"

    new-instance v2, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$8;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$8;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 462
    const-string v1, "ssl"

    new-instance v2, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$9;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$9;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    const-string v1, "vid"

    new-instance v2, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$10;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$10;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    const-string v1, "aid"

    new-instance v2, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$11;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$11;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 483
    const-string v1, "mid"

    new-instance v2, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$12;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$12;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 490
    const-string v1, "userId.id"

    new-instance v2, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$13;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$13;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 497
    const-string v1, "puuid.id"

    new-instance v2, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$14;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$14;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 504
    const-string v1, "channel"

    new-instance v2, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$15;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$15;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 511
    const-string v1, "meta"

    new-instance v2, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$16;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$16;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 559
    new-instance v1, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$17;

    invoke-direct {v1, p0, v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$17;-><init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;Ljava/util/Map;)V

    iput-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_dataResolver:Ljava/lang/Object;

    .line 582
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/va/ErrorInfo;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;

    return-object v0
.end method

.method static synthetic access$002(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;Lcom/adobe/primetime/va/ErrorInfo;)Lcom/adobe/primetime/va/ErrorInfo;
    .locals 0

    .prologue
    .line 41
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;

    return-object p1
.end method

.method static synthetic access$100(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_inputDataValidator:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_customMetadataKeys:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 41
    invoke-virtual {p0, p1, p2}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 41
    invoke-virtual {p0, p1, p2}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_config:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/Map;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_videoMetadata:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/Map;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_adMetadata:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/Map;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_chapterMetadata:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_onAppMeasurementReady()V

    return-void
.end method

.method static synthetic access$2300(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 41
    invoke-virtual {p0, p1, p2}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/core/ICallback;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_executeOpen:Lcom/adobe/primetime/core/ICallback;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/core/radio/CommandQueue;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_workQueue:Lcom/adobe/primetime/core/radio/CommandQueue;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$700(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/core/ICallback;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_executeOpenAd:Lcom/adobe/primetime/core/ICallback;

    return-object v0
.end method

.method static synthetic access$800(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 41
    invoke-virtual {p0, p1, p2}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$900(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginDelegate;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_delegate:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginDelegate;

    return-object v0
.end method


# virtual methods
.method protected _canProcess()Z
    .locals 3

    .prologue
    .line 201
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;

    if-eqz v0, :cond_0

    .line 202
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#_canProcess() > In ERROR state."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    const/4 v0, 0x0

    .line 206
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lcom/adobe/primetime/core/plugin/BasePlugin;->_canProcess()Z

    move-result v0

    goto :goto_0
.end method

.method public bootstrap(Lcom/adobe/primetime/core/plugin/PluginManager;)V
    .locals 0

    .prologue
    .line 183
    invoke-super {p0, p1}, Lcom/adobe/primetime/core/plugin/BasePlugin;->bootstrap(Lcom/adobe/primetime/core/plugin/PluginManager;)V

    .line 185
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_registerCommands()V

    .line 186
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_registerBehaviours()V

    .line 187
    return-void
.end method

.method public configure(Lcom/adobe/primetime/core/plugin/IPluginConfig;)V
    .locals 4

    .prologue
    .line 157
    if-nez p1, :cond_0

    .line 158
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the configuration data cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 161
    :cond_0
    const-class v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 162
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Expected config data to be instance of AdobeAnalyticsPluginConfig"

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 165
    :cond_1
    check-cast p1, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;

    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_config:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;

    .line 167
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_config:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;

    iget-boolean v0, v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;->debugLogging:Z

    if-eqz v0, :cond_2

    .line 168
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-interface {v0}, Lcom/adobe/primetime/core/ILogger;->enable()V

    .line 173
    :goto_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logTag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "#configure({trackingServer="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_config:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;

    iget-boolean v3, v3, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;->debugLogging:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", channel="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_config:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;->channel:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", ssl="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 176
    invoke-static {}, Lcom/adobe/mobile/MobileServices;->getUseSSL()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "})"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 173
    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    return-void

    .line 170
    :cond_2
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-interface {v0}, Lcom/adobe/primetime/core/ILogger;->disable()V

    goto :goto_0
.end method

.method public setAdMetadata(Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 139
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_adMetadata:Ljava/util/Map;

    .line 140
    return-void
.end method

.method public setChapterMetadata(Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 149
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_chapterMetadata:Ljava/util/Map;

    .line 150
    return-void
.end method

.method public setVideoMetadata(Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 129
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_videoMetadata:Ljava/util/Map;

    .line 130
    return-void
.end method

.method public setup()V
    .locals 0

    .prologue
    .line 192
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_prepareAppMeasurement()V

    .line 194
    invoke-super {p0}, Lcom/adobe/primetime/core/plugin/BasePlugin;->setup()V

    .line 195
    return-void
.end method
