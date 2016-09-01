.class public abstract Lcom/auditude/ads/view/AdView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/util/event/IEventListener;
.implements Lcom/auditude/ads/view/IAdView;


# instance fields
.field private controller:Lcom/auditude/ads/view/IViewController;

.field private session:Lcom/auditude/ads/session/IPlaybackSession;

.field private source:Lcom/auditude/ads/view/model/IAdViewSource;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 24
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 19
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    .line 26
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/AdView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 139
    iput-object v1, p0, Lcom/auditude/ads/view/AdView;->source:Lcom/auditude/ads/view/model/IAdViewSource;

    .line 141
    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    if-eqz v0, :cond_0

    .line 143
    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    invoke-interface {v0, p0}, Lcom/auditude/ads/view/IViewController;->removePropertyChangeListener(Lcom/auditude/ads/util/event/IEventListener;)V

    .line 144
    iput-object v1, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    .line 146
    :cond_0
    return-void
.end method

.method public final getAsset()Lcom/auditude/ads/model/IAsset;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->source:Lcom/auditude/ads/view/model/IAdViewSource;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->source:Lcom/auditude/ads/view/model/IAdViewSource;

    invoke-interface {v0}, Lcom/auditude/ads/view/model/IAdViewSource;->getAsset()Lcom/auditude/ads/model/IAsset;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getController()Lcom/auditude/ads/view/IViewController;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    return-object v0
.end method

.method public getDuration()I
    .locals 1

    .prologue
    .line 47
    const/4 v0, 0x0

    return v0
.end method

.method public getLeftVolume()F
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    invoke-interface {v0}, Lcom/auditude/ads/view/IViewController;->getLeftVolume()F

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPlaybackSession()Lcom/auditude/ads/session/IPlaybackSession;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->session:Lcom/auditude/ads/session/IPlaybackSession;

    return-object v0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 49
    const/4 v0, 0x0

    return v0
.end method

.method public getRightVolume()F
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    invoke-interface {v0}, Lcom/auditude/ads/view/IViewController;->getRightVolume()F

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getSource()Lcom/auditude/ads/view/model/IAdViewSource;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->source:Lcom/auditude/ads/view/model/IAdViewSource;

    return-object v0
.end method

.method public hide(Lcom/auditude/ads/view/model/IAdViewSource;)V
    .locals 0

    .prologue
    .line 95
    return-void
.end method

.method public initialize(Lcom/auditude/ads/view/IViewController;)V
    .locals 1

    .prologue
    .line 66
    iput-object p1, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    .line 67
    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    invoke-interface {v0, p0}, Lcom/auditude/ads/view/IViewController;->addPropertyChangeListener(Lcom/auditude/ads/util/event/IEventListener;)V

    .line 68
    return-void
.end method

.method public final notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;)V
    .locals 1

    .prologue
    .line 72
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/auditude/ads/view/AdView;->notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;Ljava/util/HashMap;)V

    .line 73
    return-void
.end method

.method public final notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;Ljava/util/HashMap;)V
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    invoke-interface {v0, p1, p0, p2}, Lcom/auditude/ads/view/IViewController;->notifyAdViewEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;Lcom/auditude/ads/view/IAdView;Ljava/util/HashMap;)V

    .line 81
    :cond_0
    return-void
.end method

.method public onEvent(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    .prologue
    .line 130
    instance-of v0, p2, Ljava/beans/PropertyChangeEvent;

    if-eqz v0, :cond_0

    .line 132
    check-cast p2, Ljava/beans/PropertyChangeEvent;

    .line 133
    invoke-virtual {p2}, Ljava/beans/PropertyChangeEvent;->getPropertyName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/beans/PropertyChangeEvent;->getOldValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2}, Ljava/beans/PropertyChangeEvent;->getNewValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/auditude/ads/view/AdView;->propertyChanged(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 135
    :cond_0
    return-void
.end method

.method protected propertyChanged(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 109
    :try_start_0
    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 126
    :cond_0
    :goto_0
    return-void

    .line 114
    :cond_1
    const-string v0, "width"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "height"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 116
    :cond_2
    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    invoke-interface {v0}, Lcom/auditude/ads/view/IViewController;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    invoke-interface {v1}, Lcom/auditude/ads/view/IViewController;->getHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/view/AdView;->resize(II)V

    goto :goto_0

    .line 123
    :catch_0
    move-exception v0

    goto :goto_0

    .line 118
    :cond_3
    const-string v0, "leftVolume"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 120
    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    invoke-interface {v0}, Lcom/auditude/ads/view/IViewController;->getLeftVolume()F

    move-result v0

    iget-object v1, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    invoke-interface {v1}, Lcom/auditude/ads/view/IViewController;->getRightVolume()F

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/view/AdView;->setVolume(FF)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method

.method public reset()V
    .locals 0

    .prologue
    .line 97
    return-void
.end method

.method protected resize(II)V
    .locals 0

    .prologue
    .line 103
    return-void
.end method

.method public setPlaybackSession(Lcom/auditude/ads/session/IPlaybackSession;)V
    .locals 0

    .prologue
    .line 53
    iput-object p1, p0, Lcom/auditude/ads/view/AdView;->session:Lcom/auditude/ads/session/IPlaybackSession;

    return-void
.end method

.method protected final setSource(Lcom/auditude/ads/view/model/IAdViewSource;)V
    .locals 0

    .prologue
    .line 57
    iput-object p1, p0, Lcom/auditude/ads/view/AdView;->source:Lcom/auditude/ads/view/model/IAdViewSource;

    return-void
.end method

.method public setVolume(FF)V
    .locals 0

    .prologue
    .line 43
    return-void
.end method

.method public shouldAddToStage()Z
    .locals 1

    .prologue
    .line 29
    const/4 v0, 0x1

    return v0
.end method

.method public shouldNotifyAdBeginOnLoad()Z
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x0

    return v0
.end method

.method public show(Lcom/auditude/ads/view/model/IAdViewSource;)V
    .locals 2

    .prologue
    .line 85
    iput-object p1, p0, Lcom/auditude/ads/view/AdView;->source:Lcom/auditude/ads/view/model/IAdViewSource;

    .line 87
    iget-object v0, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    invoke-interface {v0}, Lcom/auditude/ads/view/IViewController;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/auditude/ads/view/AdView;->controller:Lcom/auditude/ads/view/IViewController;

    invoke-interface {v1}, Lcom/auditude/ads/view/IViewController;->getHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/view/AdView;->resize(II)V

    .line 88
    return-void
.end method

.method public show(Lcom/auditude/ads/view/model/IAdViewSource;Lcom/auditude/ads/view/model/IAdViewSource;)V
    .locals 0

    .prologue
    .line 92
    invoke-virtual {p0, p1}, Lcom/auditude/ads/view/AdView;->show(Lcom/auditude/ads/view/model/IAdViewSource;)V

    .line 93
    return-void
.end method
