.class public Lcom/auditude/ads/model/BaseElement;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public errorUrl:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private parent:Lcom/auditude/ads/model/BaseElement;

.field private state:Ljava/util/HashMap;

.field private trackingEvents:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lcom/auditude/ads/model/BaseElement;)V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/model/BaseElement;->trackingEvents:Ljava/util/ArrayList;

    .line 19
    iput-object p1, p0, Lcom/auditude/ads/model/BaseElement;->parent:Lcom/auditude/ads/model/BaseElement;

    .line 20
    return-void
.end method


# virtual methods
.method public final addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 69
    const/4 v0, 0x1

    invoke-virtual {p0, p2, v0}, Lcom/auditude/ads/model/BaseElement;->getTrackingEventByType(Ljava/lang/String;Z)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v2

    .line 70
    if-eqz v2, :cond_0

    .line 72
    invoke-virtual {v2}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    if-nez v0, :cond_1

    .line 74
    invoke-virtual {v2, p1}, Lcom/auditude/ads/model/tracking/TrackingEvent;->addTrackingUrl(Lcom/auditude/ads/model/tracking/TrackingUrl;)V

    .line 90
    :cond_0
    :goto_0
    return-void

    .line 78
    :cond_1
    const/4 v0, 0x0

    move v1, v0

    :goto_1
    invoke-virtual {v2}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v1, v0, :cond_2

    .line 87
    invoke-virtual {v2, p1}, Lcom/auditude/ads/model/tracking/TrackingEvent;->addTrackingUrl(Lcom/auditude/ads/model/tracking/TrackingUrl;)V

    goto :goto_0

    .line 80
    :cond_2
    invoke-virtual {v2}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    .line 81
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingUrl;->getUrl()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingUrl;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/auditude/ads/model/tracking/TrackingUrl;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 78
    :cond_3
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1
.end method

.method public final copyTrackingEventsTo(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 123
    invoke-virtual {p0, p2}, Lcom/auditude/ads/model/BaseElement;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v0

    .line 124
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 126
    const/4 v1, 0x1

    invoke-virtual {p1, p2, v1}, Lcom/auditude/ads/model/BaseElement;->getTrackingEventByType(Ljava/lang/String;Z)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v2

    .line 127
    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 138
    :cond_0
    return-void

    .line 127
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    .line 129
    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingUrl;->duplicate()Lcom/auditude/ads/model/tracking/TrackingUrl;

    move-result-object v1

    .line 130
    instance-of v0, v1, Lcom/auditude/ads/model/tracking/Submission;

    if-eqz v0, :cond_2

    move-object v0, v1

    .line 132
    check-cast v0, Lcom/auditude/ads/model/tracking/Submission;

    iput-object p3, v0, Lcom/auditude/ads/model/tracking/Submission;->externalUrl:Ljava/lang/String;

    .line 135
    :cond_2
    invoke-virtual {v2, v1}, Lcom/auditude/ads/model/tracking/TrackingEvent;->addTrackingUrl(Lcom/auditude/ads/model/tracking/TrackingUrl;)V

    goto :goto_0
.end method

.method public dispose()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 142
    iput-object v0, p0, Lcom/auditude/ads/model/BaseElement;->trackingEvents:Ljava/util/ArrayList;

    .line 143
    iput-object v0, p0, Lcom/auditude/ads/model/BaseElement;->state:Ljava/util/HashMap;

    .line 144
    iput-object v0, p0, Lcom/auditude/ads/model/BaseElement;->parent:Lcom/auditude/ads/model/BaseElement;

    .line 145
    return-void
.end method

.method public final getID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/auditude/ads/model/BaseElement;->id:Ljava/lang/String;

    return-object v0
.end method

.method public final getParent()Lcom/auditude/ads/model/BaseElement;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/auditude/ads/model/BaseElement;->parent:Lcom/auditude/ads/model/BaseElement;

    return-object v0
.end method

.method public final getState()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/auditude/ads/model/BaseElement;->state:Ljava/util/HashMap;

    return-object v0
.end method

.method public final getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/model/tracking/TrackingEvent;
    .locals 1

    .prologue
    .line 94
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/auditude/ads/model/BaseElement;->getTrackingEventByType(Ljava/lang/String;Z)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v0

    return-object v0
.end method

.method public final getTrackingEventByType(Ljava/lang/String;Z)Lcom/auditude/ads/model/tracking/TrackingEvent;
    .locals 3

    .prologue
    .line 99
    iget-object v0, p0, Lcom/auditude/ads/model/BaseElement;->trackingEvents:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 101
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p0, Lcom/auditude/ads/model/BaseElement;->trackingEvents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v1, v0, :cond_1

    .line 110
    :cond_0
    if-eqz p2, :cond_3

    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 112
    new-instance v0, Lcom/auditude/ads/model/tracking/TrackingEvent;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/auditude/ads/model/tracking/TrackingEvent;-><init>(Ljava/lang/String;)V

    .line 113
    iget-object v1, p0, Lcom/auditude/ads/model/BaseElement;->trackingEvents:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    :goto_1
    return-object v0

    .line 103
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/model/BaseElement;->trackingEvents:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingEvent;

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 105
    iget-object v0, p0, Lcom/auditude/ads/model/BaseElement;->trackingEvents:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingEvent;

    goto :goto_1

    .line 101
    :cond_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 118
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public final getTrackingEvents()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/auditude/ads/model/BaseElement;->trackingEvents:Ljava/util/ArrayList;

    return-object v0
.end method

.method public final resetTrackingEvents()V
    .locals 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/auditude/ads/model/BaseElement;->trackingEvents:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/model/BaseElement;->trackingEvents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 65
    :cond_0
    return-void

    .line 61
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/model/BaseElement;->trackingEvents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingEvent;

    .line 63
    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->reset()V

    goto :goto_0
.end method

.method public final setID(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 33
    iput-object p1, p0, Lcom/auditude/ads/model/BaseElement;->id:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public final setState(Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 42
    iput-object p1, p0, Lcom/auditude/ads/model/BaseElement;->state:Ljava/util/HashMap;

    .line 43
    return-void
.end method

.method public final setTrackingEvents(Ljava/util/ArrayList;)V
    .locals 0

    .prologue
    .line 51
    iput-object p1, p0, Lcom/auditude/ads/model/BaseElement;->trackingEvents:Ljava/util/ArrayList;

    .line 52
    return-void
.end method
