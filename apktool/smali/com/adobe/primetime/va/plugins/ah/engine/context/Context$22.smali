.class Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;)V
    .locals 0

    .prologue
    .line 1155
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$22;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1158
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$22;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_sessionData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$22;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_sessionData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;->getSessionId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context$22;->this$0:Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;

    iget-object v0, v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/Context;->_sessionData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;->getSessionId()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
