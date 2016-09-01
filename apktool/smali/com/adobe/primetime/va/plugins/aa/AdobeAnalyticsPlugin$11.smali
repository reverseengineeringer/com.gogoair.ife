.class Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$11;
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
    .line 476
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$11;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 479
    invoke-static {}, Lcom/adobe/mobile/MobileServices;->getAnalyticsVisitorID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
