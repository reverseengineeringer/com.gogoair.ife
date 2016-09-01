.class Lcom/gogoair/ife/views/PlayerActivity$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/views/PlayerActivity;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 297
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClosedCaptionButtonPressed()V
    .locals 4

    .prologue
    .line 300
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 301
    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    const v2, 0x7f050018

    invoke-virtual {v1, v2}, Lcom/gogoair/ife/views/PlayerActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 302
    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->getCaptionLanguageTitles()Ljava/util/List;
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$2300(Lcom/gogoair/ife/views/PlayerActivity;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 303
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 304
    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    const v3, 0x7f050016

    invoke-virtual {v2, v3}, Lcom/gogoair/ife/views/PlayerActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 305
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/CharSequence;

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    .line 306
    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->selectedClosedCaptionsIndex:I
    invoke-static {v2}, Lcom/gogoair/ife/views/PlayerActivity;->access$1600(Lcom/gogoair/ife/views/PlayerActivity;)I

    move-result v2

    new-instance v3, Lcom/gogoair/ife/views/PlayerActivity$4$2;

    invoke-direct {v3, p0}, Lcom/gogoair/ife/views/PlayerActivity$4$2;-><init>(Lcom/gogoair/ife/views/PlayerActivity$4;)V

    .line 305
    invoke-virtual {v1, v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    const v3, 0x7f050017

    .line 323
    invoke-virtual {v2, v3}, Lcom/gogoair/ife/views/PlayerActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/gogoair/ife/views/PlayerActivity$4$1;

    invoke-direct {v3, p0}, Lcom/gogoair/ife/views/PlayerActivity$4$1;-><init>(Lcom/gogoair/ife/views/PlayerActivity$4;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 328
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 329
    return-void
.end method

.method public onHideMediaController()V
    .locals 1

    .prologue
    .line 338
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->hideActionBar()V
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$2500(Lcom/gogoair/ife/views/PlayerActivity;)V

    .line 339
    return-void
.end method

.method public onShowMediaController()V
    .locals 1

    .prologue
    .line 333
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->showActionBar()V
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$2400(Lcom/gogoair/ife/views/PlayerActivity;)V

    .line 334
    return-void
.end method
