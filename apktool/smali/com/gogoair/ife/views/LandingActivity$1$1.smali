.class Lcom/gogoair/ife/views/LandingActivity$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$1:Lcom/gogoair/ife/views/LandingActivity$1;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$intent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/LandingActivity$1;Landroid/content/Intent;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 46
    iput-object p1, p0, Lcom/gogoair/ife/views/LandingActivity$1$1;->this$1:Lcom/gogoair/ife/views/LandingActivity$1;

    iput-object p2, p0, Lcom/gogoair/ife/views/LandingActivity$1$1;->val$intent:Landroid/content/Intent;

    iput-object p3, p0, Lcom/gogoair/ife/views/LandingActivity$1$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 48
    iget-object v0, p0, Lcom/gogoair/ife/views/LandingActivity$1$1;->val$intent:Landroid/content/Intent;

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "GVNETWORK_TYPE_INTENT_EXTRA"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    .line 49
    sget-object v1, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->off:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    if-ne v0, v1, :cond_1

    .line 50
    iget-object v0, p0, Lcom/gogoair/ife/views/LandingActivity$1$1;->this$1:Lcom/gogoair/ife/views/LandingActivity$1;

    iget-object v0, v0, Lcom/gogoair/ife/views/LandingActivity$1;->this$0:Lcom/gogoair/ife/views/LandingActivity;

    sget-object v1, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NOWIFI:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    # setter for: Lcom/gogoair/ife/views/LandingActivity;->currentErrorCode:Lcom/gogoair/ife/utils/Constants$GVErrorCode;
    invoke-static {v0, v1}, Lcom/gogoair/ife/views/LandingActivity;->access$002(Lcom/gogoair/ife/views/LandingActivity;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    .line 51
    iget-object v0, p0, Lcom/gogoair/ife/views/LandingActivity$1$1;->this$1:Lcom/gogoair/ife/views/LandingActivity$1;

    iget-object v0, v0, Lcom/gogoair/ife/views/LandingActivity$1;->this$0:Lcom/gogoair/ife/views/LandingActivity;

    iget-object v1, p0, Lcom/gogoair/ife/views/LandingActivity$1$1;->this$1:Lcom/gogoair/ife/views/LandingActivity$1;

    iget-object v1, v1, Lcom/gogoair/ife/views/LandingActivity$1;->this$0:Lcom/gogoair/ife/views/LandingActivity;

    # getter for: Lcom/gogoair/ife/views/LandingActivity;->currentErrorCode:Lcom/gogoair/ife/utils/Constants$GVErrorCode;
    invoke-static {v1}, Lcom/gogoair/ife/views/LandingActivity;->access$000(Lcom/gogoair/ife/views/LandingActivity;)Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    move-result-object v1

    # invokes: Lcom/gogoair/ife/views/LandingActivity;->setMessage(Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V
    invoke-static {v0, v1}, Lcom/gogoair/ife/views/LandingActivity;->access$100(Lcom/gogoair/ife/views/LandingActivity;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V

    .line 57
    :cond_0
    :goto_0
    return-void

    .line 52
    :cond_1
    iget-object v0, p0, Lcom/gogoair/ife/views/LandingActivity$1$1;->this$1:Lcom/gogoair/ife/views/LandingActivity$1;

    iget-object v0, v0, Lcom/gogoair/ife/views/LandingActivity$1;->this$0:Lcom/gogoair/ife/views/LandingActivity;

    # getter for: Lcom/gogoair/ife/views/LandingActivity;->currentErrorCode:Lcom/gogoair/ife/utils/Constants$GVErrorCode;
    invoke-static {v0}, Lcom/gogoair/ife/views/LandingActivity;->access$000(Lcom/gogoair/ife/views/LandingActivity;)Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    move-result-object v0

    sget-object v1, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NOWIFI:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    if-ne v0, v1, :cond_0

    .line 53
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/gogoair/ife/views/LandingActivity$1$1;->val$context:Landroid/content/Context;

    const-class v2, Lcom/gogoair/ife/views/MainActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 54
    iget-object v1, p0, Lcom/gogoair/ife/views/LandingActivity$1$1;->this$1:Lcom/gogoair/ife/views/LandingActivity$1;

    iget-object v1, v1, Lcom/gogoair/ife/views/LandingActivity$1;->this$0:Lcom/gogoair/ife/views/LandingActivity;

    invoke-virtual {v1, v0}, Lcom/gogoair/ife/views/LandingActivity;->startActivity(Landroid/content/Intent;)V

    .line 55
    iget-object v0, p0, Lcom/gogoair/ife/views/LandingActivity$1$1;->this$1:Lcom/gogoair/ife/views/LandingActivity$1;

    iget-object v0, v0, Lcom/gogoair/ife/views/LandingActivity$1;->this$0:Lcom/gogoair/ife/views/LandingActivity;

    invoke-virtual {v0}, Lcom/gogoair/ife/views/LandingActivity;->finish()V

    goto :goto_0
.end method
