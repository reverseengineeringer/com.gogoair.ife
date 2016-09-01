.class public Lcom/auditude/ads/view/ViewFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private context:Landroid/content/Context;

.field private isInitialized:Z

.field private viewCache:Ljava/util/HashMap;

.field private viewTypeDictionary:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/view/ViewFactory;->isInitialized:Z

    .line 26
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/view/ViewFactory;->viewTypeDictionary:Ljava/util/HashMap;

    .line 27
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/view/ViewFactory;->viewCache:Ljava/util/HashMap;

    .line 32
    iput-object p1, p0, Lcom/auditude/ads/view/ViewFactory;->context:Landroid/content/Context;

    .line 33
    return-void
.end method

.method private initialize()V
    .locals 3

    .prologue
    .line 37
    iget-boolean v0, p0, Lcom/auditude/ads/view/ViewFactory;->isInitialized:Z

    if-nez v0, :cond_0

    .line 39
    iget-object v0, p0, Lcom/auditude/ads/view/ViewFactory;->viewTypeDictionary:Ljava/util/HashMap;

    const-string v1, "Auditude.Ads.View.Linear.LinearVideoView"

    const-class v2, Lcom/auditude/ads/view/linear/LinearVideoView;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    iget-object v0, p0, Lcom/auditude/ads/view/ViewFactory;->viewTypeDictionary:Ljava/util/HashMap;

    const-string v1, "Auditude.Ads.View.Linear.ExternalVideoView"

    const-class v2, Lcom/auditude/ads/view/linear/ExternalVideoView;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/auditude/ads/view/ViewFactory;->isInitialized:Z

    .line 44
    :cond_0
    return-void
.end method


# virtual methods
.method public final dispose()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 179
    iget-object v0, p0, Lcom/auditude/ads/view/ViewFactory;->viewCache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/auditude/ads/view/ViewFactory;->viewTypeDictionary:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 185
    iget-object v0, p0, Lcom/auditude/ads/view/ViewFactory;->viewCache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 187
    iput-object v2, p0, Lcom/auditude/ads/view/ViewFactory;->viewTypeDictionary:Ljava/util/HashMap;

    .line 188
    iput-object v2, p0, Lcom/auditude/ads/view/ViewFactory;->viewCache:Ljava/util/HashMap;

    .line 189
    return-void

    .line 179
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/view/IAdView;

    .line 181
    invoke-interface {v0}, Lcom/auditude/ads/view/IAdView;->dispose()V

    goto :goto_0
.end method

.method public final getView(Ljava/lang/String;)Lcom/auditude/ads/view/IAdView;
    .locals 1

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/auditude/ads/view/ViewFactory;->getView(Ljava/lang/String;Z)Lcom/auditude/ads/view/IAdView;

    move-result-object v0

    return-object v0
.end method

.method public final getView(Ljava/lang/String;Z)Lcom/auditude/ads/view/IAdView;
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 64
    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 110
    :cond_0
    :goto_0
    return-object v1

    .line 69
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/view/ViewFactory;->viewCache:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    if-nez p2, :cond_2

    .line 71
    iget-object v0, p0, Lcom/auditude/ads/view/ViewFactory;->viewCache:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/view/IAdView;

    move-object v1, v0

    goto :goto_0

    .line 74
    :cond_2
    iget-object v0, p0, Lcom/auditude/ads/view/ViewFactory;->viewTypeDictionary:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Lcom/auditude/ads/view/ViewFactory;->viewTypeDictionary:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 81
    const/4 v2, 0x1

    :try_start_0
    new-array v2, v2, [Ljava/lang/Class;

    .line 82
    const/4 v3, 0x0

    const-class v4, Landroid/content/Context;

    aput-object v4, v2, v3

    .line 83
    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 84
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/auditude/ads/view/ViewFactory;->context:Landroid/content/Context;

    aput-object v4, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v0

    .line 102
    :goto_1
    instance-of v2, v0, Lcom/auditude/ads/view/IAdView;

    if-eqz v2, :cond_3

    :goto_2
    check-cast v0, Lcom/auditude/ads/view/IAdView;

    .line 105
    invoke-virtual {p0, p1, v0}, Lcom/auditude/ads/view/ViewFactory;->setView(Ljava/lang/String;Lcom/auditude/ads/view/IAdView;)V

    move-object v1, v0

    .line 107
    goto :goto_0

    .line 86
    :catch_0
    move-exception v0

    .line 88
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    move-object v0, v1

    goto :goto_1

    .line 90
    :catch_1
    move-exception v0

    .line 92
    invoke-virtual {v0}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    move-object v0, v1

    goto :goto_1

    .line 94
    :catch_2
    move-exception v0

    .line 96
    invoke-virtual {v0}, Ljava/lang/InstantiationException;->printStackTrace()V

    move-object v0, v1

    goto :goto_1

    .line 98
    :catch_3
    move-exception v0

    .line 100
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    move-object v0, v1

    goto :goto_1

    :cond_3
    move-object v0, v1

    .line 102
    goto :goto_2
.end method

.method public final getViewForAsset(Lcom/auditude/ads/model/Asset;)Lcom/auditude/ads/view/IAdView;
    .locals 1

    .prologue
    .line 124
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/auditude/ads/view/ViewFactory;->getViewForAsset(Lcom/auditude/ads/model/Asset;Z)Lcom/auditude/ads/view/IAdView;

    move-result-object v0

    return-object v0
.end method

.method public final getViewForAsset(Lcom/auditude/ads/model/Asset;Z)Lcom/auditude/ads/view/IAdView;
    .locals 1

    .prologue
    .line 129
    invoke-virtual {p0, p1}, Lcom/auditude/ads/view/ViewFactory;->getViewSourceForAsset(Lcom/auditude/ads/model/Asset;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/auditude/ads/view/ViewFactory;->getView(Ljava/lang/String;Z)Lcom/auditude/ads/view/IAdView;

    move-result-object v0

    return-object v0
.end method

.method public final getViewSourceForAsset(Lcom/auditude/ads/model/Asset;)Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 134
    iget-boolean v0, p0, Lcom/auditude/ads/view/ViewFactory;->isInitialized:Z

    if-nez v0, :cond_0

    .line 136
    invoke-direct {p0}, Lcom/auditude/ads/view/ViewFactory;->initialize()V

    .line 139
    :cond_0
    if-nez p1, :cond_2

    .line 174
    :cond_1
    :goto_0
    return-object v1

    .line 141
    :cond_2
    instance-of v0, p1, Lcom/auditude/ads/model/IOnPageAsset;

    if-eqz v0, :cond_4

    .line 143
    instance-of v0, p1, Lcom/auditude/ads/model/OnPageAsset;

    if-eqz v0, :cond_3

    move-object v0, p1

    :goto_1
    check-cast v0, Lcom/auditude/ads/model/OnPageAsset;

    .line 144
    invoke-interface {v0}, Lcom/auditude/ads/model/IOnPageAsset;->getFormat()Ljava/lang/String;

    move-result-object v2

    const-string v3, "onpage"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Lcom/auditude/ads/model/IOnPageAsset;->getResourceType()Ljava/lang/String;

    move-result-object v0

    const-string v2, "static"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 146
    const-string v1, "Auditude.Ads.View.OnPage.StaticBannerView"

    goto :goto_0

    :cond_3
    move-object v0, v1

    .line 143
    goto :goto_1

    .line 152
    :cond_4
    instance-of v0, p1, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v0, :cond_6

    .line 154
    invoke-virtual {p1}, Lcom/auditude/ads/model/Asset;->getFormat()Ljava/lang/String;

    move-result-object v0

    const-string v2, "video"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 156
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v1, "auditudeHandlesLinearVideoAds"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 158
    const-string v1, "Auditude.Ads.View.Linear.LinearVideoView"

    goto :goto_0

    .line 162
    :cond_5
    const-string v1, "Auditude.Ads.View.Linear.ExternalVideoView"

    goto :goto_0

    .line 169
    :cond_6
    instance-of v0, p1, Lcom/auditude/ads/model/INonLinearAsset;

    if-eqz v0, :cond_1

    goto :goto_0
.end method

.method public final reset()V
    .locals 2

    .prologue
    .line 48
    iget-object v0, p0, Lcom/auditude/ads/view/ViewFactory;->viewCache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 55
    return-void

    .line 48
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/view/IAdView;

    .line 50
    if-eqz v0, :cond_0

    .line 52
    invoke-interface {v0}, Lcom/auditude/ads/view/IAdView;->reset()V

    goto :goto_0
.end method

.method public final setView(Ljava/lang/String;Lcom/auditude/ads/view/IAdView;)V
    .locals 1

    .prologue
    .line 115
    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    if-nez p2, :cond_1

    .line 120
    :cond_0
    :goto_0
    return-void

    .line 119
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/view/ViewFactory;->viewCache:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method
