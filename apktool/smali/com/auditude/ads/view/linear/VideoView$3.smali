.class Lcom/auditude/ads/view/linear/VideoView$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# instance fields
.field final synthetic this$0:Lcom/auditude/ads/view/linear/VideoView;


# direct methods
.method constructor <init>(Lcom/auditude/ads/view/linear/VideoView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/auditude/ads/view/linear/VideoView$3;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    .line 341
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2

    .prologue
    const/4 v1, 0x5

    .line 343
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$3;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-static {v0, v1}, Lcom/auditude/ads/view/linear/VideoView;->access$4(Lcom/auditude/ads/view/linear/VideoView;I)V

    .line 344
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$3;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-static {v0, v1}, Lcom/auditude/ads/view/linear/VideoView;->access$12(Lcom/auditude/ads/view/linear/VideoView;I)V

    .line 345
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$3;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$7(Lcom/auditude/ads/view/linear/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 346
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$3;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$7(Lcom/auditude/ads/view/linear/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 348
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$3;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$13(Lcom/auditude/ads/view/linear/VideoView;)Landroid/media/MediaPlayer$OnCompletionListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 349
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$3;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$13(Lcom/auditude/ads/view/linear/VideoView;)Landroid/media/MediaPlayer$OnCompletionListener;

    move-result-object v0

    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView$3;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/auditude/ads/view/linear/VideoView;->access$6(Lcom/auditude/ads/view/linear/VideoView;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/media/MediaPlayer$OnCompletionListener;->onCompletion(Landroid/media/MediaPlayer;)V

    .line 351
    :cond_1
    return-void
.end method
