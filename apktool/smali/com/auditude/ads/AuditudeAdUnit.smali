.class public Lcom/auditude/ads/AuditudeAdUnit;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/IAuditudeAdUnit;
.implements Lcom/auditude/ads/response/AdResponse$AdResponseListener;


# static fields
.field private static final DEFAULT_TIMEOUT:I = 0x8


# instance fields
.field private adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

.field private experienceController:Lcom/auditude/ads/session/AdExperienceController;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 23
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 25
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0}, Lcom/auditude/ads/AuditudeAdUnit;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    new-instance v0, Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-direct {v0}, Lcom/auditude/ads/AuditudeAdUnitDelegate;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    .line 28
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-virtual {v0, p0}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->setAdResponseListener(Lcom/auditude/ads/response/AdResponse$AdResponseListener;)V

    .line 30
    const-string v0, "applicationContext"

    invoke-virtual {p0, v0, p1}, Lcom/auditude/ads/AuditudeAdUnit;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 31
    return-void
.end method

.method private reset()V
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->experienceController:Lcom/auditude/ads/session/AdExperienceController;

    if-eqz v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->experienceController:Lcom/auditude/ads/session/AdExperienceController;

    invoke-virtual {v0}, Lcom/auditude/ads/session/AdExperienceController;->dispose()V

    .line 155
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->experienceController:Lcom/auditude/ads/session/AdExperienceController;

    .line 157
    :cond_0
    return-void
.end method


# virtual methods
.method public final cancel()V
    .locals 1

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/auditude/ads/AuditudeAdUnit;->reset()V

    .line 78
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-virtual {v0}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->cancel()V

    .line 79
    return-void
.end method

.method public final dispose()V
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-virtual {v0}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->dispose()V

    .line 131
    return-void
.end method

.method public final getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-virtual {v0, p1}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final hasBreak()Z
    .locals 1

    .prologue
    .line 105
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/auditude/ads/AuditudeAdUnit;->hasBreak(I)Z

    move-result v0

    return v0
.end method

.method public final hasBreak(I)Z
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->experienceController:Lcom/auditude/ads/session/AdExperienceController;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->experienceController:Lcom/auditude/ads/session/AdExperienceController;

    invoke-virtual {v0, p1}, Lcom/auditude/ads/session/AdExperienceController;->HasBreak(I)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final init(Ljava/lang/String;Ljava/lang/Object;I)V
    .locals 1

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/auditude/ads/AuditudeAdUnit;->init(Ljava/lang/String;Ljava/lang/Object;ILjava/util/HashMap;)V

    .line 61
    return-void
.end method

.method public final init(Ljava/lang/String;Ljava/lang/Object;ILjava/util/HashMap;)V
    .locals 6

    .prologue
    .line 65
    const/16 v5, 0x8

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/auditude/ads/AuditudeAdUnit;->init(Ljava/lang/String;Ljava/lang/Object;ILjava/util/HashMap;I)V

    .line 66
    return-void
.end method

.method public final init(Ljava/lang/String;Ljava/lang/Object;ILjava/util/HashMap;I)V
    .locals 6

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/auditude/ads/AuditudeAdUnit;->reset()V

    .line 72
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->init(Ljava/lang/String;Ljava/lang/Object;ILjava/util/HashMap;I)V

    .line 73
    return-void
.end method

.method protected final logError(ILjava/lang/String;)V
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-virtual {v0, p1, p2}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->logError(ILjava/lang/String;)V

    .line 126
    return-void
.end method

.method public final notify(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/auditude/ads/AuditudeAdUnit;->notify(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 89
    return-void
.end method

.method public final notify(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->experienceController:Lcom/auditude/ads/session/AdExperienceController;

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->experienceController:Lcom/auditude/ads/session/AdExperienceController;

    invoke-virtual {v0, p1, p2}, Lcom/auditude/ads/session/AdExperienceController;->notify(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 101
    :goto_0
    return-void

    .line 99
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-virtual {v0, p1, p2}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->notify(Ljava/lang/String;Ljava/util/HashMap;)V

    goto :goto_0
.end method

.method public onRequestComplete(Ljava/util/ArrayList;)V
    .locals 4

    .prologue
    .line 141
    new-instance v0, Lcom/auditude/ads/session/AdExperienceController;

    iget-object v1, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-virtual {v1}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->getAdResponse()Lcom/auditude/ads/response/AdResponse;

    move-result-object v1

    iget-object v2, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-virtual {v2}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->getAPIBridge()Lcom/auditude/ads/core/APIBridge;

    move-result-object v2

    iget-object v3, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-virtual {v3}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3, p0}, Lcom/auditude/ads/session/AdExperienceController;-><init>(Lcom/auditude/ads/response/AdResponse;Lcom/auditude/ads/core/APIBridge;Lcom/auditude/ads/core/AdSettings;Landroid/view/ViewGroup;)V

    iput-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->experienceController:Lcom/auditude/ads/session/AdExperienceController;

    .line 142
    return-void
.end method

.method public onRequestFailed(Ljava/lang/Throwable;)V
    .locals 0

    .prologue
    .line 148
    return-void
.end method

.method public final setAuditudeHandlesChapterBreaks(Z)V
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-virtual {v0, p1}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->setAuditudeHandlesChapterBreaks(Z)V

    .line 56
    return-void
.end method

.method public final setBitRate(I)V
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-virtual {v0, p1}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->setBitRate(I)V

    .line 46
    return-void
.end method

.method public setPluginEventListener(Lcom/auditude/ads/event/AuditudePluginEventListener;)V
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-virtual {v0, p1}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->setPluginEventListener(Lcom/auditude/ads/event/AuditudePluginEventListener;)V

    .line 36
    return-void
.end method

.method public final setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-virtual {v0, p1, p2}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 116
    return-void
.end method

.method public final setPublisherVersion(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-virtual {v0, p1}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->setPublisherVersion(Ljava/lang/String;)V

    .line 41
    return-void
.end method

.method public final setSize(DD)V
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->setSize(DD)V

    .line 84
    return-void
.end method

.method public setSize(II)V
    .locals 0

    .prologue
    .line 136
    return-void
.end method

.method public final setVolume(FF)V
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/auditude/ads/AuditudeAdUnit;->adUnit:Lcom/auditude/ads/AuditudeAdUnitDelegate;

    invoke-virtual {v0, p1, p2}, Lcom/auditude/ads/AuditudeAdUnitDelegate;->setVolume(FF)V

    .line 51
    return-void
.end method
