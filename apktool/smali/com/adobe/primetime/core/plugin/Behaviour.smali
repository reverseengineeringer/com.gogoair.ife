.class public Lcom/adobe/primetime/core/plugin/Behaviour;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private _action:Ljava/lang/String;

.field private _paramMappings:Ljava/util/Map;

.field private _plugin:Lcom/adobe/primetime/core/plugin/IPlugin;

.field private _trigger:Lcom/adobe/primetime/core/Trigger;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/core/Trigger;Lcom/adobe/primetime/core/plugin/IPlugin;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/adobe/primetime/core/plugin/Behaviour;->_trigger:Lcom/adobe/primetime/core/Trigger;

    .line 40
    iput-object p3, p0, Lcom/adobe/primetime/core/plugin/Behaviour;->_action:Ljava/lang/String;

    .line 41
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/core/plugin/Behaviour;->_paramMappings:Ljava/util/Map;

    .line 42
    iput-object p2, p0, Lcom/adobe/primetime/core/plugin/Behaviour;->_plugin:Lcom/adobe/primetime/core/plugin/IPlugin;

    .line 44
    invoke-virtual {p0, p4}, Lcom/adobe/primetime/core/plugin/Behaviour;->mergeParams(Ljava/util/ArrayList;)V

    .line 45
    return-void
.end method


# virtual methods
.method public addParam(Lcom/adobe/primetime/core/plugin/ParamMapping;)V
    .locals 2

    .prologue
    .line 79
    if-eqz p1, :cond_0

    .line 80
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/Behaviour;->_paramMappings:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/adobe/primetime/core/plugin/ParamMapping;->getKeyName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    :cond_0
    return-void
.end method

.method public getAction()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/Behaviour;->_action:Ljava/lang/String;

    return-object v0
.end method

.method public getParams()Ljava/util/ArrayList;
    .locals 3

    .prologue
    .line 69
    new-instance v1, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/Behaviour;->_paramMappings:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 71
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/Behaviour;->_paramMappings:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/plugin/ParamMapping;

    .line 72
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 75
    :cond_0
    return-object v1
.end method

.method public getPlugin()Lcom/adobe/primetime/core/plugin/IPlugin;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/Behaviour;->_plugin:Lcom/adobe/primetime/core/plugin/IPlugin;

    return-object v0
.end method

.method public getTrigger()Lcom/adobe/primetime/core/Trigger;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/adobe/primetime/core/plugin/Behaviour;->_trigger:Lcom/adobe/primetime/core/Trigger;

    return-object v0
.end method

.method public mergeParams(Ljava/util/ArrayList;)V
    .locals 4

    .prologue
    .line 60
    if-nez p1, :cond_1

    .line 66
    :cond_0
    return-void

    .line 63
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/plugin/ParamMapping;

    .line 64
    iget-object v2, p0, Lcom/adobe/primetime/core/plugin/Behaviour;->_paramMappings:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/adobe/primetime/core/plugin/ParamMapping;->getKeyName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public removeParam(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 84
    new-instance v0, Lcom/adobe/primetime/core/plugin/ParamMapping;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lcom/adobe/primetime/core/plugin/ParamMapping;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/Behaviour;->_paramMappings:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/adobe/primetime/core/plugin/ParamMapping;->getKeyName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 87
    iget-object v1, p0, Lcom/adobe/primetime/core/plugin/Behaviour;->_paramMappings:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/adobe/primetime/core/plugin/ParamMapping;->getKeyName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    :cond_0
    return-void
.end method
