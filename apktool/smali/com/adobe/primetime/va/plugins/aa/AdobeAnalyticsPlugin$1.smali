.class Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V
    .locals 0

    .prologue
    .line 213
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$1;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 217
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$1;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # setter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;
    invoke-static {v0, v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$002(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;Lcom/adobe/primetime/va/ErrorInfo;)Lcom/adobe/primetime/va/ErrorInfo;

    .line 218
    return-object v1
.end method
