.class Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;)V
    .locals 0

    .prologue
    .line 85
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->_interval:Ljava/lang/Double;

    return-object v0
.end method
