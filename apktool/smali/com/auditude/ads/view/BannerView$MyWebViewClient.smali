.class Lcom/auditude/ads/view/BannerView$MyWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/auditude/ads/view/BannerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyWebViewClient"
.end annotation


# instance fields
.field private pageLoaded:Ljava/lang/Boolean;

.field final synthetic this$0:Lcom/auditude/ads/view/BannerView;


# direct methods
.method private constructor <init>(Lcom/auditude/ads/view/BannerView;)V
    .locals 1

    .prologue
    .line 117
    iput-object p1, p0, Lcom/auditude/ads/view/BannerView$MyWebViewClient;->this$0:Lcom/auditude/ads/view/BannerView;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 119
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/view/BannerView$MyWebViewClient;->pageLoaded:Ljava/lang/Boolean;

    return-void
.end method

.method synthetic constructor <init>(Lcom/auditude/ads/view/BannerView;Lcom/auditude/ads/view/BannerView$MyWebViewClient;)V
    .locals 0

    .prologue
    .line 117
    invoke-direct {p0, p1}, Lcom/auditude/ads/view/BannerView$MyWebViewClient;-><init>(Lcom/auditude/ads/view/BannerView;)V

    return-void
.end method


# virtual methods
.method public onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/auditude/ads/view/BannerView$MyWebViewClient;->pageLoaded:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 139
    invoke-virtual {p1}, Landroid/webkit/WebView;->stopLoading()V

    .line 140
    iget-object v0, p0, Lcom/auditude/ads/view/BannerView$MyWebViewClient;->this$0:Lcom/auditude/ads/view/BannerView;

    # invokes: Lcom/auditude/ads/view/BannerView;->adClick(Ljava/lang/String;)V
    invoke-static {v0, p2}, Lcom/auditude/ads/view/BannerView;->access$0(Lcom/auditude/ads/view/BannerView;Ljava/lang/String;)V

    .line 142
    :cond_0
    return-void
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 124
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/view/BannerView$MyWebViewClient;->pageLoaded:Ljava/lang/Boolean;

    .line 125
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    .prologue
    .line 147
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/view/BannerView$MyWebViewClient;->pageLoaded:Ljava/lang/Boolean;

    .line 148
    return-void
.end method

.method public shouldOverrideKeyEvent(Landroid/webkit/WebView;Landroid/view/KeyEvent;)Z
    .locals 1

    .prologue
    .line 153
    const/4 v0, 0x1

    return v0
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/auditude/ads/view/BannerView$MyWebViewClient;->this$0:Lcom/auditude/ads/view/BannerView;

    # invokes: Lcom/auditude/ads/view/BannerView;->adClick(Ljava/lang/String;)V
    invoke-static {v0, p2}, Lcom/auditude/ads/view/BannerView;->access$0(Lcom/auditude/ads/view/BannerView;Ljava/lang/String;)V

    .line 131
    const/4 v0, 0x1

    return v0
.end method
