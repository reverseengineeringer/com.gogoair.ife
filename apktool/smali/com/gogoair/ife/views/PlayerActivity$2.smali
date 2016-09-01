.class Lcom/gogoair/ife/views/PlayerActivity$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/mediacore/MediaPlayer$QOSEventListener;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/views/PlayerActivity;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 110
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$2;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBufferComplete()V
    .locals 0

    .prologue
    .line 115
    return-void
.end method

.method public onBufferStart()V
    .locals 6

    .prologue
    .line 119
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$2;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->timeToBufferStart:J
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$100(Lcom/gogoair/ife/views/PlayerActivity;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 120
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$2;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$2;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->createTimestamp:J
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$200(Lcom/gogoair/ife/views/PlayerActivity;)J

    move-result-wide v4

    sub-long/2addr v2, v4

    # setter for: Lcom/gogoair/ife/views/PlayerActivity;->timeToBufferStart:J
    invoke-static {v0, v2, v3}, Lcom/gogoair/ife/views/PlayerActivity;->access$102(Lcom/gogoair/ife/views/PlayerActivity;J)J

    .line 123
    :cond_0
    return-void
.end method

.method public onLoadInfo(Lcom/adobe/mediacore/qos/LoadInfo;)V
    .locals 0

    .prologue
    .line 128
    return-void
.end method

.method public onOperationFailed(Lcom/adobe/mediacore/MediaPlayerNotification$Warning;)V
    .locals 6

    .prologue
    .line 132
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Operation failed with warning "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "ERROR"

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->PLAYER_ERROR:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    invoke-virtual {v2}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->getValue()I

    move-result v2

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/gogoair/ife/views/PlayerActivity$2;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v4}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v4

    invoke-virtual {v4}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getAppData()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcom/adobe/mediacore/MediaPlayerNotification$Warning;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/gogoair/ife/utils/GVLogger;->logASP(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    .line 134
    return-void
.end method

.method public onSeekComplete(J)V
    .locals 3

    .prologue
    .line 138
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "onSeekComplete"

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$2;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->seekProgressDialogHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$500(Lcom/gogoair/ife/views/PlayerActivity;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$2;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->seekProgressDialogRunnable:Ljava/lang/Runnable;
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$400(Lcom/gogoair/ife/views/PlayerActivity;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 140
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$2;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->cancelProgressDialog()V
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$600(Lcom/gogoair/ife/views/PlayerActivity;)V

    .line 141
    return-void
.end method

.method public onSeekStart()V
    .locals 4

    .prologue
    .line 145
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "onSeekStart"

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$2;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->seekProgressDialogHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$500(Lcom/gogoair/ife/views/PlayerActivity;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$2;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->seekProgressDialogRunnable:Ljava/lang/Runnable;
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$400(Lcom/gogoair/ife/views/PlayerActivity;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 147
    return-void
.end method
