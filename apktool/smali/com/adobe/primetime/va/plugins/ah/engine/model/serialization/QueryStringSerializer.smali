.class public Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;
.super Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/BaseSerializer;
.source "SourceFile"


# static fields
.field private static final DATA_TYPE_LONG:Ljava/lang/String; = "l"

.field private static final DATA_TYPE_SHORT:Ljava/lang/String; = "h"

.field private static final DATA_TYPE_STRING:Ljava/lang/String; = "s"


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/core/ILogger;)V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/BaseSerializer;-><init>(Lcom/adobe/primetime/core/ILogger;)V

    .line 38
    return-void
.end method

.method private _removeLastCharacter(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 192
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 193
    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 195
    :cond_0
    return-object p1
.end method


# virtual methods
.method protected serializeBooleanToLong(Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .prologue
    .line 161
    if-eqz p2, :cond_2

    .line 162
    const-string v0, "l"

    .line 166
    const-wide/16 v2, 0x0

    .line 167
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    const-wide/16 v2, 0x1

    .line 169
    :cond_0
    if-eqz p4, :cond_1

    instance-of v1, p4, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;

    if-eqz v1, :cond_1

    sget-object v1, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;->SHORT:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;

    if-ne p4, v1, :cond_1

    .line 170
    const-string v0, "h"

    .line 172
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 175
    :goto_0
    return-object v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method bridge synthetic serializeDao(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 31
    invoke-virtual {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->serializeDao(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method serializeDao(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;)Ljava/lang/String;
    .locals 5

    .prologue
    .line 95
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    invoke-virtual {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->_processDao(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;)Ljava/util/ArrayList;

    move-result-object v3

    .line 98
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_1

    .line 99
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne v1, v0, :cond_0

    .line 100
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    :goto_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 102
    :cond_0
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "&"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 106
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected serializeDouble(Ljava/lang/String;Ljava/lang/Double;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .prologue
    .line 128
    if-eqz p2, :cond_0

    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "l:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/Double;->longValue()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 132
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected serializeInteger(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .prologue
    .line 152
    if-eqz p2, :cond_0

    .line 153
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "l:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 156
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected serializeLong(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .prologue
    .line 137
    const-string v0, "l"

    .line 139
    if-eqz p2, :cond_1

    .line 140
    if-eqz p4, :cond_0

    instance-of v1, p4, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;->SHORT:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;

    if-ne p4, v1, :cond_0

    .line 141
    const-string v0, "h"

    .line 144
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 147
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method bridge synthetic serializeMap(Ljava/util/Map;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 31
    invoke-virtual {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->serializeMap(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method serializeMap(Ljava/util/Map;)Ljava/lang/String;
    .locals 7

    .prologue
    .line 111
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 113
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 115
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "s:meta:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v4, "utf-8"

    invoke-static {v0, v4}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    :goto_1
    const-string v0, "&"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 116
    :catch_0
    move-exception v0

    .line 117
    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->_logTag:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "#serializeMap() - Unable to serialize string: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v4, v0}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 123
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->_removeLastCharacter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public serializeReport(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;)Ljava/util/HashMap;
    .locals 5

    .prologue
    .line 42
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 44
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getAdobeAnalyticsData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 45
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getAdobeAnalyticsData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdobeAnalyticsDao;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->serializeDao(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    :cond_0
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getUserData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 48
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getUserData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/UserDao;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->serializeDao(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    :cond_1
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getCUserData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 51
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getCUserData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/CUserDao;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->serializeDao(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    :cond_2
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getServiceProviderData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 54
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getServiceProviderData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ServiceProviderDao;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->serializeDao(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    :cond_3
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getSessionData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 57
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getSessionData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/SessionDao;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->serializeDao(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    :cond_4
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 60
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getEventData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->serializeDao(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    :cond_5
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getAssetData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 63
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getAssetData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->serializeDao(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    :cond_6
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getStreamData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 66
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getStreamData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->serializeDao(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    :cond_7
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getQosData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v0

    if-eqz v0, :cond_8

    .line 69
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getQosData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->serializeDao(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    :cond_8
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getMeta()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 73
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getMeta()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 74
    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->serializeMap(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    :cond_9
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_b

    .line 79
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne v1, v0, :cond_a

    .line 80
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    :goto_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 82
    :cond_a
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "&"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 86
    :cond_b
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 87
    const-string v1, "serializedOutput"

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    const-string v1, "callback"

    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;->getCallback()Lcom/adobe/primetime/core/ICallback;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    return-object v0
.end method

.method public bridge synthetic serializeReport(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;)Ljava/util/Map;
    .locals 1

    .prologue
    .line 31
    invoke-virtual {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->serializeReport(Lcom/adobe/primetime/va/plugins/ah/engine/model/report/Report;)Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method protected serializeString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .prologue
    .line 180
    if-eqz p2, :cond_0

    const-string v0, ""

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 182
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "s:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "utf-8"

    invoke-static {p2, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 188
    :goto_0
    return-object v0

    .line 183
    :catch_0
    move-exception v0

    .line 184
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/serialization/QueryStringSerializer;->_logTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "serializeString() - Unable to serialize string: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
