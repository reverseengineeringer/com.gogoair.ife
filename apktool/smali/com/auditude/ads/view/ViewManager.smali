.class public Lcom/auditude/ads/view/ViewManager;
.super Lcom/auditude/ads/util/event/EventDispatcher;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/util/event/IEventListener;
.implements Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;


# static fields
.field private static synthetic $SWITCH_TABLE$com$auditude$ads$view$AdPlaybackSession$PlaybackConstants:[I = null

.field private static synthetic $SWITCH_TABLE$com$auditude$ads$view$AdViewEvent$AdViewEventType:[I = null

.field public static final VIEW_MANAGER_EVENT:Ljava/lang/String; = "viewManagerEvent"


# instance fields
.field private adContainer:Landroid/view/ViewGroup;

.field private api:Lcom/auditude/ads/core/APIBridge;

.field private isInitialized:Z

.field private viewContainer:Landroid/widget/FrameLayout;

.field private viewController:Lcom/auditude/ads/view/ViewController;

.field private viewFactory:Lcom/auditude/ads/view/ViewFactory;


# direct methods
.method static synthetic $SWITCH_TABLE$com$auditude$ads$view$AdPlaybackSession$PlaybackConstants()[I
    .locals 3

    .prologue
    .line 38
    sget-object v0, Lcom/auditude/ads/view/ViewManager;->$SWITCH_TABLE$com$auditude$ads$view$AdPlaybackSession$PlaybackConstants:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->values()[Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->CLICK:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_9

    :goto_1
    :try_start_1
    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->COMPLETE:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_8

    :goto_2
    :try_start_2
    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ERROR:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_7

    :goto_3
    :try_start_3
    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->NOTIFY:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_6

    :goto_4
    :try_start_4
    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->PAUSE:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_5

    :goto_5
    :try_start_5
    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->PROGRESS:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_4

    :goto_6
    :try_start_6
    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->RESUME:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_3

    :goto_7
    :try_start_7
    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->SKIP:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_2

    :goto_8
    :try_start_8
    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->START:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_1

    :goto_9
    :try_start_9
    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->STOP:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_0

    :goto_a
    sput-object v0, Lcom/auditude/ads/view/ViewManager;->$SWITCH_TABLE$com$auditude$ads$view$AdPlaybackSession$PlaybackConstants:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_a

    :catch_1
    move-exception v1

    goto :goto_9

    :catch_2
    move-exception v1

    goto :goto_8

    :catch_3
    move-exception v1

    goto :goto_7

    :catch_4
    move-exception v1

    goto :goto_6

    :catch_5
    move-exception v1

    goto :goto_5

    :catch_6
    move-exception v1

    goto :goto_4

    :catch_7
    move-exception v1

    goto :goto_3

    :catch_8
    move-exception v1

    goto :goto_2

    :catch_9
    move-exception v1

    goto :goto_1
.end method

.method static synthetic $SWITCH_TABLE$com$auditude$ads$view$AdViewEvent$AdViewEventType()[I
    .locals 3

    .prologue
    .line 38
    sget-object v0, Lcom/auditude/ads/view/ViewManager;->$SWITCH_TABLE$com$auditude$ads$view$AdViewEvent$AdViewEventType:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->values()[Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_CLICK:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_d

    :goto_1
    :try_start_1
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_COMPLETE:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_c

    :goto_2
    :try_start_2
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_ERROR:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_b

    :goto_3
    :try_start_3
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_LOAD:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_a

    :goto_4
    :try_start_4
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_LOG:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_9

    :goto_5
    :try_start_5
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_PAUSE:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_8

    :goto_6
    :try_start_6
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_PROGRESS:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_7

    :goto_7
    :try_start_7
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_REPLAY:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_6

    :goto_8
    :try_start_8
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_RESUME:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_5

    :goto_9
    :try_start_9
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_SKIP:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_4

    :goto_a
    :try_start_a
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_START:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_3

    :goto_b
    :try_start_b
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_STOP:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_2

    :goto_c
    :try_start_c
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_USER_CLOSE:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_1

    :goto_d
    :try_start_d
    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_VOLUME_CHANGE:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_0

    :goto_e
    sput-object v0, Lcom/auditude/ads/view/ViewManager;->$SWITCH_TABLE$com$auditude$ads$view$AdViewEvent$AdViewEventType:[I

    goto/16 :goto_0

    :catch_0
    move-exception v1

    goto :goto_e

    :catch_1
    move-exception v1

    goto :goto_d

    :catch_2
    move-exception v1

    goto :goto_c

    :catch_3
    move-exception v1

    goto :goto_b

    :catch_4
    move-exception v1

    goto :goto_a

    :catch_5
    move-exception v1

    goto :goto_9

    :catch_6
    move-exception v1

    goto :goto_8

    :catch_7
    move-exception v1

    goto :goto_7

    :catch_8
    move-exception v1

    goto :goto_6

    :catch_9
    move-exception v1

    goto :goto_5

    :catch_a
    move-exception v1

    goto :goto_4

    :catch_b
    move-exception v1

    goto/16 :goto_3

    :catch_c
    move-exception v1

    goto/16 :goto_2

    :catch_d
    move-exception v1

    goto/16 :goto_1
.end method

.method public constructor <init>(Landroid/view/ViewGroup;Lcom/auditude/ads/core/APIBridge;Lcom/auditude/ads/core/AdSettings;)V
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/auditude/ads/util/event/EventDispatcher;-><init>()V

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/view/ViewManager;->isInitialized:Z

    .line 51
    iput-object p1, p0, Lcom/auditude/ads/view/ViewManager;->adContainer:Landroid/view/ViewGroup;

    .line 52
    iput-object p2, p0, Lcom/auditude/ads/view/ViewManager;->api:Lcom/auditude/ads/core/APIBridge;

    .line 54
    new-instance v0, Lcom/auditude/ads/view/ViewController;

    invoke-direct {v0, p2, p3}, Lcom/auditude/ads/view/ViewController;-><init>(Lcom/auditude/ads/core/APIBridge;Lcom/auditude/ads/core/AdSettings;)V

    iput-object v0, p0, Lcom/auditude/ads/view/ViewManager;->viewController:Lcom/auditude/ads/view/ViewController;

    .line 55
    invoke-direct {p0}, Lcom/auditude/ads/view/ViewManager;->addViewEventHandlers()V

    .line 56
    return-void
.end method

.method private addViewEventHandlers()V
    .locals 2

    .prologue
    .line 260
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->api:Lcom/auditude/ads/core/APIBridge;

    const-string v1, "adViewEvent"

    invoke-virtual {v0, v1, p0}, Lcom/auditude/ads/core/APIBridge;->addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 261
    return-void
.end method

.method private canShowAsset(Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;Lcom/auditude/ads/model/IAsset;)Z
    .locals 1

    .prologue
    .line 410
    new-instance v0, Lcom/auditude/ads/view/ViewManagerEvent;

    invoke-direct {v0, p0, p1, p2}, Lcom/auditude/ads/view/ViewManagerEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;Lcom/auditude/ads/model/IAsset;)V

    invoke-direct {p0, v0}, Lcom/auditude/ads/view/ViewManager;->dispatchViewManagerEvent(Lcom/auditude/ads/view/ViewManagerEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private checkCompanionRequired([Lcom/auditude/ads/model/IOnPageAsset;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 8

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 140
    const-string v0, "none"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 142
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 169
    :goto_0
    return-object v0

    .line 147
    :cond_0
    array-length v5, p1

    move v4, v2

    move v3, v2

    :goto_1
    if-lt v4, v5, :cond_1

    .line 163
    array-length v0, p1

    if-ne v3, v0, :cond_4

    .line 165
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 147
    :cond_1
    aget-object v6, p1, v4

    .line 149
    invoke-interface {v6}, Lcom/auditude/ads/model/IOnPageAsset;->getCreativeType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v6}, Lcom/auditude/ads/model/IOnPageAsset;->getCreativeType()Ljava/lang/String;

    move-result-object v0

    const-string v7, "application/x-shockwave-flash"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    move v0, v1

    :goto_2
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 150
    invoke-interface {v6}, Lcom/auditude/ads/model/IOnPageAsset;->getWidth()I

    move-result v7

    invoke-interface {v6}, Lcom/auditude/ads/model/IOnPageAsset;->getHeight()I

    move-result v6

    invoke-direct {p0, v7, v6}, Lcom/auditude/ads/view/ViewManager;->getBannerContainer(II)Landroid/view/ViewGroup;

    move-result-object v6

    if-eqz v6, :cond_5

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_5

    .line 152
    const-string v0, "any"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 154
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    :cond_2
    move v0, v2

    .line 149
    goto :goto_2

    .line 158
    :cond_3
    add-int/lit8 v0, v3, 0x1

    .line 147
    :goto_3
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    move v3, v0

    goto :goto_1

    .line 169
    :cond_4
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    :cond_5
    move v0, v3

    goto :goto_3
.end method

.method private dispatchViewManagerEvent(Lcom/auditude/ads/view/ViewManagerEvent;)Z
    .locals 1

    .prologue
    .line 415
    const-string v0, "viewManagerEvent"

    invoke-virtual {p0, v0, p1}, Lcom/auditude/ads/view/ViewManager;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 417
    const/4 v0, 0x0

    return v0
.end method

.method private getBannerContainer(II)Landroid/view/ViewGroup;
    .locals 4

    .prologue
    .line 468
    const/4 v1, 0x0

    .line 469
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v2, "auditudeParamCountryCode"

    invoke-virtual {v0, v2}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 471
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v2, "auditudeParamCountryCode"

    invoke-virtual {v0, v2}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 472
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 474
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 483
    :cond_1
    return-object v1

    .line 474
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/view/BannerContainer;

    .line 476
    iget v3, v0, Lcom/auditude/ads/view/BannerContainer;->width:I

    if-ne v3, p1, :cond_0

    iget v3, v0, Lcom/auditude/ads/view/BannerContainer;->height:I

    if-ne v3, p2, :cond_0

    .line 478
    iget-object v0, v0, Lcom/auditude/ads/view/BannerContainer;->viewGroup:Landroid/view/ViewGroup;

    move-object v1, v0

    goto :goto_0
.end method

.method private hideView(Lcom/auditude/ads/view/IAdView;Lcom/auditude/ads/view/model/AdViewSource;)V
    .locals 3

    .prologue
    .line 240
    if-eqz p1, :cond_0

    .line 242
    invoke-interface {p1, p2}, Lcom/auditude/ads/view/IAdView;->hide(Lcom/auditude/ads/view/model/IAdViewSource;)V

    .line 245
    :cond_0
    if-eqz p2, :cond_1

    .line 247
    invoke-virtual {p2}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v0, :cond_2

    .line 249
    new-instance v0, Lcom/auditude/ads/view/ViewManagerEvent;

    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->LINEAR_AD_END:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    invoke-virtual {p2}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Lcom/auditude/ads/view/ViewManagerEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;Lcom/auditude/ads/model/IAsset;)V

    invoke-direct {p0, v0}, Lcom/auditude/ads/view/ViewManager;->dispatchViewManagerEvent(Lcom/auditude/ads/view/ViewManagerEvent;)Z

    .line 256
    :cond_1
    :goto_0
    return-void

    .line 251
    :cond_2
    invoke-virtual {p2}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/INonLinearAsset;

    if-eqz v0, :cond_1

    .line 253
    new-instance v0, Lcom/auditude/ads/view/ViewManagerEvent;

    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->NON_LINEAR_AD_END:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    invoke-virtual {p2}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Lcom/auditude/ads/view/ViewManagerEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;Lcom/auditude/ads/model/IAsset;)V

    invoke-direct {p0, v0}, Lcom/auditude/ads/view/ViewManager;->dispatchViewManagerEvent(Lcom/auditude/ads/view/ViewManagerEvent;)Z

    goto :goto_0
.end method

.method private initView(Lcom/auditude/ads/view/IAdView;Lcom/auditude/ads/view/model/AdViewSource;)V
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->viewController:Lcom/auditude/ads/view/ViewController;

    invoke-interface {p1, v0}, Lcom/auditude/ads/view/IAdView;->initialize(Lcom/auditude/ads/view/IViewController;)V

    .line 207
    invoke-direct {p0, p1, p2}, Lcom/auditude/ads/view/ViewManager;->showView(Lcom/auditude/ads/view/IAdView;Lcom/auditude/ads/view/model/AdViewSource;)V

    .line 208
    return-void
.end method

.method private initialize()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    .line 60
    iget-boolean v0, p0, Lcom/auditude/ads/view/ViewManager;->isInitialized:Z

    if-eqz v0, :cond_0

    .line 69
    :goto_0
    return-void

    .line 62
    :cond_0
    new-instance v0, Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/auditude/ads/view/ViewManager;->adContainer:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/auditude/ads/view/ViewManager;->viewContainer:Landroid/widget/FrameLayout;

    .line 63
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->adContainer:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/auditude/ads/view/ViewManager;->viewContainer:Landroid/widget/FrameLayout;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 65
    new-instance v0, Lcom/auditude/ads/view/ViewFactory;

    iget-object v1, p0, Lcom/auditude/ads/view/ViewManager;->adContainer:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/auditude/ads/view/ViewFactory;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/auditude/ads/view/ViewManager;->viewFactory:Lcom/auditude/ads/view/ViewFactory;

    .line 66
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->viewController:Lcom/auditude/ads/view/ViewController;

    invoke-virtual {v0}, Lcom/auditude/ads/view/ViewController;->init()V

    .line 68
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/auditude/ads/view/ViewManager;->isInitialized:Z

    goto :goto_0
.end method

.method private loadView(Lcom/auditude/ads/view/model/AdViewSource;)V
    .locals 3

    .prologue
    .line 187
    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    .line 188
    iget-object v1, p0, Lcom/auditude/ads/view/ViewManager;->viewFactory:Lcom/auditude/ads/view/ViewFactory;

    instance-of v2, v0, Lcom/auditude/ads/model/Asset;

    if-eqz v2, :cond_1

    :goto_0
    check-cast v0, Lcom/auditude/ads/model/Asset;

    invoke-virtual {v1, v0}, Lcom/auditude/ads/view/ViewFactory;->getViewForAsset(Lcom/auditude/ads/model/Asset;)Lcom/auditude/ads/view/IAdView;

    move-result-object v0

    .line 189
    if-eqz v0, :cond_2

    .line 191
    invoke-direct {p0, v0, p1}, Lcom/auditude/ads/view/ViewManager;->initView(Lcom/auditude/ads/view/IAdView;Lcom/auditude/ads/view/model/AdViewSource;)V

    .line 202
    :cond_0
    :goto_1
    return-void

    .line 188
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 195
    :cond_2
    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/ILinearAsset;

    if-nez v0, :cond_3

    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/INonLinearAsset;

    if-eqz v0, :cond_0

    .line 197
    :cond_3
    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v0, :cond_4

    sget-object v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->LINEAR_AD_END:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    .line 198
    :goto_2
    new-instance v1, Lcom/auditude/ads/view/ViewManagerEvent;

    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v2

    invoke-direct {v1, p0, v0, v2}, Lcom/auditude/ads/view/ViewManagerEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;Lcom/auditude/ads/model/IAsset;)V

    invoke-direct {p0, v1}, Lcom/auditude/ads/view/ViewManager;->dispatchViewManagerEvent(Lcom/auditude/ads/view/ViewManagerEvent;)Z

    goto :goto_1

    .line 197
    :cond_4
    sget-object v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->NON_LINEAR_AD_END:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    goto :goto_2
.end method

.method private logVastgError(Lcom/auditude/ads/model/Asset;I)V
    .locals 4

    .prologue
    .line 422
    if-eqz p1, :cond_0

    .line 424
    const-string v0, "vasterror"

    invoke-virtual {p1, v0}, Lcom/auditude/ads/model/Asset;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v0

    .line 425
    if-eqz v0, :cond_0

    .line 427
    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 433
    :cond_0
    return-void

    .line 427
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    .line 429
    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, p2}, Lcom/auditude/ads/model/tracking/TrackingUrl;->log(ZLjava/util/HashMap;I)V

    goto :goto_0
.end method

.method private onAdClick(Lcom/auditude/ads/model/Click;)V
    .locals 2

    .prologue
    .line 270
    if-nez p1, :cond_1

    .line 290
    :cond_0
    :goto_0
    return-void

    .line 275
    :cond_1
    invoke-virtual {p1}, Lcom/auditude/ads/model/Click;->getParent()Lcom/auditude/ads/model/BaseElement;

    move-result-object v0

    .line 276
    instance-of v1, v0, Lcom/auditude/ads/model/Asset;

    if-eqz v1, :cond_3

    :goto_1
    check-cast v0, Lcom/auditude/ads/model/Asset;

    .line 277
    if-eqz v0, :cond_0

    .line 282
    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getApiFramework()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "vpaid"

    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getApiFramework()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 285
    :cond_2
    if-eqz p1, :cond_0

    .line 287
    invoke-virtual {p1}, Lcom/auditude/ads/model/Click;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/auditude/ads/util/AuditudeUtil;->substituteTags(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/auditude/ads/util/BrowserUtil;->OpenUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 276
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private onAdViewEvent(Lcom/auditude/ads/view/AdViewEvent;)V
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 342
    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v3

    .line 343
    invoke-interface {v3}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v1

    .line 344
    invoke-interface {v3}, Lcom/auditude/ads/view/model/IAdViewSource;->getCompanions()[Lcom/auditude/ads/model/IOnPageAsset;

    move-result-object v2

    .line 345
    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getView()Lcom/auditude/ads/view/IAdView;

    move-result-object v5

    .line 347
    invoke-static {}, Lcom/auditude/ads/view/ViewManager;->$SWITCH_TABLE$com$auditude$ads$view$AdViewEvent$AdViewEventType()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/auditude/ads/view/AdViewEvent;->getType()Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    move-result-object v6

    invoke-virtual {v6}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->ordinal()I

    move-result v6

    aget v0, v0, v6

    packed-switch v0, :pswitch_data_0

    .line 406
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 351
    :pswitch_1
    invoke-interface {v5}, Lcom/auditude/ads/view/IAdView;->shouldNotifyAdBeginOnLoad()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 353
    iget-object v3, p0, Lcom/auditude/ads/view/ViewManager;->api:Lcom/auditude/ads/core/APIBridge;

    invoke-interface {v5}, Lcom/auditude/ads/view/IAdView;->getPlaybackSession()Lcom/auditude/ads/session/IPlaybackSession;

    move-result-object v4

    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v5, "auditudeHandlesLinearVideoAds"

    invoke-virtual {v0, v5}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {v3, v1, v2, v4, v0}, Lcom/auditude/ads/core/APIBridge;->adBegin(Lcom/auditude/ads/model/IAsset;[Lcom/auditude/ads/model/IOnPageAsset;Lcom/auditude/ads/session/IPlaybackSession;Z)V

    goto :goto_0

    .line 357
    :pswitch_2
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/auditude/ads/model/OnPageAsset;

    move-object v2, v0

    .line 359
    :pswitch_3
    invoke-direct {p0, v2}, Lcom/auditude/ads/view/ViewManager;->showCompanions([Lcom/auditude/ads/model/IOnPageAsset;)V

    .line 361
    invoke-interface {v5}, Lcom/auditude/ads/view/IAdView;->shouldNotifyAdBeginOnLoad()Z

    move-result v0

    if-nez v0, :cond_1

    .line 363
    iget-object v4, p0, Lcom/auditude/ads/view/ViewManager;->api:Lcom/auditude/ads/core/APIBridge;

    invoke-interface {v5}, Lcom/auditude/ads/view/IAdView;->getPlaybackSession()Lcom/auditude/ads/session/IPlaybackSession;

    move-result-object v5

    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v6, "auditudeHandlesLinearVideoAds"

    invoke-virtual {v0, v6}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {v4, v1, v2, v5, v0}, Lcom/auditude/ads/core/APIBridge;->adBegin(Lcom/auditude/ads/model/IAsset;[Lcom/auditude/ads/model/IOnPageAsset;Lcom/auditude/ads/session/IPlaybackSession;Z)V

    .line 366
    :cond_1
    if-eqz v1, :cond_2

    move-object v0, v1

    .line 368
    check-cast v0, Lcom/auditude/ads/model/Asset;

    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->Show()V

    .line 371
    :cond_2
    instance-of v0, v1, Lcom/auditude/ads/model/INonLinearAsset;

    if-eqz v0, :cond_3

    .line 373
    new-instance v0, Lcom/auditude/ads/view/ViewManagerEvent;

    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->NON_LINEAR_AD_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    invoke-interface {v3}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Lcom/auditude/ads/view/ViewManagerEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;Lcom/auditude/ads/model/IAsset;)V

    invoke-direct {p0, v0}, Lcom/auditude/ads/view/ViewManager;->dispatchViewManagerEvent(Lcom/auditude/ads/view/ViewManagerEvent;)Z

    goto :goto_0

    .line 375
    :cond_3
    instance-of v0, v1, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v0, :cond_0

    .line 377
    new-instance v0, Lcom/auditude/ads/view/ViewManagerEvent;

    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->LINEAR_AD_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    invoke-interface {v3}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Lcom/auditude/ads/view/ViewManagerEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;Lcom/auditude/ads/model/IAsset;)V

    invoke-direct {p0, v0}, Lcom/auditude/ads/view/ViewManager;->dispatchViewManagerEvent(Lcom/auditude/ads/view/ViewManagerEvent;)Z

    goto :goto_0

    .line 381
    :pswitch_4
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->api:Lcom/auditude/ads/core/APIBridge;

    invoke-interface {v5}, Lcom/auditude/ads/view/IAdView;->getPosition()I

    move-result v2

    invoke-interface {v5}, Lcom/auditude/ads/view/IAdView;->getDuration()I

    move-result v3

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/auditude/ads/core/APIBridge;->adProgress(Lcom/auditude/ads/model/IAsset;IILjava/util/HashMap;)V

    goto/16 :goto_0

    .line 387
    :pswitch_5
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->api:Lcom/auditude/ads/core/APIBridge;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/auditude/ads/core/APIBridge;->adEnd(Lcom/auditude/ads/model/IAsset;Z)V

    .line 388
    instance-of v0, v3, Lcom/auditude/ads/view/model/AdViewSource;

    if-eqz v0, :cond_4

    move-object v0, v3

    :goto_1
    check-cast v0, Lcom/auditude/ads/view/model/AdViewSource;

    invoke-direct {p0, v5, v0}, Lcom/auditude/ads/view/ViewManager;->hideView(Lcom/auditude/ads/view/IAdView;Lcom/auditude/ads/view/model/AdViewSource;)V

    goto/16 :goto_0

    :cond_4
    move-object v0, v4

    goto :goto_1

    .line 391
    :pswitch_6
    invoke-interface {v1}, Lcom/auditude/ads/model/IAsset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v0

    .line 392
    instance-of v2, v0, Lcom/auditude/ads/model/Click;

    if-eqz v2, :cond_5

    :goto_2
    check-cast v0, Lcom/auditude/ads/model/Click;

    invoke-direct {p0, v0}, Lcom/auditude/ads/view/ViewManager;->onAdClick(Lcom/auditude/ads/model/Click;)V

    .line 393
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->api:Lcom/auditude/ads/core/APIBridge;

    invoke-interface {v1}, Lcom/auditude/ads/model/IAsset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v1

    invoke-virtual {v0, v1, v4}, Lcom/auditude/ads/core/APIBridge;->adClick(Lcom/auditude/ads/model/IClick;Ljava/util/HashMap;)V

    goto/16 :goto_0

    :cond_5
    move-object v0, v4

    .line 392
    goto :goto_2

    .line 396
    :pswitch_7
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->api:Lcom/auditude/ads/core/APIBridge;

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/APIBridge;->adPaused(Lcom/auditude/ads/model/IAsset;)V

    goto/16 :goto_0

    .line 399
    :pswitch_8
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->api:Lcom/auditude/ads/core/APIBridge;

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/APIBridge;->adResumed(Lcom/auditude/ads/model/IAsset;)V

    goto/16 :goto_0

    .line 347
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_5
        :pswitch_5
        :pswitch_1
        :pswitch_4
        :pswitch_7
        :pswitch_8
        :pswitch_0
        :pswitch_5
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method

.method private removeViewEventHandlers()V
    .locals 2

    .prologue
    .line 265
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->api:Lcom/auditude/ads/core/APIBridge;

    const-string v1, "adViewEvent"

    invoke-virtual {v0, v1, p0}, Lcom/auditude/ads/core/APIBridge;->removeEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 266
    return-void
.end method

.method private setContentView(Lcom/auditude/ads/model/IContentViewAsset;)V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 174
    iget-object v2, p0, Lcom/auditude/ads/view/ViewManager;->viewFactory:Lcom/auditude/ads/view/ViewFactory;

    instance-of v0, p1, Lcom/auditude/ads/model/Asset;

    if-eqz v0, :cond_1

    move-object v0, p1

    :goto_0
    check-cast v0, Lcom/auditude/ads/model/Asset;

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v3}, Lcom/auditude/ads/view/ViewFactory;->getViewForAsset(Lcom/auditude/ads/model/Asset;Z)Lcom/auditude/ads/view/IAdView;

    move-result-object v2

    .line 176
    if-eqz v2, :cond_0

    instance-of v0, v2, Landroid/view/View;

    if-eqz v0, :cond_0

    .line 178
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->viewController:Lcom/auditude/ads/view/ViewController;

    invoke-interface {v2, v0}, Lcom/auditude/ads/view/IAdView;->initialize(Lcom/auditude/ads/view/IViewController;)V

    .line 179
    new-instance v3, Lcom/auditude/ads/view/model/AdViewSource;

    instance-of v0, p1, Lcom/auditude/ads/model/IAsset;

    if-eqz v0, :cond_2

    move-object v0, p1

    :goto_1
    check-cast v0, Lcom/auditude/ads/model/IAsset;

    invoke-direct {v3, v0, v1, v1}, Lcom/auditude/ads/view/model/AdViewSource;-><init>(Lcom/auditude/ads/model/IAsset;[Lcom/auditude/ads/model/IOnPageAsset;Ljava/lang/Object;)V

    invoke-interface {v2, v3}, Lcom/auditude/ads/view/IAdView;->show(Lcom/auditude/ads/view/model/IAdViewSource;)V

    .line 181
    instance-of v0, v2, Landroid/view/View;

    if-eqz v0, :cond_3

    move-object v0, v2

    :goto_2
    check-cast v0, Landroid/view/View;

    invoke-interface {p1, v0}, Lcom/auditude/ads/model/IContentViewAsset;->setContentView(Landroid/view/View;)V

    .line 183
    :cond_0
    return-void

    :cond_1
    move-object v0, v1

    .line 174
    goto :goto_0

    :cond_2
    move-object v0, v1

    .line 179
    goto :goto_1

    :cond_3
    move-object v0, v1

    .line 181
    goto :goto_2
.end method

.method private showCompanions([Lcom/auditude/ads/model/IOnPageAsset;)V
    .locals 7

    .prologue
    const/4 v1, 0x0

    .line 118
    if-eqz p1, :cond_0

    .line 120
    array-length v3, p1

    move v2, v1

    :goto_0
    if-lt v2, v3, :cond_1

    .line 136
    :cond_0
    return-void

    .line 120
    :cond_1
    aget-object v4, p1, v2

    .line 122
    invoke-interface {v4}, Lcom/auditude/ads/model/IOnPageAsset;->getCreativeType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-interface {v4}, Lcom/auditude/ads/model/IOnPageAsset;->getCreativeType()Ljava/lang/String;

    move-result-object v0

    const-string v5, "application/x-shockwave-flash"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    :goto_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 123
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_2

    .line 125
    invoke-interface {v4}, Lcom/auditude/ads/model/IOnPageAsset;->getWidth()I

    move-result v0

    invoke-interface {v4}, Lcom/auditude/ads/model/IOnPageAsset;->getHeight()I

    move-result v5

    invoke-direct {p0, v0, v5}, Lcom/auditude/ads/view/ViewManager;->getBannerContainer(II)Landroid/view/ViewGroup;

    move-result-object v0

    .line 126
    if-eqz v0, :cond_2

    .line 128
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 129
    new-instance v5, Lcom/auditude/ads/view/BannerView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/auditude/ads/view/BannerView;-><init>(Landroid/content/Context;)V

    .line 130
    iget-object v6, p0, Lcom/auditude/ads/view/ViewManager;->api:Lcom/auditude/ads/core/APIBridge;

    invoke-virtual {v5, v4, v6}, Lcom/auditude/ads/view/BannerView;->loadBanner(Lcom/auditude/ads/model/IOnPageAsset;Lcom/auditude/ads/core/APIBridge;)V

    .line 131
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 120
    :cond_2
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_3
    move v0, v1

    .line 122
    goto :goto_1
.end method

.method private showView(Lcom/auditude/ads/view/IAdView;Lcom/auditude/ads/view/model/AdViewSource;)V
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 213
    if-nez p1, :cond_2

    invoke-virtual {p2}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/ILinearAsset;

    if-nez v0, :cond_0

    invoke-virtual {p2}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/INonLinearAsset;

    if-eqz v0, :cond_2

    .line 215
    :cond_0
    invoke-virtual {p2}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->LINEAR_AD_END:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    .line 216
    :goto_0
    new-instance v1, Lcom/auditude/ads/view/ViewManagerEvent;

    invoke-virtual {p2}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v2

    invoke-direct {v1, p0, v0, v2}, Lcom/auditude/ads/view/ViewManagerEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;Lcom/auditude/ads/model/IAsset;)V

    invoke-direct {p0, v1}, Lcom/auditude/ads/view/ViewManager;->dispatchViewManagerEvent(Lcom/auditude/ads/view/ViewManagerEvent;)Z

    .line 236
    :goto_1
    return-void

    .line 215
    :cond_1
    sget-object v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->NON_LINEAR_AD_END:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    goto :goto_0

    .line 222
    :cond_2
    instance-of v0, p1, Landroid/view/View;

    if-eqz v0, :cond_3

    invoke-interface {p1}, Lcom/auditude/ads/view/IAdView;->shouldAddToStage()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 224
    iget-object v1, p0, Lcom/auditude/ads/view/ViewManager;->viewContainer:Landroid/widget/FrameLayout;

    move-object v0, p1

    check-cast v0, Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_4

    .line 226
    iget-object v1, p0, Lcom/auditude/ads/view/ViewManager;->viewContainer:Landroid/widget/FrameLayout;

    move-object v0, p1

    check-cast v0, Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 234
    :cond_3
    :goto_2
    new-instance v3, Lcom/auditude/ads/view/AdPlaybackSession;

    instance-of v0, p2, Lcom/auditude/ads/view/model/AdViewSource;

    if-eqz v0, :cond_5

    move-object v1, p2

    :goto_3
    instance-of v0, p1, Lcom/auditude/ads/view/AdView;

    if-eqz v0, :cond_6

    move-object v0, p1

    :goto_4
    check-cast v0, Lcom/auditude/ads/view/AdView;

    invoke-direct {v3, v1, v0, p0}, Lcom/auditude/ads/view/AdPlaybackSession;-><init>(Lcom/auditude/ads/view/model/AdViewSource;Lcom/auditude/ads/view/AdView;Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;)V

    invoke-interface {p1, v3}, Lcom/auditude/ads/view/IAdView;->setPlaybackSession(Lcom/auditude/ads/session/IPlaybackSession;)V

    .line 235
    invoke-interface {p1, p2}, Lcom/auditude/ads/view/IAdView;->show(Lcom/auditude/ads/view/model/IAdViewSource;)V

    goto :goto_1

    :cond_4
    move-object v0, p1

    .line 230
    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    goto :goto_2

    :cond_5
    move-object v1, v2

    .line 234
    goto :goto_3

    :cond_6
    move-object v0, v2

    goto :goto_4
.end method


# virtual methods
.method public final dispose()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 450
    invoke-virtual {p0}, Lcom/auditude/ads/view/ViewManager;->reset()V

    .line 451
    invoke-direct {p0}, Lcom/auditude/ads/view/ViewManager;->removeViewEventHandlers()V

    .line 453
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->viewFactory:Lcom/auditude/ads/view/ViewFactory;

    if-eqz v0, :cond_0

    .line 455
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->viewFactory:Lcom/auditude/ads/view/ViewFactory;

    invoke-virtual {v0}, Lcom/auditude/ads/view/ViewFactory;->dispose()V

    .line 456
    iput-object v1, p0, Lcom/auditude/ads/view/ViewManager;->viewFactory:Lcom/auditude/ads/view/ViewFactory;

    .line 459
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->viewController:Lcom/auditude/ads/view/ViewController;

    if-eqz v0, :cond_1

    .line 461
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->viewController:Lcom/auditude/ads/view/ViewController;

    invoke-virtual {v0}, Lcom/auditude/ads/view/ViewController;->dispose()V

    .line 462
    iput-object v1, p0, Lcom/auditude/ads/view/ViewManager;->viewController:Lcom/auditude/ads/view/ViewController;

    .line 464
    :cond_1
    return-void
.end method

.method public final getViewController()Lcom/auditude/ads/view/IViewController;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->viewController:Lcom/auditude/ads/view/ViewController;

    return-object v0
.end method

.method public onAdPlaybackSessionEvent(Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;Lcom/auditude/ads/view/model/AdViewSource;Lcom/auditude/ads/view/AdView;Ljava/util/HashMap;)V
    .locals 2

    .prologue
    .line 294
    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    .line 295
    :goto_0
    if-nez v0, :cond_2

    .line 330
    :cond_0
    :goto_1
    return-void

    .line 294
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 297
    :cond_2
    invoke-static {}, Lcom/auditude/ads/view/ViewManager;->$SWITCH_TABLE$com$auditude$ads$view$AdPlaybackSession$PlaybackConstants()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_1

    .line 300
    :pswitch_1
    instance-of v0, p3, Lcom/auditude/ads/view/ILinearAdView;

    if-eqz v0, :cond_0

    .line 302
    check-cast p3, Lcom/auditude/ads/view/ILinearAdView;

    invoke-interface {p3}, Lcom/auditude/ads/view/ILinearAdView;->pause()V

    goto :goto_1

    .line 306
    :pswitch_2
    instance-of v0, p3, Lcom/auditude/ads/view/ILinearAdView;

    if-eqz v0, :cond_0

    .line 308
    check-cast p3, Lcom/auditude/ads/view/ILinearAdView;

    invoke-interface {p3}, Lcom/auditude/ads/view/ILinearAdView;->resume()V

    goto :goto_1

    .line 312
    :pswitch_3
    new-instance v0, Lcom/auditude/ads/view/AdViewEvent;

    sget-object v1, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_STOP:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-direct {v0, p0, v1, p2, p3}, Lcom/auditude/ads/view/AdViewEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;Lcom/auditude/ads/view/model/IAdViewSource;Lcom/auditude/ads/view/IAdView;)V

    invoke-direct {p0, v0}, Lcom/auditude/ads/view/ViewManager;->onAdViewEvent(Lcom/auditude/ads/view/AdViewEvent;)V

    goto :goto_1

    .line 315
    :pswitch_4
    if-eqz p3, :cond_0

    .line 317
    sget-object v0, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_CLICK:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {p3, v0}, Lcom/auditude/ads/view/AdView;->notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;)V

    goto :goto_1

    .line 321
    :pswitch_5
    if-eqz p3, :cond_0

    .line 323
    sget-object v0, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_SKIP:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {p3, v0}, Lcom/auditude/ads/view/AdView;->notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;)V

    goto :goto_1

    .line 297
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public onEvent(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .prologue
    .line 334
    const-string v0, "adViewEvent"

    if-ne p1, v0, :cond_0

    instance-of v0, p2, Lcom/auditude/ads/view/AdViewEvent;

    if-eqz v0, :cond_0

    .line 336
    check-cast p2, Lcom/auditude/ads/view/AdViewEvent;

    invoke-direct {p0, p2}, Lcom/auditude/ads/view/ViewManager;->onAdViewEvent(Lcom/auditude/ads/view/AdViewEvent;)V

    .line 338
    :cond_0
    return-void
.end method

.method public final reset()V
    .locals 1

    .prologue
    .line 437
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->viewContainer:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    .line 439
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->viewContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 442
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->viewFactory:Lcom/auditude/ads/view/ViewFactory;

    if-eqz v0, :cond_1

    .line 444
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManager;->viewFactory:Lcom/auditude/ads/view/ViewFactory;

    invoke-virtual {v0}, Lcom/auditude/ads/view/ViewFactory;->reset()V

    .line 446
    :cond_1
    return-void
.end method

.method public final showAdSource(Lcom/auditude/ads/view/model/AdViewSource;)V
    .locals 4

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/auditude/ads/view/ViewManager;->initialize()V

    .line 77
    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getCompanions()[Lcom/auditude/ads/model/IOnPageAsset;

    move-result-object v0

    .line 78
    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v1

    invoke-interface {v1}, Lcom/auditude/ads/model/IAsset;->getCompanionRequired()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/auditude/ads/view/ViewManager;->checkCompanionRequired([Lcom/auditude/ads/model/IOnPageAsset;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 80
    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v1

    instance-of v1, v1, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v1, :cond_2

    .line 82
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->LINEAR_AD_ABOUT_TO_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/auditude/ads/view/ViewManager;->canShowAsset(Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;Lcom/auditude/ads/model/IAsset;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 85
    :cond_0
    new-instance v1, Lcom/auditude/ads/view/ViewManagerEvent;

    sget-object v2, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->LINEAR_AD_END:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3}, Lcom/auditude/ads/view/ViewManagerEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;Lcom/auditude/ads/model/IAsset;)V

    invoke-direct {p0, v1}, Lcom/auditude/ads/view/ViewManager;->dispatchViewManagerEvent(Lcom/auditude/ads/view/ViewManagerEvent;)Z

    .line 87
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/model/IAsset;->isNetworkAd()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 89
    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Asset;

    const/16 v1, 0x25a

    invoke-direct {p0, v0, v1}, Lcom/auditude/ads/view/ViewManager;->logVastgError(Lcom/auditude/ads/model/Asset;I)V

    .line 114
    :cond_1
    :goto_0
    return-void

    .line 95
    :cond_2
    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/INonLinearAsset;

    if-eqz v0, :cond_3

    .line 97
    sget-object v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->NON_LINEAR_AD_ABOUT_TO_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/auditude/ads/view/ViewManager;->canShowAsset(Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;Lcom/auditude/ads/model/IAsset;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 100
    new-instance v0, Lcom/auditude/ads/view/ViewManagerEvent;

    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->NON_LINEAR_AD_END:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Lcom/auditude/ads/view/ViewManagerEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;Lcom/auditude/ads/model/IAsset;)V

    invoke-direct {p0, v0}, Lcom/auditude/ads/view/ViewManager;->dispatchViewManagerEvent(Lcom/auditude/ads/view/ViewManagerEvent;)Z

    goto :goto_0

    .line 106
    :cond_3
    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/IContentViewAsset;

    if-eqz v0, :cond_4

    .line 108
    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    .line 109
    instance-of v1, v0, Lcom/auditude/ads/model/IContentViewAsset;

    if-eqz v1, :cond_5

    :goto_1
    check-cast v0, Lcom/auditude/ads/model/IContentViewAsset;

    invoke-direct {p0, v0}, Lcom/auditude/ads/view/ViewManager;->setContentView(Lcom/auditude/ads/model/IContentViewAsset;)V

    .line 113
    :cond_4
    invoke-direct {p0, p1}, Lcom/auditude/ads/view/ViewManager;->loadView(Lcom/auditude/ads/view/model/AdViewSource;)V

    goto :goto_0

    .line 109
    :cond_5
    const/4 v0, 0x0

    goto :goto_1
.end method
