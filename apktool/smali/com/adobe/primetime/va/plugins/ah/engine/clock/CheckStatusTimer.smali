.class public final Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;
.super Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;
.source "SourceFile"


# static fields
.field private static final DEFAULT_CHECK_STATUS_INTERVAL:D = 60.0

.field private static final EVENT_CLOCK_CHECK_STATUS_GET_SETTINGS:Ljava/lang/String; = "clock:check_status.get_settings"

.field private static final EVENT_CLOCK_CHECK_STATUS_TICK:Ljava/lang/String; = "clock:check_status.tick"

.field private static final EVENT_NET_CHECK_STATUS_COMPLETE:Ljava/lang/String; = "net:check_status_complete"

.field private static final KEY_CHECK_STATUS_INTERVAL:Ljava/lang/String; = "check_status_interval"

.field private static final MAXIMUM_CHECK_STATUS_INTERVAL:D = 600.0

.field private static final NAME:Ljava/lang/String; = "check_status"


# instance fields
.field private final _getSettings:Lcom/adobe/primetime/core/ICallback;

.field private final _onCheckStatusComplete:Lcom/adobe/primetime/core/ICallback;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/core/plugin/PluginManager;Lcom/adobe/primetime/core/radio/Channel;Lcom/adobe/primetime/core/ILogger;)V
    .locals 7

    .prologue
    .line 42
    const-string v3, "check_status"

    const-wide/high16 v4, 0x404e000000000000L    # 60.0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;-><init>(Lcom/adobe/primetime/core/plugin/PluginManager;Lcom/adobe/primetime/core/radio/Channel;Ljava/lang/String;DLcom/adobe/primetime/core/ILogger;)V

    .line 54
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer$1;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer$1;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;->_onCheckStatusComplete:Lcom/adobe/primetime/core/ICallback;

    .line 88
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer$2;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer$2;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;->_getSettings:Lcom/adobe/primetime/core/ICallback;

    .line 48
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;->installHandlers()V

    .line 49
    return-void
.end method

.method private installHandlers()V
    .locals 3

    .prologue
    .line 105
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "clock:check_status.get_settings"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;->_getSettings:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 106
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "net:check_status_complete"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;->_onCheckStatusComplete:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, p0}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 107
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    const-string v1, "check_status_interval"

    new-instance v2, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer$3;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer$3;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/primetime/core/radio/Channel;->reply(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 113
    return-void
.end method


# virtual methods
.method public bridge synthetic destroy()V
    .locals 0

    .prologue
    .line 29
    invoke-super {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->destroy()V

    return-void
.end method

.method public bridge synthetic pause(Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 29
    invoke-super {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->pause(Ljava/lang/Boolean;)V

    return-void
.end method

.method public bridge synthetic resume(Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 29
    invoke-super {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->resume(Ljava/lang/Boolean;)V

    return-void
.end method
