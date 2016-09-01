.class public Lcom/auditude/ads/model/tracking/TrackingEvent;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private trackingUrls:Ljava/util/ArrayList;

.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/auditude/ads/model/tracking/TrackingEvent;->type:Ljava/lang/String;

    .line 13
    return-void
.end method


# virtual methods
.method public final addTrackingUrl(Lcom/auditude/ads/model/tracking/TrackingUrl;)V
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/auditude/ads/model/tracking/TrackingEvent;->trackingUrls:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/model/tracking/TrackingEvent;->trackingUrls:Ljava/util/ArrayList;

    .line 26
    :cond_0
    if-eqz p1, :cond_1

    .line 28
    iget-object v0, p0, Lcom/auditude/ads/model/tracking/TrackingEvent;->trackingUrls:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    :cond_1
    return-void
.end method

.method public final getTrackingUrls()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/auditude/ads/model/tracking/TrackingEvent;->trackingUrls:Ljava/util/ArrayList;

    return-object v0
.end method

.method public final getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 15
    iget-object v0, p0, Lcom/auditude/ads/model/tracking/TrackingEvent;->type:Ljava/lang/String;

    return-object v0
.end method

.method public final reset()V
    .locals 3

    .prologue
    .line 34
    iget-object v0, p0, Lcom/auditude/ads/model/tracking/TrackingEvent;->trackingUrls:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 36
    iget-object v0, p0, Lcom/auditude/ads/model/tracking/TrackingEvent;->trackingUrls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 41
    :cond_0
    return-void

    .line 36
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    .line 38
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/auditude/ads/model/tracking/TrackingUrl;->setLogged(Z)V

    goto :goto_0
.end method
