.class Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer$2;
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
    .line 162
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .prologue
    .line 166
    check-cast p1, Ljava/util/HashMap;

    .line 167
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 169
    if-eqz p1, :cond_0

    const-string v0, "reset"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 170
    const-string v0, "reset"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 173
    :goto_0
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;

    invoke-virtual {v1, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->pause(Ljava/lang/Boolean;)V

    .line 175
    const/4 v0, 0x0

    return-object v0

    :cond_0
    move-object v0, v1

    goto :goto_0
.end method
