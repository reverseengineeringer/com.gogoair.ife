.class public Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;
.super Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;
.source "SourceFile"


# static fields
.field private static final REALM:Ljava/lang/String; = "stream"


# instance fields
.field private _id:Ljava/lang/String;

.field private _length:D

.field private _name:Ljava/lang/String;

.field private _offset:D

.field private _position:J

.field private _sid:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;)V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 38
    const-string v0, "stream"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;-><init>(Ljava/lang/String;)V

    .line 40
    if-eqz p1, :cond_0

    .line 41
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setId(Ljava/lang/String;)V

    .line 42
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->getSid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setSid(Ljava/lang/String;)V

    .line 43
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setName(Ljava/lang/String;)V

    .line 44
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->getPosition()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setPosition(J)V

    .line 45
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->getLength()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setLength(D)V

    .line 46
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->getOffset()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setOffset(D)V

    .line 55
    :goto_0
    return-void

    .line 48
    :cond_0
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_id:Ljava/lang/String;

    .line 49
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_sid:Ljava/lang/String;

    .line 50
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_name:Ljava/lang/String;

    .line 51
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_position:J

    .line 52
    iput-wide v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_length:D

    .line 53
    iput-wide v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_offset:D

    goto :goto_0
.end method


# virtual methods
.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_id:Ljava/lang/String;

    return-object v0
.end method

.method public getLength()D
    .locals 2

    .prologue
    .line 94
    iget-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_length:D

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public getOffset()D
    .locals 2

    .prologue
    .line 103
    iget-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_offset:D

    return-wide v0
.end method

.method public getPosition()J
    .locals 2

    .prologue
    .line 85
    iget-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_position:J

    return-wide v0
.end method

.method public getSid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_sid:Ljava/lang/String;

    return-object v0
.end method

.method public setId(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 62
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_id:Ljava/lang/String;

    .line 63
    const-string v0, "chapter_id"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 64
    return-void
.end method

.method public setLength(D)V
    .locals 3

    .prologue
    .line 98
    iput-wide p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_length:D

    .line 99
    const-string v0, "chapter_length"

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 100
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 80
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_name:Ljava/lang/String;

    .line 81
    const-string v0, "chapter_name"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 82
    return-void
.end method

.method public setOffset(D)V
    .locals 3

    .prologue
    .line 107
    iput-wide p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_offset:D

    .line 108
    const-string v0, "chapter_offset"

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 109
    return-void
.end method

.method public setPosition(J)V
    .locals 3

    .prologue
    .line 89
    iput-wide p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_position:J

    .line 90
    const-string v0, "chapter_pos"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 91
    return-void
.end method

.method public setSid(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 71
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->_sid:Ljava/lang/String;

    .line 72
    const-string v0, "chapter_sid"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 73
    return-void
.end method
