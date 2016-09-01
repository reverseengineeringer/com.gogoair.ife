.class public Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final HTML:Ljava/lang/String; = "html"

.field public static final IFRAME:Ljava/lang/String; = "iframe"

.field public static final OTHER:Ljava/lang/String; = "other"

.field public static final SCRIPT:Ljava/lang/String; = "script"

.field public static final STATIC:Ljava/lang/String; = "static"


# instance fields
.field public adId:Ljava/lang/String;

.field public adParameters:Ljava/lang/String;

.field public altText:Ljava/lang/String;

.field public apiFramework:Ljava/lang/String;

.field public clickThroughUrl:Ljava/lang/String;

.field public clickTrackingUrls:Ljava/util/ArrayList;

.field public creativeType:Ljava/lang/String;

.field public expandedHeight:I

.field public expandedWidth:I

.field public height:I

.field public id:Ljava/lang/String;

.field public maintainAspectRatio:Z

.field public resourceType:Ljava/lang/String;

.field public scalable:Z

.field public sequence:I

.field private trackingEvents:Ljava/util/ArrayList;

.field public url:Ljava/lang/String;

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput v0, p0, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->width:I

    .line 23
    iput v0, p0, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->height:I

    .line 24
    iput v0, p0, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->expandedWidth:I

    .line 25
    iput v0, p0, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->expandedHeight:I

    .line 7
    return-void
.end method


# virtual methods
.method public final addClickTrakingUrl(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->clickTrackingUrls:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 99
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->clickTrackingUrls:Ljava/util/ArrayList;

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->clickTrackingUrls:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    return-void
.end method

.method public final addTrackingEvent(Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;)V
    .locals 3

    .prologue
    .line 50
    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;->type:Ljava/lang/String;

    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 75
    :cond_0
    :goto_0
    return-void

    .line 55
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->trackingEvents:Ljava/util/ArrayList;

    if-nez v0, :cond_2

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->trackingEvents:Ljava/util/ArrayList;

    .line 60
    :cond_2
    iget-object v0, p1, Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;->type:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;

    move-result-object v1

    .line 61
    if-nez v1, :cond_3

    .line 63
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->trackingEvents:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 67
    :cond_3
    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 69
    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTTrackingUrl;

    .line 71
    invoke-virtual {v1, v0}, Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;->addTrackingUrl(Lcom/auditude/ads/network/vast/model/VASTTrackingUrl;)V

    goto :goto_1
.end method

.method public final getClickTrackingUrls()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->clickTrackingUrls:Ljava/util/ArrayList;

    return-object v0
.end method

.method public final getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 79
    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->trackingEvents:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    :cond_0
    move-object v0, v1

    .line 92
    :goto_0
    return-object v0

    .line 84
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->trackingEvents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_3

    move-object v0, v1

    .line 92
    goto :goto_0

    .line 84
    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;

    .line 86
    iget-object v3, v0, Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;->type:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0
.end method

.method public final getTrackingEvents()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->trackingEvents:Ljava/util/ArrayList;

    return-object v0
.end method

.method public final setTrackingEvents(Ljava/util/ArrayList;)V
    .locals 0

    .prologue
    .line 45
    iput-object p1, p0, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->trackingEvents:Ljava/util/ArrayList;

    .line 46
    return-void
.end method
