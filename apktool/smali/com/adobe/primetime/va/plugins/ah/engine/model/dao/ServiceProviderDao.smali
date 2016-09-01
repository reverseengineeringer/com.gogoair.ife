.class public Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;
.super Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;
.source "SourceFile"


# static fields
.field private static final REALM:Ljava/lang/String; = "sp"

.field private static final UNKNOWN:Ljava/lang/String; = "unknown"


# instance fields
.field public _apiLevel:J

.field public _channel:Ljava/lang/String;

.field public _libVersion:Ljava/lang/String;

.field public _ovp:Ljava/lang/String;

.field public _playerName:Ljava/lang/String;

.field public _sdk:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;)V
    .locals 2

    .prologue
    .line 38
    const-string v0, "sp"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;-><init>(Ljava/lang/String;)V

    .line 40
    if-eqz p1, :cond_0

    .line 41
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->getOvp()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setOvp(Ljava/lang/String;)V

    .line 42
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->getSdk()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setSdk(Ljava/lang/String;)V

    .line 43
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->getChannel()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setChannel(Ljava/lang/String;)V

    .line 44
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->getPlayerName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setPlayerName(Ljava/lang/String;)V

    .line 45
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->getLibVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setLibVersion(Ljava/lang/String;)V

    .line 46
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->getApiLevel()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setApiLevel(J)V

    .line 55
    :goto_0
    return-void

    .line 48
    :cond_0
    const-string v0, "unknown"

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_ovp:Ljava/lang/String;

    .line 49
    const-string v0, "unknown"

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_sdk:Ljava/lang/String;

    .line 50
    const-string v0, "unknown"

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_channel:Ljava/lang/String;

    .line 51
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_playerName:Ljava/lang/String;

    .line 52
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_libVersion:Ljava/lang/String;

    .line 53
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_apiLevel:J

    goto :goto_0
.end method


# virtual methods
.method public getApiLevel()J
    .locals 2

    .prologue
    .line 103
    iget-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_apiLevel:J

    return-wide v0
.end method

.method public getChannel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_channel:Ljava/lang/String;

    return-object v0
.end method

.method public getLibVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_libVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getOvp()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_ovp:Ljava/lang/String;

    return-object v0
.end method

.method public getPlayerName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_playerName:Ljava/lang/String;

    return-object v0
.end method

.method public getSdk()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_sdk:Ljava/lang/String;

    return-object v0
.end method

.method public setApiLevel(J)V
    .locals 3

    .prologue
    .line 107
    iput-wide p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_apiLevel:J

    .line 108
    const-string v0, "hb_api_lvl"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 109
    return-void
.end method

.method public setChannel(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 80
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_channel:Ljava/lang/String;

    .line 81
    const-string v0, "channel"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 82
    return-void
.end method

.method public setLibVersion(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 98
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_libVersion:Ljava/lang/String;

    .line 99
    const-string v0, "hb_version"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 100
    return-void
.end method

.method public setOvp(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 62
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_ovp:Ljava/lang/String;

    .line 63
    const-string v0, "ovp"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 64
    return-void
.end method

.method public setPlayerName(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 89
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_playerName:Ljava/lang/String;

    .line 90
    const-string v0, "player_name"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 91
    return-void
.end method

.method public setSdk(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 71
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->_sdk:Ljava/lang/String;

    .line 72
    const-string v0, "sdk"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 73
    return-void
.end method
