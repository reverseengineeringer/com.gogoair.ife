.class Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$2;
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
    .line 143
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 147
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_isDestroyed:Z
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$000(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 192
    :goto_0
    return-object v6

    .line 149
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_reportBuffer:Ljava/util/Map;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 155
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    .line 158
    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_reportBuffer:Ljava/util/Map;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_filterPauseReports(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$400(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    .line 157
    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_filterStartReports(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$500(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    .line 156
    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_filterPlayReports(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$600(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    .line 163
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # invokes: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->computePrevTsValues(Ljava/util/ArrayList;)V
    invoke-static {v2, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$700(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;Ljava/util/ArrayList;)V

    .line 166
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;

    .line 167
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 168
    const-string v4, "report"

    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_channel:Lcom/adobe/primetime/core/radio/Channel;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$300(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Lcom/adobe/primetime/core/radio/Channel;

    move-result-object v0

    new-instance v4, Lcom/adobe/primetime/core/Event;

    const-string v5, "filter:data_available"

    invoke-direct {v4, v5, v3}, Lcom/adobe/primetime/core/Event;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v4}, Lcom/adobe/primetime/core/radio/Channel;->trigger(Lcom/adobe/primetime/core/Event;)V

    goto :goto_1

    .line 174
    :cond_2
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_reportBuffer:Ljava/util/Map;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$100(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 179
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_channel:Lcom/adobe/primetime/core/radio/Channel;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$300(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Lcom/adobe/primetime/core/radio/Channel;

    move-result-object v0

    const-string v1, "session_id"

    invoke-virtual {v0, v1}, Lcom/adobe/primetime/core/radio/Channel;->request(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 181
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_tsHistory:Ljava/util/Map;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$800(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 182
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_tsHistory:Ljava/util/Map;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$800(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 186
    :goto_2
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_tsHistory:Ljava/util/Map;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$800(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 187
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    # getter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_tsHistory:Ljava/util/Map;
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$800(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter$2;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->_isBufferingInProgress:Z
    invoke-static {v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;->access$202(Lcom/adobe/primetime/va/plugins/ah/engine/filter/ReportFilter;Z)Z

    goto/16 :goto_0

    .line 184
    :cond_3
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    goto :goto_2
.end method
