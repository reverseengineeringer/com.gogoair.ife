.class public Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private _adobeAnalyticsData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;

.field private _assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

.field private _callback:Lcom/adobe/primetime/core/ICallback;

.field private _cuserData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

.field private _eventData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

.field private _meta:Ljava/lang/Object;

.field private _qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

.field private _serviceProviderData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;

.field private _sessionData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

.field private _streamData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;

.field private _userData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V
    .locals 2

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;

    invoke-direct {v0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_adobeAnalyticsData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;

    .line 40
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;

    invoke-direct {v0, p2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_userData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;

    .line 41
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

    invoke-virtual {p5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getCUserDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_cuserData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

    .line 42
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;

    invoke-direct {v0, p3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_serviceProviderData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;

    .line 43
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

    invoke-direct {v0, p4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_sessionData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

    .line 44
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    invoke-virtual {p5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_eventData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    .line 45
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    invoke-virtual {p5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getAssetDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    .line 46
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;

    invoke-virtual {p5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getStreamDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_streamData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;

    .line 47
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    invoke-virtual {p5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    .line 48
    invoke-virtual {p5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getMeta()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_meta:Ljava/lang/Object;

    .line 49
    invoke-virtual {p5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getCallback()Lcom/adobe/primetime/core/ICallback;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_callback:Lcom/adobe/primetime/core/ICallback;

    .line 50
    return-void
.end method


# virtual methods
.method public getAdobeAnalyticsData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_adobeAnalyticsData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;

    return-object v0
.end method

.method public getAssetData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    return-object v0
.end method

.method public getCUserData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_cuserData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

    return-object v0
.end method

.method public getCallback()Lcom/adobe/primetime/core/ICallback;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_callback:Lcom/adobe/primetime/core/ICallback;

    return-object v0
.end method

.method public getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_eventData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    return-object v0
.end method

.method public getMeta()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_meta:Ljava/lang/Object;

    return-object v0
.end method

.method public getQosData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    return-object v0
.end method

.method public getServiceProviderData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_serviceProviderData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;

    return-object v0
.end method

.method public getSessionData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_sessionData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

    return-object v0
.end method

.method public getStreamData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_streamData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;

    return-object v0
.end method

.method public getUserData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->_userData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;

    return-object v0
.end method
