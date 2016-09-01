.class public Lcom/auditude/ads/loader/AdPluginLoader;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/loader/IPluginLoader;


# instance fields
.field context:Landroid/content/Context;

.field listener:Lcom/auditude/ads/loader/IPluginLoader$PluginLoaderListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/auditude/ads/loader/AdPluginLoader;->context:Landroid/content/Context;

    .line 15
    return-void
.end method

.method private notifyLoadComplete(Ljava/lang/Object;)V
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/auditude/ads/loader/AdPluginLoader;->listener:Lcom/auditude/ads/loader/IPluginLoader$PluginLoaderListener;

    if-eqz v0, :cond_0

    .line 34
    iget-object v0, p0, Lcom/auditude/ads/loader/AdPluginLoader;->listener:Lcom/auditude/ads/loader/IPluginLoader$PluginLoaderListener;

    invoke-interface {v0, p1}, Lcom/auditude/ads/loader/IPluginLoader$PluginLoaderListener;->loadComplete(Ljava/lang/Object;)V

    .line 36
    :cond_0
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 0

    .prologue
    .line 23
    return-void
.end method

.method public load()V
    .locals 2

    .prologue
    .line 19
    new-instance v0, Lcom/auditude/ads/AuditudeAdUnit;

    iget-object v1, p0, Lcom/auditude/ads/loader/AdPluginLoader;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/auditude/ads/AuditudeAdUnit;-><init>(Landroid/content/Context;)V

    .line 20
    invoke-direct {p0, v0}, Lcom/auditude/ads/loader/AdPluginLoader;->notifyLoadComplete(Ljava/lang/Object;)V

    .line 21
    return-void
.end method

.method public setPluginLoaderListener(Lcom/auditude/ads/loader/IPluginLoader$PluginLoaderListener;)V
    .locals 0

    .prologue
    .line 27
    iput-object p1, p0, Lcom/auditude/ads/loader/AdPluginLoader;->listener:Lcom/auditude/ads/loader/IPluginLoader$PluginLoaderListener;

    .line 28
    return-void
.end method
