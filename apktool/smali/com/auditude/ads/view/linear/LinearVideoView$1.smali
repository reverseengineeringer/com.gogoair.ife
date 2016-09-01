.class Lcom/auditude/ads/view/linear/LinearVideoView$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$0:Lcom/auditude/ads/view/linear/LinearVideoView;


# direct methods
.method constructor <init>(Lcom/auditude/ads/view/linear/LinearVideoView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/auditude/ads/view/linear/LinearVideoView$1;->this$0:Lcom/auditude/ads/view/linear/LinearVideoView;

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/auditude/ads/view/linear/LinearVideoView$1;->this$0:Lcom/auditude/ads/view/linear/LinearVideoView;

    # invokes: Lcom/auditude/ads/view/linear/LinearVideoView;->updatePosition()V
    invoke-static {v0}, Lcom/auditude/ads/view/linear/LinearVideoView;->access$0(Lcom/auditude/ads/view/linear/LinearVideoView;)V

    .line 40
    return-void
.end method
