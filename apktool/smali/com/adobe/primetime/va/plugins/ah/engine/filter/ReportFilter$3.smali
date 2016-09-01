.class Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)V
    .locals 0

    .prologue
    .line 218
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .prologue
    .line 221
    check-cast p1, Lcom/adobe/primetime/core/Event;

    .line 223
    invoke-virtual {p1}, Lcom/adobe/primetime/core/Event;->getData()Ljava/lang/Object;

    move-result-object v0

    .line 230
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_workQueue:Lcom/adobe/primetime/core/radio/CommandQueue;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$1000(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Lcom/adobe/primetime/core/radio/CommandQueue;

    move-result-object v1

    new-instance v2, Lcom/adobe/primetime/core/radio/Command;

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$3;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_bufferReport:Lcom/adobe/primetime/core/ICallback;
    invoke-static {v3}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$900(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Lcom/adobe/primetime/core/ICallback;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lcom/adobe/primetime/core/radio/Command;-><init>(Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Lcom/adobe/primetime/core/radio/CommandQueue;->addCommand(Lcom/adobe/primetime/core/radio/Command;)V

    .line 232
    const/4 v0, 0x0

    return-object v0
.end method
