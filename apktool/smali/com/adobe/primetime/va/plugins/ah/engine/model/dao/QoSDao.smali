.class public Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;
.super Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;
.source "SourceFile"


# static fields
.field private static final REALM:Ljava/lang/String; = "stream"


# instance fields
.field private _bitrate:J

.field private _droppedFrames:J

.field private _fps:D

.field private _startupTime:J

.field public isStartupTimeOverridden:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;-><init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;)V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 37
    const-string v0, "stream"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;-><init>(Ljava/lang/String;)V

    .line 39
    if-eqz p1, :cond_0

    .line 40
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->getBitrate()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setBitrate(J)V

    .line 41
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->getFps()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setFps(D)V

    .line 42
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->getDroppedFrames()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setDroppedFrames(J)V

    .line 43
    invoke-virtual {p1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->getStartupTime()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setStartupTime(J)V

    .line 44
    iget-boolean v0, p1, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->isStartupTimeOverridden:Z

    iput-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->isStartupTimeOverridden:Z

    .line 53
    :goto_0
    return-void

    .line 46
    :cond_0
    iput-wide v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->_bitrate:J

    .line 47
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->_fps:D

    .line 48
    iput-wide v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->_droppedFrames:J

    .line 49
    iput-wide v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->_startupTime:J

    .line 51
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->isStartupTimeOverridden:Z

    goto :goto_0
.end method


# virtual methods
.method public getBitrate()J
    .locals 2

    .prologue
    .line 56
    iget-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->_bitrate:J

    return-wide v0
.end method

.method public getDroppedFrames()J
    .locals 2

    .prologue
    .line 74
    iget-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->_droppedFrames:J

    return-wide v0
.end method

.method public getFps()D
    .locals 2

    .prologue
    .line 65
    iget-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->_fps:D

    return-wide v0
.end method

.method public getStartupTime()J
    .locals 2

    .prologue
    .line 83
    iget-wide v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->_startupTime:J

    return-wide v0
.end method

.method public setBitrate(J)V
    .locals 3

    .prologue
    .line 60
    iput-wide p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->_bitrate:J

    .line 61
    const-string v0, "bitrate"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 62
    return-void
.end method

.method public setDroppedFrames(J)V
    .locals 3

    .prologue
    .line 78
    iput-wide p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->_droppedFrames:J

    .line 79
    const-string v0, "dropped_frames"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 80
    return-void
.end method

.method public setFps(D)V
    .locals 3

    .prologue
    .line 69
    iput-wide p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->_fps:D

    .line 70
    const-string v0, "fps"

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 71
    return-void
.end method

.method public setStartupTime(J)V
    .locals 3

    .prologue
    .line 87
    iput-wide p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->_startupTime:J

    .line 88
    const-string v0, "startup_time"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/QoSDao;->setField(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 89
    return-void
.end method
