.class public Lcom/auditude/ads/session/BreakManager;
.super Lcom/auditude/ads/session/GroupManager;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;
.implements Lcom/auditude/ads/util/event/IEventListener;


# static fields
.field private static synthetic $SWITCH_TABLE$com$auditude$ads$view$ViewManagerEvent$ViewManagerEventType:[I


# instance fields
.field assetRepackager:Lcom/auditude/ads/repackaging/AssetRepackager;

.field currentAdViewSource:Lcom/auditude/ads/view/model/AdViewSource;


# direct methods
.method static synthetic $SWITCH_TABLE$com$auditude$ads$view$ViewManagerEvent$ViewManagerEventType()[I
    .locals 3

    .prologue
    .line 24
    sget-object v0, Lcom/auditude/ads/session/BreakManager;->$SWITCH_TABLE$com$auditude$ads$view$ViewManagerEvent$ViewManagerEventType:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->values()[Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->LINEAR_AD_ABOUT_TO_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_5

    :goto_1
    :try_start_1
    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->LINEAR_AD_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_4

    :goto_2
    :try_start_2
    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->LINEAR_AD_END:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_3

    :goto_3
    :try_start_3
    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->NON_LINEAR_AD_ABOUT_TO_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_2

    :goto_4
    :try_start_4
    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->NON_LINEAR_AD_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_1

    :goto_5
    :try_start_5
    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->NON_LINEAR_AD_END:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    invoke-virtual {v1}, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_0

    :goto_6
    sput-object v0, Lcom/auditude/ads/session/BreakManager;->$SWITCH_TABLE$com$auditude$ads$view$ViewManagerEvent$ViewManagerEventType:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_6

    :catch_1
    move-exception v1

    goto :goto_5

    :catch_2
    move-exception v1

    goto :goto_4

    :catch_3
    move-exception v1

    goto :goto_3

    :catch_4
    move-exception v1

    goto :goto_2

    :catch_5
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>(Lcom/auditude/ads/core/APIBridge;Lcom/auditude/ads/view/ViewManager;Lcom/auditude/ads/core/AdSettings;)V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3}, Lcom/auditude/ads/session/GroupManager;-><init>(Lcom/auditude/ads/core/APIBridge;Lcom/auditude/ads/view/ViewManager;Lcom/auditude/ads/core/AdSettings;)V

    .line 33
    const-string v0, "viewManagerEvent"

    invoke-virtual {p2, v0, p0}, Lcom/auditude/ads/view/ViewManager;->addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 34
    return-void
.end method

.method private checkAssetDaisyChaining(Lcom/auditude/ads/model/IAsset;)V
    .locals 2

    .prologue
    .line 200
    instance-of v0, p1, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v0, :cond_0

    .line 202
    instance-of v0, p1, Lcom/auditude/ads/model/Asset;

    if-eqz v0, :cond_1

    move-object v0, p1

    :goto_0
    check-cast v0, Lcom/auditude/ads/model/Asset;

    .line 203
    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getAuditudeParams()Ljava/util/HashMap;

    move-result-object v0

    .line 204
    if-eqz v0, :cond_0

    const-string v1, "daisy_chaining"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 206
    const-string v1, "daisy_chaining"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 207
    const-string v1, "conditional"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 210
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getGroup()Lcom/auditude/ads/model/smil/Group;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 212
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getGroup()Lcom/auditude/ads/model/smil/Group;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/smil/Group;->setSkipCurrentSequence(Z)V

    .line 217
    :cond_0
    return-void

    .line 202
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private checkParDaisyChaining(Ljava/util/HashMap;)V
    .locals 2

    .prologue
    .line 183
    if-eqz p1, :cond_0

    const-string v0, "daisy_chaining"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 185
    const-string v0, "daisy_chaining"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 186
    const-string v1, "never"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 189
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getGroup()Lcom/auditude/ads/model/smil/Group;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 191
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getGroup()Lcom/auditude/ads/model/smil/Group;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/smil/Group;->setSkipCurrentSequence(Z)V

    .line 195
    :cond_0
    return-void
.end method

.method private hasAvailableDuration(Lcom/auditude/ads/model/ILinearAsset;)Z
    .locals 2

    .prologue
    .line 165
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 166
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->getRemainingMaxAdDuration()I

    move-result v0

    invoke-interface {p1}, Lcom/auditude/ads/model/ILinearAsset;->getDurationInMillis()I

    move-result v1

    if-lt v0, v1, :cond_1

    .line 167
    invoke-interface {p1}, Lcom/auditude/ads/model/ILinearAsset;->getDurationInMillis()I

    move-result v0

    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Sequence;->getCreativeMaxDuration()I

    move-result v1

    if-le v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getPar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Sequence;->getCreativeMaxDuration()I

    move-result v0

    .line 165
    if-gez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private onLinearAdAboutToBegin(Lcom/auditude/ads/model/IAsset;)V
    .locals 1

    .prologue
    .line 174
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->isHandlingGroup()Z

    move-result v0

    if-eqz v0, :cond_0

    instance-of v0, p1, Lcom/auditude/ads/model/ILinearAsset;

    if-nez v0, :cond_1

    .line 178
    :cond_0
    :goto_0
    return-void

    .line 177
    :cond_1
    invoke-direct {p0, p1}, Lcom/auditude/ads/session/BreakManager;->checkAssetDaisyChaining(Lcom/auditude/ads/model/IAsset;)V

    goto :goto_0
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .prologue
    .line 243
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getViewManager()Lcom/auditude/ads/view/ViewManager;

    move-result-object v0

    const-string v1, "viewManagerEvent"

    invoke-virtual {v0, v1, p0}, Lcom/auditude/ads/view/ViewManager;->removeEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 245
    invoke-super {p0}, Lcom/auditude/ads/session/GroupManager;->dispose()V

    .line 246
    return-void
.end method

.method public end(Z)V
    .locals 2

    .prologue
    .line 44
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->isHandlingGroup()Z

    move-result v0

    .line 48
    invoke-super {p0, p1}, Lcom/auditude/ads/session/GroupManager;->end(Z)V

    .line 50
    if-eqz v0, :cond_1

    .line 53
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getViewManager()Lcom/auditude/ads/view/ViewManager;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 55
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getViewManager()Lcom/auditude/ads/view/ViewManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/view/ViewManager;->reset()V

    .line 59
    :cond_0
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getAPI()Lcom/auditude/ads/core/APIBridge;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/APIBridge;->breakEnd(Ljava/util/HashMap;)V

    .line 61
    :cond_1
    return-void
.end method

.method protected groupBegin()V
    .locals 2

    .prologue
    .line 66
    invoke-super {p0}, Lcom/auditude/ads/session/GroupManager;->groupBegin()V

    .line 69
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getAPI()Lcom/auditude/ads/core/APIBridge;

    move-result-object v1

    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getGroup()Lcom/auditude/ads/model/smil/Group;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getGroup()Lcom/auditude/ads/model/smil/Group;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getDescription()Ljava/util/HashMap;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Lcom/auditude/ads/core/APIBridge;->breakBegin(Ljava/util/HashMap;)V

    .line 70
    return-void

    .line 69
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isHandlingBreak()Z
    .locals 1

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->isHandlingGroup()Z

    move-result v0

    return v0
.end method

.method public onEvent(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 221
    const-string v0, "viewManagerEvent"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 238
    :cond_0
    :goto_0
    return-void

    .line 222
    :cond_1
    check-cast p2, Lcom/auditude/ads/view/ViewManagerEvent;

    .line 224
    invoke-static {}, Lcom/auditude/ads/session/BreakManager;->$SWITCH_TABLE$com$auditude$ads$view$ViewManagerEvent$ViewManagerEventType()[I

    move-result-object v0

    invoke-virtual {p2}, Lcom/auditude/ads/view/ViewManagerEvent;->getType()Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 227
    :pswitch_1
    invoke-virtual {p2}, Lcom/auditude/ads/view/ViewManagerEvent;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/auditude/ads/session/BreakManager;->onLinearAdAboutToBegin(Lcom/auditude/ads/model/IAsset;)V

    goto :goto_0

    .line 230
    :pswitch_2
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->isHandlingGroup()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 232
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->showNextSegment()V

    goto :goto_0

    .line 224
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onRepackagingComplete(Lcom/auditude/ads/model/Asset;Z)V
    .locals 2

    .prologue
    .line 148
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/session/BreakManager;->assetRepackager:Lcom/auditude/ads/repackaging/AssetRepackager;

    .line 150
    if-eqz p2, :cond_1

    .line 152
    iget-object v0, p0, Lcom/auditude/ads/session/BreakManager;->currentAdViewSource:Lcom/auditude/ads/view/model/AdViewSource;

    if-eqz v0, :cond_0

    .line 154
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getViewManager()Lcom/auditude/ads/view/ViewManager;

    move-result-object v0

    iget-object v1, p0, Lcom/auditude/ads/session/BreakManager;->currentAdViewSource:Lcom/auditude/ads/view/model/AdViewSource;

    invoke-virtual {v0, v1}, Lcom/auditude/ads/view/ViewManager;->showAdSource(Lcom/auditude/ads/view/model/AdViewSource;)V

    .line 161
    :cond_0
    :goto_0
    return-void

    .line 159
    :cond_1
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->showNextSegment()V

    goto :goto_0
.end method

.method protected resolvePar(Lcom/auditude/ads/model/smil/Par;)V
    .locals 2

    .prologue
    .line 134
    if-eqz p1, :cond_0

    .line 136
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Par;->getPrimaryAd()Lcom/auditude/ads/model/Ad;

    move-result-object v0

    .line 137
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->getIsNetworkAd()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 139
    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->getAuditudeParams()Ljava/util/HashMap;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/auditude/ads/session/BreakManager;->checkParDaisyChaining(Ljava/util/HashMap;)V

    .line 143
    :cond_0
    invoke-super {p0, p1}, Lcom/auditude/ads/session/GroupManager;->resolvePar(Lcom/auditude/ads/model/smil/Par;)V

    .line 144
    return-void
.end method

.method protected showAdSource(Lcom/auditude/ads/view/model/AdViewSource;)V
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 75
    invoke-virtual {p1}, Lcom/auditude/ads/view/model/AdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v2

    check-cast v2, Lcom/auditude/ads/model/Asset;

    .line 76
    if-eqz p1, :cond_6

    instance-of v0, v2, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v0, :cond_6

    instance-of v0, v2, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v0, :cond_2

    move-object v0, v2

    :goto_0
    check-cast v0, Lcom/auditude/ads/model/ILinearAsset;

    invoke-direct {p0, v0}, Lcom/auditude/ads/session/BreakManager;->hasAvailableDuration(Lcom/auditude/ads/model/ILinearAsset;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 79
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v3, "repackageCreativeEnabled"

    invoke-virtual {v0, v3}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 81
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v3, "repackageCreativeEnabled"

    invoke-virtual {v0, v3}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 84
    :goto_1
    const-string v3, ""

    .line 85
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v4

    const-string v5, "repackageCreativeFormat"

    invoke-virtual {v4, v5}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 87
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v3

    const-string v4, "repackageCreativeFormat"

    invoke-virtual {v3, v4}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 90
    :cond_0
    invoke-static {v3}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    if-eqz v0, :cond_5

    invoke-virtual {v2}, Lcom/auditude/ads/model/Asset;->getParent()Lcom/auditude/ads/model/BaseElement;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Ad;

    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->isRepackagingEnabled()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 92
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 93
    invoke-virtual {v2}, Lcom/auditude/ads/model/Asset;->getMediaFiles()Ljava/util/ArrayList;

    move-result-object v1

    .line 94
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move-object v1, v0

    :cond_1
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_3

    .line 108
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_4

    .line 110
    iput-object p1, p0, Lcom/auditude/ads/session/BreakManager;->currentAdViewSource:Lcom/auditude/ads/view/model/AdViewSource;

    .line 112
    new-instance v0, Lcom/auditude/ads/repackaging/AssetRepackager;

    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/core/AdSettings;->getDomain()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/core/AdSettings;->getZoneId()I

    move-result v5

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/repackaging/AssetRepackager;-><init>(Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;Lcom/auditude/ads/model/Asset;Ljava/lang/String;Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/auditude/ads/session/BreakManager;->assetRepackager:Lcom/auditude/ads/repackaging/AssetRepackager;

    .line 113
    iget-object v0, p0, Lcom/auditude/ads/session/BreakManager;->assetRepackager:Lcom/auditude/ads/repackaging/AssetRepackager;

    invoke-virtual {v0}, Lcom/auditude/ads/repackaging/AssetRepackager;->repackage()V

    .line 129
    :goto_3
    return-void

    .line 76
    :cond_2
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 94
    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/media/MediaFile;

    .line 96
    if-eqz v0, :cond_1

    .line 98
    iget-object v5, v0, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    invoke-static {v5}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 100
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    iget-object v0, v0, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 102
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    move-object v1, v0

    goto :goto_2

    .line 117
    :cond_4
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getViewManager()Lcom/auditude/ads/view/ViewManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/auditude/ads/view/ViewManager;->showAdSource(Lcom/auditude/ads/view/model/AdViewSource;)V

    goto :goto_3

    .line 122
    :cond_5
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->getViewManager()Lcom/auditude/ads/view/ViewManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/auditude/ads/view/ViewManager;->showAdSource(Lcom/auditude/ads/view/model/AdViewSource;)V

    goto :goto_3

    .line 127
    :cond_6
    invoke-virtual {p0}, Lcom/auditude/ads/session/BreakManager;->showNextSegment()V

    goto :goto_3

    :cond_7
    move v0, v1

    goto/16 :goto_1
.end method
