.class public Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/plugin/IPluginConfig;


# static fields
.field private static final DEFAULT_UNKNOWN:Ljava/lang/String; = "unknown"


# instance fields
.field public __isPrimetime:Z

.field public __psdkVersion:Ljava/lang/String;

.field private _publisher:Ljava/lang/String;

.field private _trackingServer:Ljava/lang/String;

.field public debugLogging:Z

.field public ovp:Ljava/lang/String;

.field public quietMode:Z

.field public sdk:Ljava/lang/String;

.field public ssl:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->ssl:Z

    .line 75
    const-string v0, "unknown"

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->ovp:Ljava/lang/String;

    .line 81
    const-string v0, "unknown"

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->sdk:Ljava/lang/String;

    .line 86
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->__isPrimetime:Z

    .line 97
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->quietMode:Z

    .line 103
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->debugLogging:Z

    .line 33
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->_trackingServer:Ljava/lang/String;

    .line 34
    iput-object p2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->_publisher:Ljava/lang/String;

    .line 35
    return-void
.end method


# virtual methods
.method public getPublisher()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->_publisher:Ljava/lang/String;

    return-object v0
.end method

.method public getTrackingServer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPluginConfig;->_trackingServer:Ljava/lang/String;

    return-object v0
.end method
