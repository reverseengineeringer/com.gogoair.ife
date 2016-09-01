.class Lcom/auditude/ads/view/linear/VideoView$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# instance fields
.field final synthetic this$0:Lcom/auditude/ads/view/linear/VideoView;


# direct methods
.method constructor <init>(Lcom/auditude/ads/view/linear/VideoView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    .line 449
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 454
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-static {v0, p3}, Lcom/auditude/ads/view/linear/VideoView;->access$17(Lcom/auditude/ads/view/linear/VideoView;I)V

    .line 455
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-static {v0, p4}, Lcom/auditude/ads/view/linear/VideoView;->access$18(Lcom/auditude/ads/view/linear/VideoView;I)V

    .line 456
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mTargetState:I
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$11(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v0

    const/4 v3, 0x3

    if-ne v0, v3, :cond_2

    move v0, v1

    .line 457
    :goto_0
    iget-object v3, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mVideoWidth:I
    invoke-static {v3}, Lcom/auditude/ads/view/linear/VideoView;->access$2(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v3

    if-ne v3, p3, :cond_3

    iget-object v3, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mVideoHeight:I
    invoke-static {v3}, Lcom/auditude/ads/view/linear/VideoView;->access$3(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v3

    if-ne v3, p4, :cond_3

    .line 458
    :goto_1
    iget-object v2, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v2}, Lcom/auditude/ads/view/linear/VideoView;->access$6(Lcom/auditude/ads/view/linear/VideoView;)Landroid/media/MediaPlayer;

    move-result-object v2

    if-eqz v2, :cond_1

    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    .line 459
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mSeekWhenPrepared:I
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$8(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 460
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mSeekWhenPrepared:I
    invoke-static {v1}, Lcom/auditude/ads/view/linear/VideoView;->access$8(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/auditude/ads/view/linear/VideoView;->seekTo(I)V

    .line 462
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0}, Lcom/auditude/ads/view/linear/VideoView;->start()V

    .line 464
    :cond_1
    return-void

    :cond_2
    move v0, v2

    .line 456
    goto :goto_0

    :cond_3
    move v1, v2

    .line 457
    goto :goto_1
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    .prologue
    .line 468
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-static {v0, p1}, Lcom/auditude/ads/view/linear/VideoView;->access$19(Lcom/auditude/ads/view/linear/VideoView;Landroid/view/SurfaceHolder;)V

    .line 469
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # invokes: Lcom/auditude/ads/view/linear/VideoView;->openVideo()V
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$20(Lcom/auditude/ads/view/linear/VideoView;)V

    .line 470
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2

    .prologue
    .line 475
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/auditude/ads/view/linear/VideoView;->access$19(Lcom/auditude/ads/view/linear/VideoView;Landroid/view/SurfaceHolder;)V

    .line 476
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$7(Lcom/auditude/ads/view/linear/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$7(Lcom/auditude/ads/view/linear/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 477
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$6;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    const/4 v1, 0x1

    # invokes: Lcom/auditude/ads/view/linear/VideoView;->release(Z)V
    invoke-static {v0, v1}, Lcom/auditude/ads/view/linear/VideoView;->access$21(Lcom/auditude/ads/view/linear/VideoView;Z)V

    .line 478
    return-void
.end method
