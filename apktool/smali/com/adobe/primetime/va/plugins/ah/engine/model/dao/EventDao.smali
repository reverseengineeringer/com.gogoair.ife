.class public Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;
.super Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;
    }
.end annotation


# static fields
.field public static final EVENT_TYPE_AA_AD_START:Ljava/lang/String; = "aa_ad_start"

.field public static final EVENT_TYPE_AA_START:Ljava/lang/String; = "aa_start"

.field public static final EVENT_TYPE_BITRATE_CHANGE:Ljava/lang/String; = "bitrate_change"

.field public static final EVENT_TYPE_BUFFER:Ljava/lang/String; = "buffer"

.field public static final EVENT_TYPE_CHAPTER_COMPLETE:Ljava/lang/String; = "chapter_complete"

.field public static final EVENT_TYPE_CHAPTER_START:Ljava/lang/String; = "chapter_start"

.field public static final EVENT_TYPE_COMPLETE:Ljava/lang/String; = "complete"

.field public static final EVENT_TYPE_ERROR:Ljava/lang/String; = "error"

.field public static final EVENT_TYPE_PAUSE:Ljava/lang/String; = "pause"

.field public static final EVENT_TYPE_PLAY:Ljava/lang/String; = "play"

.field public static final EVENT_TYPE_START:Ljava/lang/String; = "start"

.field private static final REALM:Ljava/lang/String; = "event"


# instance fields
.field private _duration:J

.field private _id:Ljava/lang/String;

.field private _playhead:D

.field private _prevTs:J

.field private _source:Ljava/lang/String;

.field private _ts:J

.field private _type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;)V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 53
    const-string v0, "event"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;-><init>(Ljava/lang/String;)V

    .line 55
    if-eqz p1, :cond_0

    .line 56
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setType(Ljava/lang/String;)V

    .line 57
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getDuration()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setDuration(J)V

    .line 58
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getPlayhead()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setPlayhead(D)V

    .line 59
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setId(Ljava/lang/String;)V

    .line 60
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getSource()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setSource(Ljava/lang/String;)V

    .line 61
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getPrevTs()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setPrevTs(J)V

    .line 62
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->getTs()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setTs(J)V

    .line 73
    :goto_0
    return-void

    .line 64
    :cond_0
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_type:Ljava/lang/String;

    .line 65
    iput-wide v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_duration:J

    .line 66
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_playhead:D

    .line 67
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_id:Ljava/lang/String;

    .line 68
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_source:Ljava/lang/String;

    .line 69
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_prevTs:J

    .line 70
    iput-wide v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_ts:J

    goto :goto_0
.end method


# virtual methods
.method public getDuration()J
    .locals 2

    .prologue
    .line 85
    iget-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_duration:J

    return-wide v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_id:Ljava/lang/String;

    return-object v0
.end method

.method public getPlayhead()D
    .locals 2

    .prologue
    .line 94
    iget-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_playhead:D

    return-wide v0
.end method

.method public getPrevTs()J
    .locals 2

    .prologue
    .line 121
    iget-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_prevTs:J

    return-wide v0
.end method

.method public getSource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_source:Ljava/lang/String;

    return-object v0
.end method

.method public getTs()J
    .locals 2

    .prologue
    .line 130
    iget-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_ts:J

    return-wide v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_type:Ljava/lang/String;

    return-object v0
.end method

.method public setDuration(J)V
    .locals 3

    .prologue
    .line 89
    iput-wide p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_duration:J

    .line 90
    const-string v0, "duration"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 91
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 107
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_id:Ljava/lang/String;

    .line 108
    const-string v0, "id"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 109
    return-void
.end method

.method public setPlayhead(D)V
    .locals 3

    .prologue
    .line 98
    iput-wide p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_playhead:D

    .line 99
    const-string v0, "playhead"

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 100
    return-void
.end method

.method public setPrevTs(J)V
    .locals 3

    .prologue
    .line 125
    iput-wide p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_prevTs:J

    .line 126
    const-string v0, "prev_ts"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 127
    return-void
.end method

.method public setSource(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 116
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_source:Ljava/lang/String;

    .line 117
    const-string v0, "source"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 118
    return-void
.end method

.method public setTs(J)V
    .locals 3

    .prologue
    .line 134
    iput-wide p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_ts:J

    .line 135
    const-string v0, "ts"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 136
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 80
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->_type:Ljava/lang/String;

    .line 81
    const-string v0, "type"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 82
    return-void
.end method
