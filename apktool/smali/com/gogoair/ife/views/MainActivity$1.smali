.class Lcom/gogoair/ife/views/MainActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/views/MainActivity;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/MainActivity;)V
    .locals 0

    .prologue
    .line 53
    iput-object p1, p0, Lcom/gogoair/ife/views/MainActivity$1;->this$0:Lcom/gogoair/ife/views/MainActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/gogoair/ife/views/MainActivity$1;->this$0:Lcom/gogoair/ife/views/MainActivity;

    # getter for: Lcom/gogoair/ife/views/MainActivity;->viewState:Lcom/gogoair/ife/views/MainActivity$ViewState;
    invoke-static {v0}, Lcom/gogoair/ife/views/MainActivity;->access$000(Lcom/gogoair/ife/views/MainActivity;)Lcom/gogoair/ife/views/MainActivity$ViewState;

    move-result-object v0

    sget-object v1, Lcom/gogoair/ife/views/MainActivity$ViewState;->GROUND:Lcom/gogoair/ife/views/MainActivity$ViewState;

    if-eq v0, v1, :cond_0

    .line 57
    const-string v0, "MainActivity"

    const-string v1, "We are in the air. Check network status only on user interaction."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    :goto_0
    return-void

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/gogoair/ife/views/MainActivity$1;->this$0:Lcom/gogoair/ife/views/MainActivity;

    new-instance v1, Lcom/gogoair/ife/views/MainActivity$1$1;

    invoke-direct {v1, p0, p2, p1}, Lcom/gogoair/ife/views/MainActivity$1$1;-><init>(Lcom/gogoair/ife/views/MainActivity$1;Landroid/content/Intent;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/views/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
