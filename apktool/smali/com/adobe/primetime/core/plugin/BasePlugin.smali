.class public Lcom/adobe/primetime/core/plugin/BasePlugin;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/plugin/IPlugin;


# static fields
.field public static final ERROR_INFO:Ljava/lang/String; = "error_info"

.field protected static final INITIALIZED:Ljava/lang/String; = "initialized"

.field public static final STATE_PLUGIN:Ljava/lang/String; = "state"


# instance fields
.field protected _dataResolver:Ljava/lang/Object;

.field protected _isDestroyed:Z

.field protected _isEnabled:Z

.field protected _isInitialized:Z

.field protected _logTag:Ljava/lang/String;

.field protected _logger:Lcom/adobe/primetime/core/ILogger;

.field protected _name:Ljava/lang/String;

.field protected _pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_name:Ljava/lang/String;

    .line 47
    iput-boolean v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_isInitialized:Z

    .line 48
    iput-boolean v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_isDestroyed:Z

    .line 49
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_isEnabled:Z

    .line 50
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_dataResolver:Ljava/lang/Object;

    .line 53
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_logTag:Ljava/lang/String;

    .line 54
    new-instance v0, Lcom/adobe/primetime/core/Logger;

    invoke-direct {v0}, Lcom/adobe/primetime/core/Logger;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    .line 55
    return-void
.end method


# virtual methods
.method protected _canProcess()Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 185
    iget-boolean v1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_isEnabled:Z

    if-nez v1, :cond_0

    .line 186
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v2, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_logTag:Ljava/lang/String;

    const-string v3, "#_canProcess() > Plugin disabled."

    invoke-interface {v1, v2, v3}, Lcom/adobe/primetime/core/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    :goto_0
    return v0

    .line 190
    :cond_0
    iget-boolean v1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_isDestroyed:Z

    if-eqz v1, :cond_1

    .line 191
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v2, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_logTag:Ljava/lang/String;

    const-string v3, "#_canProcess() > Plugin destroyed."

    invoke-interface {v1, v2, v3}, Lcom/adobe/primetime/core/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 195
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected _disabled()V
    .locals 0

    .prologue
    .line 177
    return-void
.end method

.method protected _enabled()V
    .locals 0

    .prologue
    .line 173
    return-void
.end method

.method protected _teardown()V
    .locals 0

    .prologue
    .line 181
    return-void
.end method

.method protected _trigger(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 199
    new-instance v0, Lcom/adobe/primetime/core/Trigger;

    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_name:Ljava/lang/String;

    invoke-direct {v0, v1, p1}, Lcom/adobe/primetime/core/Trigger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/adobe/primetime/core/Event;->createFromTrigger(Lcom/adobe/primetime/core/Trigger;)Lcom/adobe/primetime/core/Event;

    move-result-object v0

    .line 200
    invoke-virtual {v0, p2}, Lcom/adobe/primetime/core/Event;->setData(Ljava/lang/Object;)V

    .line 201
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    invoke-virtual {v1, v0}, Lcom/adobe/primetime/core/plugin/PluginManager;->trigger(Lcom/adobe/primetime/core/Event;)V

    .line 202
    return-void
.end method

.method public bootstrap(Lcom/adobe/primetime/core/plugin/PluginManager;)V
    .locals 4

    .prologue
    .line 67
    iput-object p1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    .line 69
    iget-boolean v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_isDestroyed:Z

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_pluginManager:Lcom/adobe/primetime/core/plugin/PluginManager;

    new-instance v1, Lcom/adobe/primetime/va/ErrorInfo;

    const-string v2, "Invalid State."

    const-string v3, "Plugin already destroyed."

    invoke-direct {v1, v2, v3}, Lcom/adobe/primetime/va/ErrorInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/plugin/PluginManager;->raise(Lcom/adobe/primetime/va/ErrorInfo;)V

    .line 72
    :cond_0
    return-void
.end method

.method public configure(Lcom/adobe/primetime/core/plugin/IPluginConfig;)V
    .locals 0

    .prologue
    .line 63
    return-void
.end method

.method public destroy()V
    .locals 1

    .prologue
    .line 84
    iget-boolean v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_isDestroyed:Z

    if-eqz v0, :cond_0

    .line 91
    :goto_0
    return-void

    .line 87
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_isDestroyed:Z

    .line 90
    invoke-virtual {p0}, Lcom/adobe/primetime/core/plugin/BasePlugin;->_teardown()V

    goto :goto_0
.end method

.method public disable()V
    .locals 1

    .prologue
    .line 101
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_isEnabled:Z

    .line 102
    invoke-virtual {p0}, Lcom/adobe/primetime/core/plugin/BasePlugin;->_disabled()V

    .line 103
    return-void
.end method

.method public enable()V
    .locals 1

    .prologue
    .line 95
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_isEnabled:Z

    .line 96
    invoke-virtual {p0}, Lcom/adobe/primetime/core/plugin/BasePlugin;->_enabled()V

    .line 97
    return-void
.end method

.method public getLogger()Lcom/adobe/primetime/core/Logger;
    .locals 1

    .prologue
    .line 164
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    check-cast v0, Lcom/adobe/primetime/core/Logger;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public isInitialized()Z
    .locals 1

    .prologue
    .line 112
    iget-boolean v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_isInitialized:Z

    return v0
.end method

.method public resolveData(Ljava/util/ArrayList;)Ljava/lang/Object;
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 118
    iget-boolean v1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_isEnabled:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_isInitialized:Z

    if-nez v1, :cond_2

    .line 119
    :cond_0
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v2, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_logTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to retrieve plugin data.. Plugin: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ". Enabled: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_isEnabled:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ". Initialized: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_isInitialized:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    :cond_1
    :goto_0
    return-object v0

    .line 128
    :cond_2
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_dataResolver:Ljava/lang/Object;

    if-eqz v1, :cond_1

    .line 131
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_dataResolver:Ljava/lang/Object;

    instance-of v1, v1, Lcom/adobe/primetime/core/ICallback;

    if-eqz v1, :cond_3

    .line 132
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_dataResolver:Ljava/lang/Object;

    check-cast v0, Lcom/adobe/primetime/core/ICallback;

    invoke-interface {v0, p1}, Lcom/adobe/primetime/core/ICallback;->call(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 137
    :cond_3
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_dataResolver:Ljava/lang/Object;

    instance-of v1, v1, Ljava/util/HashMap;

    if-eqz v1, :cond_1

    .line 138
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 140
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_dataResolver:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 141
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 143
    instance-of v3, v1, Lcom/adobe/primetime/core/ICallback;

    if-eqz v3, :cond_4

    .line 145
    check-cast v1, Lcom/adobe/primetime/core/ICallback;

    invoke-interface {v1, v0}, Lcom/adobe/primetime/core/ICallback;->call(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 149
    :cond_4
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_dataResolver:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    .line 150
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public setup()V
    .locals 2

    .prologue
    .line 76
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_isInitialized:Z

    .line 79
    const-string v0, "initialized"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/core/plugin/BasePlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    .line 80
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 160
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<plugin: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/BasePlugin;->_name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
