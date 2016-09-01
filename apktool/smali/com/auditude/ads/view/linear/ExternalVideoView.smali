.class public Lcom/auditude/ads/view/linear/ExternalVideoView;
.super Lcom/auditude/ads/view/AdView;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;
.implements Lcom/auditude/ads/view/ILinearAdView;


# static fields
.field private static synthetic $SWITCH_TABLE$com$auditude$ads$view$AdPlaybackSession$PlaybackConstants:[I = null

.field private static final DURATION:Ljava/lang/String; = "duration"

.field private static final POSITION:Ljava/lang/String; = "position"


# instance fields
.field private duration:I

.field private position:I


# direct methods
.method static synthetic $SWITCH_TABLE$com$auditude$ads$view$AdPlaybackSession$PlaybackConstants()[I
    .locals 3

    .prologue
    .line 15
    sget-object v0, Lcom/auditude/ads/view/linear/ExternalVideoView;->$SWITCH_TABLE$com$auditude$ads$view$AdPlaybackSession$PlaybackConstants:[I

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
    sput-object v0, Lcom/auditude/ads/view/linear/ExternalVideoView;->$SWITCH_TABLE$com$auditude$ads$view$AdPlaybackSession$PlaybackConstants:[I

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

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 25
    invoke-direct {p0, p1}, Lcom/auditude/ads/view/AdView;-><init>(Landroid/content/Context;)V

    .line 17
    iput v0, p0, Lcom/auditude/ads/view/linear/ExternalVideoView;->duration:I

    .line 18
    iput v0, p0, Lcom/auditude/ads/view/linear/ExternalVideoView;->position:I

    .line 26
    return-void
.end method


# virtual methods
.method public getDuration()I
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lcom/auditude/ads/view/linear/ExternalVideoView;->duration:I

    return v0
.end method

.method public getPlaybackSession()Lcom/auditude/ads/session/IPlaybackSession;
    .locals 1

    .prologue
    .line 55
    invoke-super {p0}, Lcom/auditude/ads/view/AdView;->getPlaybackSession()Lcom/auditude/ads/session/IPlaybackSession;

    move-result-object v0

    return-object v0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 49
    iget v0, p0, Lcom/auditude/ads/view/linear/ExternalVideoView;->position:I

    return v0
.end method

.method public hide(Lcom/auditude/ads/view/model/IAdViewSource;)V
    .locals 0

    .prologue
    .line 85
    invoke-super {p0, p1}, Lcom/auditude/ads/view/AdView;->hide(Lcom/auditude/ads/view/model/IAdViewSource;)V

    .line 86
    return-void
.end method

.method public initialize(Lcom/auditude/ads/view/IViewController;)V
    .locals 0

    .prologue
    .line 68
    invoke-super {p0, p1}, Lcom/auditude/ads/view/AdView;->initialize(Lcom/auditude/ads/view/IViewController;)V

    .line 69
    return-void
.end method

.method public onAdPlaybackSessionEvent(Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;Lcom/auditude/ads/view/model/AdViewSource;Lcom/auditude/ads/view/AdView;Ljava/util/HashMap;)V
    .locals 2

    .prologue
    .line 107
    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    .line 108
    :goto_0
    if-nez v0, :cond_2

    .line 142
    :cond_0
    :goto_1
    return-void

    .line 107
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 110
    :cond_2
    invoke-static {}, Lcom/auditude/ads/view/linear/ExternalVideoView;->$SWITCH_TABLE$com$auditude$ads$view$AdPlaybackSession$PlaybackConstants()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_1

    .line 113
    :pswitch_1
    sget-object v0, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_START:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/linear/ExternalVideoView;->notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;)V

    goto :goto_1

    .line 116
    :pswitch_2
    sget-object v0, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_COMPLETE:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/linear/ExternalVideoView;->notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;)V

    goto :goto_1

    .line 119
    :pswitch_3
    sget-object v0, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_STOP:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/linear/ExternalVideoView;->notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;)V

    goto :goto_1

    .line 122
    :pswitch_4
    sget-object v0, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_ERROR:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/linear/ExternalVideoView;->notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;)V

    goto :goto_1

    .line 125
    :pswitch_5
    sget-object v0, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_CLICK:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/linear/ExternalVideoView;->notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;)V

    goto :goto_1

    .line 128
    :pswitch_6
    if-eqz p4, :cond_0

    .line 129
    const-string v0, "position"

    invoke-virtual {p4, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 131
    const-string v0, "position"

    invoke-virtual {p4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/auditude/ads/view/linear/ExternalVideoView;->position:I

    .line 133
    :cond_3
    const-string v0, "duration"

    invoke-virtual {p4, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 135
    const-string v0, "duration"

    invoke-virtual {p4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/auditude/ads/view/linear/ExternalVideoView;->duration:I

    .line 137
    :cond_4
    sget-object v0, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_PROGRESS:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/linear/ExternalVideoView;->notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;)V

    goto :goto_1

    .line 110
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_6
    .end packed-switch
.end method

.method public final pause()V
    .locals 0

    .prologue
    .line 96
    return-void
.end method

.method public reset()V
    .locals 0

    .prologue
    .line 91
    invoke-super {p0}, Lcom/auditude/ads/view/AdView;->reset()V

    .line 92
    return-void
.end method

.method public final resume()V
    .locals 0

    .prologue
    .line 100
    return-void
.end method

.method public setPlaybackSession(Lcom/auditude/ads/session/IPlaybackSession;)V
    .locals 1

    .prologue
    .line 61
    move-object v0, p1

    check-cast v0, Lcom/auditude/ads/view/AdPlaybackSession;

    invoke-virtual {v0, p0}, Lcom/auditude/ads/view/AdPlaybackSession;->setOnAdPlaybackSessionEventListener(Lcom/auditude/ads/view/AdPlaybackSession$OnAdPlaybackSessionEventListener;)V

    .line 62
    invoke-super {p0, p1}, Lcom/auditude/ads/view/AdView;->setPlaybackSession(Lcom/auditude/ads/session/IPlaybackSession;)V

    .line 63
    return-void
.end method

.method public shouldAddToStage()Z
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x0

    return v0
.end method

.method public shouldNotifyAdBeginOnLoad()Z
    .locals 1

    .prologue
    .line 37
    const/4 v0, 0x1

    return v0
.end method

.method public show(Lcom/auditude/ads/view/model/IAdViewSource;)V
    .locals 1

    .prologue
    .line 74
    invoke-super {p0, p1}, Lcom/auditude/ads/view/AdView;->show(Lcom/auditude/ads/view/model/IAdViewSource;)V

    .line 76
    invoke-interface {p1}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    invoke-interface {v0}, Lcom/auditude/ads/model/IAsset;->getDurationInMillis()I

    move-result v0

    iput v0, p0, Lcom/auditude/ads/view/linear/ExternalVideoView;->duration:I

    .line 78
    sget-object v0, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->AD_LOAD:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/linear/ExternalVideoView;->notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;)V

    .line 79
    return-void
.end method
