.class Lcom/auditude/ads/view/linear/VideoView$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# instance fields
.field final synthetic this$0:Lcom/auditude/ads/view/linear/VideoView;


# direct methods
.method constructor <init>(Lcom/auditude/ads/view/linear/VideoView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/auditude/ads/view/linear/VideoView$4;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    .line 355
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, -0x1

    .line 357
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$4;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->TAG:Ljava/lang/String;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$14(Lcom/auditude/ads/view/linear/VideoView;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$4;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-static {v0, v3}, Lcom/auditude/ads/view/linear/VideoView;->access$4(Lcom/auditude/ads/view/linear/VideoView;I)V

    .line 359
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$4;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-static {v0, v3}, Lcom/auditude/ads/view/linear/VideoView;->access$12(Lcom/auditude/ads/view/linear/VideoView;I)V

    .line 360
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$4;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$7(Lcom/auditude/ads/view/linear/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 361
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$4;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$7(Lcom/auditude/ads/view/linear/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 365
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$4;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$15(Lcom/auditude/ads/view/linear/VideoView;)Landroid/media/MediaPlayer$OnErrorListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 366
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$4;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$15(Lcom/auditude/ads/view/linear/VideoView;)Landroid/media/MediaPlayer$OnErrorListener;

    move-result-object v0

    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView$4;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/auditude/ads/view/linear/VideoView;->access$6(Lcom/auditude/ads/view/linear/VideoView;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-interface {v0, v1, p2, p3}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 403
    :goto_0
    return v4

    .line 376
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$4;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0}, Lcom/auditude/ads/view/linear/VideoView;->getWindowToken()Landroid/os/IBinder;

    goto :goto_0
.end method
