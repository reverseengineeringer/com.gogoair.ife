.class public Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$DaoField;,
        Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;
    }
.end annotation


# instance fields
.field private final _data:Ljava/util/HashMap;

.field private final _realm:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;->_realm:Ljava/lang/String;

    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;->_data:Ljava/util/HashMap;

    .line 39
    return-void
.end method


# virtual methods
.method public getData()Ljava/util/HashMap;
    .locals 2

    .prologue
    .line 46
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;->_data:Ljava/util/HashMap;

    monitor-enter v1

    .line 47
    :try_start_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;->_data:Ljava/util/HashMap;

    monitor-exit v1

    return-object v0

    .line 48
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getRealm()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;->_realm:Ljava/lang/String;

    return-object v0
.end method

.method setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    .prologue
    .line 52
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;->_data:Ljava/util/HashMap;

    monitor-enter v1

    .line 53
    :try_start_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;->_data:Ljava/util/HashMap;

    new-instance v2, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$DaoField;

    invoke-direct {v2, p2, p3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$DaoField;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    monitor-exit v1

    .line 55
    return-void

    .line 54
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
