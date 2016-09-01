.class public Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private _context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

.field private _logTag:Ljava/lang/String;

.field private _logger:Lcom/adobe/primetime/core/ILogger;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;Lcom/adobe/primetime/core/ILogger;)V
    .locals 2

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    if-nez p2, :cond_0

    .line 15
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the logger object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 17
    :cond_0
    const-class v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;->_logTag:Ljava/lang/String;

    .line 18
    iput-object p2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;->_logger:Lcom/adobe/primetime/core/ILogger;

    .line 20
    if-nez p1, :cond_1

    .line 21
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the context object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 23
    :cond_1
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    .line 24
    return-void
.end method


# virtual methods
.method public createReportForItem(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;
    .locals 6

    .prologue
    .line 27
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;->_logTag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Creating report for item: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;->getEventDao()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v1, v1, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_adobeAnalyticsData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v2, v2, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_userData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v3, v3, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_serviceProviderData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;

    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/ReportFactory;->_context:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v4, v4, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_sessionData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;Lcom/adobe/primetime/va/plugins/ah/engine/model/report/TrackItem;)V

    .line 35
    return-object v0
.end method
