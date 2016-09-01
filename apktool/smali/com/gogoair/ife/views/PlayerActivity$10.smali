.class Lcom/gogoair/ife/views/PlayerActivity$10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/views/PlayerActivity;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 754
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$10;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 6

    .prologue
    .line 757
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$10;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->playerFrame:Landroid/widget/FrameLayout;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$3100(Lcom/gogoair/ife/views/PlayerActivity;)Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 758
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$10;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$10;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movieWidth:J
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$700(Lcom/gogoair/ife/views/PlayerActivity;)J

    move-result-wide v2

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$10;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movieHeight:J
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$800(Lcom/gogoair/ife/views/PlayerActivity;)J

    move-result-wide v4

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->setPlayerViewSize(JJ)V
    invoke-static {v0, v2, v3, v4, v5}, Lcom/gogoair/ife/views/PlayerActivity;->access$900(Lcom/gogoair/ife/views/PlayerActivity;JJ)V

    .line 759
    return-void
.end method
