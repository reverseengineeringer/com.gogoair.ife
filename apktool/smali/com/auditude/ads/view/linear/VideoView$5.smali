.class Lcom/auditude/ads/view/linear/VideoView$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnBufferingUpdateListener;


# instance fields
.field final synthetic this$0:Lcom/auditude/ads/view/linear/VideoView;


# direct methods
.method constructor <init>(Lcom/auditude/ads/view/linear/VideoView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/auditude/ads/view/linear/VideoView$5;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    .line 408
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBufferingUpdate(Landroid/media/MediaPlayer;I)V
    .locals 1

    .prologue
    .line 410
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView$5;->this$0:Lcom/auditude/ads/view/linear/VideoView;

    invoke-static {v0, p2}, Lcom/auditude/ads/view/linear/VideoView;->access$16(Lcom/auditude/ads/view/linear/VideoView;I)V

    .line 411
    return-void
.end method
