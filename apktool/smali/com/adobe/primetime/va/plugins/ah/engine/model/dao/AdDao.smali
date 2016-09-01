.class public Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;
.super Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;
.source "SourceFile"


# static fields
.field private static final REALM:Ljava/lang/String; = "asset"


# instance fields
.field private _adId:Ljava/lang/String;

.field private _adLength:D

.field private _adName:Ljava/lang/String;

.field private _podId:Ljava/lang/String;

.field private _podName:Ljava/lang/String;

.field private _podOffset:D

.field private _podPosition:Ljava/lang/String;

.field private _resolver:Ljava/lang/String;

.field private _sid:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;)V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 41
    const-string v0, "asset"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;-><init>(Ljava/lang/String;)V

    .line 43
    if-eqz p1, :cond_0

    .line 44
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->getAdId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setAdId(Ljava/lang/String;)V

    .line 45
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->getAdName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setAdName(Ljava/lang/String;)V

    .line 46
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->getAdLength()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setAdLength(D)V

    .line 47
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->getSid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setSid(Ljava/lang/String;)V

    .line 48
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->getResolver()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setResolver(Ljava/lang/String;)V

    .line 49
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->getPodId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setPodId(Ljava/lang/String;)V

    .line 50
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->getPodPosition()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setPodPosition(Ljava/lang/String;)V

    .line 51
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->getPodOffset()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setPodOffset(D)V

    .line 52
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->getPodName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setPodName(Ljava/lang/String;)V

    .line 64
    :goto_0
    return-void

    .line 54
    :cond_0
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_adId:Ljava/lang/String;

    .line 55
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_adName:Ljava/lang/String;

    .line 56
    iput-wide v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_adLength:D

    .line 57
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_sid:Ljava/lang/String;

    .line 58
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_podId:Ljava/lang/String;

    .line 59
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_podPosition:Ljava/lang/String;

    .line 60
    iput-wide v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_podOffset:D

    .line 61
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_podName:Ljava/lang/String;

    .line 62
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_resolver:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public getAdId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_adId:Ljava/lang/String;

    return-object v0
.end method

.method public getAdLength()D
    .locals 2

    .prologue
    .line 76
    iget-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_adLength:D

    return-wide v0
.end method

.method public getAdName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_adName:Ljava/lang/String;

    return-object v0
.end method

.method public getPodId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_podId:Ljava/lang/String;

    return-object v0
.end method

.method public getPodName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_podName:Ljava/lang/String;

    return-object v0
.end method

.method public getPodOffset()D
    .locals 2

    .prologue
    .line 112
    iget-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_podOffset:D

    return-wide v0
.end method

.method public getPodPosition()Ljava/lang/String;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_podPosition:Ljava/lang/String;

    return-object v0
.end method

.method public getResolver()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_resolver:Ljava/lang/String;

    return-object v0
.end method

.method public getSid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_sid:Ljava/lang/String;

    return-object v0
.end method

.method public setAdId(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 71
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_adId:Ljava/lang/String;

    .line 72
    const-string v0, "ad_id"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 73
    return-void
.end method

.method public setAdLength(D)V
    .locals 3

    .prologue
    .line 80
    iput-wide p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_adLength:D

    .line 81
    const-string v0, "ad_length"

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 82
    return-void
.end method

.method public setAdName(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 89
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_adName:Ljava/lang/String;

    .line 90
    const-string v0, "ad_name"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 91
    return-void
.end method

.method public setPodId(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 134
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_podId:Ljava/lang/String;

    .line 135
    const-string v0, "pod_id"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 136
    return-void
.end method

.method public setPodName(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 125
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_podName:Ljava/lang/String;

    .line 126
    const-string v0, "pod_name"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 127
    return-void
.end method

.method public setPodOffset(D)V
    .locals 5

    .prologue
    .line 116
    iput-wide p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_podOffset:D

    .line 117
    const-string v0, "pod_offset"

    iget-wide v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_podOffset:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 118
    return-void
.end method

.method public setPodPosition(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 143
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_podPosition:Ljava/lang/String;

    .line 144
    const-string v0, "pod_position"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 145
    return-void
.end method

.method public setResolver(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 107
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_resolver:Ljava/lang/String;

    .line 108
    const-string v0, "resolver"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 109
    return-void
.end method

.method public setSid(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 98
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->_sid:Ljava/lang/String;

    .line 99
    const-string v0, "ad_sid"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 100
    return-void
.end method
