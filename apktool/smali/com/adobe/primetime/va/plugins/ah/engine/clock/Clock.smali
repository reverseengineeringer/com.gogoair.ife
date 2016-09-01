.class public final Lcom/adobe/primetime/va/plugins/ah/engine/clock/Clock;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private _checkStatusTimer:Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;

.field private _flushFilterTimer:Lcom/adobe/primetime/va/plugins/ah/engine/clock/FlushFilterTimer;

.field private _isDestroyed:Z

.field private _reportingTimer:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/core/plugin/PluginManager;Lcom/adobe/primetime/core/radio/Channel;Lcom/adobe/primetime/core/ILogger;)V
    .locals 2

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    if-nez p1, :cond_0

    .line 34
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the pluginManger object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_0
    if-nez p2, :cond_1

    .line 38
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the channel object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_1
    if-nez p3, :cond_2

    .line 42
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the logger object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Clock;->_isDestroyed:Z

    .line 48
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    invoke-direct {v0, p1, p2, p3}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;-><init>(Lcom/adobe/primetime/core/plugin/PluginManager;Lcom/adobe/primetime/core/radio/Channel;Lcom/adobe/primetime/core/ILogger;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Clock;->_reportingTimer:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    .line 49
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/FlushFilterTimer;

    invoke-direct {v0, p1, p2, p3}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/FlushFilterTimer;-><init>(Lcom/adobe/primetime/core/plugin/PluginManager;Lcom/adobe/primetime/core/radio/Channel;Lcom/adobe/primetime/core/ILogger;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Clock;->_flushFilterTimer:Lcom/adobe/primetime/va/plugins/ah/engine/clock/FlushFilterTimer;

    .line 50
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;

    invoke-direct {v0, p1, p2, p3}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;-><init>(Lcom/adobe/primetime/core/plugin/PluginManager;Lcom/adobe/primetime/core/radio/Channel;Lcom/adobe/primetime/core/ILogger;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Clock;->_checkStatusTimer:Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;

    .line 52
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .prologue
    .line 55
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Clock;->_isDestroyed:Z

    if-eqz v0, :cond_0

    .line 61
    :goto_0
    return-void

    .line 56
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Clock;->_isDestroyed:Z

    .line 58
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Clock;->_reportingTimer:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->destroy()V

    .line 59
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Clock;->_checkStatusTimer:Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;->destroy()V

    .line 60
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Clock;->_flushFilterTimer:Lcom/adobe/primetime/va/plugins/ah/engine/clock/FlushFilterTimer;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/FlushFilterTimer;->destroy()V

    goto :goto_0
.end method
