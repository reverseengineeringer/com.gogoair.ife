.class public final Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;
.super Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;
.source "SourceFile"


# static fields
.field private static final DEFAULT_REPORT_INTERVAL:D = 10.0

.field private static final EVENT_NET_CHECK_STATUS_COMPLETE:Ljava/lang/String; = "net:check_status_complete"

.field private static final KEY_REPORTING_INTERVAL:Ljava/lang/String; = "reporting_interval"

.field private static final NAME:Ljava/lang/String; = "reporting"


# instance fields
.field private final _onCheckStatusComplete:Lcom/adobe/primetime/core/ICallback;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/core/plugin/PluginManager;Lcom/adobe/primetime/core/radio/Channel;Lcom/adobe/primetime/core/ILogger;)V
    .locals 7

    .prologue
    .line 42
    const-string v3, "reporting"

    const-wide/high16 v4, 0x4024000000000000L    # 10.0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;-><init>(Lcom/adobe/primetime/core/plugin/PluginManager;Lcom/adobe/primetime/core/radio/Channel;Ljava/lang/String;DLcom/adobe/primetime/core/ILogger;)V

    .line 50
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$1;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$1;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->_onCheckStatusComplete:Lcom/adobe/primetime/core/ICallback;

    .line 43
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->installHandlers()V

    .line 44
    return-void
.end method

.method private installHandlers()V
    .locals 3

    .prologue
    .line 84
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "net:check_status_complete"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->_onCheckStatusComplete:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 85
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "reporting_interval"

    new-instance v2, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$2;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$2;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/primetime/core/radio/Channel;->reply(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 91
    return-void
.end method


# virtual methods
.method public bridge synthetic destroy()V
    .locals 0

    .prologue
    .line 30
    invoke-super {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->destroy()V

    return-void
.end method

.method public bridge synthetic pause(Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 30
    invoke-super {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->pause(Ljava/lang/Boolean;)V

    return-void
.end method

.method public bridge synthetic resume(Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 30
    invoke-super {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->resume(Ljava/lang/Boolean;)V

    return-void
.end method
