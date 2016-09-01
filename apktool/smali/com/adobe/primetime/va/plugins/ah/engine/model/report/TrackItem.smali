.class public final Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private _assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

.field private _callback:Lcom/adobe/primetime/core/ICallback;

.field private _cuserData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

.field private _eventData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

.field private _meta:Ljava/lang/Object;

.field private _qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

.field private _streamData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Ljava/lang/String;DLjava/lang/Object;Lcom/adobe/primetime/core/ICallback;)V
    .locals 5

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_eventData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    .line 43
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_eventData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    invoke-virtual {v0, p2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setType(Ljava/lang/String;)V

    .line 44
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_eventData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setDuration(J)V

    .line 45
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_eventData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setTs(J)V

    .line 46
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_eventData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    invoke-virtual {v0, p3, p4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setPlayhead(D)V

    .line 48
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    iget-object v1, p1, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    invoke-direct {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    .line 49
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;

    iget-object v1, p1, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_streamData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;

    invoke-direct {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_streamData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;

    .line 50
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    iget-object v1, p1, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    invoke-direct {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    .line 51
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

    iget-object v1, p1, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_cuserData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

    invoke-direct {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_cuserData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

    .line 52
    iput-object p5, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_meta:Ljava/lang/Object;

    .line 53
    iput-object p6, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_callback:Lcom/adobe/primetime/core/ICallback;

    .line 54
    return-void
.end method


# virtual methods
.method public getAssetDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_assetData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    return-object v0
.end method

.method public getCUserDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_cuserData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

    return-object v0
.end method

.method public getCallback()Lcom/adobe/primetime/core/ICallback;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_callback:Lcom/adobe/primetime/core/ICallback;

    return-object v0
.end method

.method public getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_eventData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    return-object v0
.end method

.method public getMeta()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_meta:Ljava/lang/Object;

    return-object v0
.end method

.method public getQoSDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_qosData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    return-object v0
.end method

.method public getStreamDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->_streamData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;

    return-object v0
.end method
