.class public Lcom/gogoair/ife/views/PlayerActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "SourceFile"

# interfaces
.implements Landroid/widget/MediaController$MediaPlayerControl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;
    }
.end annotation


# static fields
.field public static final INTENT_EXTRA_GV_LIBRARY_ENTRY:Ljava/lang/String; = "INTENT_EXTRA_GV_LIBRARY_ENTRY"

.field private static final MEDIACONTROLLER_SHOW_TIME:I = 0x1388

.field private static final PLAYBACK_OBSERVATION_INTERVAL:I = 0x3e8

.field private static final TAG:Ljava/lang/String; = "Player"


# instance fields
.field private accountingGradeDuration:J

.field private actionBarVisibility:I

.field private closedCaptionTracks:Ljava/util/List;

.field private createTimestamp:J

.field private db:Lcom/gogoair/ife/storage/MediaDb;

.field private final drmEventListener:Lcom/adobe/mediacore/MediaPlayer$DRMEventListener;

.field private drmManager:Lcom/adobe/ave/drm/DRMManager;

.field private final licenseAcquisitionListener:Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;

.field private mediaController:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

.field private mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

.field private movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

.field private movieHeight:J

.field private moviePlayerLayout:Landroid/view/View;

.field private movieWidth:J

.field private final playbackEventListener:Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

.field private final playbackObserverHandler:Landroid/os/Handler;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final playbackObserverRunnable:Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private playerFrame:Landroid/widget/FrameLayout;

.field private playerPrepared:Z

.field private progressDialog:Landroid/app/ProgressDialog;

.field private final qosEventListener:Lcom/adobe/mediacore/MediaPlayer$QOSEventListener;

.field private savedPosition:I

.field private final seekProgressDialogHandler:Landroid/os/Handler;

.field private final seekProgressDialogRunnable:Ljava/lang/Runnable;

.field private selectedClosedCaptionsIndex:I

.field private timeToBufferStart:J

.field private timeToFirstFrame:J


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    .line 66
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 76
    iput-wide v2, p0, Lcom/gogoair/ife/views/PlayerActivity;->movieWidth:J

    .line 77
    iput-wide v2, p0, Lcom/gogoair/ife/views/PlayerActivity;->movieHeight:J

    .line 84
    iput-boolean v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->playerPrepared:Z

    .line 86
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->playbackObserverHandler:Landroid/os/Handler;

    .line 88
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->seekProgressDialogHandler:Landroid/os/Handler;

    .line 90
    new-instance v0, Lcom/gogoair/ife/views/PlayerActivity$1;

    invoke-direct {v0, p0}, Lcom/gogoair/ife/views/PlayerActivity$1;-><init>(Lcom/gogoair/ife/views/PlayerActivity;)V

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->seekProgressDialogRunnable:Ljava/lang/Runnable;

    .line 97
    new-instance v0, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;

    invoke-direct {v0, p0}, Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;-><init>(Lcom/gogoair/ife/views/PlayerActivity;)V

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->playbackObserverRunnable:Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;

    .line 100
    const/16 v0, 0x500

    iput v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->actionBarVisibility:I

    .line 101
    iput v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->selectedClosedCaptionsIndex:I

    .line 104
    iput-wide v2, p0, Lcom/gogoair/ife/views/PlayerActivity;->accountingGradeDuration:J

    .line 110
    new-instance v0, Lcom/gogoair/ife/views/PlayerActivity$2;

    invoke-direct {v0, p0}, Lcom/gogoair/ife/views/PlayerActivity$2;-><init>(Lcom/gogoair/ife/views/PlayerActivity;)V

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->qosEventListener:Lcom/adobe/mediacore/MediaPlayer$QOSEventListener;

    .line 150
    new-instance v0, Lcom/gogoair/ife/views/PlayerActivity$3;

    invoke-direct {v0, p0}, Lcom/gogoair/ife/views/PlayerActivity$3;-><init>(Lcom/gogoair/ife/views/PlayerActivity;)V

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->playbackEventListener:Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    .line 343
    new-instance v0, Lcom/gogoair/ife/views/PlayerActivity$5;

    invoke-direct {v0, p0}, Lcom/gogoair/ife/views/PlayerActivity$5;-><init>(Lcom/gogoair/ife/views/PlayerActivity;)V

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->licenseAcquisitionListener:Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;

    .line 386
    new-instance v0, Lcom/gogoair/ife/views/PlayerActivity$6;

    invoke-direct {v0, p0}, Lcom/gogoair/ife/views/PlayerActivity$6;-><init>(Lcom/gogoair/ife/views/PlayerActivity;)V

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->drmEventListener:Lcom/adobe/mediacore/MediaPlayer$DRMEventListener;

    .line 842
    return-void
.end method

.method static synthetic access$000(Lcom/gogoair/ife/views/PlayerActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0, p1, p2}, Lcom/gogoair/ife/views/PlayerActivity;->showProgressDialog(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/gogoair/ife/views/PlayerActivity;)J
    .locals 2

    .prologue
    .line 66
    iget-wide v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->timeToBufferStart:J

    return-wide v0
.end method

.method static synthetic access$1000(Lcom/gogoair/ife/views/PlayerActivity;)J
    .locals 2

    .prologue
    .line 66
    iget-wide v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->accountingGradeDuration:J

    return-wide v0
.end method

.method static synthetic access$1002(Lcom/gogoair/ife/views/PlayerActivity;J)J
    .locals 1

    .prologue
    .line 66
    iput-wide p1, p0, Lcom/gogoair/ife/views/PlayerActivity;->accountingGradeDuration:J

    return-wide p1
.end method

.method static synthetic access$102(Lcom/gogoair/ife/views/PlayerActivity;J)J
    .locals 1

    .prologue
    .line 66
    iput-wide p1, p0, Lcom/gogoair/ife/views/PlayerActivity;->timeToBufferStart:J

    return-wide p1
.end method

.method static synthetic access$1100(Lcom/gogoair/ife/views/PlayerActivity;)J
    .locals 2

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getAccountingGradeDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$1202(Lcom/gogoair/ife/views/PlayerActivity;Z)Z
    .locals 0

    .prologue
    .line 66
    iput-boolean p1, p0, Lcom/gogoair/ife/views/PlayerActivity;->playerPrepared:Z

    return p1
.end method

.method static synthetic access$1300(Lcom/gogoair/ife/views/PlayerActivity;)Ljava/util/List;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->closedCaptionTracks:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1302(Lcom/gogoair/ife/views/PlayerActivity;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .prologue
    .line 66
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity;->closedCaptionTracks:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/gogoair/ife/views/PlayerActivity;Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/util/List;
    .locals 1

    .prologue
    .line 66
    invoke-direct {p0, p1}, Lcom/gogoair/ife/views/PlayerActivity;->loadClosedCaptioningTracks(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1600(Lcom/gogoair/ife/views/PlayerActivity;)I
    .locals 1

    .prologue
    .line 66
    iget v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->selectedClosedCaptionsIndex:I

    return v0
.end method

.method static synthetic access$1602(Lcom/gogoair/ife/views/PlayerActivity;I)I
    .locals 0

    .prologue
    .line 66
    iput p1, p0, Lcom/gogoair/ife/views/PlayerActivity;->selectedClosedCaptionsIndex:I

    return p1
.end method

.method static synthetic access$1700(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->initializeMediaController()V

    return-void
.end method

.method static synthetic access$1800(Lcom/gogoair/ife/views/PlayerActivity;)I
    .locals 1

    .prologue
    .line 66
    iget v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->savedPosition:I

    return v0
.end method

.method static synthetic access$1802(Lcom/gogoair/ife/views/PlayerActivity;I)I
    .locals 0

    .prologue
    .line 66
    iput p1, p0, Lcom/gogoair/ife/views/PlayerActivity;->savedPosition:I

    return p1
.end method

.method static synthetic access$1900(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->startPlaybackObserver()V

    return-void
.end method

.method static synthetic access$200(Lcom/gogoair/ife/views/PlayerActivity;)J
    .locals 2

    .prologue
    .line 66
    iget-wide v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->createTimestamp:J

    return-wide v0
.end method

.method static synthetic access$2000(Lcom/gogoair/ife/views/PlayerActivity;)J
    .locals 2

    .prologue
    .line 66
    iget-wide v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->timeToFirstFrame:J

    return-wide v0
.end method

.method static synthetic access$2002(Lcom/gogoair/ife/views/PlayerActivity;J)J
    .locals 1

    .prologue
    .line 66
    iput-wide p1, p0, Lcom/gogoair/ife/views/PlayerActivity;->timeToFirstFrame:J

    return-wide p1
.end method

.method static synthetic access$2100(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->stopPlaybackObserver()V

    return-void
.end method

.method static synthetic access$2200(Lcom/gogoair/ife/views/PlayerActivity;Lcom/gogoair/ife/utils/Constants$GVErrorCode;J)V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0, p1, p2, p3}, Lcom/gogoair/ife/views/PlayerActivity;->goToLandingPage(Lcom/gogoair/ife/utils/Constants$GVErrorCode;J)V

    return-void
.end method

.method static synthetic access$2300(Lcom/gogoair/ife/views/PlayerActivity;)Ljava/util/List;
    .locals 1

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getCaptionLanguageTitles()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2400(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->showActionBar()V

    return-void
.end method

.method static synthetic access$2500(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->hideActionBar()V

    return-void
.end method

.method static synthetic access$2600(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->licenseAcquisitionListener:Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->createPlayer()V

    return-void
.end method

.method static synthetic access$2800(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->prepareMedia()V

    return-void
.end method

.method static synthetic access$2900(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/ave/drm/DRMManager;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->drmManager:Lcom/adobe/ave/drm/DRMManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    return-object v0
.end method

.method static synthetic access$3000(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/utils/ClosedCaptionMediaController;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaController:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    return-object v0
.end method

.method static synthetic access$3100(Lcom/gogoair/ife/views/PlayerActivity;)Landroid/widget/FrameLayout;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->playerFrame:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$3200(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/storage/MediaDb;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->db:Lcom/gogoair/ife/storage/MediaDb;

    return-object v0
.end method

.method static synthetic access$400(Lcom/gogoair/ife/views/PlayerActivity;)Ljava/lang/Runnable;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->seekProgressDialogRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$500(Lcom/gogoair/ife/views/PlayerActivity;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->seekProgressDialogHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$600(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->cancelProgressDialog()V

    return-void
.end method

.method static synthetic access$700(Lcom/gogoair/ife/views/PlayerActivity;)J
    .locals 2

    .prologue
    .line 66
    iget-wide v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->movieWidth:J

    return-wide v0
.end method

.method static synthetic access$702(Lcom/gogoair/ife/views/PlayerActivity;J)J
    .locals 1

    .prologue
    .line 66
    iput-wide p1, p0, Lcom/gogoair/ife/views/PlayerActivity;->movieWidth:J

    return-wide p1
.end method

.method static synthetic access$800(Lcom/gogoair/ife/views/PlayerActivity;)J
    .locals 2

    .prologue
    .line 66
    iget-wide v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->movieHeight:J

    return-wide v0
.end method

.method static synthetic access$802(Lcom/gogoair/ife/views/PlayerActivity;J)J
    .locals 1

    .prologue
    .line 66
    iput-wide p1, p0, Lcom/gogoair/ife/views/PlayerActivity;->movieHeight:J

    return-wide p1
.end method

.method static synthetic access$900(Lcom/gogoair/ife/views/PlayerActivity;JJ)V
    .locals 1

    .prologue
    .line 66
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/gogoair/ife/views/PlayerActivity;->setPlayerViewSize(JJ)V

    return-void
.end method

.method private attemptIndiv()V
    .locals 3

    .prologue
    .line 441
    const-string v0, "http://cs.video.gogoinflight.com/media/static/players/ReferencePlayer/onprem.metadata"

    .line 443
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lcom/gogoair/ife/drm/DRMHelper;->setUseCloudDRM(Ljava/lang/Boolean;)V

    .line 444
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 445
    invoke-static {v0}, Lcom/adobe/ave/drm/DRMManager;->getSharedManager(Landroid/content/Context;)Lcom/adobe/ave/drm/DRMManager;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->drmManager:Lcom/adobe/ave/drm/DRMManager;

    .line 447
    const-string v0, ""

    .line 448
    const-string v0, ""

    .line 449
    const-string v0, ""

    .line 451
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->drmManager:Lcom/adobe/ave/drm/DRMManager;

    const-string v1, "http://cs.video.gogoinflight.com/media/static/players/ReferencePlayer/onprem.metadata"

    new-instance v2, Lcom/gogoair/ife/views/PlayerActivity$7;

    invoke-direct {v2, p0}, Lcom/gogoair/ife/views/PlayerActivity$7;-><init>(Lcom/gogoair/ife/views/PlayerActivity;)V

    invoke-static {v0, v1, v2}, Lcom/gogoair/ife/drm/DRMHelper;->loadDRMMetadata(Lcom/adobe/ave/drm/DRMManager;Ljava/lang/String;Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;)V

    .line 523
    return-void
.end method

.method private cancelProgressDialog()V
    .locals 1

    .prologue
    .line 536
    :try_start_0
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->cancel()V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 540
    :goto_0
    return-void

    .line 537
    :catch_0
    move-exception v0

    .line 538
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    goto :goto_0
.end method

.method private createPlayer()V
    .locals 3

    .prologue
    .line 569
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "Creating media player."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 570
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/mediacore/DefaultMediaPlayer;->create(Landroid/content/Context;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    .line 571
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$Event;->PLAYBACK:Lcom/adobe/mediacore/MediaPlayer$Event;

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity;->playbackEventListener:Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/MediaPlayer;->addEventListener(Lcom/adobe/mediacore/MediaPlayer$Event;Lcom/adobe/mediacore/MediaPlayer$EventListener;)V

    .line 572
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$Event;->QOS:Lcom/adobe/mediacore/MediaPlayer$Event;

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity;->qosEventListener:Lcom/adobe/mediacore/MediaPlayer$QOSEventListener;

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/MediaPlayer;->addEventListener(Lcom/adobe/mediacore/MediaPlayer$Event;Lcom/adobe/mediacore/MediaPlayer$EventListener;)V

    .line 573
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$Event;->DRM:Lcom/adobe/mediacore/MediaPlayer$Event;

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity;->drmEventListener:Lcom/adobe/mediacore/MediaPlayer$DRMEventListener;

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/MediaPlayer;->addEventListener(Lcom/adobe/mediacore/MediaPlayer$Event;Lcom/adobe/mediacore/MediaPlayer$EventListener;)V

    .line 575
    const v0, 0x7f0b005b

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/PlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->playerFrame:Landroid/widget/FrameLayout;

    .line 576
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->playerFrame:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getView()Lcom/adobe/mediacore/MediaPlayerView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 577
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->playerFrame:Landroid/widget/FrameLayout;

    new-instance v1, Lcom/gogoair/ife/views/PlayerActivity$8;

    invoke-direct {v1, p0}, Lcom/gogoair/ife/views/PlayerActivity$8;-><init>(Lcom/gogoair/ife/views/PlayerActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 590
    return-void
.end method

.method private destroyPlayer()V
    .locals 3

    .prologue
    .line 559
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    if-eqz v0, :cond_0

    .line 560
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$Event;->PLAYBACK:Lcom/adobe/mediacore/MediaPlayer$Event;

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity;->playbackEventListener:Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/MediaPlayer;->removeEventListener(Lcom/adobe/mediacore/MediaPlayer$Event;Lcom/adobe/mediacore/MediaPlayer$EventListener;)V

    .line 561
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->playerFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 563
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->release()V

    .line 564
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    .line 566
    :cond_0
    return-void
.end method

.method private getAccountingGradeDuration()J
    .locals 4

    .prologue
    .line 544
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-virtual {v0}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getPlayDuration()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-virtual {v0}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getDurationUrl()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 546
    :try_start_0
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "mm:ss"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 547
    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-virtual {v1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getPlayDuration()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 548
    new-instance v1, Ljava/util/GregorianCalendar;

    invoke-direct {v1}, Ljava/util/GregorianCalendar;-><init>()V

    .line 549
    invoke-virtual {v1}, Ljava/util/Calendar;->clear()V

    .line 550
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v0

    sub-long v0, v2, v0

    .line 555
    :goto_0
    return-wide v0

    .line 551
    :catch_0
    move-exception v0

    .line 552
    invoke-virtual {v0}, Ljava/text/ParseException;->printStackTrace()V

    .line 555
    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method private getCaptionLanguageTitles()Ljava/util/List;
    .locals 3

    .prologue
    .line 932
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 933
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->closedCaptionTracks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/info/ClosedCaptionsTrack;

    .line 934
    invoke-virtual {v0}, Lcom/adobe/mediacore/info/ClosedCaptionsTrack;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 936
    :cond_0
    return-object v1
.end method

.method private goToLandingPage(Lcom/gogoair/ife/utils/Constants$GVErrorCode;J)V
    .locals 4
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 375
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/gogoair/ife/views/LandingActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 376
    const-string v1, "LANDING_STATE_INTENT_EXTRA"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 377
    const-string v1, "INTENT_EXTRA_GV_LIBRARY_ENTRY"

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 378
    const-wide/16 v2, 0x0

    cmp-long v1, p2, v2

    if-eqz v1, :cond_0

    .line 379
    const-string v1, "LANDING_ADOBE_CODE_INTENT_EXTRA"

    long-to-int v2, p2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 382
    :cond_0
    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/PlayerActivity;->startActivity(Landroid/content/Intent;)V

    .line 383
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->finish()V

    .line 384
    return-void
.end method

.method private hideActionBar()V
    .locals 2

    .prologue
    .line 900
    iget v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->actionBarVisibility:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->actionBarVisibility:I

    .line 902
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->moviePlayerLayout:Landroid/view/View;

    iget v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->actionBarVisibility:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 903
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 904
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->hide()V

    .line 905
    :cond_0
    return-void
.end method

.method private initializeMediaController()V
    .locals 2

    .prologue
    .line 287
    new-instance v0, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    invoke-direct {v0, p0}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaController:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    .line 288
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaController:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->playerFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->setAnchorView(Landroid/view/View;)V

    .line 289
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaController:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    invoke-virtual {v0, p0}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->setMediaPlayer(Landroid/widget/MediaController$MediaPlayerControl;)V

    .line 290
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaController:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->setEnabled(Z)V

    .line 291
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaController:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    const/16 v1, 0x1388

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->show(I)V

    .line 293
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->closedCaptionTracks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 294
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaController:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    invoke-virtual {v0}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->showClosedCaptionButton()V

    .line 297
    :cond_0
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaController:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    new-instance v1, Lcom/gogoair/ife/views/PlayerActivity$4;

    invoke-direct {v1, p0}, Lcom/gogoair/ife/views/PlayerActivity$4;-><init>(Lcom/gogoair/ife/views/PlayerActivity;)V

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->setClosedCaptionMediaControllerListener(Lcom/gogoair/ife/utils/ClosedCaptionMediaController$ClosedCaptionMediaControllerListener;)V

    .line 341
    return-void
.end method

.method private isPlayerValid()Z
    .locals 2

    .prologue
    .line 916
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->playerPrepared:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getStatus()Lcom/adobe/mediacore/MediaPlayer$PlayerState;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$PlayerState;->ERROR:Lcom/adobe/mediacore/MediaPlayer$PlayerState;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private loadClosedCaptioningTracks(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/util/List;
    .locals 4
    .param p1    # Lcom/adobe/mediacore/MediaPlayerItem;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 920
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 921
    if-eqz p1, :cond_1

    .line 922
    invoke-interface {p1}, Lcom/adobe/mediacore/MediaPlayerItem;->getClosedCaptionsTracks()Ljava/util/List;

    move-result-object v0

    .line 923
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/info/ClosedCaptionsTrack;

    .line 924
    invoke-virtual {v0}, Lcom/adobe/mediacore/info/ClosedCaptionsTrack;->isActive()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 925
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 928
    :cond_1
    return-object v1
.end method

.method private prepareMedia()V
    .locals 4

    .prologue
    .line 593
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Preparing media player item: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-virtual {v3}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getMediaFileUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 594
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-virtual {v0}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getMediaFileUrl()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/adobe/mediacore/MediaResource;->createFromUrl(Ljava/lang/String;Lcom/adobe/mediacore/metadata/Metadata;)Lcom/adobe/mediacore/MediaResource;

    move-result-object v0

    .line 595
    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1, v0}, Lcom/adobe/mediacore/MediaPlayer;->replaceCurrentItem(Lcom/adobe/mediacore/MediaResource;)V

    .line 596
    return-void
.end method

.method private setPlayerViewSize(JJ)V
    .locals 9

    .prologue
    const-wide/16 v6, 0x0

    .line 599
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 600
    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->playerFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v1

    iput v1, v0, Landroid/graphics/Point;->y:I

    .line 601
    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->playerFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v1

    iput v1, v0, Landroid/graphics/Point;->x:I

    .line 603
    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getView()Lcom/adobe/mediacore/MediaPlayerView;

    move-result-object v1

    if-nez v1, :cond_1

    .line 619
    :cond_0
    :goto_0
    return-void

    .line 607
    :cond_1
    iget v1, v0, Landroid/graphics/Point;->x:I

    int-to-long v2, v1

    .line 608
    iget v0, v0, Landroid/graphics/Point;->y:I

    int-to-long v0, v0

    .line 610
    cmp-long v4, p1, v6

    if-lez v4, :cond_2

    cmp-long v4, p3, v6

    if-lez v4, :cond_2

    .line 611
    mul-long v4, p1, v0

    mul-long v6, v2, p3

    cmp-long v4, v4, v6

    if-lez v4, :cond_3

    .line 612
    mul-long v0, v2, p3

    div-long/2addr v0, p1

    .line 618
    :cond_2
    :goto_1
    iget-object v4, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v4}, Lcom/adobe/mediacore/MediaPlayer;->getView()Lcom/adobe/mediacore/MediaPlayerView;

    move-result-object v4

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    long-to-int v2, v2

    long-to-int v0, v0

    const/16 v1, 0x11

    invoke-direct {v5, v2, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v4, v5}, Lcom/adobe/mediacore/MediaPlayerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    .line 613
    :cond_3
    mul-long v4, p1, v0

    mul-long v6, v2, p3

    cmp-long v4, v4, v6

    if-gez v4, :cond_2

    .line 614
    mul-long v2, v0, p1

    div-long/2addr v2, p3

    goto :goto_1
.end method

.method private showActionBar()V
    .locals 2

    .prologue
    .line 908
    iget v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->actionBarVisibility:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->actionBarVisibility:I

    .line 910
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->moviePlayerLayout:Landroid/view/View;

    iget v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->actionBarVisibility:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 911
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 912
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->show()V

    .line 913
    :cond_0
    return-void
.end method

.method private showProgressDialog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 526
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->progressDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 527
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 528
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 529
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 530
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 531
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 532
    return-void
.end method

.method private startPlaybackObserver()V
    .locals 4

    .prologue
    .line 834
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->playbackObserverHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->playbackObserverRunnable:Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 835
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->playbackObserverHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->playbackObserverRunnable:Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 836
    return-void
.end method

.method private stopPlaybackObserver()V
    .locals 2

    .prologue
    .line 839
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->playbackObserverHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->playbackObserverRunnable:Lcom/gogoair/ife/views/PlayerActivity$PlaybackObserverRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 840
    return-void
.end method


# virtual methods
.method public canPause()Z
    .locals 1

    .prologue
    .line 815
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->isPlayerValid()Z

    move-result v0

    return v0
.end method

.method public canSeekBackward()Z
    .locals 1

    .prologue
    .line 820
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->isPlayerValid()Z

    move-result v0

    return v0
.end method

.method public canSeekForward()Z
    .locals 1

    .prologue
    .line 825
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->isPlayerValid()Z

    move-result v0

    return v0
.end method

.method public getAudioSessionId()I
    .locals 1

    .prologue
    .line 830
    const/4 v0, 0x0

    return v0
.end method

.method public getBufferPercentage()I
    .locals 1

    .prologue
    .line 810
    const/4 v0, 0x0

    return v0
.end method

.method public getCurrentPosition()I
    .locals 2

    .prologue
    .line 787
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->isPlayerValid()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 788
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentTime()J

    move-result-wide v0

    long-to-int v0, v0

    .line 790
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDuration()I
    .locals 2

    .prologue
    .line 779
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->isPlayerValid()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 780
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getPlaybackRange()Lcom/adobe/mediacore/utils/TimeRange;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/utils/TimeRange;->getEnd()J

    move-result-wide v0

    long-to-int v0, v0

    .line 782
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPlaying()Z
    .locals 2

    .prologue
    .line 805
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->isPlayerValid()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getRate()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 681
    invoke-static {p0}, Landroid/support/v4/app/NavUtils;->navigateUpFromSameTask(Landroid/app/Activity;)V

    .line 682
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    .prologue
    .line 752
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 753
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->playerFrame:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    .line 754
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->playerFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/gogoair/ife/views/PlayerActivity$10;

    invoke-direct {v1, p0}, Lcom/gogoair/ife/views/PlayerActivity$10;-><init>(Lcom/gogoair/ife/views/PlayerActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 762
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 623
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 625
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AVE Version:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/adobe/mediacore/Version;->getAVEVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " PSDK version:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/adobe/mediacore/Version;->getVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 627
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getAdobeLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/logging/Logger$Verbosity;->ERROR:Lcom/adobe/mediacore/logging/Logger$Verbosity;

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/utils/GVLogger;->setVerbosityLevel(Lcom/adobe/mediacore/logging/Logger$Verbosity;)V

    .line 631
    new-instance v0, Lcom/gogoair/ife/views/PlayerActivity$9;

    invoke-direct {v0, p0}, Lcom/gogoair/ife/views/PlayerActivity$9;-><init>(Lcom/gogoair/ife/views/PlayerActivity;)V

    invoke-static {v0}, Lcom/adobe/mediacore/logging/Log;->setLogFactory(Lcom/adobe/mediacore/logging/LogFactory;)V

    .line 638
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/ave/drm/DRMManager;->getSharedManager(Landroid/content/Context;)Lcom/adobe/ave/drm/DRMManager;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->drmManager:Lcom/adobe/ave/drm/DRMManager;

    .line 639
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->drmManager:Lcom/adobe/ave/drm/DRMManager;

    const-wide/16 v2, 0xf

    invoke-virtual {v0, v2, v3}, Lcom/adobe/ave/drm/DRMManager;->setMaxOperationTime(J)V

    .line 640
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->attemptIndiv()V

    .line 642
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->createTimestamp:J

    .line 643
    const v0, 0x7f03001b

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/PlayerActivity;->setContentView(I)V

    .line 645
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->progressDialog:Landroid/app/ProgressDialog;

    .line 648
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "INTENT_EXTRA_GV_LIBRARY_ENTRY"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    .line 649
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    if-eqz v0, :cond_0

    .line 651
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 652
    const-string v1, "mediaId"

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-virtual {v2}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getLogicalMediaId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 653
    const-string v1, "cacheId"

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-virtual {v2}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getCacheId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 654
    invoke-static {v0}, Lcom/crittercism/app/Crittercism;->setMetadata(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 659
    :cond_0
    :goto_0
    new-instance v0, Lcom/gogoair/ife/storage/MediaDb;

    invoke-direct {v0, p0}, Lcom/gogoair/ife/storage/MediaDb;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->db:Lcom/gogoair/ife/storage/MediaDb;

    .line 661
    const v0, 0x7f05001c

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/PlayerActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f05001b

    invoke-virtual {p0, v1}, Lcom/gogoair/ife/views/PlayerActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/gogoair/ife/views/PlayerActivity;->showProgressDialog(Ljava/lang/String;Ljava/lang/String;)V

    .line 663
    const v0, 0x7f0b0063

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/PlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    .line 664
    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/PlayerActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 665
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 666
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 667
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 668
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->hide()V

    .line 671
    :cond_1
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/PlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->moviePlayerLayout:Landroid/view/View;

    .line 672
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->moviePlayerLayout:Landroid/view/View;

    iget v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->actionBarVisibility:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 675
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 676
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "com.gogoair.ife.playedContent"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 677
    return-void

    .line 655
    :catch_0
    move-exception v0

    .line 656
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    .prologue
    .line 727
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f0c0000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 728
    const/4 v0, 0x1

    return v0
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 717
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onDestroy()V

    .line 718
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->db:Lcom/gogoair/ife/storage/MediaDb;

    invoke-virtual {v0}, Lcom/gogoair/ife/storage/MediaDb;->close()V

    .line 719
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player#onDestroy"

    const-string v2, "Destroying fragment."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 720
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->destroyPlayer()V

    .line 721
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->cancelProgressDialog()V

    .line 722
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4

    .prologue
    .line 734
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 746
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 737
    :pswitch_0
    :try_start_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f05001c

    .line 738
    invoke-virtual {p0, v1}, Lcom/gogoair/ife/views/PlayerActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 739
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 740
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 744
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    .line 741
    :catch_0
    move-exception v0

    .line 742
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 734
    nop

    :pswitch_data_0
    .packed-switch 0x7f0b0071
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 6

    .prologue
    .line 693
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onPause()V

    .line 694
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "onPause"

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 695
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->pause()V

    .line 696
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-virtual {v0}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getLogicalMediaId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    if-eqz v0, :cond_0

    .line 697
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getPlaybackRange()Lcom/adobe/mediacore/utils/TimeRange;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/utils/TimeRange;->getEnd()J

    move-result-wide v0

    .line 698
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    .line 699
    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v2}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentTime()J

    move-result-wide v2

    const-wide/16 v4, 0x64

    mul-long/2addr v2, v4

    div-long v0, v2, v0

    const-wide/16 v2, 0x62

    cmp-long v0, v0, v2

    if-lez v0, :cond_2

    .line 700
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "Completed watching content. Resetting position back to 0"

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 701
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->setPlaybackElapsed(I)V

    .line 706
    :goto_0
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->db:Lcom/gogoair/ife/storage/MediaDb;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/storage/MediaDb;->updateLibraryEntry(Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;)V

    .line 710
    :cond_0
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaController:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    if-eqz v0, :cond_1

    .line 711
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaController:Lcom/gogoair/ife/utils/ClosedCaptionMediaController;

    invoke-virtual {v0}, Lcom/gogoair/ife/utils/ClosedCaptionMediaController;->hide()V

    .line 712
    :cond_1
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->stopPlaybackObserver()V

    .line 713
    return-void

    .line 703
    :cond_2
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Saving moving position with value "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v3}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentTime()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 704
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentTime()J

    move-result-wide v2

    long-to-int v1, v2

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->setPlaybackElapsed(I)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 686
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onResume()V

    .line 687
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "onResume"

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 688
    invoke-virtual {p0}, Lcom/gogoair/ife/views/PlayerActivity;->start()V

    .line 689
    return-void
.end method

.method public pause()V
    .locals 1

    .prologue
    .line 773
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->isPlayerValid()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 774
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->pause()V

    .line 775
    :cond_0
    return-void
.end method

.method public seekTo(I)V
    .locals 4

    .prologue
    .line 795
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->isPlayerValid()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 796
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    int-to-long v2, p1

    invoke-interface {v0, v2, v3}, Lcom/adobe/mediacore/MediaPlayer;->seek(J)V

    .line 797
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-virtual {v0, p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->setPlaybackElapsed(I)V

    .line 798
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->db:Lcom/gogoair/ife/storage/MediaDb;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/storage/MediaDb;->updateLibraryEntry(Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;)V

    .line 801
    :cond_0
    return-void
.end method

.method public start()V
    .locals 1

    .prologue
    .line 766
    invoke-direct {p0}, Lcom/gogoair/ife/views/PlayerActivity;->isPlayerValid()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 767
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->play()V

    .line 769
    :cond_0
    return-void
.end method
