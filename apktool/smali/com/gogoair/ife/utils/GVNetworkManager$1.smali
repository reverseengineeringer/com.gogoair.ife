.class Lcom/gogoair/ife/utils/GVNetworkManager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/utils/GVNetworkManager;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/utils/GVNetworkManager;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 135
    iput-object p1, p0, Lcom/gogoair/ife/utils/GVNetworkManager$1;->this$0:Lcom/gogoair/ife/utils/GVNetworkManager;

    iput-object p2, p0, Lcom/gogoair/ife/utils/GVNetworkManager$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 138
    iget-object v0, p0, Lcom/gogoair/ife/utils/GVNetworkManager$1;->this$0:Lcom/gogoair/ife/utils/GVNetworkManager;

    iget-object v1, p0, Lcom/gogoair/ife/utils/GVNetworkManager$1;->val$context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/utils/GVNetworkManager;->findCurrentNetwork(Landroid/content/Context;)V

    .line 139
    return-void
.end method
