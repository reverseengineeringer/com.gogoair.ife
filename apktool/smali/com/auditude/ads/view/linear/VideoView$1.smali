.class Lcom/auditude/ads/view/linear/VideoView$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnVideoSizeChangedListener;


# instance fields
.field final synthetic this$0:Lcom/auditude/ads/view/linear/VideoView;


# direct methods
.method constructor <init>(Lcom/auditude/ads/view/linear/VideoView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/auditude/ads/view/linear/VideoView$1;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    .line 265
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onVideoSizeChanged(Landroid/media/MediaPlayer;II)V
    .locals 3

    .prologue
    .line 267
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$1;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v1

    invoke-static {v0, v1}, Lcom/auditude/ads/view/linear/VideoView;->access$0(Lcom/auditude/ads/view/linear/VideoView;I)V

    .line 268
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$1;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v1

    invoke-static {v0, v1}, Lcom/auditude/ads/view/linear/VideoView;->access$1(Lcom/auditude/ads/view/linear/VideoView;I)V

    .line 269
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$1;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mVideoWidth:I
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$2(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$1;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mVideoHeight:I
    invoke-static {v0}, Lcom/auditude/ads/view/linear/VideoView;->access$3(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 270
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$1;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-virtual {v0}, Lcom/auditude/ads/view/linear/VideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView$1;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mVideoWidth:I
    invoke-static {v1}, Lcom/auditude/ads/view/linear/VideoView;->access$2(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v1

    iget-object v2, p0, Lcom/auditude/ads/view/linear/VideoView$1;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    # getter for: Lcom/auditude/ads/view/linear/VideoView;->mVideoHeight:I
    invoke-static {v2}, Lcom/auditude/ads/view/linear/VideoView;->access$3(Lcom/auditude/ads/view/linear/VideoView;)I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 272
    :cond_0
    return-void
.end method
