.class public Lcom/auditude/ads/view/BannerView;
.super Landroid/webkit/WebView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/auditude/ads/view/BannerView$MyWebViewClient;
    }
.end annotation


# instance fields
.field private api:Lcom/auditude/ads/core/APIBridge;

.field private banner:Lcom/auditude/ads/model/OnPageAsset;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 29
    invoke-direct {p0}, Lcom/auditude/ads/view/BannerView;->init()V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    invoke-direct {p0}, Lcom/auditude/ads/view/BannerView;->init()V

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    invoke-direct {p0}, Lcom/auditude/ads/view/BannerView;->init()V

    .line 40
    return-void
.end method

.method static synthetic access$0(Lcom/auditude/ads/view/BannerView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/auditude/ads/view/BannerView;->adClick(Ljava/lang/String;)V

    return-void
.end method

.method private adClick(Ljava/lang/String;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 82
    iget-object v0, p0, Lcom/auditude/ads/view/BannerView;->banner:Lcom/auditude/ads/model/OnPageAsset;

    invoke-virtual {v0}, Lcom/auditude/ads/model/OnPageAsset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Click;

    .line 83
    if-nez v0, :cond_0

    .line 85
    new-instance v0, Lcom/auditude/ads/model/Click;

    iget-object v1, p0, Lcom/auditude/ads/view/BannerView;->banner:Lcom/auditude/ads/model/OnPageAsset;

    invoke-direct {v0, v1}, Lcom/auditude/ads/model/Click;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 86
    iget-object v1, p0, Lcom/auditude/ads/view/BannerView;->banner:Lcom/auditude/ads/model/OnPageAsset;

    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/OnPageAsset;->setClick(Lcom/auditude/ads/model/IClick;)V

    .line 88
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/Click;->setShouldAppendParState(Z)V

    .line 89
    invoke-virtual {v0, p1}, Lcom/auditude/ads/model/Click;->setUrl(Ljava/lang/String;)V

    .line 91
    new-instance v1, Lcom/auditude/ads/event/AdClickThroughEvent;

    const-string v2, "adClick"

    iget-object v3, p0, Lcom/auditude/ads/view/BannerView;->banner:Lcom/auditude/ads/model/OnPageAsset;

    invoke-virtual {v3}, Lcom/auditude/ads/model/OnPageAsset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v3

    invoke-direct {v1, v2, v3, v4}, Lcom/auditude/ads/event/AdClickThroughEvent;-><init>(Ljava/lang/String;Lcom/auditude/ads/model/IClick;Ljava/util/HashMap;)V

    .line 92
    iget-object v2, p0, Lcom/auditude/ads/view/BannerView;->api:Lcom/auditude/ads/core/APIBridge;

    const-string v3, "apiEvent"

    invoke-virtual {v2, v3, v1}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 95
    const-string v1, "click"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/Click;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v0

    .line 96
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 98
    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 103
    :cond_1
    return-void

    .line 98
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    .line 100
    const/4 v2, 0x1

    invoke-virtual {v0, v2, v4}, Lcom/auditude/ads/model/tracking/TrackingUrl;->log(ZLjava/util/HashMap;)V

    goto :goto_0
.end method

.method private init()V
    .locals 2

    .prologue
    .line 75
    invoke-virtual {p0}, Lcom/auditude/ads/view/BannerView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 76
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 77
    new-instance v0, Lcom/auditude/ads/view/BannerView$MyWebViewClient;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/auditude/ads/view/BannerView$MyWebViewClient;-><init>(Lcom/auditude/ads/view/BannerView;Lcom/auditude/ads/view/BannerView$MyWebViewClient;)V

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/BannerView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 78
    return-void
.end method

.method private pingImpression()V
    .locals 3

    .prologue
    .line 107
    iget-object v0, p0, Lcom/auditude/ads/view/BannerView;->banner:Lcom/auditude/ads/model/OnPageAsset;

    const-string v1, "creativeview"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/OnPageAsset;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v0

    .line 108
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 110
    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 115
    :cond_0
    return-void

    .line 110
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    .line 112
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/auditude/ads/model/tracking/TrackingUrl;->log(Z)V

    goto :goto_0
.end method


# virtual methods
.method public loadBanner(Lcom/auditude/ads/model/IOnPageAsset;Lcom/auditude/ads/core/APIBridge;)V
    .locals 3

    .prologue
    .line 44
    iput-object p2, p0, Lcom/auditude/ads/view/BannerView;->api:Lcom/auditude/ads/core/APIBridge;

    .line 45
    check-cast p1, Lcom/auditude/ads/model/OnPageAsset;

    iput-object p1, p0, Lcom/auditude/ads/view/BannerView;->banner:Lcom/auditude/ads/model/OnPageAsset;

    .line 47
    iget-object v0, p0, Lcom/auditude/ads/view/BannerView;->banner:Lcom/auditude/ads/model/OnPageAsset;

    if-eqz v0, :cond_1

    .line 49
    iget-object v0, p0, Lcom/auditude/ads/view/BannerView;->banner:Lcom/auditude/ads/model/OnPageAsset;

    invoke-virtual {v0}, Lcom/auditude/ads/model/OnPageAsset;->getResourceType()Ljava/lang/String;

    move-result-object v0

    const-string v1, "static"

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/view/BannerView;->banner:Lcom/auditude/ads/model/OnPageAsset;

    invoke-virtual {v0}, Lcom/auditude/ads/model/OnPageAsset;->getResourceType()Ljava/lang/String;

    move-result-object v0

    const-string v1, "html"

    if-ne v0, v1, :cond_2

    .line 51
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/view/BannerView;->banner:Lcom/auditude/ads/model/OnPageAsset;

    invoke-virtual {v0}, Lcom/auditude/ads/model/OnPageAsset;->getSource()Ljava/lang/String;

    move-result-object v0

    const-string v1, "text/html"

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/auditude/ads/view/BannerView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    :cond_1
    :goto_0
    return-void

    .line 53
    :cond_2
    iget-object v0, p0, Lcom/auditude/ads/view/BannerView;->banner:Lcom/auditude/ads/model/OnPageAsset;

    invoke-virtual {v0}, Lcom/auditude/ads/model/OnPageAsset;->getResourceType()Ljava/lang/String;

    move-result-object v0

    const-string v1, "iframe"

    if-ne v0, v1, :cond_1

    .line 55
    iget-object v0, p0, Lcom/auditude/ads/view/BannerView;->banner:Lcom/auditude/ads/model/OnPageAsset;

    invoke-virtual {v0}, Lcom/auditude/ads/model/OnPageAsset;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/auditude/ads/util/AuditudeUtil;->substituteTags(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/BannerView;->loadUrl(Ljava/lang/String;)V

    .line 56
    invoke-direct {p0}, Lcom/auditude/ads/view/BannerView;->pingImpression()V

    goto :goto_0
.end method
