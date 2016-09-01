.class public Lcom/gogoair/ife/views/LandingActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "SourceFile"


# static fields
.field public static final LANDING_ADOBE_CODE_INTENT_EXTRA:Ljava/lang/String; = "LANDING_ADOBE_CODE_INTENT_EXTRA"

.field public static final LANDING_STATE_INTENT_EXTRA:Ljava/lang/String; = "LANDING_STATE_INTENT_EXTRA"


# instance fields
.field private adobeErrorCode:I

.field private context:Landroid/content/Context;

.field private currentErrorCode:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

.field private final gvNetworkBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private landingActivity:Landroid/app/Activity;

.field private movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 43
    new-instance v0, Lcom/gogoair/ife/views/LandingActivity$1;

    invoke-direct {v0, p0}, Lcom/gogoair/ife/views/LandingActivity$1;-><init>(Lcom/gogoair/ife/views/LandingActivity;)V

    iput-object v0, p0, Lcom/gogoair/ife/views/LandingActivity;->gvNetworkBroadcastReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/gogoair/ife/views/LandingActivity;)Lcom/gogoair/ife/utils/Constants$GVErrorCode;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/gogoair/ife/views/LandingActivity;->currentErrorCode:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    return-object v0
.end method

.method static synthetic access$002(Lcom/gogoair/ife/views/LandingActivity;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)Lcom/gogoair/ife/utils/Constants$GVErrorCode;
    .locals 0

    .prologue
    .line 32
    iput-object p1, p0, Lcom/gogoair/ife/views/LandingActivity;->currentErrorCode:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    return-object p1
.end method

.method static synthetic access$100(Lcom/gogoair/ife/views/LandingActivity;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/gogoair/ife/views/LandingActivity;->setMessage(Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V

    return-void
.end method

.method static synthetic access$200(Lcom/gogoair/ife/views/LandingActivity;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/gogoair/ife/views/LandingActivity;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300(Lcom/gogoair/ife/views/LandingActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/gogoair/ife/views/LandingActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    return-object v0
.end method

.method static synthetic access$400(Lcom/gogoair/ife/views/LandingActivity;)Landroid/app/Activity;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/gogoair/ife/views/LandingActivity;->landingActivity:Landroid/app/Activity;

    return-object v0
.end method

.method private setMessage(Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V
    .locals 13

    .prologue
    const/16 v12, 0x8

    const/4 v11, 0x2

    const/4 v10, 0x1

    const v9, 0x7f050028

    const/4 v8, 0x0

    .line 140
    const v0, 0x7f0b0052

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/LandingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 141
    const v1, 0x7f0b0053

    invoke-virtual {p0, v1}, Lcom/gogoair/ife/views/LandingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 142
    const v2, 0x7f0b0054

    invoke-virtual {p0, v2}, Lcom/gogoair/ife/views/LandingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 143
    const v3, 0x7f0b0051

    invoke-virtual {p0, v3}, Lcom/gogoair/ife/views/LandingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 144
    const v4, 0x7f0b0055

    invoke-virtual {p0, v4}, Lcom/gogoair/ife/views/LandingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    .line 145
    const v5, 0x7f0b0056

    invoke-virtual {p0, v5}, Lcom/gogoair/ife/views/LandingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    .line 146
    invoke-virtual {p0}, Lcom/gogoair/ife/views/LandingActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "DINOffcPro-Bold.otf"

    invoke-static {v6, v7}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v6

    .line 147
    invoke-virtual {v4, v6}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 150
    new-instance v6, Lcom/gogoair/ife/views/LandingActivity$3;

    invoke-direct {v6, p0}, Lcom/gogoair/ife/views/LandingActivity$3;-><init>(Lcom/gogoair/ife/views/LandingActivity;)V

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    invoke-virtual {v4, v12}, Landroid/widget/Button;->setVisibility(I)V

    .line 161
    invoke-virtual {v5, v12}, Landroid/widget/Button;->setVisibility(I)V

    .line 163
    sget-object v6, Lcom/gogoair/ife/views/LandingActivity$4;->$SwitchMap$com$gogoair$ife$utils$Constants$GVErrorCode:[I

    invoke-virtual {p1}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 195
    invoke-virtual {v5, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 196
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 197
    const-string v3, "com.gogoair.ife.playedContent"

    invoke-interface {v2, v3, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 198
    if-eqz v2, :cond_0

    .line 199
    const v2, 0x7f05002d

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 200
    const v0, 0x7f050021

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 207
    :goto_0
    return-void

    .line 165
    :pswitch_0
    const v2, 0x7f050031

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 166
    const v0, 0x7f050025

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 167
    const v0, 0x7f050027

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 171
    :pswitch_1
    invoke-virtual {v4, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 172
    const v4, 0x7f05002e

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(I)V

    .line 173
    const v0, 0x7f050022

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 174
    const-string v0, "41%02d%04d"

    new-array v1, v11, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->getValue()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v8

    iget v4, p0, Lcom/gogoair/ife/views/LandingActivity;->adobeErrorCode:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v10

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 175
    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 178
    :pswitch_2
    invoke-virtual {v4, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 179
    const v4, 0x7f050030

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(I)V

    .line 180
    const v0, 0x7f050024

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 181
    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setText(I)V

    .line 182
    const-string v0, "41%02d%04d"

    new-array v1, v11, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->getValue()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v8

    iget v3, p0, Lcom/gogoair/ife/views/LandingActivity;->adobeErrorCode:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v10

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 185
    :pswitch_3
    const v2, 0x7f050029

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 186
    const v0, 0x7f05001d

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 187
    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setText(I)V

    goto/16 :goto_0

    .line 190
    :pswitch_4
    const v2, 0x7f05002f

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 191
    const v0, 0x7f050023

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 192
    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setText(I)V

    goto/16 :goto_0

    .line 202
    :cond_0
    const v2, 0x7f05002c

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 203
    const v0, 0x7f050020

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    goto/16 :goto_0

    .line 163
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method


# virtual methods
.method public onBackPressed()V
    .locals 0

    .prologue
    .line 117
    invoke-static {p0}, Landroid/support/v4/app/NavUtils;->navigateUpFromSameTask(Landroid/app/Activity;)V

    .line 118
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .prologue
    .line 64
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 65
    const v0, 0x7f030019

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/LandingActivity;->setContentView(I)V

    .line 67
    const v0, 0x7f0b0063

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/LandingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    .line 68
    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/LandingActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 69
    invoke-virtual {p0}, Lcom/gogoair/ife/views/LandingActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 70
    invoke-virtual {p0}, Lcom/gogoair/ife/views/LandingActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 71
    invoke-virtual {p0}, Lcom/gogoair/ife/views/LandingActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 73
    :cond_0
    iput-object p0, p0, Lcom/gogoair/ife/views/LandingActivity;->landingActivity:Landroid/app/Activity;

    .line 74
    invoke-virtual {p0}, Lcom/gogoair/ife/views/LandingActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/views/LandingActivity;->context:Landroid/content/Context;

    .line 75
    invoke-virtual {p0}, Lcom/gogoair/ife/views/LandingActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "LANDING_STATE_INTENT_EXTRA"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    iput-object v0, p0, Lcom/gogoair/ife/views/LandingActivity;->currentErrorCode:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    .line 76
    invoke-virtual {p0}, Lcom/gogoair/ife/views/LandingActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "INTENT_EXTRA_GV_LIBRARY_ENTRY"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    iput-object v0, p0, Lcom/gogoair/ife/views/LandingActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    .line 77
    invoke-virtual {p0}, Lcom/gogoair/ife/views/LandingActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "LANDING_ADOBE_CODE_INTENT_EXTRA"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 78
    invoke-virtual {p0}, Lcom/gogoair/ife/views/LandingActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "LANDING_ADOBE_CODE_INTENT_EXTRA"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/gogoair/ife/views/LandingActivity;->adobeErrorCode:I

    .line 80
    :cond_1
    const v0, 0x7f0b0056

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/views/LandingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 81
    new-instance v1, Lcom/gogoair/ife/views/LandingActivity$2;

    invoke-direct {v1, p0}, Lcom/gogoair/ife/views/LandingActivity$2;-><init>(Lcom/gogoair/ife/views/LandingActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    iget-object v0, p0, Lcom/gogoair/ife/views/LandingActivity;->currentErrorCode:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    invoke-direct {p0, v0}, Lcom/gogoair/ife/views/LandingActivity;->setMessage(Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V

    .line 90
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    .prologue
    .line 110
    invoke-virtual {p0}, Lcom/gogoair/ife/views/LandingActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 111
    const/high16 v1, 0x7f0c0000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 112
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4

    .prologue
    .line 123
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 135
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 126
    :pswitch_0
    :try_start_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f05001c

    .line 127
    invoke-virtual {p0, v1}, Lcom/gogoair/ife/views/LandingActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 128
    invoke-virtual {p0}, Lcom/gogoair/ife/views/LandingActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p0}, Lcom/gogoair/ife/views/LandingActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 129
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    .line 130
    :catch_0
    move-exception v0

    .line 131
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 123
    nop

    :pswitch_data_0
    .packed-switch 0x7f0b0071
        :pswitch_0
    .end packed-switch
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 102
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onPause()V

    .line 104
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/gogoair/ife/views/LandingActivity;->gvNetworkBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 105
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    .line 94
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onResume()V

    .line 96
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/gogoair/ife/views/LandingActivity;->gvNetworkBroadcastReceiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "GVNETWORK_ON_NETWORK_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 98
    return-void
.end method
