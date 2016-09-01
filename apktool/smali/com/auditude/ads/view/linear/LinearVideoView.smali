.class public Lcom/auditude/ads/view/linear/LinearVideoView;
.super Lcom/auditude/ads/view/AdView;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Lcom/auditude/ads/view/ILinearAdView;


# static fields
.field private static final CATEGORY:Ljava/lang/String; = "LinearVideoView"

.field private static final UPDATE_FREQUENCY:I = 0x1f4


# instance fields
.field private isVideoReadyToBePlayed:Z

.field private player:Landroid/media/MediaPlayer;

.field private final positionHandler:Landroid/os/Handler;

.field private final updatePositionRunnable:Ljava/lang/Runnable;

.field private videoView:Lcom/auditude/ads/view/linear/VideoView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .prologue
    const/4 v3, -0x1

    .line 45
    invoke-direct {p0, p1}, Lcom/auditude/ads/view/AdView;-><init>(Landroid/content/Context;)V

    .line 29
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->isVideoReadyToBePlayed:Z

    .line 33
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->positionHandler:Landroid/os/Handler;

    .line 35
    new-instance v0, Lcom/auditude/ads/view/linear/LinearVideoView$1;

    invoke-direct {v0, p0}, Lcom/auditude/ads/view/linear/LinearVideoView$1;-><init>(Lcom/auditude/ads/view/linear/LinearVideoView;)V

    iput-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->updatePositionRunnable:Ljava/lang/Runnable;

    .line 48
    const/high16 v0, -0x1000000

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/linear/LinearVideoView;->setBackgroundColor(I)V

    .line 51
    new-instance v0, Lcom/auditude/ads/view/linear/VideoView;

    invoke-direct {v0, p1}, Lcom/auditude/ads/view/linear/VideoView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    .line 52
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v2, 0x11

    invoke-direct {v1, v3, v3, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/view/linear/LinearVideoView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0, p0}, Lcom/auditude/ads/view/linear/VideoView;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 55
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0, p0}, Lcom/auditude/ads/view/linear/VideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 56
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0, p0}, Lcom/auditude/ads/view/linear/VideoView;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 57
    return-void
.end method

.method static synthetic access$0(Lcom/auditude/ads/view/linear/LinearVideoView;)V
    .locals 0

    .prologue
    .line 192
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/LinearVideoView;->updatePosition()V

    return-void
.end method

.method private close()V
    .locals 2

    .prologue
    .line 219
    :try_start_0
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->positionHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->updatePositionRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 220
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/LinearVideoView;->stopVideoPlayback()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 226
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->isVideoReadyToBePlayed:Z

    .line 227
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->player:Landroid/media/MediaPlayer;

    .line 228
    return-void

    .line 222
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private notifyError()V
    .locals 1

    .prologue
    .line 204
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/auditude/ads/view/linear/LinearVideoView;->notifyError(Ljava/lang/String;)V

    .line 205
    return-void
.end method

.method private notifyError(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 209
    const-string v0, "LinearVideoView"

    invoke-static {v0}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "--> LinearVideoView onError"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    .line 211
    sget-object v0, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_ERROR:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/linear/LinearVideoView;->notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;)V

    .line 212
    return-void
.end method

.method private startVideoPlayback()V
    .locals 3

    .prologue
    .line 234
    :try_start_0
    sget-object v0, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_START:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/linear/LinearVideoView;->notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;)V

    .line 236
    const-string v0, "LinearVideoView"

    invoke-static {v0}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v0

    const-string v1, "--> LinearVideoView startVideoPlayback"

    invoke-interface {v0, v1}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    .line 238
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 240
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->player:Landroid/media/MediaPlayer;

    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/LinearVideoView;->getController()Lcom/auditude/ads/view/IViewController;

    move-result-object v1

    invoke-interface {v1}, Lcom/auditude/ads/view/IViewController;->getLeftVolume()F

    move-result v1

    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/LinearVideoView;->getController()Lcom/auditude/ads/view/IViewController;

    move-result-object v2

    invoke-interface {v2}, Lcom/auditude/ads/view/IViewController;->getRightVolume()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 243
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0}, Lcom/auditude/ads/view/linear/VideoView;->start()V

    .line 244
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0}, Lcom/auditude/ads/view/linear/VideoView;->invalidate()V

    .line 245
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/LinearVideoView;->updatePosition()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 252
    :goto_0
    return-void

    .line 247
    :catch_0
    move-exception v0

    .line 249
    sget-object v0, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_ERROR:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/linear/LinearVideoView;->notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;)V

    goto :goto_0
.end method

.method private stopVideoPlayback()V
    .locals 2

    .prologue
    .line 256
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 258
    const-string v0, "LinearVideoView"

    invoke-static {v0}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v0

    const-string v1, "--> LinearVideoView stopVideoPlayback"

    invoke-interface {v0, v1}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    .line 259
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0}, Lcom/auditude/ads/view/linear/VideoView;->stopPlayback()V

    .line 261
    :cond_0
    return-void
.end method

.method private updatePosition()V
    .locals 4

    .prologue
    .line 194
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->positionHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->updatePositionRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 196
    sget-object v0, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_PROGRESS:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/linear/LinearVideoView;->notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;)V

    .line 197
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0}, Lcom/auditude/ads/view/linear/VideoView;->invalidate()V

    .line 199
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->positionHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->updatePositionRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 200
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 340
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/LinearVideoView;->close()V

    .line 342
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    if-eqz v0, :cond_1

    .line 344
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/linear/LinearVideoView;->indexOfChild(Landroid/view/View;)I

    move-result v0

    if-ltz v0, :cond_0

    .line 346
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/linear/LinearVideoView;->removeView(Landroid/view/View;)V

    .line 348
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->player:Landroid/media/MediaPlayer;

    .line 351
    :cond_1
    invoke-super {p0}, Lcom/auditude/ads/view/AdView;->dispose()V

    .line 352
    return-void
.end method

.method public getDuration()I
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0}, Lcom/auditude/ads/view/linear/VideoView;->getDuration()I

    move-result v0

    return v0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0}, Lcom/auditude/ads/view/linear/VideoView;->getCurrentPosition()I

    move-result v0

    return v0
.end method

.method public hide(Lcom/auditude/ads/view/model/IAdViewSource;)V
    .locals 0

    .prologue
    .line 150
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/LinearVideoView;->close()V

    .line 153
    invoke-super {p0, p1}, Lcom/auditude/ads/view/AdView;->hide(Lcom/auditude/ads/view/model/IAdViewSource;)V

    .line 154
    return-void
.end method

.method public initialize(Lcom/auditude/ads/view/IViewController;)V
    .locals 0

    .prologue
    .line 83
    invoke-super {p0, p1}, Lcom/auditude/ads/view/AdView;->initialize(Lcom/auditude/ads/view/IViewController;)V

    .line 84
    return-void
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2

    .prologue
    .line 302
    const-string v0, "LinearVideoView"

    invoke-static {v0}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v0

    const-string v1, "--> LinearVideoView onCompletion"

    invoke-interface {v0, v1}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    .line 303
    sget-object v0, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_COMPLETE:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/linear/LinearVideoView;->notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;)V

    .line 304
    return-void
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 267
    const-string v0, "Unknown error"

    .line 268
    sparse-switch p2, :sswitch_data_0

    .line 284
    invoke-direct {p0, v0}, Lcom/auditude/ads/view/linear/LinearVideoView;->notifyError(Ljava/lang/String;)V

    .line 285
    :goto_0
    return v1

    .line 271
    :sswitch_0
    const-string v0, "Unable to play media"

    .line 272
    invoke-direct {p0, v0}, Lcom/auditude/ads/view/linear/LinearVideoView;->notifyError(Ljava/lang/String;)V

    goto :goto_0

    .line 275
    :sswitch_1
    const-string v0, "Server failed"

    .line 276
    invoke-direct {p0, v0}, Lcom/auditude/ads/view/linear/LinearVideoView;->notifyError(Ljava/lang/String;)V

    goto :goto_0

    .line 279
    :sswitch_2
    const-string v0, "Invalid media"

    .line 280
    invoke-direct {p0, v0}, Lcom/auditude/ads/view/linear/LinearVideoView;->notifyError(Ljava/lang/String;)V

    goto :goto_0

    .line 268
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x64 -> :sswitch_1
        0xc8 -> :sswitch_2
    .end sparse-switch
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 2

    .prologue
    .line 290
    const-string v0, "LinearVideoView"

    invoke-static {v0}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v0

    const-string v1, "--> LinearVideoView OnPrepared"

    invoke-interface {v0, v1}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    .line 291
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->isVideoReadyToBePlayed:Z

    .line 292
    iput-object p1, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->player:Landroid/media/MediaPlayer;

    .line 294
    iget-boolean v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->isVideoReadyToBePlayed:Z

    if-eqz v0, :cond_0

    .line 296
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/LinearVideoView;->startVideoPlayback()V

    .line 298
    :cond_0
    return-void
.end method

.method public final pause()V
    .locals 1

    .prologue
    .line 168
    :try_start_0
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0}, Lcom/auditude/ads/view/linear/VideoView;->pause()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    :goto_0
    return-void

    .line 170
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public reset()V
    .locals 0

    .prologue
    .line 159
    invoke-super {p0}, Lcom/auditude/ads/view/AdView;->reset()V

    .line 161
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/LinearVideoView;->close()V

    .line 162
    return-void
.end method

.method protected resize(II)V
    .locals 0

    .prologue
    .line 189
    invoke-super {p0, p1, p2}, Lcom/auditude/ads/view/AdView;->resize(II)V

    .line 190
    return-void
.end method

.method public final resume()V
    .locals 1

    .prologue
    .line 179
    :try_start_0
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0}, Lcom/auditude/ads/view/linear/VideoView;->start()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    :goto_0
    return-void

    .line 181
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public setVolume(FF)V
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1, p2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 66
    :cond_0
    return-void
.end method

.method public show(Lcom/auditude/ads/view/model/IAdViewSource;)V
    .locals 4

    .prologue
    .line 89
    invoke-super {p0, p1}, Lcom/auditude/ads/view/AdView;->show(Lcom/auditude/ads/view/model/IAdViewSource;)V

    .line 91
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v2

    .line 92
    const/4 v0, 0x0

    .line 93
    const-string v1, "repackageCreativeEnabled"

    invoke-virtual {v2, v1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 95
    const-string v0, "repackageCreativeEnabled"

    invoke-virtual {v2, v0}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 98
    :cond_0
    const-string v1, ""

    .line 99
    const-string v3, "repackageCreativeFormat"

    invoke-virtual {v2, v3}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 101
    const-string v1, "repackageCreativeFormat"

    invoke-virtual {v2, v1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 104
    :cond_1
    const/4 v2, 0x0

    .line 105
    invoke-static {v1}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    if-eqz v0, :cond_2

    .line 107
    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/LinearVideoView;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 109
    invoke-interface {p1}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/LinearAsset;

    if-eqz v0, :cond_4

    .line 111
    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/LinearVideoView;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/LinearAsset;

    invoke-virtual {v0}, Lcom/auditude/ads/model/LinearAsset;->getBestMediaFile()Lcom/auditude/ads/model/media/MediaFile;

    move-result-object v0

    iget-object v0, v0, Lcom/auditude/ads/model/media/MediaFile;->source:Ljava/lang/String;

    .line 123
    :goto_0
    if-nez v0, :cond_3

    .line 125
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/LinearVideoView;->notifyError()V

    .line 145
    :goto_1
    return-void

    .line 117
    :cond_2
    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/LinearVideoView;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 119
    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/LinearVideoView;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/model/IAsset;->getUrl()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 131
    :cond_3
    :try_start_0
    iget-object v1, p0, Lcom/auditude/ads/view/linear/LinearVideoView;->videoView:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v1, v0}, Lcom/auditude/ads/view/linear/VideoView;->setVideoPath(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_1

    .line 133
    :catch_0
    move-exception v0

    .line 135
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_1

    .line 137
    :catch_1
    move-exception v0

    .line 139
    invoke-virtual {v0}, Ljava/lang/SecurityException;->printStackTrace()V

    goto :goto_1

    .line 141
    :catch_2
    move-exception v0

    .line 143
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    goto :goto_1

    :cond_4
    move-object v0, v2

    goto :goto_0
.end method
