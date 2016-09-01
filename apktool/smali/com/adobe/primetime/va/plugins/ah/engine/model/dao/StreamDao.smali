.class public Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;
.super Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;
.source "SourceFile"


# static fields
.field private static final REALM:Ljava/lang/String; = "stream"


# instance fields
.field private _type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;)V
    .locals 1

    .prologue
    .line 32
    const-string v0, "stream"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;-><init>(Ljava/lang/String;)V

    .line 34
    if-eqz p1, :cond_0

    .line 35
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;->setType(Ljava/lang/String;)V

    .line 39
    :goto_0
    return-void

    .line 37
    :cond_0
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;->_type:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;->_type:Ljava/lang/String;

    return-object v0
.end method

.method public setType(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 46
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;->_type:Ljava/lang/String;

    .line 47
    const-string v0, "type"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/StreamDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 48
    return-void
.end method
