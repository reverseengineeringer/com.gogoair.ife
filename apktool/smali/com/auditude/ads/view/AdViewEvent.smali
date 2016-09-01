.class public Lcom/auditude/ads/view/AdViewEvent;
.super Lcom/auditude/ads/util/event/Event;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;
    }
.end annotation


# instance fields
.field private data:Ljava/util/HashMap;

.field private source:Lcom/auditude/ads/view/model/IAdViewSource;

.field private type:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

.field private view:Lcom/auditude/ads/view/IAdView;


# direct methods
.method public constructor <init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;Lcom/auditude/ads/view/model/IAdViewSource;Lcom/auditude/ads/view/IAdView;)V
    .locals 6

    .prologue
    .line 34
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/view/AdViewEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;Lcom/auditude/ads/view/model/IAdViewSource;Lcom/auditude/ads/view/IAdView;Ljava/util/HashMap;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;Lcom/auditude/ads/view/model/IAdViewSource;Lcom/auditude/ads/view/IAdView;Ljava/util/HashMap;)V
    .locals 2

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/auditude/ads/util/event/Event;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;)V

    .line 30
    invoke-static {}, Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;->values()[Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/auditude/ads/view/AdViewEvent;->type:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    .line 41
    iput-object p2, p0, Lcom/auditude/ads/view/AdViewEvent;->type:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    .line 42
    iput-object p3, p0, Lcom/auditude/ads/view/AdViewEvent;->source:Lcom/auditude/ads/view/model/IAdViewSource;

    .line 43
    iput-object p4, p0, Lcom/auditude/ads/view/AdViewEvent;->view:Lcom/auditude/ads/view/IAdView;

    .line 44
    iput-object p5, p0, Lcom/auditude/ads/view/AdViewEvent;->data:Ljava/util/HashMap;

    .line 45
    return-void
.end method


# virtual methods
.method public final getData()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/auditude/ads/view/AdViewEvent;->data:Ljava/util/HashMap;

    return-object v0
.end method

.method public final getSource()Lcom/auditude/ads/view/model/IAdViewSource;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/auditude/ads/view/AdViewEvent;->source:Lcom/auditude/ads/view/model/IAdViewSource;

    return-object v0
.end method

.method public final getType()Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/auditude/ads/view/AdViewEvent;->type:Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;

    return-object v0
.end method

.method public final getView()Lcom/auditude/ads/view/IAdView;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/auditude/ads/view/AdViewEvent;->view:Lcom/auditude/ads/view/IAdView;

    return-object v0
.end method
