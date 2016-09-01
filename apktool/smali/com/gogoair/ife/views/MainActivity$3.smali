.class Lcom/gogoair/ife/views/MainActivity$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/views/MainActivity;

.field final synthetic val$cursor:Landroid/database/Cursor;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/MainActivity;Landroid/database/Cursor;)V
    .locals 0

    .prologue
    .line 206
    iput-object p1, p0, Lcom/gogoair/ife/views/MainActivity$3;->this$0:Lcom/gogoair/ife/views/MainActivity;

    iput-object p2, p0, Lcom/gogoair/ife/views/MainActivity$3;->val$cursor:Landroid/database/Cursor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4

    .prologue
    .line 209
    invoke-static {}, Lcom/gogoair/ife/utils/GVNetworkManager;->getCurrentNetwork()Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    move-result-object v0

    .line 210
    sget-object v1, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->off:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    if-ne v0, v1, :cond_1

    .line 211
    iget-object v0, p0, Lcom/gogoair/ife/views/MainActivity$3;->this$0:Lcom/gogoair/ife/views/MainActivity;

    iget-object v1, p0, Lcom/gogoair/ife/views/MainActivity$3;->this$0:Lcom/gogoair/ife/views/MainActivity;

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NOWIFI:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    # invokes: Lcom/gogoair/ife/views/MainActivity;->showErrorScreen(Landroid/content/Context;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V
    invoke-static {v0, v1, v2}, Lcom/gogoair/ife/views/MainActivity;->access$200(Lcom/gogoair/ife/views/MainActivity;Landroid/content/Context;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V

    .line 229
    :cond_0
    :goto_0
    return-void

    .line 214
    :cond_1
    sget-object v1, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->ground:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    if-eq v0, v1, :cond_2

    sget-object v1, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->unknown:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    if-ne v0, v1, :cond_3

    .line 215
    :cond_2
    iget-object v0, p0, Lcom/gogoair/ife/views/MainActivity$3;->this$0:Lcom/gogoair/ife/views/MainActivity;

    iget-object v1, p0, Lcom/gogoair/ife/views/MainActivity$3;->this$0:Lcom/gogoair/ife/views/MainActivity;

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NOTASPFLIGHT:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    # invokes: Lcom/gogoair/ife/views/MainActivity;->showErrorScreen(Landroid/content/Context;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V
    invoke-static {v0, v1, v2}, Lcom/gogoair/ife/views/MainActivity;->access$200(Lcom/gogoair/ife/views/MainActivity;Landroid/content/Context;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V

    goto :goto_0

    .line 219
    :cond_3
    iget-object v0, p0, Lcom/gogoair/ife/views/MainActivity$3;->val$cursor:Landroid/database/Cursor;

    invoke-interface {v0, p3}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 220
    new-instance v0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    iget-object v1, p0, Lcom/gogoair/ife/views/MainActivity$3;->val$cursor:Landroid/database/Cursor;

    invoke-direct {v0, v1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;-><init>(Landroid/database/Cursor;)V

    .line 221
    invoke-virtual {v0}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->hasExpired()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 222
    iget-object v0, p0, Lcom/gogoair/ife/views/MainActivity$3;->this$0:Lcom/gogoair/ife/views/MainActivity;

    iget-object v1, p0, Lcom/gogoair/ife/views/MainActivity$3;->this$0:Lcom/gogoair/ife/views/MainActivity;

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->EXPIRED:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    # invokes: Lcom/gogoair/ife/views/MainActivity;->showErrorScreen(Landroid/content/Context;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V
    invoke-static {v0, v1, v2}, Lcom/gogoair/ife/views/MainActivity;->access$200(Lcom/gogoair/ife/views/MainActivity;Landroid/content/Context;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V

    goto :goto_0

    .line 224
    :cond_4
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/gogoair/ife/views/MainActivity$3;->this$0:Lcom/gogoair/ife/views/MainActivity;

    const-class v3, Lcom/gogoair/ife/views/PlayerActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 225
    const-string v2, "INTENT_EXTRA_GV_LIBRARY_ENTRY"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 226
    iget-object v0, p0, Lcom/gogoair/ife/views/MainActivity$3;->this$0:Lcom/gogoair/ife/views/MainActivity;

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/views/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
