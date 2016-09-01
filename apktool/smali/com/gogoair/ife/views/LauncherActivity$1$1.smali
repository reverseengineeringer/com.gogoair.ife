.class Lcom/gogoair/ife/views/LauncherActivity$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$1:Lcom/gogoair/ife/views/LauncherActivity$1;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$intent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/LauncherActivity$1;Landroid/content/Intent;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 34
    iput-object p1, p0, Lcom/gogoair/ife/views/LauncherActivity$1$1;->this$1:Lcom/gogoair/ife/views/LauncherActivity$1;

    iput-object p2, p0, Lcom/gogoair/ife/views/LauncherActivity$1$1;->val$intent:Landroid/content/Intent;

    iput-object p3, p0, Lcom/gogoair/ife/views/LauncherActivity$1$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 37
    iget-object v0, p0, Lcom/gogoair/ife/views/LauncherActivity$1$1;->val$intent:Landroid/content/Intent;

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "GVNETWORK_ON_NETWORK_CHANGED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 38
    iget-object v0, p0, Lcom/gogoair/ife/views/LauncherActivity$1$1;->val$intent:Landroid/content/Intent;

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "GVNETWORK_TYPE_INTENT_EXTRA"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    .line 39
    iget-object v1, p0, Lcom/gogoair/ife/views/LauncherActivity$1$1;->this$1:Lcom/gogoair/ife/views/LauncherActivity$1;

    iget-object v1, v1, Lcom/gogoair/ife/views/LauncherActivity$1;->this$0:Lcom/gogoair/ife/views/LauncherActivity;

    iget-object v2, p0, Lcom/gogoair/ife/views/LauncherActivity$1$1;->val$context:Landroid/content/Context;

    # invokes: Lcom/gogoair/ife/views/LauncherActivity;->handleNetworkType(Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;Landroid/content/Context;)V
    invoke-static {v1, v0, v2}, Lcom/gogoair/ife/views/LauncherActivity;->access$000(Lcom/gogoair/ife/views/LauncherActivity;Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;Landroid/content/Context;)V

    .line 41
    :cond_0
    return-void
.end method
