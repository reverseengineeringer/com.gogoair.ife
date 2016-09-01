.class public Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;
.super Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;
.source "SourceFile"


# static fields
.field private static final REALM:Ljava/lang/String; = "cuser"


# instance fields
.field private _dpid:Ljava/lang/String;

.field private _dpuuid:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;)V
    .locals 1

    .prologue
    .line 33
    const-string v0, "cuser"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;-><init>(Ljava/lang/String;)V

    .line 35
    if-eqz p1, :cond_0

    .line 36
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;->getDpid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;->setDpid(Ljava/lang/String;)V

    .line 37
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;->getDpuuid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;->setDpuuid(Ljava/lang/String;)V

    .line 43
    :goto_0
    return-void

    .line 40
    :cond_0
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;->_dpid:Ljava/lang/String;

    .line 41
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;->_dpuuid:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public getDpid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;->_dpid:Ljava/lang/String;

    return-object v0
.end method

.method public getDpuuid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;->_dpuuid:Ljava/lang/String;

    return-object v0
.end method

.method public setDpid(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 50
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;->_dpid:Ljava/lang/String;

    .line 51
    const-string v0, "userId.id"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 52
    return-void
.end method

.method public setDpuuid(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 59
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;->_dpuuid:Ljava/lang/String;

    .line 60
    const-string v0, "puuid.id"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 61
    return-void
.end method
