.class Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final CLOCK_SERVICE:Ljava/lang/String; = "service.clock"

.field private static final CMD_CREATE:Ljava/lang/String; = "create"

.field private static final CMD_DESTROY:Ljava/lang/String; = "destroy"

.field private static final CMD_PAUSE:Ljava/lang/String; = "pause"

.field private static final CMD_RESUME:Ljava/lang/String; = "resume"

.field private static final HEARTBEAT_PLUGIN:Ljava/lang/String; = "heartbeat"

.field protected static final KEY_INTERVAL:Ljava/lang/String; = "interval"

.field protected static final KEY_NAME:Ljava/lang/String; = "name"

.field protected static final KEY_RESET:Ljava/lang/String; = "reset"

.field private static final REQ_TIMER_IS_PAUSED:Ljava/lang/String; = "is_paused"


# instance fields
.field protected _channel:Lcom/adobe/primetime/core/radio/Channel;

.field private _cmdPause:Lcom/adobe/primetime/core/ICallback;

.field private _cmdResume:Lcom/adobe/primetime/core/ICallback;

.field protected _interval:Ljava/lang/Double;

.field private _isDestroyed:Z

.field protected _logTag:Ljava/lang/String;

.field protected _logger:Lcom/adobe/primetime/core/ILogger;

.field protected _name:Ljava/lang/String;

.field private _onTick:Lcom/adobe/primetime/core/ICallback;

.field protected _pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/core/plugin/PluginManager;Lcom/adobe/primetime/core/radio/Channel;Ljava/lang/String;DLcom/adobe/primetime/core/ILogger;)V
    .locals 2

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 145
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer$1;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer$1;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_cmdResume:Lcom/adobe/primetime/core/ICallback;

    .line 162
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer$2;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer$2;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_cmdPause:Lcom/adobe/primetime/core/ICallback;

    .line 179
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer$3;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer$3;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_onTick:Lcom/adobe/primetime/core/ICallback;

    .line 60
    if-nez p2, :cond_0

    .line 61
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the channel object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    :cond_0
    iput-object p2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    .line 65
    if-nez p1, :cond_1

    .line 66
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the pluginManager object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 68
    :cond_1
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    .line 70
    if-nez p6, :cond_2

    .line 71
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the logger object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_2
    iput-object p6, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_logger:Lcom/adobe/primetime/core/ILogger;

    .line 74
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_logTag:Ljava/lang/String;

    .line 76
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_isDestroyed:Z

    .line 79
    invoke-direct {p0, p3, p4, p5}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_createTimer(Ljava/lang/String;D)V

    .line 81
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_installHandlers()V

    .line 82
    return-void
.end method

.method private _createTimer(Ljava/lang/String;D)V
    .locals 4

    .prologue
    .line 207
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_name:Ljava/lang/String;

    .line 208
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_interval:Ljava/lang/Double;

    .line 210
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 211
    const-string v1, "name"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "heartbeat."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    const-string v1, "interval"

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_interval:Ljava/lang/Double;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v2, "service.clock"

    const-string v3, "create"

    invoke-virtual {v1, v2, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->command(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 214
    return-void
.end method

.method private _installHandlers()V
    .locals 4

    .prologue
    .line 195
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "clock:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".resume"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_cmdResume:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/primetime/core/radio/Channel;->comply(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 196
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "clock:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".pause"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_cmdPause:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/primetime/core/radio/Channel;->comply(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 198
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "service.clock"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "heartbeat."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".tick"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_onTick:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/adobe/primetime/core/plugin/PluginManager;->on(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 199
    return-void
.end method

.method private _uninstallHandlers()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 202
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_channel:Lcom/adobe/primetime/core/radio/Channel;

    invoke-virtual {v0, v1, v1, p0}, Lcom/adobe/primetime/core/radio/Channel;->off(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 203
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    invoke-virtual {v0, v1, v1, v1, p0}, Lcom/adobe/primetime/core/plugin/PluginManager;->off(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 204
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 4

    .prologue
    .line 106
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_isDestroyed:Z

    if-eqz v0, :cond_0

    .line 115
    :goto_0
    return-void

    .line 107
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_isDestroyed:Z

    .line 109
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_uninstallHandlers()V

    .line 112
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 113
    const-string v1, "name"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "heartbeat."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v2, "service.clock"

    const-string v3, "destroy"

    invoke-virtual {v1, v2, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->command(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public pause(Ljava/lang/Boolean;)V
    .locals 4

    .prologue
    .line 97
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_logTag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Stopping timer: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 100
    const-string v1, "name"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "heartbeat."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    const-string v1, "reset"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v2, "service.clock"

    const-string v3, "pause"

    invoke-virtual {v1, v2, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->command(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 103
    return-void
.end method

.method public resume(Ljava/lang/Boolean;)V
    .locals 4

    .prologue
    .line 88
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_logTag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Starting timer: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 91
    const-string v1, "name"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "heartbeat."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const-string v1, "reset"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v2, "service.clock"

    const-string v3, "resume"

    invoke-virtual {v1, v2, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->command(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 94
    return-void
.end method

.method setInterval(D)V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "is_paused.heartbeat."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 124
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 125
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v3, "service.clock"

    invoke-virtual {v2, v3, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->request(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 131
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->pause(Ljava/lang/Boolean;)V

    .line 134
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_name:Ljava/lang/String;

    invoke-direct {p0, v1, p1, p2}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->_createTimer(Ljava/lang/String;D)V

    .line 137
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 138
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->resume(Ljava/lang/Boolean;)V

    .line 140
    :cond_0
    return-void
.end method
