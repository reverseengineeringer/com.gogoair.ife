.class public Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;
.super Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;
.source "SourceFile"


# static fields
.field private static final REALM:Ljava/lang/String; = "sc"


# instance fields
.field private _reportSuiteId:Ljava/lang/String;

.field private _ssl:Ljava/lang/Boolean;

.field private _trackingServer:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;)V

    .line 31
    return-void
.end method

.method public constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;)V
    .locals 1

    .prologue
    .line 34
    const-string v0, "sc"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;-><init>(Ljava/lang/String;)V

    .line 36
    if-eqz p1, :cond_0

    .line 37
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->getReportSuiteId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->setReportSuiteId(Ljava/lang/String;)V

    .line 38
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->getTrackingServer()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->setTrackingServer(Ljava/lang/String;)V

    .line 39
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->getSsl()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->setSsl(Ljava/lang/Boolean;)V

    .line 45
    :goto_0
    return-void

    .line 41
    :cond_0
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->_reportSuiteId:Ljava/lang/String;

    .line 42
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->_trackingServer:Ljava/lang/String;

    .line 43
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->_ssl:Ljava/lang/Boolean;

    goto :goto_0
.end method


# virtual methods
.method public getReportSuiteId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->_reportSuiteId:Ljava/lang/String;

    return-object v0
.end method

.method public getSsl()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->_ssl:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getTrackingServer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->_trackingServer:Ljava/lang/String;

    return-object v0
.end method

.method public setReportSuiteId(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 52
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->_reportSuiteId:Ljava/lang/String;

    .line 53
    const-string v0, "rsid"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 54
    return-void
.end method

.method public setSsl(Ljava/lang/Boolean;)V
    .locals 2

    .prologue
    .line 70
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->_ssl:Ljava/lang/Boolean;

    .line 71
    const-string v0, "ssl"

    sget-object v1, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;->SHORT:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 72
    return-void
.end method

.method public setTrackingServer(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 61
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->_trackingServer:Ljava/lang/String;

    .line 62
    const-string v0, "tracking_server"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 63
    return-void
.end method
