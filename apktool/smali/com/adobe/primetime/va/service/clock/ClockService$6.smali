.class Lcom/adobe/primetime/va/service/clock/ClockService$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/service/clock/ClockService;

.field final synthetic val$fnMap:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/service/clock/ClockService;Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 148
    iput-object p1, p0, Lcom/adobe/primetime/va/service/clock/ClockService$6;->this$0:Lcom/adobe/primetime/va/service/clock/ClockService;

    iput-object p2, p0, Lcom/adobe/primetime/va/service/clock/ClockService$6;->val$fnMap:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 152
    check-cast p1, Ljava/util/ArrayList;

    .line 154
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_1

    .line 169
    :cond_0
    return-object v2

    .line 158
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/lang/String;

    .line 159
    if-nez v2, :cond_3

    .line 160
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v2, v0

    .line 162
    :cond_3
    const-string v0, "is_paused"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 163
    const-string v0, "is_paused."

    invoke-virtual {v1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 165
    array-length v0, v4

    if-lez v0, :cond_2

    .line 166
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/ClockService$6;->val$fnMap:Ljava/util/Map;

    const-string v5, "is_paused"

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/ICallback;

    const/4 v5, 0x1

    aget-object v4, v4, v5

    invoke-interface {v0, v4}, Lcom/adobe/primetime/core/ICallback;->call(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method
