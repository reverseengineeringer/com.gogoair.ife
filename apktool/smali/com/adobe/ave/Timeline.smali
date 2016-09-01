.class public Lcom/adobe/ave/Timeline;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public complete:I

.field public firstPeriodIndex:I

.field public firstSubscribedTagIndex:I

.field public lastPeriodIndex:I

.field public lastSubscribedTagIndex:I

.field private mNativeContext:J

.field public type:Lcom/adobe/ave/ContainerType;

.field public virtualDuration:J

.field public virtualStartTime:J


# direct methods
.method private constructor <init>(J)V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-wide p1, p0, Lcom/adobe/ave/Timeline;->mNativeContext:J

    .line 50
    invoke-direct {p0, p1, p2}, Lcom/adobe/ave/Timeline;->nativeCreateTimeline(J)V

    .line 51
    return-void
.end method

.method private constructor <init>(JIIJJIIII)V
    .locals 7

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-wide p1, p0, Lcom/adobe/ave/Timeline;->mNativeContext:J

    .line 61
    sget-object v2, Lcom/adobe/ave/ContainerType;->UNDEFINED:Lcom/adobe/ave/ContainerType;

    .line 62
    invoke-static {}, Lcom/adobe/ave/ContainerType;->values()[Lcom/adobe/ave/ContainerType;

    move-result-object v4

    array-length v5, v4

    const/4 v1, 0x0

    move v3, v1

    :goto_0
    if-ge v3, v5, :cond_1

    aget-object v1, v4, v3

    .line 64
    invoke-virtual {v1}, Lcom/adobe/ave/ContainerType;->getValue()I

    move-result v6

    if-ne v6, p3, :cond_0

    .line 70
    :goto_1
    iput-object v1, p0, Lcom/adobe/ave/Timeline;->type:Lcom/adobe/ave/ContainerType;

    .line 72
    iput p4, p0, Lcom/adobe/ave/Timeline;->complete:I

    .line 73
    iput-wide p5, p0, Lcom/adobe/ave/Timeline;->virtualStartTime:J

    .line 74
    iput-wide p7, p0, Lcom/adobe/ave/Timeline;->virtualDuration:J

    .line 75
    move/from16 v0, p9

    iput v0, p0, Lcom/adobe/ave/Timeline;->firstPeriodIndex:I

    .line 76
    move/from16 v0, p10

    iput v0, p0, Lcom/adobe/ave/Timeline;->lastPeriodIndex:I

    .line 77
    move/from16 v0, p11

    iput v0, p0, Lcom/adobe/ave/Timeline;->firstSubscribedTagIndex:I

    .line 78
    move/from16 v0, p12

    iput v0, p0, Lcom/adobe/ave/Timeline;->lastSubscribedTagIndex:I

    .line 80
    invoke-direct {p0, p1, p2}, Lcom/adobe/ave/Timeline;->nativeCreateTimeline(J)V

    .line 81
    return-void

    .line 62
    :cond_0
    add-int/lit8 v1, v3, 0x1

    move v3, v1

    goto :goto_0

    :cond_1
    move-object v1, v2

    goto :goto_1
.end method

.method private native nativeClearPauseAtPeriodEnd(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeCreateTimeline(J)V
.end method

.method private native nativeEraseByLocalTime(IJJZ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeEraseByVirtualTime(JJ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetABRProfileCount(I)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetABRProfileInfoAtIndex(II)Lcom/adobe/ave/ABRProfileInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetCuePoint(II)Lcom/adobe/ave/CuePoint;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetMainManifestSubscribedTag(I)Lcom/adobe/ave/TagData;
.end method

.method private native nativeGetPeriodInfo(I)Lcom/adobe/ave/PeriodInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetSubscribedTag(II)Lcom/adobe/ave/TagData;
.end method

.method private native nativeGetTrackCount(II)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetTrackInfo(III)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeInsertByLocalTime(IJIIJ)Lcom/adobe/ave/InsertionResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeInsertByVirtualTime(JIIJ)Lcom/adobe/ave/InsertionResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeLoadManifest(Ljava/lang/String;II)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeReleaseManifest(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSetHoldAt(J)V
.end method

.method private native nativeSetPauseAtPeriodEnd(II)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method


# virtual methods
.method public clearPauseAtPeriodEnd(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 373
    invoke-direct {p0, p1}, Lcom/adobe/ave/Timeline;->nativeClearPauseAtPeriodEnd(I)V

    .line 374
    return-void
.end method

.method public eraseByLocalTime(IJJZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 308
    invoke-direct/range {p0 .. p6}, Lcom/adobe/ave/Timeline;->nativeEraseByLocalTime(IJJZ)V

    .line 309
    return-void
.end method

.method public eraseByVirtualTime(JJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 290
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/ave/Timeline;->nativeEraseByVirtualTime(JJ)V

    .line 291
    return-void
.end method

.method public getABRProfileCount(I)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 144
    invoke-direct {p0, p1}, Lcom/adobe/ave/Timeline;->nativeGetABRProfileCount(I)I

    move-result v0

    return v0
.end method

.method public getABRProfileInfoAtIndex(II)Lcom/adobe/ave/ABRProfileInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 157
    invoke-direct {p0, p1, p2}, Lcom/adobe/ave/Timeline;->nativeGetABRProfileInfoAtIndex(II)Lcom/adobe/ave/ABRProfileInfo;

    move-result-object v0

    return-object v0
.end method

.method public getCuePoint(II)Lcom/adobe/ave/CuePoint;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 321
    invoke-direct {p0, p1, p2}, Lcom/adobe/ave/Timeline;->nativeGetCuePoint(II)Lcom/adobe/ave/CuePoint;

    move-result-object v0

    return-object v0
.end method

.method public getMainManifestSubscribedTag(I)Lcom/adobe/ave/TagData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 348
    invoke-direct {p0, p1}, Lcom/adobe/ave/Timeline;->nativeGetMainManifestSubscribedTag(I)Lcom/adobe/ave/TagData;

    move-result-object v0

    return-object v0
.end method

.method public getPeriodInfo(I)Lcom/adobe/ave/PeriodInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 133
    invoke-direct {p0, p1}, Lcom/adobe/ave/Timeline;->nativeGetPeriodInfo(I)Lcom/adobe/ave/PeriodInfo;

    move-result-object v0

    return-object v0
.end method

.method public getSubscribedTag(II)Lcom/adobe/ave/TagData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 335
    invoke-direct {p0, p1, p2}, Lcom/adobe/ave/Timeline;->nativeGetSubscribedTag(II)Lcom/adobe/ave/TagData;

    move-result-object v0

    return-object v0
.end method

.method public getTrackCount(ILcom/adobe/ave/PayloadType;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 170
    invoke-virtual {p2}, Lcom/adobe/ave/PayloadType;->getValue()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/adobe/ave/Timeline;->nativeGetTrackCount(II)I

    move-result v0

    return v0
.end method

.method public getTrackInfo(IILcom/adobe/ave/PayloadType;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 188
    invoke-virtual {p3}, Lcom/adobe/ave/PayloadType;->getValue()I

    move-result v0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/ave/Timeline;->nativeGetTrackInfo(III)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public insertByLocalTime(IJIIJ)Lcom/adobe/ave/InsertionResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 275
    invoke-direct/range {p0 .. p7}, Lcom/adobe/ave/Timeline;->nativeInsertByLocalTime(IJIIJ)Lcom/adobe/ave/InsertionResult;

    move-result-object v0

    return-object v0
.end method

.method public insertByVirtualTime(JIIJ)Lcom/adobe/ave/InsertionResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 252
    invoke-direct/range {p0 .. p6}, Lcom/adobe/ave/Timeline;->nativeInsertByVirtualTime(JIIJ)Lcom/adobe/ave/InsertionResult;

    move-result-object v0

    return-object v0
.end method

.method public loadManifest(Ljava/lang/String;ILcom/adobe/ave/ContainerType;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 205
    invoke-virtual {p3}, Lcom/adobe/ave/ContainerType;->getValue()I

    move-result v0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/ave/Timeline;->nativeLoadManifest(Ljava/lang/String;II)V

    .line 206
    return-void
.end method

.method public releaseManifest(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 216
    invoke-direct {p0, p1}, Lcom/adobe/ave/Timeline;->nativeReleaseManifest(I)V

    .line 217
    return-void
.end method

.method public setHoldAt(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 229
    invoke-direct {p0, p1, p2}, Lcom/adobe/ave/Timeline;->nativeSetHoldAt(J)V

    .line 230
    return-void
.end method

.method public setPauseAtPeriodEnd(II)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 361
    invoke-direct {p0, p1, p2}, Lcom/adobe/ave/Timeline;->nativeSetPauseAtPeriodEnd(II)V

    .line 362
    return-void
.end method
