.class Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;

.field final synthetic val$payload:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 155
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$2;->this$1:Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2;

    iput-object p2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$2;->val$payload:Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 158
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$2;->val$payload:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$2;->val$payload:Ljava/util/HashMap;

    const-string v1, "callback"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 159
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/Network$2$2;->val$payload:Ljava/util/HashMap;

    const-string v1, "callback"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/ICallback;

    invoke-interface {v0, v2}, Lcom/adobe/primetime/core/ICallback;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    :cond_0
    return-object v2
.end method
