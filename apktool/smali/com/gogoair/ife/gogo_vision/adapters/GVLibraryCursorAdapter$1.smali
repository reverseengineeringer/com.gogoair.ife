.class Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;

.field final synthetic val$duration:I

.field final synthetic val$playbackPosition:I

.field final synthetic val$progressView:Landroid/widget/ImageView;

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;Landroid/widget/ImageView;IILandroid/view/View;)V
    .locals 0

    .prologue
    .line 67
    iput-object p1, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$1;->this$0:Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;

    iput-object p2, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$1;->val$progressView:Landroid/widget/ImageView;

    iput p3, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$1;->val$playbackPosition:I

    iput p4, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$1;->val$duration:I

    iput-object p5, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$1;->val$view:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 4

    .prologue
    .line 71
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$1;->val$progressView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v0

    int-to-long v0, v0

    .line 72
    iget v2, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$1;->val$playbackPosition:I

    int-to-long v2, v2

    mul-long/2addr v0, v2

    iget v2, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$1;->val$duration:I

    int-to-long v2, v2

    div-long v2, v0, v2

    .line 74
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$1;->val$view:Landroid/view/View;

    const v1, 0x7f0b0060

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 76
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    long-to-int v1, v2

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 78
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$1;->val$progressView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 79
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$1;->val$progressView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->invalidate()V

    .line 80
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$1;->val$progressView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->requestLayout()V

    .line 81
    return-void
.end method
