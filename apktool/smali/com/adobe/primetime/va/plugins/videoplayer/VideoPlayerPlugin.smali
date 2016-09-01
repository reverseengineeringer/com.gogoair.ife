.class public Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;
.super Lcom/adobe/primetime/core/plugin/BasePlugin;
.source "SourceFile"


# static fields
.field public static final AD_COMPLETE:Ljava/lang/String; = "ad_complete"

.field public static final AD_START:Ljava/lang/String; = "ad_start"

.field public static final BITRATE_CHANGE:Ljava/lang/String; = "bitrate_change"

.field public static final BUFFER_COMPLETE:Ljava/lang/String; = "buffer_complete"

.field public static final BUFFER_START:Ljava/lang/String; = "buffer_start"

.field public static final CHAPTER_COMPLETE:Ljava/lang/String; = "chapter_complete"

.field public static final CHAPTER_START:Ljava/lang/String; = "chapter_start"

.field private static final ERROR_SOURCE_APPLICATION:Ljava/lang/String; = "sourceErrorExternal"

.field private static final ERROR_SOURCE_PLAYER:Ljava/lang/String; = "sourceErrorSDK"

.field private static final KEY_CALLBACK:Ljava/lang/String; = "callback"

.field private static final KEY_ERROR_ID:Ljava/lang/String; = "error_id"

.field private static final KEY_SOURCE:Ljava/lang/String; = "source"

.field private static final NAME:Ljava/lang/String; = "player"

.field public static final PAUSE:Ljava/lang/String; = "pause"

.field public static final PLAY:Ljava/lang/String; = "play"

.field public static final SEEK_COMPLETE:Ljava/lang/String; = "seek_complete"

.field public static final SEEK_START:Ljava/lang/String; = "seek_start"

.field public static final TRACK_ERROR:Ljava/lang/String; = "track_error"

.field public static final VIDEO_COMPLETE:Ljava/lang/String; = "video_complete"

.field public static final VIDEO_LOAD:Ljava/lang/String; = "video_load"

.field public static final VIDEO_START:Ljava/lang/String; = "video_start"

.field public static final VIDEO_UNLOAD:Ljava/lang/String; = "video_unload"


# instance fields
.field private _delegate:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginDelegate;

.field private _isTrackingSessionActive:Z

.field private _isTrackingSessionStarted:Z

.field private final cacheAdBreakInfo:Lcom/adobe/primetime/core/ICallback;

.field private final cacheAdInfo:Lcom/adobe/primetime/core/ICallback;

.field private final cacheChapterInfo:Lcom/adobe/primetime/core/ICallback;

.field private final cacheQoSInfo:Lcom/adobe/primetime/core/ICallback;

.field private final cacheVideoInfo:Lcom/adobe/primetime/core/ICallback;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginDelegate;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 69
    const-string v0, "player"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/core/plugin/BasePlugin;-><init>(Ljava/lang/String;)V

    .line 387
    new-instance v0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$1;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$1;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->cacheVideoInfo:Lcom/adobe/primetime/core/ICallback;

    .line 402
    new-instance v0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$2;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$2;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->cacheAdInfo:Lcom/adobe/primetime/core/ICallback;

    .line 417
    new-instance v0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$3;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$3;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->cacheAdBreakInfo:Lcom/adobe/primetime/core/ICallback;

    .line 432
    new-instance v0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$4;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$4;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->cacheChapterInfo:Lcom/adobe/primetime/core/ICallback;

    .line 447
    new-instance v0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$5;

    invoke-direct {v0, p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$5;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)V

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->cacheQoSInfo:Lcom/adobe/primetime/core/ICallback;

    .line 71
    if-nez p1, :cond_0

    .line 72
    new-instance v0, Ljava/lang/Error;

    const-string v1, "PlayerPluginDelegate cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 74
    :cond_0
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_delegate:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginDelegate;

    .line 76
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_isTrackingSessionActive:Z

    .line 77
    iput-boolean v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_isTrackingSessionStarted:Z

    .line 79
    invoke-direct {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_setupDataResolver()V

    .line 80
    return-void
.end method

.method private _setupDataResolver()V
    .locals 4

    .prologue
    .line 468
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 469
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 471
    const-string v2, "video.id"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$6;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$6;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 481
    const-string v2, "video.name"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$7;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$7;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 491
    const-string v2, "video.length"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$8;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$8;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 501
    const-string v2, "video.playerName"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$9;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$9;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 511
    const-string v2, "video.streamType"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$10;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$10;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 521
    const-string v2, "video.playhead"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$11;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$11;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 531
    const-string v2, "pod.name"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$12;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$12;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 541
    const-string v2, "pod.playerName"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$13;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$13;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 551
    const-string v2, "pod.position"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$14;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$14;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 561
    const-string v2, "pod.startTime"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$15;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$15;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 571
    const-string v2, "ad.isInAdBreak"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$16;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$16;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 581
    const-string v2, "ad.isInAd"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$17;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$17;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 591
    const-string v2, "ad.id"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$18;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$18;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 601
    const-string v2, "ad.name"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$19;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$19;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 611
    const-string v2, "ad.length"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$20;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$20;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 621
    const-string v2, "ad.position"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$21;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$21;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 631
    const-string v2, "chapter.isInChapter"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$22;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$22;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 641
    const-string v2, "chapter.name"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$23;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$23;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 651
    const-string v2, "chapter.length"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$24;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$24;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 661
    const-string v2, "chapter.position"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$25;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$25;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 671
    const-string v2, "chapter.startTime"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$26;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$26;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 681
    const-string v2, "qos.bitrate"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$27;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$27;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 691
    const-string v2, "qos.fps"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$28;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$28;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 701
    const-string v2, "qos.droppedFrames"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$29;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$29;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 711
    const-string v2, "qos.startupTime"

    new-instance v3, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$30;

    invoke-direct {v3, p0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$30;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 723
    new-instance v2, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$31;

    invoke-direct {v2, p0, v1, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin$31;-><init>(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;Ljava/util/Map;Ljava/util/Map;)V

    iput-object v2, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_dataResolver:Ljava/lang/Object;

    .line 742
    return-void
.end method

.method private _startSessionIfNeeded(Ljava/lang/String;)Z
    .locals 4

    .prologue
    .line 745
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_isTrackingSessionActive:Z

    if-nez v0, :cond_0

    .line 746
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "#"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "() > No active tracking session."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    .line 747
    const/4 v0, 0x0

    .line 755
    :goto_0
    return v0

    .line 750
    :cond_0
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_isTrackingSessionStarted:Z

    if-nez v0, :cond_1

    .line 751
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "#"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "() > Tracking session auto-start."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 752
    invoke-virtual {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->trackSessionStart()V

    .line 755
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginDelegate;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_delegate:Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginDelegate;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ICallback;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->cacheVideoInfo:Lcom/adobe/primetime/core/ICallback;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ICallback;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->cacheAdBreakInfo:Lcom/adobe/primetime/core/ICallback;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2600(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$2900(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3000(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$3100(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3200(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$3300(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3400(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$3500(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ICallback;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->cacheAdInfo:Lcom/adobe/primetime/core/ICallback;

    return-object v0
.end method

.method static synthetic access$3600(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3700(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$3800(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3900(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$4000(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4100(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$4200(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4300(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$4400(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4500(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$4600(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ICallback;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->cacheChapterInfo:Lcom/adobe/primetime/core/ICallback;

    return-object v0
.end method

.method static synthetic access$4700(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4800(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$4900(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$5000(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$5100(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$5200(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$5300(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$5400(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$5500(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$5600(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$5700(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ICallback;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->cacheQoSInfo:Lcom/adobe/primetime/core/ICallback;

    return-object v0
.end method

.method static synthetic access$5800(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$5900(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$6000(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$6100(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$6200(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$6300(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$6400(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$6500(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$700(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$800(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Lcom/adobe/primetime/core/ILogger;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    return-object v0
.end method

.method static synthetic access$900(Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public configure(Lcom/adobe/primetime/core/plugin/IPluginConfig;)V
    .locals 4

    .prologue
    .line 84
    if-nez p1, :cond_0

    .line 85
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference tp the configuration data cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_0
    instance-of v0, p1, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginConfig;

    if-nez v0, :cond_1

    .line 89
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Expected config data to be instance of VideoPlayerPluginConfig."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 92
    :cond_1
    check-cast p1, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginConfig;

    .line 93
    iget-boolean v0, p1, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginConfig;->debugLogging:Z

    if-eqz v0, :cond_2

    .line 94
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-interface {v0}, Lcom/adobe/primetime/core/ILogger;->enable()V

    .line 99
    :goto_0
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "configure(debugLogging="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p1, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginConfig;->debugLogging:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    return-void

    .line 96
    :cond_2
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-interface {v0}, Lcom/adobe/primetime/core/ILogger;->disable()V

    goto :goto_0
.end method

.method public trackAdComplete()V
    .locals 3

    .prologue
    .line 320
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackAdComplete()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    invoke-virtual {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 327
    :cond_0
    :goto_0
    return-void

    .line 324
    :cond_1
    const-string v0, "trackAdComplete"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_startSessionIfNeeded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 326
    const-string v0, "ad_complete"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public trackAdStart()V
    .locals 3

    .prologue
    .line 306
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackAdStart()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    invoke-virtual {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 313
    :cond_0
    :goto_0
    return-void

    .line 310
    :cond_1
    const-string v0, "trackAdStart"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_startSessionIfNeeded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 312
    const-string v0, "ad_start"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public trackApplicationError(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 370
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "#trackApplicationError(errorId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 374
    const-string v0, "trackApplicationError"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_startSessionIfNeeded(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 381
    :goto_0
    return-void

    .line 376
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 377
    const-string v1, "source"

    const-string v2, "sourceErrorExternal"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    const-string v1, "error_id"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    const-string v1, "track_error"

    invoke-virtual {p0, v1, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public trackBitrateChange()V
    .locals 3

    .prologue
    .line 336
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackBitrateChange()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 338
    invoke-virtual {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 343
    :cond_0
    :goto_0
    return-void

    .line 340
    :cond_1
    const-string v0, "trackBitrateChange"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_startSessionIfNeeded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 342
    const-string v0, "bitrate_change"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public trackBufferComplete()V
    .locals 3

    .prologue
    .line 215
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackBufferComplete()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    invoke-virtual {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 222
    :cond_0
    :goto_0
    return-void

    .line 219
    :cond_1
    const-string v0, "trackBufferComplete"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_startSessionIfNeeded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 221
    const-string v0, "buffer_complete"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public trackBufferStart()V
    .locals 3

    .prologue
    .line 201
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackBufferStart()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    invoke-virtual {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 208
    :cond_0
    :goto_0
    return-void

    .line 205
    :cond_1
    const-string v0, "trackBufferStart"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_startSessionIfNeeded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    const-string v0, "buffer_start"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public trackChapterComplete()V
    .locals 3

    .prologue
    .line 290
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "trackChapterComplete()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    invoke-virtual {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 297
    :cond_0
    :goto_0
    return-void

    .line 294
    :cond_1
    const-string v0, "trackChapterComplete"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_startSessionIfNeeded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 296
    const-string v0, "chapter_complete"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public trackChapterStart()V
    .locals 3

    .prologue
    .line 276
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackChapterStart()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    invoke-virtual {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 283
    :cond_0
    :goto_0
    return-void

    .line 280
    :cond_1
    const-string v0, "trackChapterStart"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_startSessionIfNeeded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 282
    const-string v0, "chapter_start"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public trackComplete(Lcom/adobe/primetime/core/ICallback;)V
    .locals 3

    .prologue
    .line 257
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackComplete()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    invoke-virtual {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 267
    :cond_0
    :goto_0
    return-void

    .line 261
    :cond_1
    const-string v0, "trackComplete"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_startSessionIfNeeded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 263
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 264
    const-string v1, "callback"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    const-string v1, "video_complete"

    invoke-virtual {p0, v1, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public trackPause()V
    .locals 3

    .prologue
    .line 187
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackPause()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    invoke-virtual {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 194
    :cond_0
    :goto_0
    return-void

    .line 191
    :cond_1
    const-string v0, "trackPause"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_startSessionIfNeeded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 193
    const-string v0, "pause"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public trackPlay()V
    .locals 3

    .prologue
    .line 173
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackPlay()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    invoke-virtual {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 180
    :cond_0
    :goto_0
    return-void

    .line 177
    :cond_1
    const-string v0, "trackPlay"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_startSessionIfNeeded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 179
    const-string v0, "play"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public trackSeekComplete()V
    .locals 3

    .prologue
    .line 243
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackSeekComplete()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    invoke-virtual {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 250
    :cond_0
    :goto_0
    return-void

    .line 247
    :cond_1
    const-string v0, "trackSeekComplete"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_startSessionIfNeeded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 249
    const-string v0, "seek_complete"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public trackSeekStart()V
    .locals 3

    .prologue
    .line 229
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackSeekStart()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    invoke-virtual {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 236
    :cond_0
    :goto_0
    return-void

    .line 233
    :cond_1
    const-string v0, "trackSeekStart"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_startSessionIfNeeded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 235
    const-string v0, "seek_start"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public trackSessionStart()V
    .locals 3

    .prologue
    .line 114
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackSessionStart()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    invoke-virtual {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 131
    :goto_0
    return-void

    .line 118
    :cond_0
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_isTrackingSessionActive:Z

    if-nez v0, :cond_1

    .line 119
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackSessionStart() > No active tracking session."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 123
    :cond_1
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_isTrackingSessionStarted:Z

    if-eqz v0, :cond_2

    .line 124
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackSessionStart() > Tracking session already started."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 128
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_isTrackingSessionStarted:Z

    .line 130
    const-string v0, "video_start"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public trackVideoLoad()V
    .locals 3

    .prologue
    .line 138
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackVideoLoad()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    invoke-virtual {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 146
    :goto_0
    return-void

    .line 142
    :cond_0
    const-string v0, "video_load"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    .line 144
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_isTrackingSessionActive:Z

    .line 145
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_isTrackingSessionStarted:Z

    goto :goto_0
.end method

.method public trackVideoPlayerError(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 352
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "#trackVideoPlayerError(errorId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 356
    const-string v0, "trackVideoPlayerError"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_startSessionIfNeeded(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 363
    :goto_0
    return-void

    .line 358
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 359
    const-string v1, "source"

    const-string v2, "sourceErrorSDK"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    const-string v1, "error_id"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 362
    const-string v1, "track_error"

    invoke-virtual {p0, v1, v0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public trackVideoUnload()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 153
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackVideoUnload()"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    invoke-virtual {p0}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 166
    :goto_0
    return-void

    .line 157
    :cond_0
    iget-boolean v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_isTrackingSessionActive:Z

    if-nez v0, :cond_1

    .line 158
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_logTag:Ljava/lang/String;

    const-string v2, "#trackVideoUnload() > No active tracking session."

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 162
    :cond_1
    const-string v0, "video_unload"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V

    .line 164
    iput-boolean v3, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_isTrackingSessionActive:Z

    .line 165
    iput-boolean v3, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPlugin;->_isTrackingSessionStarted:Z

    goto :goto_0
.end method
