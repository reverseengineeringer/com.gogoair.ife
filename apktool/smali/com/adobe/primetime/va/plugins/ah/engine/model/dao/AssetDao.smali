.class public Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;
.super Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;
.source "SourceFile"


# static fields
.field private static final REALM:Ljava/lang/String; = "asset"

.field public static final TYPE_AD:Ljava/lang/String; = "ad"

.field public static final TYPE_MAIN_CONTENT:Ljava/lang/String; = "main"


# instance fields
.field private _adData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

.field private _chapterData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

.field private _duration:D

.field private _name:Ljava/lang/String;

.field private _publisher:Ljava/lang/String;

.field private _type:Ljava/lang/String;

.field private _videoId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 41
    const-string v0, "asset"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;-><init>(Ljava/lang/String;)V

    .line 43
    if-eqz p1, :cond_2

    .line 44
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setType(Ljava/lang/String;)V

    .line 45
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setName(Ljava/lang/String;)V

    .line 46
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getVideoId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setVideoId(Ljava/lang/String;)V

    .line 47
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getPublisher()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setPublisher(Ljava/lang/String;)V

    .line 48
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getDuration()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setDuration(D)V

    .line 50
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getAdData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 51
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getAdData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setAdData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;)V

    .line 54
    :cond_0
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getChapterData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 55
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->getChapterData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setChapterData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;)V

    .line 66
    :cond_1
    :goto_0
    return-void

    .line 58
    :cond_2
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_type:Ljava/lang/String;

    .line 59
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_name:Ljava/lang/String;

    .line 60
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_videoId:Ljava/lang/String;

    .line 61
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_publisher:Ljava/lang/String;

    .line 62
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_duration:D

    .line 63
    iput-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_adData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    .line 64
    iput-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_chapterData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    goto :goto_0
.end method


# virtual methods
.method public getAdData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_adData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    return-object v0
.end method

.method public getChapterData()Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_chapterData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    return-object v0
.end method

.method public getDuration()D
    .locals 2

    .prologue
    .line 105
    iget-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_duration:D

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public getPublisher()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_publisher:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_type:Ljava/lang/String;

    return-object v0
.end method

.method public getVideoId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_videoId:Ljava/lang/String;

    return-object v0
.end method

.method public setAdData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;)V
    .locals 2

    .prologue
    .line 118
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_adData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AdDao;

    .line 119
    const-string v0, "ad_data"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 120
    return-void
.end method

.method public setChapterData(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;)V
    .locals 2

    .prologue
    .line 127
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_chapterData:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/ChapterDao;

    .line 128
    const-string v0, "chapter_data"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 129
    return-void
.end method

.method public setDuration(D)V
    .locals 3

    .prologue
    .line 109
    iput-wide p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_duration:D

    .line 110
    const-string v0, "length"

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 111
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 73
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_name:Ljava/lang/String;

    .line 74
    const-string v0, "name"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 75
    return-void
.end method

.method public setPublisher(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 100
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_publisher:Ljava/lang/String;

    .line 101
    const-string v0, "publisher"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 102
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 82
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_type:Ljava/lang/String;

    .line 83
    const-string v0, "type"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 84
    return-void
.end method

.method public setVideoId(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 91
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->_videoId:Ljava/lang/String;

    .line 92
    const-string v0, "video_id"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/AssetDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 93
    return-void
.end method
