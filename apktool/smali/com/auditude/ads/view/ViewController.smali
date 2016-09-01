.class public Lcom/auditude/ads/view/ViewController;
.super Lcom/auditude/ads/util/event/EventDispatcher;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/view/IViewController;
.implements Ljava/beans/PropertyChangeListener;


# static fields
.field public static final PROPERTY_CHANGE:Ljava/lang/String; = "propertyChange"


# instance fields
.field private api:Lcom/auditude/ads/core/APIBridge;

.field private isInBreak:Z

.field private settings:Lcom/auditude/ads/core/AdSettings;


# direct methods
.method public constructor <init>(Lcom/auditude/ads/core/APIBridge;Lcom/auditude/ads/core/AdSettings;)V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/auditude/ads/util/event/EventDispatcher;-><init>()V

    .line 18
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/view/ViewController;->isInBreak:Z

    .line 24
    iput-object p1, p0, Lcom/auditude/ads/view/ViewController;->api:Lcom/auditude/ads/core/APIBridge;

    .line 26
    iput-object p2, p0, Lcom/auditude/ads/view/ViewController;->settings:Lcom/auditude/ads/core/AdSettings;

    .line 27
    iget-object v0, p0, Lcom/auditude/ads/view/ViewController;->settings:Lcom/auditude/ads/core/AdSettings;

    invoke-virtual {v0, p0}, Lcom/auditude/ads/core/AdSettings;->addPropertyChangeListener(Ljava/beans/PropertyChangeListener;)V

    .line 28
    return-void
.end method


# virtual methods
.method public addPropertyChangeListener(Lcom/auditude/ads/util/event/IEventListener;)V
    .locals 1

    .prologue
    .line 97
    if-eqz p1, :cond_0

    .line 99
    const-string v0, "propertyChange"

    invoke-virtual {p0, v0, p1}, Lcom/auditude/ads/view/ViewController;->addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 101
    :cond_0
    return-void
.end method

.method public final dispose()V
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/auditude/ads/view/ViewController;->settings:Lcom/auditude/ads/core/AdSettings;

    if-eqz v0, :cond_0

    .line 118
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/view/ViewController;->settings:Lcom/auditude/ads/core/AdSettings;

    .line 120
    :cond_0
    return-void
.end method

.method public final getBitRate()I
    .locals 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/auditude/ads/view/ViewController;->settings:Lcom/auditude/ads/core/AdSettings;

    const-string v1, "bitrate"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public final getHeight()I
    .locals 2

    .prologue
    .line 62
    iget-object v0, p0, Lcom/auditude/ads/view/ViewController;->settings:Lcom/auditude/ads/core/AdSettings;

    const-string v1, "height"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/auditude/ads/util/ObjectUtil;->convertToInt(Ljava/lang/Object;I)I

    move-result v0

    return v0
.end method

.method public final getIsInBreak()Z
    .locals 1

    .prologue
    .line 72
    iget-boolean v0, p0, Lcom/auditude/ads/view/ViewController;->isInBreak:Z

    return v0
.end method

.method public final getLeftVolume()F
    .locals 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/auditude/ads/view/ViewController;->settings:Lcom/auditude/ads/core/AdSettings;

    const-string v1, "leftVolume"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/auditude/ads/util/ObjectUtil;->convertToFloat(Ljava/lang/Object;F)F

    move-result v0

    return v0
.end method

.method public final getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/auditude/ads/view/ViewController;->settings:Lcom/auditude/ads/core/AdSettings;

    invoke-virtual {v0, p1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getRightVolume()F
    .locals 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/auditude/ads/view/ViewController;->settings:Lcom/auditude/ads/core/AdSettings;

    const-string v1, "rightVolume"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/auditude/ads/util/ObjectUtil;->convertToFloat(Ljava/lang/Object;F)F

    move-result v0

    return v0
.end method

.method public final getWidth()I
    .locals 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/auditude/ads/view/ViewController;->settings:Lcom/auditude/ads/core/AdSettings;

    const-string v1, "width"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/auditude/ads/util/ObjectUtil;->convertToInt(Ljava/lang/Object;I)I

    move-result v0

    return v0
.end method

.method public final hasProperty(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/auditude/ads/view/ViewController;->settings:Lcom/auditude/ads/core/AdSettings;

    invoke-virtual {v0, p1}, Lcom/auditude/ads/core/AdSettings;->hasProperty(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public final init()V
    .locals 0

    .prologue
    .line 33
    return-void
.end method

.method public final notifyAdViewEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;Lcom/auditude/ads/view/IAdView;Ljava/util/HashMap;)V
    .locals 6

    .prologue
    .line 37
    new-instance v0, Lcom/auditude/ads/view/AdViewEvent;

    invoke-interface {p2}, Lcom/auditude/ads/view/IAdView;->getSource()Lcom/auditude/ads/view/model/IAdViewSource;

    move-result-object v3

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/view/AdViewEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;Lcom/auditude/ads/view/model/IAdViewSource;Lcom/auditude/ads/view/IAdView;Ljava/util/HashMap;)V

    .line 42
    iget-object v1, p0, Lcom/auditude/ads/view/ViewController;->api:Lcom/auditude/ads/core/APIBridge;

    const-string v2, "adViewEvent"

    invoke-virtual {v1, v2, v0}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 43
    return-void
.end method

.method public final pauseMainMedia()V
    .locals 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/auditude/ads/view/ViewController;->api:Lcom/auditude/ads/core/APIBridge;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/APIBridge;->pauseMainMedia(Ljava/util/HashMap;)V

    .line 78
    return-void
.end method

.method public propertyChange(Ljava/beans/PropertyChangeEvent;)V
    .locals 1

    .prologue
    .line 110
    const-string v0, "propertyChange"

    invoke-virtual {p0, v0, p1}, Lcom/auditude/ads/view/ViewController;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 111
    return-void
.end method

.method public removePropertyChangeListener(Lcom/auditude/ads/util/event/IEventListener;)V
    .locals 1

    .prologue
    .line 105
    const-string v0, "propertyChange"

    invoke-virtual {p0, v0, p1}, Lcom/auditude/ads/view/ViewController;->removeEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 106
    return-void
.end method

.method public final resumeMainMedia()V
    .locals 2

    .prologue
    .line 82
    iget-object v0, p0, Lcom/auditude/ads/view/ViewController;->api:Lcom/auditude/ads/core/APIBridge;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/APIBridge;->resumeMainMedia(Ljava/util/HashMap;)V

    .line 83
    return-void
.end method
