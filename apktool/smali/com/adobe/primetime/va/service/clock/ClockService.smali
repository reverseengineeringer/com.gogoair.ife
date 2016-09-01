.class public Lcom/adobe/primetime/va/service/clock/ClockService;
.super Lcom/adobe/primetime/core/plugin/BasePlugin;
.source "SourceFile"


# static fields
.field private static final CMD_CREATE:Ljava/lang/String; = "create"

.field private static final CMD_DESTROY:Ljava/lang/String; = "destroy"

.field private static final CMD_PAUSE:Ljava/lang/String; = "pause"

.field private static final CMD_RESUME:Ljava/lang/String; = "resume"

.field private static final KEY_INTERVAL:Ljava/lang/String; = "interval"

.field private static final KEY_NAME:Ljava/lang/String; = "name"

.field private static final KEY_REPEAT_COUNT:Ljava/lang/String; = "repeat_count"

.field private static final KEY_RESET:Ljava/lang/String; = "reset"

.field private static final KEY_TICK:Ljava/lang/String; = "tick"

.field private static final NAME:Ljava/lang/String; = "service.clock"

.field private static final REPEAT_FOREVER:I = -0x1

.field private static final REQ_IS_PAUSED:Ljava/lang/String; = "is_paused"


# instance fields
.field private _cmdCreate:Lcom/adobe/primetime/core/ICallback;

.field private _cmdDestroy:Lcom/adobe/primetime/core/ICallback;

.field private _cmdPause:Lcom/adobe/primetime/core/ICallback;

.field private _cmdResume:Lcom/adobe/primetime/core/ICallback;

.field private _timerManager:Lcom/adobe/primetime/va/service/clock/TimerManager;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/core/ILogger;)V
    .locals 2

    .prologue
    .line 52
    const-string v0, "service.clock"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/core/plugin/BasePlugin;-><init>(Ljava/lang/String;)V

    .line 87
    new-instance v0, Lcom/adobe/primetime/va/service/clock/ClockService$1;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/service/clock/ClockService$1;-><init>(Lcom/adobe/primetime/va/service/clock/ClockService;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_cmdCreate:Lcom/adobe/primetime/core/ICallback;

    .line 99
    new-instance v0, Lcom/adobe/primetime/va/service/clock/ClockService$2;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/service/clock/ClockService$2;-><init>(Lcom/adobe/primetime/va/service/clock/ClockService;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_cmdPause:Lcom/adobe/primetime/core/ICallback;

    .line 107
    new-instance v0, Lcom/adobe/primetime/va/service/clock/ClockService$3;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/service/clock/ClockService$3;-><init>(Lcom/adobe/primetime/va/service/clock/ClockService;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_cmdResume:Lcom/adobe/primetime/core/ICallback;

    .line 115
    new-instance v0, Lcom/adobe/primetime/va/service/clock/ClockService$4;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/service/clock/ClockService$4;-><init>(Lcom/adobe/primetime/va/service/clock/ClockService;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_cmdDestroy:Lcom/adobe/primetime/core/ICallback;

    .line 54
    if-nez p1, :cond_0

    .line 55
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the logger cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 57
    :cond_0
    iput-object p1, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_logger:Lcom/adobe/primetime/core/ILogger;

    .line 59
    new-instance v0, Lcom/adobe/primetime/va/service/clock/TimerManager;

    iget-object v1, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-direct {v0, p0, v1}, Lcom/adobe/primetime/va/service/clock/TimerManager;-><init>(Lcom/adobe/primetime/va/service/clock/ClockService;Lcom/adobe/primetime/core/ILogger;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_timerManager:Lcom/adobe/primetime/va/service/clock/TimerManager;

    .line 61
    invoke-direct {p0}, Lcom/adobe/primetime/va/service/clock/ClockService;->_setupDataResolver()V

    .line 62
    return-void
.end method

.method private _setupDataResolver()V
    .locals 3

    .prologue
    .line 140
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 141
    const-string v1, "is_paused"

    new-instance v2, Lcom/adobe/primetime/va/service/clock/ClockService$5;

    invoke-direct {v2, p0}, Lcom/adobe/primetime/va/service/clock/ClockService$5;-><init>(Lcom/adobe/primetime/va/service/clock/ClockService;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    new-instance v1, Lcom/adobe/primetime/va/service/clock/ClockService$6;

    invoke-direct {v1, p0, v0}, Lcom/adobe/primetime/va/service/clock/ClockService$6;-><init>(Lcom/adobe/primetime/va/service/clock/ClockService;Ljava/util/Map;)V

    iput-object v1, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_dataResolver:Ljava/lang/Object;

    .line 172
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/primetime/va/service/clock/ClockService;)Lcom/adobe/primetime/va/service/clock/TimerManager;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_timerManager:Lcom/adobe/primetime/va/service/clock/TimerManager;

    return-object v0
.end method


# virtual methods
.method protected _teardown()V
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_timerManager:Lcom/adobe/primetime/va/service/clock/TimerManager;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/service/clock/TimerManager;->destroy()V

    .line 82
    return-void
.end method

.method public bootstrap(Lcom/adobe/primetime/core/plugin/PluginManager;)V
    .locals 3

    .prologue
    .line 67
    invoke-super {p0, p1}, Lcom/adobe/primetime/core/plugin/BasePlugin;->bootstrap(Lcom/adobe/primetime/core/plugin/PluginManager;)V

    .line 70
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "create"

    iget-object v2, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_cmdCreate:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 71
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "resume"

    iget-object v2, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_cmdResume:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 72
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "pause"

    iget-object v2, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_cmdPause:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 73
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    const-string v1, "destroy"

    iget-object v2, p0, Lcom/adobe/primetime/va/service/clock/ClockService;->_cmdDestroy:Lcom/adobe/primetime/core/ICallback;

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 74
    return-void
.end method

.method onTick(Ljava/lang/String;DI)V
    .locals 4

    .prologue
    .line 127
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".tick"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 128
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 129
    const-string v2, "name"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    const-string v2, "interval"

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    const-string v2, "tick"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/service/clock/ClockService;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    .line 133
    return-void
.end method
