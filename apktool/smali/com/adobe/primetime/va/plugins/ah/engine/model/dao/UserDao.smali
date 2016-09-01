.class public Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;
.super Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;
.source "SourceFile"


# static fields
.field private static final REALM:Ljava/lang/String; = "user"


# instance fields
.field private _analyticsVisitorId:Ljava/lang/String;

.field private _marketingCloudVisitorId:Ljava/lang/String;

.field private _visitorId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;)V

    .line 31
    return-void
.end method

.method public constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;)V
    .locals 1

    .prologue
    .line 34
    const-string v0, "user"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;-><init>(Ljava/lang/String;)V

    .line 36
    if-eqz p1, :cond_0

    .line 37
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->getVisitorId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->setVisitorId(Ljava/lang/String;)V

    .line 38
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->getAnalyticsVisitorId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->setAnalyticsVisitorId(Ljava/lang/String;)V

    .line 39
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->getMarketingCloudVisitorId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->setMarketingCloudVisitorId(Ljava/lang/String;)V

    .line 46
    :goto_0
    return-void

    .line 42
    :cond_0
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->_visitorId:Ljava/lang/String;

    .line 43
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->_analyticsVisitorId:Ljava/lang/String;

    .line 44
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->_marketingCloudVisitorId:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public getAnalyticsVisitorId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->_analyticsVisitorId:Ljava/lang/String;

    return-object v0
.end method

.method public getMarketingCloudVisitorId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->_marketingCloudVisitorId:Ljava/lang/String;

    return-object v0
.end method

.method public getVisitorId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->_visitorId:Ljava/lang/String;

    return-object v0
.end method

.method public setAnalyticsVisitorId(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 62
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->_analyticsVisitorId:Ljava/lang/String;

    .line 63
    const-string v0, "aid"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 64
    return-void
.end method

.method public setMarketingCloudVisitorId(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 71
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->_marketingCloudVisitorId:Ljava/lang/String;

    .line 72
    const-string v0, "mid"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 73
    return-void
.end method

.method public setVisitorId(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 53
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->_visitorId:Ljava/lang/String;

    .line 54
    const-string v0, "id"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 55
    return-void
.end method
