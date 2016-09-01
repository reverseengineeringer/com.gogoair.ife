.class Lcom/adobe/primetime/va/Heartbeat$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/Heartbeat;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/Heartbeat;)V
    .locals 0

    .prologue
    .line 77
    iput-object p1, p0, Lcom/adobe/primetime/va/Heartbeat$1;->this$0:Lcom/adobe/primetime/va/Heartbeat;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/adobe/primetime/core/plugin/IPlugin;Lcom/adobe/primetime/core/plugin/IPlugin;)I
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v0, -0x1

    .line 80
    invoke-interface {p1}, Lcom/adobe/primetime/core/plugin/IPlugin;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "adobe-heartbeat"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p2}, Lcom/adobe/primetime/core/plugin/IPlugin;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "adobe-analytics"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 97
    :cond_0
    :goto_0
    return v0

    .line 82
    :cond_1
    invoke-interface {p1}, Lcom/adobe/primetime/core/plugin/IPlugin;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "adobe-heartbeat"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p2}, Lcom/adobe/primetime/core/plugin/IPlugin;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "player"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 84
    :cond_2
    invoke-interface {p1}, Lcom/adobe/primetime/core/plugin/IPlugin;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "adobe-analytics"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {p2}, Lcom/adobe/primetime/core/plugin/IPlugin;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "adobe-heartbeat"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    move v0, v1

    .line 85
    goto :goto_0

    .line 87
    :cond_3
    invoke-interface {p1}, Lcom/adobe/primetime/core/plugin/IPlugin;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "adobe-analytics"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {p2}, Lcom/adobe/primetime/core/plugin/IPlugin;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "player"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 90
    :cond_4
    invoke-interface {p1}, Lcom/adobe/primetime/core/plugin/IPlugin;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v2, "player"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p2}, Lcom/adobe/primetime/core/plugin/IPlugin;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v2, "adobe-heartbeat"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    move v0, v1

    .line 91
    goto :goto_0

    .line 93
    :cond_5
    invoke-interface {p1}, Lcom/adobe/primetime/core/plugin/IPlugin;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v2, "player"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {p2}, Lcom/adobe/primetime/core/plugin/IPlugin;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v2, "adobe-analytics"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    move v0, v1

    .line 94
    goto :goto_0

    .line 97
    :cond_6
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 77
    check-cast p1, Lcom/adobe/primetime/core/plugin/IPlugin;

    check-cast p2, Lcom/adobe/primetime/core/plugin/IPlugin;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/primetime/va/Heartbeat$1;->compare(Lcom/adobe/primetime/core/plugin/IPlugin;Lcom/adobe/primetime/core/plugin/IPlugin;)I

    move-result v0

    return v0
.end method
