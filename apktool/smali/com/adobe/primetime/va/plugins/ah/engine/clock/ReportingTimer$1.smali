.class Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$1;
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
    .line 50
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 53
    check-cast p1, Lcom/adobe/primetime/core/Event;

    invoke-virtual {p1}, Lcom/adobe/primetime/core/Event;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 54
    const-string v1, "reporting_interval"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    .line 56
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    iget-object v1, v1, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    iget-object v2, v2, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->_logTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "#_onCheckStatusComplete(interval="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    if-eqz v0, :cond_1

    .line 59
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    iget-object v1, v1, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->_interval:Ljava/lang/Double;

    invoke-virtual {v0, v1}, Ljava/lang/Double;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 60
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    iget-object v1, v1, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->_logTag:Ljava/lang/String;

    const-string v2, "#_onCheckStatusComplete() - Interval value not changed."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    :goto_0
    return-object v5

    .line 66
    :cond_0
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    iget-object v1, v1, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    iget-object v2, v2, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->_logTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "#_onCheckStatusComplete() > Interval changed to: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->setInterval(D)V

    goto :goto_0

    .line 71
    :cond_1
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    iget-object v1, v1, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->_logTag:Ljava/lang/String;

    const-string v2, "#_onCheckStatusComplete() - Invalid interval value."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;

    const-wide/high16 v2, 0x4024000000000000L    # 10.0

    invoke-virtual {v0, v2, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/ReportingTimer;->setInterval(D)V

    goto :goto_0
.end method
