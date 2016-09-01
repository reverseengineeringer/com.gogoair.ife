.class Lcom/auditude/ads/view/linear/VideoView$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# instance fields
.field final synthetic this$0:Lcom/auditude/ads/view/linear/VideoView;


# direct methods
.method constructor <init>(Lcom/auditude/ads/view/linear/VideoView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    .line 275
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x1

    .line 277
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/auditude/ads/view/linear/VideoView;->access$4(Lcom/auditude/ads/view/linear/VideoView;I)V

    .line 294
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$5(Lcom/auditude/ads/view/linear/VideoView;)Landroid/media/MediaPlayer$OnPreparedListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 295
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$5(Lcom/auditude/ads/view/linear/VideoView;)Landroid/media/MediaPlayer$OnPreparedListener;

    move-result-object v0

    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/auditude/ads/view/linear/VideoView;->access$6(Lcom/auditude/ads/view/linear/VideoView;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/media/MediaPlayer$OnPreparedListener;->onPrepared(Landroid/media/MediaPlayer;)V

    .line 297
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$7(Lcom/auditude/ads/view/linear/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 298
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$7(Lcom/auditude/ads/view/linear/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/widget/MediaController;->setEnabled(Z)V

    .line 300
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v1

    invoke-static {v0, v1}, Lcom/auditude/ads/view/linear/VideoView;->access$0(Lcom/auditude/ads/view/linear/VideoView;I)V

    .line 301
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v1

    invoke-static {v0, v1}, Lcom/auditude/ads/view/linear/VideoView;->access$1(Lcom/auditude/ads/view/linear/VideoView;I)V

    .line 303
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mSeekWhenPrepared:I
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$8(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v0

    .line 304
    if-eqz v0, :cond_2

    .line 305
    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v1, v0}, Lcom/auditude/ads/view/linear/VideoView;->seekTo(I)V

    .line 307
    :cond_2
    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mVideoWidth:I
    invoke-static {v1}, Lcom/auditude/ads/view/linear/VideoView;->access$2(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mVideoHeight:I
    invoke-static {v1}, Lcom/auditude/ads/view/linear/VideoView;->access$3(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v1

    if-eqz v1, :cond_6

    .line 309
    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v1}, Lcom/auditude/ads/view/linear/VideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    iget-object v2, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mVideoWidth:I
    invoke-static {v2}, Lcom/auditude/ads/view/linear/VideoView;->access$2(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v2

    iget-object v3, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mVideoHeight:I
    invoke-static {v3}, Lcom/auditude/ads/view/linear/VideoView;->access$3(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 310
    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mSurfaceWidth:I
    invoke-static {v1}, Lcom/auditude/ads/view/linear/VideoView;->access$9(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v1

    iget-object v2, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mVideoWidth:I
    invoke-static {v2}, Lcom/auditude/ads/view/linear/VideoView;->access$2(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v2

    if-ne v1, v2, :cond_3

    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mSurfaceHeight:I
    invoke-static {v1}, Lcom/auditude/ads/view/linear/VideoView;->access$10(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v1

    iget-object v2, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mVideoHeight:I
    invoke-static {v2}, Lcom/auditude/ads/view/linear/VideoView;->access$3(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v2

    if-ne v1, v2, :cond_3

    .line 314
    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mTargetState:I
    invoke-static {v1}, Lcom/auditude/ads/view/linear/VideoView;->access$11(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v1

    if-ne v1, v5, :cond_4

    .line 315
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0}, Lcom/auditude/ads/view/linear/VideoView;->start()V

    .line 316
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$7(Lcom/auditude/ads/view/linear/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 317
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$7(Lcom/auditude/ads/view/linear/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/MediaController;->show()V

    .line 335
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0, v4}, Lcom/auditude/ads/view/linear/VideoView;->setZOrderOnTop(Z)V

    .line 336
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0, v4}, Lcom/auditude/ads/view/linear/VideoView;->setZOrderMediaOverlay(Z)V

    .line 337
    return-void

    .line 319
    :cond_4
    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v1}, Lcom/auditude/ads/view/linear/VideoView;->isPlaying()Z

    move-result v1

    if-nez v1, :cond_3

    .line 320
    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0}, Lcom/auditude/ads/view/linear/VideoView;->getCurrentPosition()I

    move-result v0

    if-lez v0, :cond_3

    .line 321
    :cond_5
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$7(Lcom/auditude/ads/view/linear/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 323
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$7(Lcom/auditude/ads/view/linear/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/MediaController;->show(I)V

    goto :goto_0

    .line 330
    :cond_6
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mTargetState:I
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$11(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v0

    if-ne v0, v5, :cond_3

    .line 331
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$2;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0}, Lcom/auditude/ads/view/linear/VideoView;->start()V

    goto :goto_0
.end method
