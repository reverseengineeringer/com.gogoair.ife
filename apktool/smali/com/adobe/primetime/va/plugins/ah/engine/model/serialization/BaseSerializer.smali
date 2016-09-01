.class abstract Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/BaseSerializer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/ISerializable;


# instance fields
.field protected _logTag:Ljava/lang/String;

.field protected _logger:Lcom/adobe/primetime/core/ILogger;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/core/ILogger;)V
    .locals 2

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    if-nez p1, :cond_0

    .line 35
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to logger object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_0
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/BaseSerializer;->_logger:Lcom/adobe/primetime/core/ILogger;

    .line 38
    const-class v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/BaseSerializer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/BaseSerializer;->_logTag:Ljava/lang/String;

    .line 39
    return-void
.end method


# virtual methods
.method _processDao(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;)Ljava/util/ArrayList;
    .locals 9

    .prologue
    .line 42
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 44
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;->getData()Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 45
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 46
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$DaoField;

    .line 48
    iget-object v2, v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$DaoField;->value:Ljava/lang/Object;

    .line 49
    iget-object v5, v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$DaoField;->hint:Ljava/lang/Object;

    .line 50
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;->getRealm()Ljava/lang/String;

    move-result-object v6

    .line 52
    const/4 v0, 0x0

    .line 54
    if-eqz v2, :cond_0

    .line 58
    instance-of v7, v2, Ljava/lang/Long;

    if-eqz v7, :cond_1

    move-object v0, v2

    .line 59
    check-cast v0, Ljava/lang/Long;

    invoke-virtual {p0, v1, v0, v6, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/BaseSerializer;->serializeLong(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 76
    :goto_1
    if-eqz v0, :cond_0

    .line 77
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 60
    :cond_1
    instance-of v7, v2, Ljava/lang/Integer;

    if-eqz v7, :cond_2

    .line 61
    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {p0, v1, v2, v6, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/BaseSerializer;->serializeInteger(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_1

    .line 62
    :cond_2
    instance-of v7, v2, Ljava/lang/Double;

    if-eqz v7, :cond_3

    .line 63
    check-cast v2, Ljava/lang/Double;

    invoke-virtual {p0, v1, v2, v6, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/BaseSerializer;->serializeDouble(Ljava/lang/String;Ljava/lang/Double;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_1

    .line 64
    :cond_3
    instance-of v7, v2, Ljava/lang/Boolean;

    if-eqz v7, :cond_4

    .line 67
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {p0, v1, v2, v6, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/BaseSerializer;->serializeBooleanToLong(Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_1

    .line 68
    :cond_4
    instance-of v7, v2, Ljava/lang/String;

    if-eqz v7, :cond_5

    .line 69
    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v1, v2, v6, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/BaseSerializer;->serializeString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_1

    .line 70
    :cond_5
    instance-of v5, v2, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;

    if-eqz v5, :cond_6

    .line 71
    check-cast v2, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;

    invoke-virtual {p0, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/BaseSerializer;->serializeDao(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_1

    .line 73
    :cond_6
    iget-object v5, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/BaseSerializer;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v6, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/BaseSerializer;->_logTag:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "_processDao() - Unable to serialize DAO. Field: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v7, ". Value: "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v5, v6, v1}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 81
    :cond_7
    return-object v3
.end method

.method abstract serializeBooleanToLong(Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method abstract serializeDao(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;)Ljava/lang/Object;
.end method

.method abstract serializeDouble(Ljava/lang/String;Ljava/lang/Double;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method abstract serializeInteger(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method abstract serializeLong(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method abstract serializeMap(Ljava/util/Map;)Ljava/lang/Object;
.end method

.method public serializeReport(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;)Ljava/util/Map;
    .locals 3

    .prologue
    .line 86
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/BaseSerializer;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/BaseSerializer;->_logTag:Ljava/lang/String;

    const-string v2, "#serializeReport() - Pure virtual method. Must override."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    const/4 v0, 0x0

    return-object v0
.end method

.method abstract serializeString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
.end method
