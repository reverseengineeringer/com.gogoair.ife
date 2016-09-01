.class Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;)V
    .locals 0

    .prologue
    .line 107
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/CheckStatusTimer;->_interval:Ljava/lang/Double;

    return-object v0
.end method
