.class public Lcom/auditude/ads/AuditudePlugin;
.super Lcom/auditude/ads/AuditudeBasePlugin;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0, p1}, Lcom/auditude/ads/AuditudeBasePlugin;-><init>(Landroid/content/Context;)V

    .line 13
    return-void
.end method


# virtual methods
.method protected getLoader()Lcom/auditude/ads/loader/IPluginLoader;
    .locals 2

    .prologue
    .line 17
    new-instance v0, Lcom/auditude/ads/loader/AdPluginLoader;

    invoke-virtual {p0}, Lcom/auditude/ads/AuditudePlugin;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/auditude/ads/loader/AdPluginLoader;-><init>(Landroid/content/Context;)V

    return-object v0
.end method
