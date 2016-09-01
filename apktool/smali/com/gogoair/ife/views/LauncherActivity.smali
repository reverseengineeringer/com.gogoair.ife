.class public Lcom/gogoair/ife/views/LauncherActivity;
.super Landroid/app/Activity;
.source "SourceFile"


# static fields
.field private static final APP_DATA_URL_PARAM:Ljava/lang/String; = "app-data"

.field private static final TAG:Ljava/lang/String; = "LauncherActivity"


# instance fields
.field private appDataJson:Ljava/lang/String;

.field private final launcherActivityBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private progressDialog:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 31
    new-instance v0, Lcom/gogoair/ife/views/LauncherActivity$1;

    invoke-direct {v0, p0}, Lcom/gogoair/ife/views/LauncherActivity$1;-><init>(Lcom/gogoair/ife/views/LauncherActivity;)V

    iput-object v0, p0, Lcom/gogoair/ife/views/LauncherActivity;->launcherActivityBroadcastReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/gogoair/ife/views/LauncherActivity;Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Lcom/gogoair/ife/views/LauncherActivity;->handleNetworkType(Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;Landroid/content/Context;)V

    return-void
.end method

.method private cancelProgressDialog()V
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/gogoair/ife/views/LauncherActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->cancel()V

    .line 90
    return-void
.end method

.method private goToLandingActivity(Landroid/content/Context;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/gogoair/ife/utils/Constants$GVErrorCode;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 115
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/gogoair/ife/views/LandingActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 116
    const-string v1, "LANDING_STATE_INTENT_EXTRA"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 117
    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/LauncherActivity;->startActivity(Landroid/content/Intent;)V

    .line 118
    invoke-virtual {p0}, Lcom/gogoair/ife/views/LauncherActivity;->finish()V

    .line 119
    return-void
.end method

.method private goToPlayMovieActivity(Landroid/content/Context;Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 123
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/gogoair/ife/views/PlayerActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 124
    const-string v1, "INTENT_EXTRA_GV_LIBRARY_ENTRY"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 127
    invoke-static {p0}, Landroid/app/TaskStackBuilder;->create(Landroid/content/Context;)Landroid/app/TaskStackBuilder;

    move-result-object v1

    .line 128
    invoke-virtual {v1, v0}, Landroid/app/TaskStackBuilder;->addNextIntentWithParentStack(Landroid/content/Intent;)Landroid/app/TaskStackBuilder;

    .line 129
    invoke-virtual {v1}, Landroid/app/TaskStackBuilder;->startActivities()V

    .line 131
    invoke-virtual {p0}, Lcom/gogoair/ife/views/LauncherActivity;->finish()V

    .line 132
    return-void
.end method

.method private handleInAirNetwork(Landroid/content/Context;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 135
    new-instance v2, Lcom/gogoair/ife/storage/MediaDb;

    invoke-direct {v2, p1}, Lcom/gogoair/ife/storage/MediaDb;-><init>(Landroid/content/Context;)V

    .line 136
    invoke-direct {p0}, Lcom/gogoair/ife/views/LauncherActivity;->cancelProgressDialog()V

    .line 139
    :try_start_0
    iget-object v0, p0, Lcom/gogoair/ife/views/LauncherActivity;->appDataJson:Ljava/lang/String;

    const-string v1, "UTF-8"

    invoke-static {v0, v1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 140
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 142
    new-instance v0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-direct {v0, v1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;-><init>(Lorg/json/JSONObject;)V

    .line 143
    invoke-virtual {v0}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getLogicalMediaId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/gogoair/ife/storage/MediaDb;->getVideoV2LibraryEntry(Ljava/lang/String;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v1

    .line 145
    if-nez v1, :cond_0

    .line 146
    invoke-virtual {v2, v0}, Lcom/gogoair/ife/storage/MediaDb;->addV2LibraryEntry(Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;)V

    .line 152
    :goto_0
    invoke-virtual {v0}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->hasExpired()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 153
    sget-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->EXPIRED:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    invoke-direct {p0, p1, v0}, Lcom/gogoair/ife/views/LauncherActivity;->goToLandingActivity(Landroid/content/Context;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 166
    :goto_1
    invoke-virtual {v2}, Lcom/gogoair/ife/storage/MediaDb;->close()V

    .line 168
    :goto_2
    return-void

    :cond_0
    move-object v0, v1

    .line 149
    goto :goto_0

    .line 156
    :cond_1
    :try_start_1
    invoke-direct {p0, p1, v0}, Lcom/gogoair/ife/views/LauncherActivity;->goToPlayMovieActivity(Landroid/content/Context;Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 158
    :catch_0
    move-exception v0

    .line 160
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 161
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/gogoair/ife/views/MainActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 162
    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/LauncherActivity;->startActivity(Landroid/content/Intent;)V

    .line 163
    invoke-virtual {p0}, Lcom/gogoair/ife/views/LauncherActivity;->finish()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 166
    invoke-virtual {v2}, Lcom/gogoair/ife/storage/MediaDb;->close()V

    goto :goto_2

    :catchall_0
    move-exception v0

    invoke-virtual {v2}, Lcom/gogoair/ife/storage/MediaDb;->close()V

    throw v0
.end method

.method private handleNetworkType(Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;Landroid/content/Context;)V
    .locals 2
    .param p2    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 100
    sget-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->in_air:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    if-ne p1, v0, :cond_0

    .line 101
    invoke-direct {p0, p2}, Lcom/gogoair/ife/views/LauncherActivity;->handleInAirNetwork(Landroid/content/Context;)V

    .line 112
    :goto_0
    return-void

    .line 102
    :cond_0
    sget-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->ground:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    if-ne p1, v0, :cond_1

    .line 103
    invoke-direct {p0}, Lcom/gogoair/ife/views/LauncherActivity;->cancelProgressDialog()V

    .line 104
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/gogoair/ife/views/MainActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 105
    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/LauncherActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 106
    :cond_1
    sget-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->off:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    if-ne p1, v0, :cond_2

    .line 107
    invoke-direct {p0}, Lcom/gogoair/ife/views/LauncherActivity;->cancelProgressDialog()V

    .line 108
    sget-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NOWIFI:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    invoke-direct {p0, p2, v0}, Lcom/gogoair/ife/views/LauncherActivity;->goToLandingActivity(Landroid/content/Context;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V

    goto :goto_0

    .line 110
    :cond_2
    const v0, 0x7f05001c

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/LauncherActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f05001a

    invoke-virtual {p0, v1}, Lcom/gogoair/ife/views/LauncherActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/gogoair/ife/views/LauncherActivity;->showProgressDialog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private parseUrlData()V
    .locals 2

    .prologue
    .line 94
    invoke-virtual {p0}, Lcom/gogoair/ife/views/LauncherActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 95
    invoke-virtual {p0}, Lcom/gogoair/ife/views/LauncherActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    const-string v1, "app-data"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/views/LauncherActivity;->appDataJson:Ljava/lang/String;

    .line 97
    :cond_0
    return-void
.end method

.method private showProgressDialog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 80
    iget-object v0, p0, Lcom/gogoair/ife/views/LauncherActivity;->progressDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 81
    iget-object v0, p0, Lcom/gogoair/ife/views/LauncherActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 82
    iget-object v0, p0, Lcom/gogoair/ife/views/LauncherActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 83
    iget-object v0, p0, Lcom/gogoair/ife/views/LauncherActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 84
    iget-object v0, p0, Lcom/gogoair/ife/views/LauncherActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 85
    iget-object v0, p0, Lcom/gogoair/ife/views/LauncherActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 86
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .prologue
    .line 48
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 50
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "LauncherActivity"

    const-string v2, "LAUNCHING PLAYER"

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 52
    const-string v1, "GVNETWORK_ON_NETWORK_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 53
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    iget-object v2, p0, Lcom/gogoair/ife/views/LauncherActivity;->launcherActivityBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 55
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gogoair/ife/views/LauncherActivity;->progressDialog:Landroid/app/ProgressDialog;

    .line 57
    new-instance v0, Lcom/gogoair/ife/storage/MediaDb;

    invoke-direct {v0, p0}, Lcom/gogoair/ife/storage/MediaDb;-><init>(Landroid/content/Context;)V

    .line 58
    invoke-virtual {v0}, Lcom/gogoair/ife/storage/MediaDb;->removeV2ExpiredContents()V

    .line 59
    invoke-virtual {v0}, Lcom/gogoair/ife/storage/MediaDb;->close()V

    .line 61
    invoke-direct {p0}, Lcom/gogoair/ife/views/LauncherActivity;->parseUrlData()V

    .line 62
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 66
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 67
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/gogoair/ife/views/LauncherActivity;->launcherActivityBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 68
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 72
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 73
    invoke-static {}, Lcom/gogoair/ife/utils/GVNetworkManager;->getCurrentNetwork()Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    move-result-object v0

    .line 74
    sget-object v1, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->unknown:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    if-ne v0, v1, :cond_0

    .line 75
    new-instance v1, Lcom/gogoair/ife/utils/GVNetworkManager;

    invoke-direct {v1}, Lcom/gogoair/ife/utils/GVNetworkManager;-><init>()V

    invoke-virtual {v1, p0}, Lcom/gogoair/ife/utils/GVNetworkManager;->findCurrentNetwork(Landroid/content/Context;)V

    .line 76
    :cond_0
    invoke-direct {p0, v0, p0}, Lcom/gogoair/ife/views/LauncherActivity;->handleNetworkType(Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;Landroid/content/Context;)V

    .line 77
    return-void
.end method
