.class Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$31;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

.field final synthetic val$fnMap:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 868
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$31;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    iput-object p2, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$31;->val$fnMap:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 872
    check-cast p1, Ljava/util/ArrayList;

    .line 874
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 882
    :cond_0
    :goto_0
    return-object v2

    .line 877
    :cond_1
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 878
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 879
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$31;->val$fnMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$31;->val$fnMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/primetime/core/ICallback;

    invoke-interface {v1, p0}, Lcom/adobe/primetime/core/ICallback;->call(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    :goto_2
    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    move-object v1, v2

    goto :goto_2

    :cond_3
    move-object v2, v3

    .line 882
    goto :goto_0
.end method
