.class public Lcom/gogoair/ife/views/MainActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gogoair/ife/views/MainActivity$ViewState;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MainActivity"


# instance fields
.field private db:Lcom/gogoair/ife/storage/MediaDb;

.field private final mainActivityBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private viewState:Lcom/gogoair/ife/views/MainActivity$ViewState;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 51
    sget-object v0, Lcom/gogoair/ife/views/MainActivity$ViewState;->GROUND:Lcom/gogoair/ife/views/MainActivity$ViewState;

    iput-object v0, p0, Lcom/gogoair/ife/views/MainActivity;->viewState:Lcom/gogoair/ife/views/MainActivity$ViewState;

    .line 53
    new-instance v0, Lcom/gogoair/ife/views/MainActivity$1;

    invoke-direct {v0, p0}, Lcom/gogoair/ife/views/MainActivity$1;-><init>(Lcom/gogoair/ife/views/MainActivity;)V

    iput-object v0, p0, Lcom/gogoair/ife/views/MainActivity;->mainActivityBroadcastReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/gogoair/ife/views/MainActivity;)Lcom/gogoair/ife/views/MainActivity$ViewState;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/gogoair/ife/views/MainActivity;->viewState:Lcom/gogoair/ife/views/MainActivity$ViewState;

    return-object v0
.end method

.method static synthetic access$100(Lcom/gogoair/ife/views/MainActivity;Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Lcom/gogoair/ife/views/MainActivity;->handleNetworkType(Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$200(Lcom/gogoair/ife/views/MainActivity;Landroid/content/Context;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Lcom/gogoair/ife/views/MainActivity;->showErrorScreen(Landroid/content/Context;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V

    return-void
.end method

.method private handleNetworkChangeToInAir()V
    .locals 3

    .prologue
    .line 235
    iget-object v0, p0, Lcom/gogoair/ife/views/MainActivity;->db:Lcom/gogoair/ife/storage/MediaDb;

    invoke-virtual {v0}, Lcom/gogoair/ife/storage/MediaDb;->getV2Library()Landroid/database/Cursor;

    move-result-object v1

    .line 236
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/gogoair/ife/views/MainActivity$ViewState;->AIR_NO_TITLES:Lcom/gogoair/ife/views/MainActivity$ViewState;

    :goto_0
    iput-object v0, p0, Lcom/gogoair/ife/views/MainActivity;->viewState:Lcom/gogoair/ife/views/MainActivity$ViewState;

    .line 237
    iget-object v0, p0, Lcom/gogoair/ife/views/MainActivity;->viewState:Lcom/gogoair/ife/views/MainActivity$ViewState;

    sget-object v2, Lcom/gogoair/ife/views/MainActivity$ViewState;->AIR_NO_TITLES:Lcom/gogoair/ife/views/MainActivity$ViewState;

    if-ne v0, v2, :cond_2

    .line 238
    invoke-direct {p0}, Lcom/gogoair/ife/views/MainActivity;->showInAirMessageView()V

    .line 243
    :cond_0
    :goto_1
    return-void

    .line 236
    :cond_1
    sget-object v0, Lcom/gogoair/ife/views/MainActivity$ViewState;->AIR_SHOWING_TITLES:Lcom/gogoair/ife/views/MainActivity$ViewState;

    goto :goto_0

    .line 240
    :cond_2
    iget-object v0, p0, Lcom/gogoair/ife/views/MainActivity;->viewState:Lcom/gogoair/ife/views/MainActivity$ViewState;

    sget-object v2, Lcom/gogoair/ife/views/MainActivity$ViewState;->AIR_SHOWING_TITLES:Lcom/gogoair/ife/views/MainActivity$ViewState;

    if-ne v0, v2, :cond_0

    .line 241
    invoke-direct {p0, v1}, Lcom/gogoair/ife/views/MainActivity;->showMyLibraryView(Landroid/database/Cursor;)V

    goto :goto_1
.end method

.method private handleNetworkType(Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 74
    sget-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->in_air:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    if-ne p1, v0, :cond_1

    .line 75
    invoke-direct {p0}, Lcom/gogoair/ife/views/MainActivity;->handleNetworkChangeToInAir()V

    .line 79
    :cond_0
    :goto_0
    return-void

    .line 76
    :cond_1
    sget-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->off:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    if-ne p1, v0, :cond_0

    .line 77
    sget-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NOWIFI:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    invoke-direct {p0, p0, v0}, Lcom/gogoair/ife/views/MainActivity;->showErrorScreen(Landroid/content/Context;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V

    goto :goto_0
.end method

.method private showErrorScreen(Landroid/content/Context;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V
    .locals 2

    .prologue
    .line 246
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/gogoair/ife/views/LandingActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 247
    const-string v1, "LANDING_STATE_INTENT_EXTRA"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 248
    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 249
    invoke-virtual {p0}, Lcom/gogoair/ife/views/MainActivity;->finish()V

    .line 250
    return-void
.end method

.method private showInAirMessageView()V
    .locals 7

    .prologue
    const/16 v5, 0x8

    const/4 v6, 0x0

    .line 171
    const v0, 0x7f0b0059

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 172
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 173
    const v0, 0x7f0b0058

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 175
    const v0, 0x7f0b0052

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 176
    const v1, 0x7f0b0053

    invoke-virtual {p0, v1}, Lcom/gogoair/ife/views/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 177
    const v2, 0x7f0b0056

    invoke-virtual {p0, v2}, Lcom/gogoair/ife/views/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 179
    invoke-static {}, Lcom/gogoair/ife/utils/GVNetworkManager;->getCurrentNetwork()Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    move-result-object v3

    .line 180
    sget-object v4, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->in_air:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    if-ne v3, v4, :cond_1

    .line 181
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 182
    const-string v4, "com.gogoair.ife.firstTimeInAir"

    const/4 v5, 0x1

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 183
    const v3, 0x7f05002a

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    .line 184
    const v0, 0x7f05001e

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 185
    invoke-virtual {v2, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 194
    :goto_0
    return-void

    .line 187
    :cond_0
    sget-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NONE:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    invoke-direct {p0, p0, v0}, Lcom/gogoair/ife/views/MainActivity;->showErrorScreen(Landroid/content/Context;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V

    goto :goto_0

    .line 190
    :cond_1
    const v3, 0x7f05002b

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    .line 191
    const v0, 0x7f05001f

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 192
    invoke-virtual {v2, v5}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0
.end method

.method private showMyLibraryView(Landroid/database/Cursor;)V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 197
    const v0, 0x7f0b0058

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    .line 199
    const v1, 0x7f0b0059

    invoke-virtual {p0, v1}, Lcom/gogoair/ife/views/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 200
    const v1, 0x7f0b0057

    invoke-virtual {p0, v1}, Lcom/gogoair/ife/views/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 202
    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setVisibility(I)V

    .line 204
    new-instance v1, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;

    invoke-direct {v1, p0, p1}, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;)V

    .line 205
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 206
    new-instance v1, Lcom/gogoair/ife/views/MainActivity$3;

    invoke-direct {v1, p0, p1}, Lcom/gogoair/ife/views/MainActivity$3;-><init>(Lcom/gogoair/ife/views/MainActivity;Landroid/database/Cursor;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 231
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/MainActivity;->setRequestedOrientation(I)V

    .line 232
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .prologue
    .line 83
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 84
    const v0, 0x7f03001a

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/MainActivity;->setContentView(I)V

    .line 86
    const v0, 0x7f0b0057

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    .line 87
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 88
    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/MainActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 89
    invoke-virtual {p0}, Lcom/gogoair/ife/views/MainActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 90
    invoke-virtual {p0}, Lcom/gogoair/ife/views/MainActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 93
    :cond_0
    new-instance v0, Lcom/gogoair/ife/storage/MediaDb;

    invoke-direct {v0, p0}, Lcom/gogoair/ife/storage/MediaDb;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/gogoair/ife/views/MainActivity;->db:Lcom/gogoair/ife/storage/MediaDb;

    .line 94
    const v0, 0x7f0b0056

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 95
    new-instance v1, Lcom/gogoair/ife/views/MainActivity$2;

    invoke-direct {v1, p0}, Lcom/gogoair/ife/views/MainActivity$2;-><init>(Lcom/gogoair/ife/views/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    .prologue
    .line 140
    invoke-virtual {p0}, Lcom/gogoair/ife/views/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 141
    const/high16 v1, 0x7f0c0000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 142
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 106
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onDestroy()V

    .line 107
    iget-object v0, p0, Lcom/gogoair/ife/views/MainActivity;->db:Lcom/gogoair/ife/storage/MediaDb;

    invoke-virtual {v0}, Lcom/gogoair/ife/storage/MediaDb;->close()V

    .line 109
    invoke-virtual {p0}, Lcom/gogoair/ife/views/MainActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 111
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "com.gogoair.ife.firstTimeInAir"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 113
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4

    .prologue
    .line 148
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 160
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 151
    :pswitch_0
    :try_start_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f05001c

    .line 152
    invoke-virtual {p0, v1}, Lcom/gogoair/ife/views/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 153
    invoke-virtual {p0}, Lcom/gogoair/ife/views/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p0}, Lcom/gogoair/ife/views/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 154
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    .line 155
    :catch_0
    move-exception v0

    .line 156
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 148
    nop

    :pswitch_data_0
    .packed-switch 0x7f0b0071
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 166
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onPause()V

    .line 167
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/gogoair/ife/views/MainActivity;->mainActivityBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 168
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 117
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onResume()V

    .line 119
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 120
    const-string v1, "GV_CATALOG_DOWNLOAD_COMPLETE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 121
    const-string v1, "GV_MEDIA_ADDED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 122
    const-string v1, "GVNETWORK_ON_NETWORK_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 123
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    iget-object v2, p0, Lcom/gogoair/ife/views/MainActivity;->mainActivityBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 126
    invoke-static {}, Lcom/gogoair/ife/utils/GVNetworkManager;->getCurrentNetwork()Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    move-result-object v0

    .line 127
    sget-object v1, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->unknown:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    if-ne v0, v1, :cond_0

    .line 128
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "MainActivity"

    const-string v2, "We don\'t know what network we are on, search"

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    new-instance v0, Lcom/gogoair/ife/utils/GVNetworkManager;

    invoke-direct {v0}, Lcom/gogoair/ife/utils/GVNetworkManager;-><init>()V

    invoke-virtual {v0, p0}, Lcom/gogoair/ife/utils/GVNetworkManager;->findCurrentNetwork(Landroid/content/Context;)V

    .line 134
    :goto_0
    iget-object v0, p0, Lcom/gogoair/ife/views/MainActivity;->db:Lcom/gogoair/ife/storage/MediaDb;

    invoke-virtual {v0}, Lcom/gogoair/ife/storage/MediaDb;->removeV2ExpiredContents()V

    .line 135
    return-void

    .line 132
    :cond_0
    invoke-direct {p0, v0, p0}, Lcom/gogoair/ife/views/MainActivity;->handleNetworkType(Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;Landroid/content/Context;)V

    goto :goto_0
.end method
