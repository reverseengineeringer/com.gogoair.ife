.class public Lcom/adobe/ave/VideoEngine;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/ave/VideoEngine$EventHandler;,
        Lcom/adobe/ave/VideoEngine$customMessage;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoEngine(j)"

.field private static final kCTBackgroundManifestError:I = 0x4000

.field private static final kCTBackgroundManifestWarning:I = 0x8000

.field private static final kCTDRMError:I = 0x2000

.field private static final kCTDRMMetadata:I = 0x10

.field private static final kCTData:I = 0x40

.field private static final kCTDictionaryData:I = 0x400

.field private static final kCTError:I = 0x1

.field private static final kCTLoadInfo:I = 0x800

.field private static final kCTManifestLoad:I = 0x80

.field private static final kCTPauseAtPeriodEnd:I = 0x10000

.field private static final kCTPlayState:I = 0x2

.field private static final kCTSeekComplete:I = 0x100

.field private static final kCTStreamMetadata:I = 0x8

.field private static final kCTStreamSwitch:I = 0x4

.field private static final kCTTimeline:I = 0x20

.field private static final kCTTrickPlayEnded:I = 0x1000

.field private static final kCTWarning:I = 0x200


# instance fields
.field private mEnableCaption:Z

.field private mEventHandler:Lcom/adobe/ave/VideoEngine$EventHandler;

.field private mListener:Lcom/adobe/ave/VideoEngineListener;

.field private mListenerTypeSet:Ljava/util/Set;

.field private mNativeContext:J

.field private mVideoView:Lcom/adobe/ave/VideoEngineView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 153
    const-string v0, "AVEAndroid"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 154
    invoke-static {}, Lcom/adobe/ave/VideoEngine;->nativeInitVideoEngine()V

    .line 155
    return-void
.end method

.method public constructor <init>()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object v1, p0, Lcom/adobe/ave/VideoEngine;->mVideoView:Lcom/adobe/ave/VideoEngineView;

    .line 46
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/ave/VideoEngine;->mEnableCaption:Z

    .line 174
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 178
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 179
    new-instance v1, Lcom/adobe/ave/VideoEngine$EventHandler;

    invoke-direct {v1, p0, p0, v0}, Lcom/adobe/ave/VideoEngine$EventHandler;-><init>(Lcom/adobe/ave/VideoEngine;Lcom/adobe/ave/VideoEngine;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/adobe/ave/VideoEngine;->mEventHandler:Lcom/adobe/ave/VideoEngine$EventHandler;

    .line 186
    :goto_0
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeCreateVideoEngine()V

    .line 187
    return-void

    .line 180
    :cond_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 181
    new-instance v1, Lcom/adobe/ave/VideoEngine$EventHandler;

    invoke-direct {v1, p0, p0, v0}, Lcom/adobe/ave/VideoEngine$EventHandler;-><init>(Lcom/adobe/ave/VideoEngine;Lcom/adobe/ave/VideoEngine;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/adobe/ave/VideoEngine;->mEventHandler:Lcom/adobe/ave/VideoEngine$EventHandler;

    goto :goto_0

    .line 183
    :cond_1
    iput-object v1, p0, Lcom/adobe/ave/VideoEngine;->mEventHandler:Lcom/adobe/ave/VideoEngine$EventHandler;

    goto :goto_0
.end method

.method static synthetic access$100(Lcom/adobe/ave/VideoEngine;)J
    .locals 2

    .prologue
    .line 42
    iget-wide v0, p0, Lcom/adobe/ave/VideoEngine;->mNativeContext:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;

    return-object v0
.end method

.method private failIfNotUIThread()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 142
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 143
    new-instance v0, Lcom/adobe/ave/VideoEngineException;

    sget-object v1, Lcom/adobe/ave/MediaErrorCode;->CALLED_FROM_WRONG_THREAD:Lcom/adobe/ave/MediaErrorCode;

    const-string v2, "Method must be called from the application\'s main thread"

    invoke-direct {v0, v1, v2}, Lcom/adobe/ave/VideoEngineException;-><init>(Lcom/adobe/ave/MediaErrorCode;Ljava/lang/String;)V

    throw v0

    .line 144
    :cond_0
    return-void
.end method

.method public static getVersionString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 164
    invoke-static {}, Lcom/adobe/ave/VideoEngine;->nativeGetVersionString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private native nativeAddCustomHeader(Ljava/lang/String;[Ljava/lang/String;I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeAddListener(ILcom/adobe/ave/VideoEngineListener;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeCreateVideoEngine()V
.end method

.method private native nativeEnableCaptions(Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeFastForward(F)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeFinalize()V
.end method

.method private native nativeGetARCorrectedOutputRectangle()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetBackgroundTimeline()Lcom/adobe/ave/Timeline;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetBufferLength()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetClientLivePoint()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetLocalTime(I)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetPlayState()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetQosBufferUnderrunCount()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetQosDroppedFrameCount()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetQosFileDuration()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetQosFileSize()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetQosFrameRate()F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetQosLoadTime()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetQosTimeToFirstByte()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetTime()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeGetTimeline()Lcom/adobe/ave/Timeline;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private static native nativeGetVersionString()Ljava/lang/String;
.end method

.method private static final native nativeInitVideoEngine()V
.end method

.method private native nativeInjectData(IJ[BI)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeLoad(Ljava/lang/String;II)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeLoadWithBackgroundManifest(Ljava/lang/String;IILjava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativePause()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativePlay()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativePrepareBuffer()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeRelease()V
.end method

.method private native nativeReleaseGPUResources()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeRemoveListener(Lcom/adobe/ave/VideoEngineListener;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeReset()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeRewind(F)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSeek(JZ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSeekToKeyFrame(JZ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSeekToLivePoint()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSeekToLocalTime(IJ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSelectTrack(III)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSetABRParameters(Lcom/adobe/ave/ABRParameters;)V
.end method

.method private native nativeSetBandwidth(I)V
.end method

.method private native nativeSetBufferTime(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSetCaptionStyle([Ljava/lang/String;[Ljava/lang/String;I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSetCuePointTags([Ljava/lang/String;I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSetCustomConfiguration(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSetDRMManager(Lcom/adobe/ave/drm/DRMManager;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSetInitialBufferTime(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSetMasterUpdateInterval(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSetNetworkingParameters(Lcom/adobe/ave/NetworkingParameters;)V
.end method

.method private native nativeSetPlaySpeed(FZ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSetSourceViewport(IIII)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSetSubscribedTags([Ljava/lang/String;I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSetSubscribedTagsForBackgroundManifest([Ljava/lang/String;I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSetSurface(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeSetVolume(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativeUseRedirectedUrl(Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private native nativesetLocalStoragePath(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation
.end method

.method private static postEventFromNative(Ljava/lang/Object;IIILjava/lang/Object;)V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1118
    check-cast p0, Lcom/adobe/ave/VideoEngine;

    .line 1119
    if-eqz p0, :cond_1

    move v0, v1

    :goto_0
    iget-object v3, p0, Lcom/adobe/ave/VideoEngine;->mEventHandler:Lcom/adobe/ave/VideoEngine$EventHandler;

    if-eqz v3, :cond_2

    :goto_1
    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 1120
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine;->mEventHandler:Lcom/adobe/ave/VideoEngine$EventHandler;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/adobe/ave/VideoEngine$EventHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 1121
    iget-object v1, p0, Lcom/adobe/ave/VideoEngine;->mEventHandler:Lcom/adobe/ave/VideoEngine$EventHandler;

    invoke-virtual {v1, v0}, Lcom/adobe/ave/VideoEngine$EventHandler;->sendMessage(Landroid/os/Message;)Z

    .line 1127
    :cond_0
    return-void

    :cond_1
    move v0, v2

    .line 1119
    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1
.end method

.method private static postEventFromNativeEx(Ljava/lang/Object;IIIJJLjava/lang/Object;)V
    .locals 10

    .prologue
    .line 1154
    check-cast p0, Lcom/adobe/ave/VideoEngine;

    .line 1155
    if-eqz p0, :cond_1

    const/4 v0, 0x1

    :goto_0
    iget-object v1, p0, Lcom/adobe/ave/VideoEngine;->mEventHandler:Lcom/adobe/ave/VideoEngine$EventHandler;

    if-eqz v1, :cond_2

    const/4 v1, 0x1

    :goto_1
    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 1156
    new-instance v1, Lcom/adobe/ave/VideoEngine$customMessage;

    const/4 v9, 0x0

    move v2, p2

    move v3, p3

    move-wide v4, p4

    move-wide/from16 v6, p6

    move-object/from16 v8, p8

    invoke-direct/range {v1 .. v9}, Lcom/adobe/ave/VideoEngine$customMessage;-><init>(IIJJLjava/lang/Object;Lcom/adobe/ave/VideoEngine$1;)V

    .line 1157
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine;->mEventHandler:Lcom/adobe/ave/VideoEngine$EventHandler;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, p1, v2, v3, v1}, Lcom/adobe/ave/VideoEngine$EventHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 1158
    iget-object v1, p0, Lcom/adobe/ave/VideoEngine;->mEventHandler:Lcom/adobe/ave/VideoEngine$EventHandler;

    invoke-virtual {v1, v0}, Lcom/adobe/ave/VideoEngine$EventHandler;->sendMessage(Landroid/os/Message;)Z

    .line 1164
    :cond_0
    return-void

    .line 1155
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method


# virtual methods
.method public addCustomHeader(Ljava/lang/String;[Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 1100
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 1101
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/ave/VideoEngine;->nativeAddCustomHeader(Ljava/lang/String;[Ljava/lang/String;I)V

    .line 1102
    return-void
.end method

.method public addListener(Ljava/util/Set;Lcom/adobe/ave/VideoEngineListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 418
    const/4 v0, 0x0

    .line 419
    iput-object p1, p0, Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;

    .line 421
    sget-object v1, Lcom/adobe/ave/ListenerType;->ERROR:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 422
    sget-object v1, Lcom/adobe/ave/ListenerType;->ERROR:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 424
    :cond_0
    sget-object v1, Lcom/adobe/ave/ListenerType;->PLAY_STATE:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 425
    sget-object v1, Lcom/adobe/ave/ListenerType;->PLAY_STATE:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 427
    :cond_1
    sget-object v1, Lcom/adobe/ave/ListenerType;->STREAM_SWITCH:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 428
    sget-object v1, Lcom/adobe/ave/ListenerType;->STREAM_SWITCH:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 430
    :cond_2
    sget-object v1, Lcom/adobe/ave/ListenerType;->STREAM_METADATA:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 431
    sget-object v1, Lcom/adobe/ave/ListenerType;->STREAM_METADATA:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 433
    :cond_3
    sget-object v1, Lcom/adobe/ave/ListenerType;->DRM_METADATA:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 434
    sget-object v1, Lcom/adobe/ave/ListenerType;->DRM_METADATA:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 436
    :cond_4
    sget-object v1, Lcom/adobe/ave/ListenerType;->TIMELINE:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 437
    sget-object v1, Lcom/adobe/ave/ListenerType;->TIMELINE:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 439
    :cond_5
    sget-object v1, Lcom/adobe/ave/ListenerType;->DATA:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 440
    sget-object v1, Lcom/adobe/ave/ListenerType;->DATA:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 442
    :cond_6
    sget-object v1, Lcom/adobe/ave/ListenerType;->MANIFEST_LOAD:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 443
    sget-object v1, Lcom/adobe/ave/ListenerType;->MANIFEST_LOAD:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 445
    :cond_7
    sget-object v1, Lcom/adobe/ave/ListenerType;->SEEK_COMPLETE:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 446
    sget-object v1, Lcom/adobe/ave/ListenerType;->SEEK_COMPLETE:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 448
    :cond_8
    sget-object v1, Lcom/adobe/ave/ListenerType;->WARNING:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 449
    sget-object v1, Lcom/adobe/ave/ListenerType;->WARNING:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 451
    :cond_9
    sget-object v1, Lcom/adobe/ave/ListenerType;->DICTIONARY_DATA:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 452
    sget-object v1, Lcom/adobe/ave/ListenerType;->DICTIONARY_DATA:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 454
    :cond_a
    sget-object v1, Lcom/adobe/ave/ListenerType;->LOAD_INFO:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 455
    sget-object v1, Lcom/adobe/ave/ListenerType;->LOAD_INFO:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 457
    :cond_b
    sget-object v1, Lcom/adobe/ave/ListenerType;->TRICK_PLAY_ENDED:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 458
    sget-object v1, Lcom/adobe/ave/ListenerType;->TRICK_PLAY_ENDED:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 460
    :cond_c
    sget-object v1, Lcom/adobe/ave/ListenerType;->DRM_ERROR:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 461
    sget-object v1, Lcom/adobe/ave/ListenerType;->DRM_ERROR:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 463
    :cond_d
    sget-object v1, Lcom/adobe/ave/ListenerType;->BACKGROUND_MANIFEST_ERROR:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 464
    sget-object v1, Lcom/adobe/ave/ListenerType;->BACKGROUND_MANIFEST_ERROR:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 466
    :cond_e
    sget-object v1, Lcom/adobe/ave/ListenerType;->BACKGROUND_MANIFEST_WARNING:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 467
    sget-object v1, Lcom/adobe/ave/ListenerType;->BACKGROUND_MANIFEST_WARNING:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 469
    :cond_f
    sget-object v1, Lcom/adobe/ave/ListenerType;->PAUSE_AT_PERIOD_END:Lcom/adobe/ave/ListenerType;

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 470
    sget-object v1, Lcom/adobe/ave/ListenerType;->PAUSE_AT_PERIOD_END:Lcom/adobe/ave/ListenerType;

    invoke-virtual {v1}, Lcom/adobe/ave/ListenerType;->getValue()I

    move-result v1

    or-int/2addr v0, v1

    .line 472
    :cond_10
    iget-object v1, p0, Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;

    if-eqz v1, :cond_11

    .line 473
    invoke-direct {p0, p2}, Lcom/adobe/ave/VideoEngine;->nativeRemoveListener(Lcom/adobe/ave/VideoEngineListener;)V

    .line 475
    :cond_11
    iput-object p2, p0, Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;

    .line 476
    invoke-direct {p0, v0, p2}, Lcom/adobe/ave/VideoEngine;->nativeAddListener(ILcom/adobe/ave/VideoEngineListener;)V

    .line 477
    return-void
.end method

.method public enableCaptions(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 817
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 818
    invoke-direct {p0, p1}, Lcom/adobe/ave/VideoEngine;->nativeEnableCaptions(Z)V

    .line 819
    iput-boolean p1, p0, Lcom/adobe/ave/VideoEngine;->mEnableCaption:Z

    .line 821
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine;->mVideoView:Lcom/adobe/ave/VideoEngineView;

    if-eqz v0, :cond_0

    .line 823
    iget-boolean v0, p0, Lcom/adobe/ave/VideoEngine;->mEnableCaption:Z

    if-ne v0, v1, :cond_1

    .line 824
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine;->mVideoView:Lcom/adobe/ave/VideoEngineView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/ave/VideoEngineView;->setWillNotDrawCaption(Z)V

    .line 828
    :cond_0
    :goto_0
    return-void

    .line 826
    :cond_1
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine;->mVideoView:Lcom/adobe/ave/VideoEngineView;

    invoke-virtual {v0, v1}, Lcom/adobe/ave/VideoEngineView;->setWillNotDrawCaption(Z)V

    goto :goto_0
.end method

.method public fastForward(F)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 791
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 792
    invoke-direct {p0, p1}, Lcom/adobe/ave/VideoEngine;->nativeFastForward(F)V

    .line 793
    return-void
.end method

.method protected finalize()V
    .locals 0

    .prologue
    .line 208
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeFinalize()V

    .line 209
    return-void
.end method

.method public getARCorrectedOutputRectangle()Landroid/graphics/Rect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 340
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 341
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeGetARCorrectedOutputRectangle()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    return-object v0
.end method

.method public getBackgroundTimeline()Lcom/adobe/ave/Timeline;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 989
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 990
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeGetBackgroundTimeline()Lcom/adobe/ave/Timeline;

    move-result-object v0

    return-object v0
.end method

.method public getBufferLength()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 747
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 748
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeGetBufferLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public getClientLivePoint()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 1086
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 1087
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeGetClientLivePoint()J

    move-result-wide v0

    return-wide v0
.end method

.method public getLocalTime(I)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 712
    invoke-direct {p0, p1}, Lcom/adobe/ave/VideoEngine;->nativeGetLocalTime(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getPlayState()Lcom/adobe/ave/PlayState;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 674
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 675
    sget-object v1, Lcom/adobe/ave/PlayState;->UNINITIALIZED:Lcom/adobe/ave/PlayState;

    .line 676
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeGetPlayState()I

    move-result v3

    .line 678
    invoke-static {}, Lcom/adobe/ave/PlayState;->values()[Lcom/adobe/ave/PlayState;

    move-result-object v4

    array-length v5, v4

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-ge v2, v5, :cond_1

    aget-object v0, v4, v2

    .line 680
    invoke-virtual {v0}, Lcom/adobe/ave/PlayState;->getValue()I

    move-result v6

    if-ne v6, v3, :cond_0

    .line 687
    :goto_1
    return-object v0

    .line 678
    :cond_0
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    move-object v0, v1

    goto :goto_1
.end method

.method public getQosBufferUnderrunCount()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 965
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 966
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeGetQosBufferUnderrunCount()I

    move-result v0

    return v0
.end method

.method public getQosDroppedFrameCount()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 898
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 899
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeGetQosDroppedFrameCount()I

    move-result v0

    return v0
.end method

.method public getQosFileDuration()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 922
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeGetQosFileDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getQosFileSize()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 910
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 911
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeGetQosFileSize()I

    move-result v0

    return v0
.end method

.method public getQosFrameRate()F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 885
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 886
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeGetQosFrameRate()F

    move-result v0

    return v0
.end method

.method public getQosLoadTime()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 937
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 938
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeGetQosLoadTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public getQosTimeToFirstByte()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 951
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 952
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeGetQosTimeToFirstByte()J

    move-result-wide v0

    return-wide v0
.end method

.method public getTime()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 699
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 700
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeGetTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public getTimeline()Lcom/adobe/ave/Timeline;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 977
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 978
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeGetTimeline()Lcom/adobe/ave/Timeline;

    move-result-object v0

    return-object v0
.end method

.method public injectData(Lcom/adobe/ave/DataType;J[BI)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 507
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 508
    invoke-virtual {p1}, Lcom/adobe/ave/DataType;->getValue()I

    move-result v1

    move-object v0, p0

    move-wide v2, p2

    move-object v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/adobe/ave/VideoEngine;->nativeInjectData(IJ[BI)V

    .line 509
    return-void
.end method

.method public load(Ljava/lang/String;Lcom/adobe/ave/ContainerType;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 255
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 256
    invoke-virtual {p2}, Lcom/adobe/ave/ContainerType;->getValue()I

    move-result v0

    invoke-direct {p0, p1, v0, p3}, Lcom/adobe/ave/VideoEngine;->nativeLoad(Ljava/lang/String;II)V

    .line 257
    return-void
.end method

.method public loadWithBackgroundManifest(Ljava/lang/String;Lcom/adobe/ave/ContainerType;ILjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 275
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 276
    invoke-virtual {p2}, Lcom/adobe/ave/ContainerType;->getValue()I

    move-result v0

    invoke-direct {p0, p1, v0, p3, p4}, Lcom/adobe/ave/VideoEngine;->nativeLoadWithBackgroundManifest(Ljava/lang/String;IILjava/lang/String;)V

    .line 277
    return-void
.end method

.method public pause()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 549
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 550
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativePause()V

    .line 551
    return-void
.end method

.method public play()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 535
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 536
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativePlay()V

    .line 537
    return-void
.end method

.method public prepareBuffer()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 519
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 520
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativePrepareBuffer()V

    .line 521
    return-void
.end method

.method public release()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 197
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 198
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeRelease()V

    .line 199
    return-void
.end method

.method public releaseGPUResources()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 662
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 663
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeReleaseGPUResources()V

    .line 664
    return-void
.end method

.method public removeListener(Lcom/adobe/ave/VideoEngineListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 486
    invoke-direct {p0, p1}, Lcom/adobe/ave/VideoEngine;->nativeRemoveListener(Lcom/adobe/ave/VideoEngineListener;)V

    .line 487
    iput-object v0, p0, Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;

    .line 488
    iput-object v0, p0, Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;

    .line 489
    return-void
.end method

.method public reset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 643
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 645
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/ave/VideoEngine;->enableCaptions(Z)V

    .line 646
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeReset()V

    .line 647
    return-void
.end method

.method public rewind(F)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 805
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 806
    invoke-direct {p0, p1}, Lcom/adobe/ave/VideoEngine;->nativeRewind(F)V

    .line 807
    return-void
.end method

.method public seek(JZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 571
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 572
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/ave/VideoEngine;->nativeSeek(JZ)V

    .line 573
    return-void
.end method

.method public seekToKeyFrame(JZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 628
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 629
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/ave/VideoEngine;->nativeSeekToKeyFrame(JZ)V

    .line 630
    return-void
.end method

.method public seekToLivePoint()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 606
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 607
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->nativeSeekToLivePoint()V

    .line 608
    return-void
.end method

.method public seekToLocalTime(IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 592
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 593
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/ave/VideoEngine;->nativeSeekToLocalTime(IJ)V

    .line 594
    return-void
.end method

.method public selectTrack(ILcom/adobe/ave/PayloadType;I)Lcom/adobe/ave/MediaErrorCode;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 298
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 299
    invoke-virtual {p2}, Lcom/adobe/ave/PayloadType;->getValue()I

    move-result v0

    invoke-direct {p0, p1, v0, p3}, Lcom/adobe/ave/VideoEngine;->nativeSelectTrack(III)I

    move-result v3

    .line 301
    sget-object v1, Lcom/adobe/ave/MediaErrorCode;->GENERIC_ERROR:Lcom/adobe/ave/MediaErrorCode;

    .line 302
    invoke-static {}, Lcom/adobe/ave/MediaErrorCode;->values()[Lcom/adobe/ave/MediaErrorCode;

    move-result-object v4

    array-length v5, v4

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-ge v2, v5, :cond_1

    aget-object v0, v4, v2

    .line 304
    invoke-virtual {v0}, Lcom/adobe/ave/MediaErrorCode;->getValue()I

    move-result v6

    if-ne v6, v3, :cond_0

    .line 310
    :goto_1
    return-object v0

    .line 302
    :cond_0
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    move-object v0, v1

    goto :goto_1
.end method

.method public setABRParameters(Lcom/adobe/ave/ABRParameters;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 376
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 377
    invoke-direct {p0, p1}, Lcom/adobe/ave/VideoEngine;->nativeSetABRParameters(Lcom/adobe/ave/ABRParameters;)V

    .line 378
    return-void
.end method

.method public setBandwidth(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 400
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 401
    invoke-direct {p0, p1}, Lcom/adobe/ave/VideoEngine;->nativeSetBandwidth(I)V

    .line 402
    return-void
.end method

.method public setBufferTime(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 736
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 737
    invoke-direct {p0, p1, p2}, Lcom/adobe/ave/VideoEngine;->nativeSetBufferTime(J)V

    .line 738
    return-void
.end method

.method public setCaptionStyle([Ljava/lang/String;[Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 872
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 873
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/ave/VideoEngine;->nativeSetCaptionStyle([Ljava/lang/String;[Ljava/lang/String;I)V

    .line 874
    return-void
.end method

.method public setCuePointTags([Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 1003
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 1004
    invoke-direct {p0, p1, p2}, Lcom/adobe/ave/VideoEngine;->nativeSetCuePointTags([Ljava/lang/String;I)V

    .line 1005
    return-void
.end method

.method public setCustomConfiguration(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 1107
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 1108
    invoke-direct {p0, p1}, Lcom/adobe/ave/VideoEngine;->nativeSetCustomConfiguration(Ljava/lang/String;)V

    .line 1109
    return-void
.end method

.method public setDRMManager(Lcom/adobe/ave/drm/DRMManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 352
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 353
    invoke-direct {p0, p1}, Lcom/adobe/ave/VideoEngine;->nativeSetDRMManager(Lcom/adobe/ave/drm/DRMManager;)V

    .line 354
    return-void
.end method

.method public setInitialBufferTime(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 724
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 725
    invoke-direct {p0, p1, p2}, Lcom/adobe/ave/VideoEngine;->nativeSetInitialBufferTime(J)V

    .line 726
    return-void
.end method

.method public setLocalStoragePath(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 364
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 365
    invoke-direct {p0, p1}, Lcom/adobe/ave/VideoEngine;->nativesetLocalStoragePath(Ljava/lang/String;)V

    .line 366
    return-void
.end method

.method public setMasterUpdateInterval(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 1074
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 1075
    invoke-direct {p0, p1}, Lcom/adobe/ave/VideoEngine;->nativeSetMasterUpdateInterval(I)V

    .line 1076
    return-void
.end method

.method public setNetworkingParameters(Lcom/adobe/ave/NetworkingParameters;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 388
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 389
    invoke-direct {p0, p1}, Lcom/adobe/ave/VideoEngine;->nativeSetNetworkingParameters(Lcom/adobe/ave/NetworkingParameters;)V

    .line 390
    return-void
.end method

.method public setPlaySpeed(FZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 777
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 778
    invoke-direct {p0, p1, p2}, Lcom/adobe/ave/VideoEngine;->nativeSetPlaySpeed(FZ)V

    .line 779
    return-void
.end method

.method public setScreenOnWhilePlaying(Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 1045
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 1046
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine;->mVideoView:Lcom/adobe/ave/VideoEngineView;

    if-eqz v0, :cond_0

    .line 1048
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine;->mVideoView:Lcom/adobe/ave/VideoEngineView;

    invoke-virtual {v0}, Lcom/adobe/ave/VideoEngineView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    .line 1049
    invoke-interface {v0, p1}, Landroid/view/SurfaceHolder;->setKeepScreenOn(Z)V

    .line 1051
    :cond_0
    return-void
.end method

.method public setSourceViewport(IIII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 325
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 326
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/ave/VideoEngine;->nativeSetSourceViewport(IIII)V

    .line 327
    return-void
.end method

.method public setSubscribedTags([Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 1018
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 1019
    invoke-direct {p0, p1, p2}, Lcom/adobe/ave/VideoEngine;->nativeSetSubscribedTags([Ljava/lang/String;I)V

    .line 1020
    return-void
.end method

.method public setSubscribedTagsForBackgroundManifest([Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 1033
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 1034
    invoke-direct {p0, p1, p2}, Lcom/adobe/ave/VideoEngine;->nativeSetSubscribedTagsForBackgroundManifest([Ljava/lang/String;I)V

    .line 1035
    return-void
.end method

.method public setView(Lcom/adobe/ave/VideoEngineView;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 221
    invoke-direct {p0, p1}, Lcom/adobe/ave/VideoEngine;->nativeSetSurface(Ljava/lang/Object;)V

    .line 224
    if-nez p1, :cond_0

    .line 225
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine;->mVideoView:Lcom/adobe/ave/VideoEngineView;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/adobe/ave/VideoEngineView;->setNativeInstance(J)V

    .line 227
    :cond_0
    iput-object p1, p0, Lcom/adobe/ave/VideoEngine;->mVideoView:Lcom/adobe/ave/VideoEngineView;

    .line 229
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine;->mVideoView:Lcom/adobe/ave/VideoEngineView;

    if-eqz v0, :cond_1

    .line 231
    iget-boolean v0, p0, Lcom/adobe/ave/VideoEngine;->mEnableCaption:Z

    if-ne v0, v1, :cond_2

    .line 232
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine;->mVideoView:Lcom/adobe/ave/VideoEngineView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/ave/VideoEngineView;->setWillNotDrawCaption(Z)V

    .line 236
    :cond_1
    :goto_0
    return-void

    .line 234
    :cond_2
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine;->mVideoView:Lcom/adobe/ave/VideoEngineView;

    invoke-virtual {v0, v1}, Lcom/adobe/ave/VideoEngineView;->setWillNotDrawCaption(Z)V

    goto :goto_0
.end method

.method public setVolume(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    .line 760
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 761
    invoke-direct {p0, p1}, Lcom/adobe/ave/VideoEngine;->nativeSetVolume(I)V

    .line 762
    return-void
.end method

.method public useRedirectedUrl(Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/ave/VideoEngineException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 1062
    invoke-direct {p0}, Lcom/adobe/ave/VideoEngine;->failIfNotUIThread()V

    .line 1063
    if-ne p1, v0, :cond_0

    :goto_0
    invoke-direct {p0, v0}, Lcom/adobe/ave/VideoEngine;->nativeUseRedirectedUrl(Z)V

    .line 1064
    return-void

    .line 1063
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
