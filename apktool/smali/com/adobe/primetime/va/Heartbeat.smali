.class public Lcom/adobe/primetime/va/Heartbeat;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final ADOBE_ANALYTICS_PLUGIN:Ljava/lang/String; = "adobe-analytics"

.field private static final ADOBE_HEARTBEAT_PLUGIN:Ljava/lang/String; = "adobe-heartbeat"

.field private static final PLAYER_PLUGIN:Ljava/lang/String; = "player"


# instance fields
.field private _isDestroyed:Z

.field private _logTag:Ljava/lang/String;

.field private _logger:Lcom/adobe/primetime/core/ILogger;

.field private _pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/va/HeartbeatDelegate;)V
    .locals 1

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/primetime/va/Heartbeat;-><init>(Lcom/adobe/primetime/va/HeartbeatDelegate;Ljava/util/List;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lcom/adobe/primetime/va/HeartbeatDelegate;Ljava/util/List;)V
    .locals 3

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const-class v0, Lcom/adobe/primetime/va/Heartbeat;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/va/Heartbeat;->_logTag:Ljava/lang/String;

    .line 63
    new-instance v0, Lcom/adobe/primetime/core/Logger;

    invoke-direct {v0}, Lcom/adobe/primetime/core/Logger;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/Heartbeat;->_logger:Lcom/adobe/primetime/core/ILogger;

    .line 66
    new-instance v0, Lcom/adobe/primetime/core/plugin/PluginManager;

    iget-object v1, p0, Lcom/adobe/primetime/va/Heartbeat;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-direct {v0, v1}, Lcom/adobe/primetime/core/plugin/PluginManager;-><init>(Lcom/adobe/primetime/core/ILogger;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/Heartbeat;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    .line 69
    iget-object v0, p0, Lcom/adobe/primetime/va/Heartbeat;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v1, Lcom/adobe/primetime/va/service/clock/ClockService;

    iget-object v2, p0, Lcom/adobe/primetime/va/Heartbeat;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-direct {v1, v2}, Lcom/adobe/primetime/va/service/clock/ClockService;-><init>(Lcom/adobe/primetime/core/ILogger;)V

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/plugin/PluginManager;->addPlugin(Lcom/adobe/primetime/core/plugin/IPlugin;)V

    .line 72
    if-eqz p2, :cond_0

    .line 77
    new-instance v0, Lcom/adobe/primetime/va/Heartbeat$1;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/Heartbeat$1;-><init>(Lcom/adobe/primetime/va/Heartbeat;)V

    invoke-static {p2, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 101
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/plugin/IPlugin;

    .line 102
    iget-object v2, p0, Lcom/adobe/primetime/va/Heartbeat;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    invoke-virtual {v2, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->addPlugin(Lcom/adobe/primetime/core/plugin/IPlugin;)V

    goto :goto_0

    .line 108
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/va/Heartbeat;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    invoke-virtual {v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->setupPlugins()V

    .line 110
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/primetime/va/Heartbeat;->_isDestroyed:Z

    .line 111
    return-void
.end method


# virtual methods
.method public declared-synchronized configure(Lcom/adobe/primetime/va/HeartbeatConfig;)V
    .locals 3

    .prologue
    .line 124
    monitor-enter p0

    if-nez p1, :cond_0

    .line 125
    :try_start_0
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Configuration object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 128
    :cond_0
    :try_start_1
    iget-boolean v0, p1, Lcom/adobe/primetime/va/HeartbeatConfig;->debugLogging:Z

    if-eqz v0, :cond_2

    .line 129
    iget-object v0, p0, Lcom/adobe/primetime/va/Heartbeat;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-interface {v0}, Lcom/adobe/primetime/core/ILogger;->enable()V

    .line 134
    :goto_0
    iget-boolean v0, p0, Lcom/adobe/primetime/va/Heartbeat;->_isDestroyed:Z

    if-eqz v0, :cond_1

    .line 135
    iget-object v0, p0, Lcom/adobe/primetime/va/Heartbeat;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/Heartbeat;->_logTag:Ljava/lang/String;

    const-string v2, "Instance is destroyed."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 137
    :cond_1
    monitor-exit p0

    return-void

    .line 131
    :cond_2
    :try_start_2
    iget-object v0, p0, Lcom/adobe/primetime/va/Heartbeat;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-interface {v0}, Lcom/adobe/primetime/core/ILogger;->disable()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized destroy()V
    .locals 1

    .prologue
    .line 145
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/adobe/primetime/va/Heartbeat;->_isDestroyed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 152
    :goto_0
    monitor-exit p0

    return-void

    .line 148
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/adobe/primetime/va/Heartbeat;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    invoke-virtual {v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->destroy()V

    .line 151
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/va/Heartbeat;->_isDestroyed:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 145
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
