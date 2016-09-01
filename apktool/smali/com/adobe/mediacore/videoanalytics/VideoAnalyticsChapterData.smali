.class public Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private _endTime:Ljava/lang/Double;

.field private _metadata:Ljava/util/HashMap;

.field private _name:Ljava/lang/String;

.field private _startTime:Ljava/lang/Double;


# direct methods
.method public constructor <init>(DD)V
    .locals 5

    const-wide/16 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->_startTime:Ljava/lang/Double;

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->_endTime:Ljava/lang/Double;

    const-string v0, "default-chapter-name"

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->_name:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->_metadata:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->_startTime:Ljava/lang/Double;

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->_endTime:Ljava/lang/Double;

    return-void
.end method


# virtual methods
.method public getEndTime()Ljava/lang/Double;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->_endTime:Ljava/lang/Double;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public getStartTime()Ljava/lang/Double;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->_startTime:Ljava/lang/Double;

    return-object v0
.end method

.method public setEndTime(Ljava/lang/Double;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->_endTime:Ljava/lang/Double;

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 1

    invoke-static {p1}, Lcom/adobe/mediacore/utils/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->_name:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public setStartTime(Ljava/lang/Double;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->_startTime:Ljava/lang/Double;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " Object {"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->_name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " start time="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->_startTime:Ljava/lang/Double;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " ,end time="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/mediacore/videoanalytics/VideoAnalyticsChapterData;->_endTime:Ljava/lang/Double;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
