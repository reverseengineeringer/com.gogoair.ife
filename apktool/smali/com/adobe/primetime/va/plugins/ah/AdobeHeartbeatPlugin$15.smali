.class Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$15;
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
    .line 483
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$15;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 487
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$15;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 496
    :goto_0
    return-object v3

    .line 489
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$15;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_channel:Lcom/adobe/primetime/core/radio/Channel;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$400(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)Lcom/adobe/primetime/core/radio/Channel;

    move-result-object v0

    new-instance v1, Lcom/adobe/primetime/core/Event;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->EVENT_API_SEEK_COMPLETE:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$2000()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lcom/adobe/primetime/core/Event;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/radio/Channel;->trigger(Lcom/adobe/primetime/core/Event;)V

    .line 492
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$15;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_isSeeking:Z
    invoke-static {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$902(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Z)Z

    .line 494
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$15;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    # invokes: Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->_resumePlaybackIfPossible(Ljava/lang/Object;)V
    invoke-static {v0, p1}, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;->access$1400(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Ljava/lang/Object;)V

    goto :goto_0
.end method
