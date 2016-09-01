.class public Lcom/gogoair/ife/utils/ClosedCaptionMediaController;
.super Landroid/widget/MediaController;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;
    }
.end annotation


# instance fields
.field private closedCaptionButton:Landroid/widget/Button;

.field private closedCaptionMediaControllerListener:Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;

.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0, p1}, Landroid/widget/MediaController;-><init>(Landroid/content/Context;)V

    .line 39
    iput-object p1, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->context:Landroid/content/Context;

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Landroid/widget/MediaController;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    iput-object p1, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->context:Landroid/content/Context;

    .line 35
    return-void
.end method

.method static synthetic access$000(Lcom/gogoair/ife/utils/ClosedCaptionMediaController;)Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionMediaControllerListener:Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;

    return-object v0
.end method


# virtual methods
.method public hide()V
    .locals 1

    .prologue
    .line 60
    invoke-super {p0}, Landroid/widget/MediaController;->hide()V

    .line 61
    iget-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionMediaControllerListener:Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;

    if-eqz v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionMediaControllerListener:Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;

    invoke-interface {v0}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;->onHideMediaController()V

    .line 64
    :cond_0
    return-void
.end method

.method public setAnchorView(Landroid/view/View;)V
    .locals 4

    .prologue
    const/4 v3, -0x2

    .line 69
    invoke-super {p0, p1}, Landroid/widget/MediaController;->setAnchorView(Landroid/view/View;)V

    .line 71
    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionButton:Landroid/widget/Button;

    .line 72
    iget-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v1, "FontAwesome.otf"

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    .line 73
    iget-object v1, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionButton:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 74
    iget-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->context:Landroid/content/Context;

    const v2, 0x7f050019

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 75
    iget-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionButton:Landroid/widget/Button;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 76
    iget-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 77
    iget-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionButton:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 78
    iget-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionButton:Landroid/widget/Button;

    new-instance v1, Lcom/gogoair/ife/utils/ClosedCaptionMediaController$1;

    invoke-direct {v1, p0}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController$1;-><init>(Lcom/gogoair/ife/utils/ClosedCaptionMediaController;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 90
    const v1, 0x800005

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 91
    iget-object v1, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionButton:Landroid/widget/Button;

    invoke-virtual {p0, v1, v0}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    return-void
.end method

.method public setClosedCaptionMediaControllerListener(Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;)V
    .locals 0

    .prologue
    .line 95
    iput-object p1, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionMediaControllerListener:Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;

    .line 96
    return-void
.end method

.method public show()V
    .locals 1

    .prologue
    .line 44
    invoke-super {p0}, Landroid/widget/MediaController;->show()V

    .line 45
    iget-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionMediaControllerListener:Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;

    if-eqz v0, :cond_0

    .line 46
    iget-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionMediaControllerListener:Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;

    invoke-interface {v0}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;->onShowMediaController()V

    .line 48
    :cond_0
    return-void
.end method

.method public show(I)V
    .locals 1

    .prologue
    .line 52
    invoke-super {p0, p1}, Landroid/widget/MediaController;->show(I)V

    .line 53
    iget-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionMediaControllerListener:Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;

    if-eqz v0, :cond_0

    .line 54
    iget-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionMediaControllerListener:Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;

    invoke-interface {v0}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;->onShowMediaController()V

    .line 56
    :cond_0
    return-void
.end method

.method public showClosedCaptionButton()V
    .locals 2

    .prologue
    .line 99
    iget-object v0, p0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->closedCaptionButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 100
    return-void
.end method
