.class Lcom/gogoair/ife/views/PlayerActivity$8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/views/PlayerActivity;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 577
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$8;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 580
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$8;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaController:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$3000(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    move-result-object v0

    if-nez v0, :cond_0

    .line 587
    :goto_0
    return v2

    .line 583
    :cond_0
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$8;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaController:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$3000(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 584
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$8;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaController:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$3000(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->hide()V

    goto :goto_0

    .line 586
    :cond_1
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$8;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaController:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$3000(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    move-result-object v0

    const/16 v1, 0x1388

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->show(I)V

    goto :goto_0
.end method
