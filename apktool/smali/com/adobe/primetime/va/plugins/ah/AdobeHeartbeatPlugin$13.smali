.class Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$13;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V
    .locals 0

    .prologue
    .line 450
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 454
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 461
    :goto_0
    return-object v2

    .line 457
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isBuffering:Z
    invoke-static {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$1002(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Z)Z

    .line 460
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$13;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # invokes: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_resumePlaybackIfPossible(Ljava/lang/Object;)V
    invoke-static {v0, p1}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$1400(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Ljava/lang/Object;)V

    goto :goto_0
.end method
