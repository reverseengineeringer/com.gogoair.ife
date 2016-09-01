.class Lcom/adobe/mediacore/CustomAdView$2;
.super Landroid/webkit/WebChromeClient;


# instance fields
.field final synthetic this$0:Lcom/adobe/mediacore/CustomAdView;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/CustomAdView;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/CustomAdView$2;->this$0:Lcom/adobe/mediacore/CustomAdView;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z
    .locals 4

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView$2;->this$0:Lcom/adobe/mediacore/CustomAdView;

    # getter for: Lcom/adobe/mediacore/CustomAdView;->_logger:Lcom/adobe/mediacore/logging/Logger;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdView;->access$200(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/logging/Logger;

    move-result-object v0

    # getter for: Lcom/adobe/mediacore/CustomAdView;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mediacore/CustomAdView;->access$100()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->message()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " -- From line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->lineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->sourceId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0
.end method
