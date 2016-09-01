.class Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$4;
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
    .line 237
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .prologue
    .line 246
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_workQueue:Lcom/adobe/primetime/core/radio/CommandQueue;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$1000(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Lcom/adobe/primetime/core/radio/CommandQueue;

    move-result-object v0

    new-instance v1, Lcom/adobe/primetime/core/radio/Command;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$4;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_flushBufferReport:Lcom/adobe/primetime/core/ICallback;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$1100(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Lcom/adobe/primetime/core/ICallback;

    move-result-object v2

    invoke-direct {v1, v2, p0}, Lcom/adobe/primetime/core/radio/Command;-><init>(Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/radio/CommandQueue;->addCommand(Lcom/adobe/primetime/core/radio/Command;)V

    .line 248
    const/4 v0, 0x0

    return-object v0
.end method
