.class public interface abstract Lcom/adobe/primetime/core/plugin/IPlugin;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract bootstrap(Lcom/adobe/primetime/core/plugin/PluginManager;)V
.end method

.method public abstract configure(Lcom/adobe/primetime/core/plugin/IPluginConfig;)V
.end method

.method public abstract destroy()V
.end method

.method public abstract disable()V
.end method

.method public abstract enable()V
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract isInitialized()Z
.end method

.method public abstract resolveData(Ljava/util/ArrayList;)Ljava/lang/Object;
.end method

.method public abstract setup()V
.end method
