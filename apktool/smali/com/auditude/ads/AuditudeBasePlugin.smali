.class public Lcom/auditude/ads/AuditudeBasePlugin;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/loader/IPluginLoader$PluginLoaderListener;


# static fields
.field private static final DEFAULT_TIMEOUT:I = 0x5

.field public static final LOAD_TIME:Ljava/lang/String; = "loadTime"

.field public static final PLUGIN_INSTANCE:Ljava/lang/String; = "pluginInstance"

.field private static final USE_SSL:Ljava/lang/String; = "useSSL"


# instance fields
.field private adProperties:Ljava/util/HashMap;

.field private adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

.field private adUnitLoader:Lcom/auditude/ads/loader/IPluginLoader;

.field private auditudeHandlesChapterBreaks:Z

.field private bitRate:I

.field private leftVolume:F

.field private listener:Lcom/auditude/ads/event/AuditudePluginEventListener;

.field private rightVolume:F

.field private useSSL:Z

.field private version:Ljava/lang/String;

.field private zoneId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 52
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 21
    const-string v0, "adunit-1.0"

    iput-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->version:Ljava/lang/String;

    .line 24
    iput v1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->leftVolume:F

    .line 25
    iput v1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->rightVolume:F

    .line 26
    iput v2, p0, Lcom/auditude/ads/AuditudeBasePlugin;->bitRate:I

    .line 27
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->auditudeHandlesChapterBreaks:Z

    .line 28
    iput-boolean v2, p0, Lcom/auditude/ads/AuditudeBasePlugin;->useSSL:Z

    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adProperties:Ljava/util/HashMap;

    .line 53
    invoke-virtual {p0}, Lcom/auditude/ads/AuditudeBasePlugin;->getLoader()Lcom/auditude/ads/loader/IPluginLoader;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnitLoader:Lcom/auditude/ads/loader/IPluginLoader;

    .line 55
    invoke-virtual {p0}, Lcom/auditude/ads/AuditudeBasePlugin;->load()V

    .line 56
    return-void
.end method

.method public static isNullOrEmpty(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 436
    if-eqz p0, :cond_0

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private onPluginLoadComplete(Ljava/lang/Object;)V
    .locals 4

    .prologue
    const/4 v2, -0x1

    .line 369
    instance-of v0, p1, Lcom/auditude/ads/IAuditudeAdUnit;

    if-eqz v0, :cond_2

    move-object v0, p1

    :goto_0
    check-cast v0, Lcom/auditude/ads/IAuditudeAdUnit;

    iput-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    .line 371
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    if-eqz v0, :cond_0

    .line 373
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    check-cast v0, Landroid/view/ViewGroup;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/AuditudeBasePlugin;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 376
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    iget v1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->leftVolume:F

    iget v2, p0, Lcom/auditude/ads/AuditudeBasePlugin;->rightVolume:F

    invoke-interface {v0, v1, v2}, Lcom/auditude/ads/IAuditudeAdUnit;->setVolume(FF)V

    .line 377
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    iget v1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->bitRate:I

    invoke-interface {v0, v1}, Lcom/auditude/ads/IAuditudeAdUnit;->setBitRate(I)V

    .line 378
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    iget-object v1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->version:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/auditude/ads/IAuditudeAdUnit;->setPublisherVersion(Ljava/lang/String;)V

    .line 379
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    iget-boolean v1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->auditudeHandlesChapterBreaks:Z

    invoke-interface {v0, v1}, Lcom/auditude/ads/IAuditudeAdUnit;->setAuditudeHandlesChapterBreaks(Z)V

    .line 380
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    iget-object v1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->listener:Lcom/auditude/ads/event/AuditudePluginEventListener;

    invoke-interface {v0, v1}, Lcom/auditude/ads/IAuditudeAdUnit;->setPluginEventListener(Lcom/auditude/ads/event/AuditudePluginEventListener;)V

    .line 382
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adProperties:Ljava/util/HashMap;

    if-eqz v0, :cond_1

    .line 384
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adProperties:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_3

    .line 389
    :cond_1
    return-void

    .line 369
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 384
    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 386
    iget-object v3, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v3, v1, v0}, Lcom/auditude/ads/IAuditudeAdUnit;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    if-eqz v0, :cond_0

    .line 236
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    invoke-interface {v0}, Lcom/auditude/ads/IAuditudeAdUnit;->cancel()V

    .line 238
    :cond_0
    return-void
.end method

.method public dispose()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 424
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    if-eqz v0, :cond_0

    .line 426
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    invoke-interface {v0}, Lcom/auditude/ads/IAuditudeAdUnit;->cancel()V

    .line 427
    iput-object v1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    .line 430
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnitLoader:Lcom/auditude/ads/loader/IPluginLoader;

    invoke-interface {v0}, Lcom/auditude/ads/loader/IPluginLoader;->cancel()V

    .line 431
    iput-object v1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnitLoader:Lcom/auditude/ads/loader/IPluginLoader;

    .line 432
    return-void
.end method

.method protected getLoader()Lcom/auditude/ads/loader/IPluginLoader;
    .locals 1

    .prologue
    .line 63
    const/4 v0, 0x0

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 320
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    if-eqz v0, :cond_0

    .line 322
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    invoke-interface {v0, p1}, Lcom/auditude/ads/IAuditudeAdUnit;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 329
    :goto_0
    return-object v0

    .line 324
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adProperties:Ljava/util/HashMap;

    if-eqz v0, :cond_1

    invoke-static {p1}, Lcom/auditude/ads/AuditudeBasePlugin;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 326
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adProperties:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 329
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasBreak()Z
    .locals 1

    .prologue
    .line 341
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/auditude/ads/AuditudeBasePlugin;->hasBreak(I)Z

    move-result v0

    return v0
.end method

.method public hasBreak(I)Z
    .locals 1

    .prologue
    .line 354
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    if-eqz v0, :cond_0

    .line 356
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    invoke-interface {v0, p1}, Lcom/auditude/ads/IAuditudeAdUnit;->hasBreak(I)Z

    .line 358
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public init(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .prologue
    .line 179
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/auditude/ads/AuditudeBasePlugin;->init(Ljava/lang/String;Ljava/lang/Object;Ljava/util/HashMap;)V

    .line 180
    return-void
.end method

.method public init(Ljava/lang/String;Ljava/lang/Object;Ljava/util/HashMap;)V
    .locals 1

    .prologue
    .line 195
    const/4 v0, 0x5

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/auditude/ads/AuditudeBasePlugin;->init(Ljava/lang/String;Ljava/lang/Object;Ljava/util/HashMap;I)V

    .line 196
    return-void
.end method

.method public init(Ljava/lang/String;Ljava/lang/Object;Ljava/util/HashMap;I)V
    .locals 6

    .prologue
    .line 212
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    if-nez v0, :cond_1

    .line 214
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "AdUnit library not found"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 215
    iget-object v1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->listener:Lcom/auditude/ads/event/AuditudePluginEventListener;

    if-eqz v1, :cond_0

    .line 217
    iget-object v1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->listener:Lcom/auditude/ads/event/AuditudePluginEventListener;

    new-instance v2, Lcom/auditude/ads/event/AdPluginErrorEvent;

    const-string v3, "initFailed"

    invoke-direct {v2, v3, v0}, Lcom/auditude/ads/event/AdPluginErrorEvent;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-interface {v1, v2}, Lcom/auditude/ads/event/AuditudePluginEventListener;->onAdPluginErrorEvent(Lcom/auditude/ads/event/AdPluginErrorEvent;)V

    .line 226
    :cond_0
    :goto_0
    return-void

    .line 225
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    iget v3, p0, Lcom/auditude/ads/AuditudeBasePlugin;->zoneId:I

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move v5, p4

    invoke-interface/range {v0 .. v5}, Lcom/auditude/ads/IAuditudeAdUnit;->init(Ljava/lang/String;Ljava/lang/Object;ILjava/util/HashMap;I)V

    goto :goto_0
.end method

.method public load()V
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    if-eqz v0, :cond_0

    .line 165
    :goto_0
    return-void

    .line 163
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnitLoader:Lcom/auditude/ads/loader/IPluginLoader;

    invoke-interface {v0, p0}, Lcom/auditude/ads/loader/IPluginLoader;->setPluginLoaderListener(Lcom/auditude/ads/loader/IPluginLoader$PluginLoaderListener;)V

    .line 164
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnitLoader:Lcom/auditude/ads/loader/IPluginLoader;

    invoke-interface {v0}, Lcom/auditude/ads/loader/IPluginLoader;->load()V

    goto :goto_0
.end method

.method public loadComplete(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 442
    invoke-direct {p0, p1}, Lcom/auditude/ads/AuditudeBasePlugin;->onPluginLoadComplete(Ljava/lang/Object;)V

    .line 443
    return-void
.end method

.method public loadFailed(Ljava/lang/Throwable;)V
    .locals 0

    .prologue
    .line 448
    return-void
.end method

.method public notify(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 249
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/auditude/ads/AuditudeBasePlugin;->notify(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 250
    return-void
.end method

.method public notify(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 3

    .prologue
    .line 262
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    if-eqz v0, :cond_1

    .line 264
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    invoke-interface {v0, p1, p2}, Lcom/auditude/ads/IAuditudeAdUnit;->notify(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 274
    :cond_0
    :goto_0
    return-void

    .line 266
    :cond_1
    const-string v0, "breakBegin"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 269
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->listener:Lcom/auditude/ads/event/AuditudePluginEventListener;

    if-eqz v0, :cond_0

    .line 271
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->listener:Lcom/auditude/ads/event/AuditudePluginEventListener;

    new-instance v1, Lcom/auditude/ads/event/AdPluginEvent;

    const-string v2, "breakEnd"

    invoke-direct {v1, v2}, Lcom/auditude/ads/event/AdPluginEvent;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/auditude/ads/event/AuditudePluginEventListener;->onAdPluginEvent(Lcom/auditude/ads/event/AdPluginEvent;)V

    goto :goto_0
.end method

.method public setAuditudeHandlesChapterBreaks(Z)V
    .locals 1

    .prologue
    .line 147
    iput-boolean p1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->auditudeHandlesChapterBreaks:Z

    .line 148
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    if-eqz v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    invoke-interface {v0, p1}, Lcom/auditude/ads/IAuditudeAdUnit;->setAuditudeHandlesChapterBreaks(Z)V

    .line 152
    :cond_0
    return-void
.end method

.method public setBitRate(I)V
    .locals 2

    .prologue
    .line 108
    iput p1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->bitRate:I

    .line 109
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    iget v1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->bitRate:I

    invoke-interface {v0, v1}, Lcom/auditude/ads/IAuditudeAdUnit;->setBitRate(I)V

    .line 113
    :cond_0
    return-void
.end method

.method public setPluginEventListener(Lcom/auditude/ads/event/AuditudePluginEventListener;)V
    .locals 1

    .prologue
    .line 68
    iput-object p1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->listener:Lcom/auditude/ads/event/AuditudePluginEventListener;

    .line 69
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    if-eqz v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    invoke-interface {v0, p1}, Lcom/auditude/ads/IAuditudeAdUnit;->setPluginEventListener(Lcom/auditude/ads/event/AuditudePluginEventListener;)V

    .line 73
    :cond_0
    return-void
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .prologue
    .line 302
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    if-eqz v0, :cond_1

    .line 304
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    invoke-interface {v0, p1, p2}, Lcom/auditude/ads/IAuditudeAdUnit;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 310
    :cond_0
    :goto_0
    return-void

    .line 306
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adProperties:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/auditude/ads/AuditudeBasePlugin;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 308
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adProperties:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public setSize(DD)V
    .locals 0

    .prologue
    .line 292
    return-void
.end method

.method public setUseSSL(Z)V
    .locals 2

    .prologue
    .line 134
    iput-boolean p1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->useSSL:Z

    .line 135
    const-string v0, "useSSL"

    iget-boolean v1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->useSSL:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/AuditudeBasePlugin;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 136
    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 96
    iput-object p1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->version:Ljava/lang/String;

    .line 97
    return-void
.end method

.method public setVolume(FF)V
    .locals 1

    .prologue
    .line 117
    iput p1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->leftVolume:F

    .line 118
    iput p2, p0, Lcom/auditude/ads/AuditudeBasePlugin;->rightVolume:F

    .line 119
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/auditude/ads/AuditudeBasePlugin;->adUnit:Lcom/auditude/ads/IAuditudeAdUnit;

    invoke-interface {v0, p1, p2}, Lcom/auditude/ads/IAuditudeAdUnit;->setVolume(FF)V

    .line 123
    :cond_0
    return-void
.end method

.method public setZoneId(I)V
    .locals 0

    .prologue
    .line 84
    iput p1, p0, Lcom/auditude/ads/AuditudeBasePlugin;->zoneId:I

    .line 85
    return-void
.end method
