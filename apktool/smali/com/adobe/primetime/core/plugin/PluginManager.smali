.class public Lcom/adobe/primetime/core/plugin/PluginManager;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ALL_PLUGINS:Ljava/lang/String; = "*"

.field private static final CTRL_CHANNEL:Ljava/lang/String; = "ctrl_channel"

.field private static final DATA_CHANNEL:Ljava/lang/String; = "data_channel"


# instance fields
.field private _behaviours:Ljava/util/Map;

.field private _ctrlChannel:Lcom/adobe/primetime/core/radio/Channel;

.field private _dataChannel:Lcom/adobe/primetime/core/radio/Channel;

.field private _errorInfo:Lcom/adobe/primetime/va/ErrorInfo;

.field private _isDestroyed:Z

.field private _logTag:Ljava/lang/String;

.field private _logger:Lcom/adobe/primetime/core/ILogger;

.field private _plugins:Ljava/util/Map;

.field private _radio:Lcom/adobe/primetime/core/radio/Radio;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/core/ILogger;)V
    .locals 2

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    if-nez p1, :cond_0

    .line 56
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the logger object cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_0
    const-class v0, Lcom/adobe/primetime/core/plugin/PluginManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_logTag:Ljava/lang/String;

    .line 59
    iput-object p1, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_logger:Lcom/adobe/primetime/core/ILogger;

    .line 60
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_isDestroyed:Z

    .line 63
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_plugins:Ljava/util/Map;

    .line 66
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_behaviours:Ljava/util/Map;

    .line 69
    new-instance v0, Lcom/adobe/primetime/core/radio/Radio;

    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-direct {v0, v1}, Lcom/adobe/primetime/core/radio/Radio;-><init>(Lcom/adobe/primetime/core/ILogger;)V

    iput-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_radio:Lcom/adobe/primetime/core/radio/Radio;

    .line 70
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_radio:Lcom/adobe/primetime/core/radio/Radio;

    const-string v1, "ctrl_channel"

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/radio/Radio;->channel(Ljava/lang/String;)Lcom/adobe/primetime/core/radio/Channel;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_ctrlChannel:Lcom/adobe/primetime/core/radio/Channel;

    .line 71
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_radio:Lcom/adobe/primetime/core/radio/Radio;

    const-string v1, "data_channel"

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/radio/Radio;->channel(Ljava/lang/String;)Lcom/adobe/primetime/core/radio/Channel;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_dataChannel:Lcom/adobe/primetime/core/radio/Channel;

    .line 72
    return-void
.end method


# virtual methods
.method public addPlugin(Lcom/adobe/primetime/core/plugin/IPlugin;)V
    .locals 5

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_isDestroyed:Z

    if-eqz v0, :cond_0

    .line 88
    :goto_0
    return-void

    .line 77
    :cond_0
    invoke-interface {p1}, Lcom/adobe/primetime/core/plugin/IPlugin;->getName()Ljava/lang/String;

    move-result-object v0

    .line 79
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_plugins:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 80
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v2, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_logTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "#addPlugin > Replacing plugin: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1}, Lcom/adobe/primetime/core/plugin/IPlugin;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    :cond_1
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_plugins:Ljava/util/Map;

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    invoke-interface {p1, p0}, Lcom/adobe/primetime/core/plugin/IPlugin;->bootstrap(Lcom/adobe/primetime/core/plugin/PluginManager;)V

    goto :goto_0
.end method

.method public command(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    .prologue
    .line 213
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_dataChannel:Lcom/adobe/primetime/core/radio/Channel;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p3}, Lcom/adobe/primetime/core/radio/Channel;->command(Ljava/lang/String;Ljava/lang/Object;)V

    .line 214
    return-void
.end method

.method public comply(Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V
    .locals 3

    .prologue
    .line 209
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_dataChannel:Lcom/adobe/primetime/core/radio/Channel;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Lcom/adobe/primetime/core/plugin/IPlugin;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p3}, Lcom/adobe/primetime/core/radio/Channel;->comply(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V

    .line 210
    return-void
.end method

.method public destroy()V
    .locals 2

    .prologue
    .line 197
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_isDestroyed:Z

    .line 200
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_plugins:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/plugin/IPlugin;

    .line 201
    invoke-interface {v0}, Lcom/adobe/primetime/core/plugin/IPlugin;->destroy()V

    goto :goto_0

    .line 205
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_radio:Lcom/adobe/primetime/core/radio/Radio;

    invoke-virtual {v0}, Lcom/adobe/primetime/core/radio/Radio;->shutdown()V

    .line 206
    return-void
.end method

.method public getErrorInfo()Lcom/adobe/primetime/va/ErrorInfo;
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;

    return-object v0
.end method

.method public isPluginInitialized(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 104
    iget-boolean v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_isDestroyed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_plugins:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_plugins:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/plugin/IPlugin;

    invoke-interface {v0}, Lcom/adobe/primetime/core/plugin/IPlugin;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public off(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 114
    iget-boolean v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_isDestroyed:Z

    if-eqz v0, :cond_0

    .line 117
    :goto_0
    return-void

    .line 115
    :cond_0
    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 116
    :goto_1
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_dataChannel:Lcom/adobe/primetime/core/radio/Channel;

    invoke-virtual {v1, v0, p3, p4}, Lcom/adobe/primetime/core/radio/Channel;->off(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    goto :goto_0

    .line 115
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public on(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V
    .locals 3

    .prologue
    .line 108
    iget-boolean v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_isDestroyed:Z

    if-eqz v0, :cond_0

    .line 111
    :goto_0
    return-void

    .line 110
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_dataChannel:Lcom/adobe/primetime/core/radio/Channel;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p3, p4}, Lcom/adobe/primetime/core/radio/Channel;->on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public pluginExists(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 99
    iget-boolean v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_isDestroyed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_plugins:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public raise(Lcom/adobe/primetime/va/ErrorInfo;)V
    .locals 2

    .prologue
    .line 184
    iput-object p1, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;

    .line 186
    new-instance v0, Lcom/adobe/primetime/core/Event;

    const-string v1, "error"

    invoke-direct {v0, v1, p1}, Lcom/adobe/primetime/core/Event;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 189
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_ctrlChannel:Lcom/adobe/primetime/core/radio/Channel;

    invoke-virtual {v1, v0}, Lcom/adobe/primetime/core/radio/Channel;->trigger(Lcom/adobe/primetime/core/Event;)V

    .line 190
    return-void
.end method

.method public registerBehaviour(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 4

    .prologue
    .line 217
    invoke-virtual {p1}, Lcom/adobe/primetime/core/Trigger;->getName()Ljava/lang/String;

    move-result-object v0

    .line 218
    new-instance v1, Lcom/adobe/primetime/core/plugin/Behaviour;

    invoke-direct {v1, p1, p2, p3, p4}, Lcom/adobe/primetime/core/plugin/Behaviour;-><init>(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 221
    iget-object v2, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_behaviours:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 222
    iget-object v2, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_behaviours:Ljava/util/Map;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    :cond_0
    iget-object v2, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_behaviours:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 225
    return-void
.end method

.method public request(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/Object;
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 172
    iget-boolean v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_isDestroyed:Z

    if-eqz v0, :cond_0

    move-object v0, v1

    .line 180
    :goto_0
    return-object v0

    .line 175
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_plugins:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/plugin/IPlugin;

    .line 178
    if-eqz v0, :cond_1

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_2

    :cond_1
    move-object v0, v1

    goto :goto_0

    .line 180
    :cond_2
    invoke-interface {v0, p2}, Lcom/adobe/primetime/core/plugin/IPlugin;->resolveData(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public setupPlugins()V
    .locals 2

    .prologue
    .line 91
    iget-boolean v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_isDestroyed:Z

    if-eqz v0, :cond_1

    .line 96
    :cond_0
    return-void

    .line 93
    :cond_1
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_plugins:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/plugin/IPlugin;

    .line 94
    invoke-interface {v0}, Lcom/adobe/primetime/core/plugin/IPlugin;->setup()V

    goto :goto_0
.end method

.method public trigger(Lcom/adobe/primetime/core/Event;)V
    .locals 8

    .prologue
    .line 120
    invoke-virtual {p1}, Lcom/adobe/primetime/core/Event;->getName()Ljava/lang/String;

    move-result-object v0

    .line 121
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_behaviours:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 123
    iget-boolean v1, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_isDestroyed:Z

    if-eqz v1, :cond_0

    .line 169
    :goto_0
    return-void

    .line 126
    :cond_0
    if-eqz v0, :cond_8

    .line 127
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 128
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 131
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/primetime/core/plugin/Behaviour;

    .line 132
    invoke-virtual {v1}, Lcom/adobe/primetime/core/plugin/Behaviour;->getParams()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    .line 133
    invoke-virtual {v1}, Lcom/adobe/primetime/core/plugin/ParamMapping;->getPluginName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 134
    invoke-virtual {v1}, Lcom/adobe/primetime/core/plugin/ParamMapping;->getPluginName()Ljava/lang/String;

    move-result-object v2

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    :cond_3
    invoke-virtual {v1}, Lcom/adobe/primetime/core/plugin/ParamMapping;->getPluginName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-virtual {v1}, Lcom/adobe/primetime/core/plugin/ParamMapping;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 137
    invoke-virtual {v1}, Lcom/adobe/primetime/core/plugin/ParamMapping;->getPluginName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-virtual {v1}, Lcom/adobe/primetime/core/plugin/ParamMapping;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 142
    :cond_4
    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_5
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 144
    invoke-interface {v3, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 146
    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 145
    invoke-virtual {p0, v1, v2}, Lcom/adobe/primetime/core/plugin/PluginManager;->request(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v4, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 151
    :cond_6
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/plugin/Behaviour;

    .line 152
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 153
    const-string v1, "_behaviour"

    invoke-interface {v5, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    const-string v1, "_eventData"

    invoke-virtual {p1}, Lcom/adobe/primetime/core/Event;->getData()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v5, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    invoke-virtual {v0}, Lcom/adobe/primetime/core/plugin/Behaviour;->getParams()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/primetime/core/plugin/ParamMapping;

    .line 158
    invoke-virtual {v1}, Lcom/adobe/primetime/core/plugin/ParamMapping;->getPluginName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 159
    invoke-virtual {v1}, Lcom/adobe/primetime/core/plugin/ParamMapping;->getParamName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1}, Lcom/adobe/primetime/core/plugin/ParamMapping;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v5, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 162
    :cond_7
    invoke-virtual {v0}, Lcom/adobe/primetime/core/plugin/Behaviour;->getPlugin()Lcom/adobe/primetime/core/plugin/IPlugin;

    move-result-object v1

    invoke-interface {v1}, Lcom/adobe/primetime/core/plugin/IPlugin;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/adobe/primetime/core/plugin/Behaviour;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0, v5}, Lcom/adobe/primetime/core/plugin/PluginManager;->command(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    .line 168
    :cond_8
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/PluginManager;->_dataChannel:Lcom/adobe/primetime/core/radio/Channel;

    invoke-virtual {v0, p1}, Lcom/adobe/primetime/core/radio/Channel;->trigger(Lcom/adobe/primetime/core/Event;)V

    goto/16 :goto_0
.end method
