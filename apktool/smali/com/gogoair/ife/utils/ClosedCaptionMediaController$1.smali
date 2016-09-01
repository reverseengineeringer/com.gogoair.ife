.class Lcom/gogoair/ife/utils/ClosedCaptionMediaController$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/utils/ClosedCaptionMediaController;)V
    .locals 0

    .prologue
    .line 78
    iput-object p1, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController$1;->this$0:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController$1;->this$0:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    # getter for: Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionMediaControllerListener:Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;
    invoke-static {v0}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->access$000(Lcom/gogoair/ife/utils/ClosedCaptionMediaController;)Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController$1;->this$0:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    # getter for: Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionMediaControllerListener:Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;
    invoke-static {v0}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->access$000(Lcom/gogoair/ife/utils/ClosedCaptionMediaController;)Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;->onClosedCaptionButtonPressed()V

    .line 85
    :cond_0
    return-void
.end method
