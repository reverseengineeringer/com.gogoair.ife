.class Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gogoair/ife/views/PlayerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PlaybackObserverRunnable"
.end annotation


# static fields
.field private static final SAVE_INTERVAL:I = 0x2710


# instance fields
.field private previousSaveTime:J

.field final synthetic this$0:Lcom/gogoair/ife/views/PlayerActivity;


# direct methods
.method public constructor <init>(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 2

    .prologue
    .line 847
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 845
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->previousSaveTime:J

    .line 848
    return-void
.end method

.method private processAccountingGradeLoggingIfNeeded()V
    .locals 8

    .prologue
    const-wide/16 v2, 0x0

    .line 881
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->accountingGradeDuration:J
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1000(Lcom/gogoair/ife/views/PlayerActivity;)J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getDurationUrl()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->isPlaybackLogged()Z

    move-result v0

    if-nez v0, :cond_0

    .line 882
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentTime()J

    move-result-wide v0

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->accountingGradeDuration:J
    invoke-static {v2}, Lcom/gogoair/ife/views/PlayerActivity;->access$1000(Lcom/gogoair/ife/views/PlayerActivity;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 884
    :try_start_0
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "Accounting grade triggering..."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 885
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    const-wide/16 v2, 0x0

    # setter for: Lcom/gogoair/ife/views/PlayerActivity;->accountingGradeDuration:J
    invoke-static {v0, v2, v3}, Lcom/gogoair/ife/views/PlayerActivity;->access$1002(Lcom/gogoair/ife/views/PlayerActivity;J)J

    .line 886
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v1

    invoke-virtual {v1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getAppData()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 887
    const-string v1, "eventType"

    const-string v2, "3"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 888
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v1

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v3, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v3}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v3

    invoke-virtual {v3}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getDurationUrl()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v4}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v4

    invoke-virtual {v1, v2, v0, v3, v4}, Lcom/gogoair/ife/utils/GVLogger;->logAccountingGrade(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 896
    :cond_0
    :goto_0
    return-void

    .line 889
    :catch_0
    move-exception v0

    .line 890
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 893
    :cond_1
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Accounting grade logging will trigger after in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->accountingGradeDuration:J
    invoke-static {v3}, Lcom/gogoair/ife/views/PlayerActivity;->access$1000(Lcom/gogoair/ife/views/PlayerActivity;)J

    move-result-wide v4

    iget-object v3, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v3}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v3

    invoke-interface {v3}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentTime()J

    move-result-wide v6

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " seconds"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private processContentExpiry()Z
    .locals 8

    .prologue
    const-wide/16 v2, 0x0

    .line 861
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->timeToExpiryInMillis()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 862
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Movie will expire in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v3}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v3

    invoke-virtual {v3}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->timeToExpiryInMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " seconds."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 863
    const/4 v0, 0x1

    .line 866
    :goto_0
    return v0

    .line 865
    :cond_0
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    sget-object v1, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->EXPIRED:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->goToLandingPage(Lcom/gogoair/ife/utils/Constants$GVErrorCode;J)V
    invoke-static {v0, v1, v2, v3}, Lcom/gogoair/ife/views/PlayerActivity;->access$2200(Lcom/gogoair/ife/views/PlayerActivity;Lcom/gogoair/ife/utils/Constants$GVErrorCode;J)V

    .line 866
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private savePlaybackPositionIfNeeded()V
    .locals 8

    .prologue
    .line 871
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    .line 872
    iget-wide v2, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->previousSaveTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x2710

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 873
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v2

    const-string v3, "Player"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Saved playback position "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v5}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v5

    invoke-interface {v5}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentTime()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 874
    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v2}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v2

    iget-object v3, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v3}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v3

    invoke-interface {v3}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentTime()J

    move-result-wide v4

    long-to-int v3, v4

    invoke-virtual {v2, v3}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->setPlaybackElapsed(I)V

    .line 875
    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->db:Lcom/gogoair/ife/storage/MediaDb;
    invoke-static {v2}, Lcom/gogoair/ife/views/PlayerActivity;->access$3200(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/storage/MediaDb;

    move-result-object v2

    iget-object v3, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v3}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/gogoair/ife/storage/MediaDb;->updateLibraryEntry(Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;)V

    .line 876
    iput-wide v0, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->previousSaveTime:J

    .line 878
    :cond_0
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 851
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 852
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->processAccountingGradeLoggingIfNeeded()V

    .line 853
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->savePlaybackPositionIfNeeded()V

    .line 854
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->processContentExpiry()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 855
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->startPlaybackObserver()V
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1900(Lcom/gogoair/ife/views/PlayerActivity;)V

    .line 858
    :cond_0
    return-void
.end method
