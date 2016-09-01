.class Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;)V
    .locals 0

    .prologue
    .line 145
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .prologue
    .line 149
    check-cast p1, Ljava/util/HashMap;

    .line 150
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 152
    if-eqz p1, :cond_0

    const-string v1, "reset"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 153
    const-string v0, "reset"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 156
    :cond_0
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;

    invoke-virtual {v1, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->resume(Ljava/lang/Boolean;)V

    .line 158
    const/4 v0, 0x0

    return-object v0
.end method
