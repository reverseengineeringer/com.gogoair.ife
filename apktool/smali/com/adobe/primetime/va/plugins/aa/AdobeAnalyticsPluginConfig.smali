.class public Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/plugin/IPluginConfig;


# static fields
.field private static DEFAULT_EMPTY_STRING:Ljava/lang/String;


# instance fields
.field public channel:Ljava/lang/String;

.field public debugLogging:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const-string v0, ""

    sput-object v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;->DEFAULT_EMPTY_STRING:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    sget-object v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;->DEFAULT_EMPTY_STRING:Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;->channel:Ljava/lang/String;

    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPluginConfig;->debugLogging:Z

    return-void
.end method
