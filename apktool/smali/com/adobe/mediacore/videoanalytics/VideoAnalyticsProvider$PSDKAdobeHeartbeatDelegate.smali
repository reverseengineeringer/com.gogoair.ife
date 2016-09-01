.class Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeHeartbeatDelegate;
.super Lcom/adobe/primetime/va/HeartbeatDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PSDKAdobeHeartbeatDelegate"
.end annotation


# instance fields
.field private final LOG_TAG:Ljava/lang/String;

.field private final _logger:Lcom/adobe/mediacore/logging/Logger;

.field final synthetic this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;)V
    .locals 2

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeHeartbeatDelegate;->this$0:Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider;

    invoke-direct {p0}, Lcom/adobe/primetime/va/HeartbeatDelegate;-><init>()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[PSDK-VA]::"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeHeartbeatDelegate;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeHeartbeatDelegate;->LOG_TAG:Ljava/lang/String;

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeHeartbeatDelegate;->LOG_TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/adobe/mediacore/logging/Log;->getLogger(Ljava/lang/String;)Lcom/adobe/mediacore/logging/Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeHeartbeatDelegate;->_logger:Lcom/adobe/mediacore/logging/Logger;

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/primetime/va/ErrorInfo;)V
    .locals 4

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeHeartbeatDelegate;->_logger:Lcom/adobe/mediacore/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsProvider$PSDKAdobeHeartbeatDelegate;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#onError"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "VideoHeartbeat error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/primetime/va/ErrorInfo;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/primetime/va/ErrorInfo;->getDetails()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
