.class Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$1;
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
    .line 104
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 108
    check-cast p1, Ljava/util/HashMap;

    .line 110
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_isDestroyed:Z
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 139
    :cond_0
    :goto_0
    return-object v5

    .line 112
    :cond_1
    const-string v0, "report"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;

    .line 113
    if-eqz v0, :cond_3

    .line 121
    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getSessionData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;->getSessionId()Ljava/lang/String;

    move-result-object v1

    .line 123
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_reportBuffer:Ljava/util/Map;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 124
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_reportBuffer:Ljava/util/Map;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Ljava/util/Map;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    :cond_2
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_reportBuffer:Ljava/util/Map;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    :cond_3
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_isBufferingInProgress:Z
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$200(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_isBufferingInProgress:Z
    invoke-static {v0, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$202(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;Z)Z

    .line 133
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 134
    const-string v1, "reset"

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    const-string v1, "repeat_count"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$1;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_channel:Lcom/adobe/primetime/core/radio/Channel;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$300(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Lcom/adobe/primetime/core/radio/Channel;

    move-result-object v1

    const-string v2, "clock:flush_filter.resume"

    invoke-virtual {v1, v2, v0}, Lcom/adobe/primetime/core/radio/Channel;->command(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method
