.class Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$19;
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
    .line 649
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$19;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 653
    invoke-static {}, Lcom/adobe/mobile/MobileServices;->getVisitorID()Ljava/lang/String;

    .line 654
    invoke-static {}, Lcom/adobe/mobile/MobileServices;->getAnalyticsVisitorID()Ljava/lang/String;

    .line 655
    invoke-static {}, Lcom/adobe/mobile/MobileServices;->getMarketingCloudVisitorID()Ljava/lang/String;

    .line 658
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$19;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # invokes: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_onAppMeasurementReady()V
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$2200(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V

    .line 659
    const/4 v0, 0x0

    return-object v0
.end method
