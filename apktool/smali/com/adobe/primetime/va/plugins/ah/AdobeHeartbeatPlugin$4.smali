.class Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$4;
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
    .line 296
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 300
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # setter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_errorInfo:Lcom/adobe/primetime/va/ErrorInfo;
    invoke-static {v0, v4}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$002(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Lcom/adobe/primetime/va/ErrorInfo;)Lcom/adobe/primetime/va/ErrorInfo;

    .line 303
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 321
    :goto_0
    return-object v4

    .line 306
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isTrackingSessionActive:Z
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$600(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 307
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_channel:Lcom/adobe/primetime/core/radio/Channel;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$400(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)Lcom/adobe/primetime/core/radio/Channel;

    move-result-object v0

    new-instance v1, Lcom/adobe/primetime/core/Event;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_VIDEO_UNLOAD:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$700()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lcom/adobe/primetime/core/Event;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/radio/Channel;->trigger(Lcom/adobe/primetime/core/Event;)V

    .line 311
    :cond_1
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # setter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isTrackingSessionActive:Z
    invoke-static {v0, v3}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$602(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Z)Z

    .line 312
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # setter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isPaused:Z
    invoke-static {v0, v5}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$802(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Z)Z

    .line 313
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # setter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isSeeking:Z
    invoke-static {v0, v3}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$902(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Z)Z

    .line 314
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # setter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isBuffering:Z
    invoke-static {v0, v3}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$1002(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Z)Z

    .line 316
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_channel:Lcom/adobe/primetime/core/radio/Channel;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$400(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)Lcom/adobe/primetime/core/radio/Channel;

    move-result-object v0

    new-instance v1, Lcom/adobe/primetime/core/Event;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_VIDEO_LOAD:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$1100()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lcom/adobe/primetime/core/Event;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/radio/Channel;->trigger(Lcom/adobe/primetime/core/Event;)V

    .line 319
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # setter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isTrackingSessionActive:Z
    invoke-static {v0, v5}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$602(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Z)Z

    goto :goto_0
.end method
