.class public Lcom/adobe/mobile/MobileServices;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAnalyticsVisitorID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    invoke-static {}, Lcom/adobe/mobile/Analytics;->getTrackingIdentifier()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMarketingCloudVisitorID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    invoke-static {}, Lcom/adobe/mobile/Visitor;->getMarketingCloudId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getReportSuiteIDs()Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    invoke-static {}, Lcom/adobe/mobile/MobileConfig;->getInstance()Lcom/adobe/mobile/MobileConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mobile/MobileConfig;->getReportSuiteIds()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSCTrackingServer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    invoke-static {}, Lcom/adobe/mobile/MobileConfig;->getInstance()Lcom/adobe/mobile/MobileConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mobile/MobileConfig;->getTrackingServer()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUseSSL()Z
    .locals 1

    .prologue
    .line 23
    invoke-static {}, Lcom/adobe/mobile/MobileConfig;->getInstance()Lcom/adobe/mobile/MobileConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mobile/MobileConfig;->getSSL()Z

    move-result v0

    return v0
.end method

.method public static getVisitorID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    invoke-static {}, Lcom/adobe/mobile/Config;->getUserIdentifier()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
