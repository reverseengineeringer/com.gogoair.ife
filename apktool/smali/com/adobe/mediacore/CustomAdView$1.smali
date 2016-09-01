.class Lcom/adobe/mediacore/CustomAdView$1;
.super Landroid/webkit/WebViewClient;


# instance fields
.field final synthetic this$0:Lcom/adobe/mediacore/CustomAdView;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/CustomAdView;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/CustomAdView$1;->this$0:Lcom/adobe/mediacore/CustomAdView;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3

    const/4 v0, 0x1

    if-eqz p2, :cond_0

    const-string v1, "http://"

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdView$1;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v1}, Lcom/adobe/mediacore/CustomAdView;->access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v1

    invoke-static {p2, v0}, Lcom/adobe/mediacore/CustomAdEvent;->createAdClickThru(Ljava/lang/String;Z)Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
