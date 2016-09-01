.class public Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/creativerepackaging/CreativeRepackagingService$CreativeRepackagingServiceListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager$VastAssetRepackagingCompletionListener;
    }
.end annotation


# static fields
.field private static final PLATFORM_HOST:Ljava/lang/String; = "theplatform.com"

.field private static final PLATFORM_HOST_CREATIVEURL_QUERY_PARAM:Ljava/lang/String; = "creativeurl"


# instance fields
.field private domain:Ljava/lang/String;

.field private linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

.field private listener:Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager$VastAssetRepackagingCompletionListener;

.field private requiredFormat:Ljava/lang/String;

.field private rootAdId:Ljava/lang/String;

.field private zoneId:I


# direct methods
.method public constructor <init>(Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager$VastAssetRepackagingCompletionListener;Lcom/auditude/ads/network/vast/model/VASTLinearCreative;Ljava/lang/String;Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackagerInfo;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    .line 18
    iput-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->rootAdId:Ljava/lang/String;

    .line 19
    iput-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->requiredFormat:Ljava/lang/String;

    .line 20
    iput-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->domain:Ljava/lang/String;

    .line 21
    const/4 v0, 0x0

    iput v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->zoneId:I

    .line 29
    iput-object p1, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->listener:Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager$VastAssetRepackagingCompletionListener;

    .line 30
    iput-object p2, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    .line 31
    iput-object p3, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->rootAdId:Ljava/lang/String;

    .line 32
    if-eqz p4, :cond_0

    .line 34
    iget-object v0, p4, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackagerInfo;->requiredFormat:Ljava/lang/String;

    iput-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->requiredFormat:Ljava/lang/String;

    .line 35
    iget-object v0, p4, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackagerInfo;->domain:Ljava/lang/String;

    iput-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->domain:Ljava/lang/String;

    .line 36
    iget v0, p4, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackagerInfo;->zoneId:I

    iput v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->zoneId:I

    .line 38
    :cond_0
    return-void
.end method

.method private creativeUrlForSource(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v0, 0x0

    .line 78
    .line 81
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 84
    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    const-string v3, "theplatform.com"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 86
    invoke-virtual {v1}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v1

    const-string v2, "&"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 87
    :goto_0
    array-length v2, v1

    if-lt v0, v2, :cond_1

    .line 117
    :cond_0
    :goto_1
    return-object p1

    .line 89
    :cond_1
    aget-object v2, v1, v0

    .line 90
    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 92
    array-length v3, v2

    if-ge v3, v5, :cond_3

    .line 87
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 98
    :cond_3
    const/4 v3, 0x0

    aget-object v3, v2, v3

    const-string v4, "creativeurl"

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_2

    .line 100
    array-length v0, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_4

    .line 102
    const-string p1, ""

    goto :goto_1

    .line 105
    :cond_4
    const/4 v0, 0x1

    :try_start_1
    aget-object p1, v2, v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 115
    :catch_0
    move-exception v0

    goto :goto_1
.end method


# virtual methods
.method public onError(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 148
    iget-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->listener:Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager$VastAssetRepackagingCompletionListener;

    if-eqz v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->listener:Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager$VastAssetRepackagingCompletionListener;

    iget-object v1, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager$VastAssetRepackagingCompletionListener;->onRepackagingComplete(Lcom/auditude/ads/network/vast/model/VASTLinearCreative;Z)V

    .line 153
    :cond_0
    return-void
.end method

.method public onURLAvaliable(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 122
    iget-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    if-eqz v0, :cond_0

    .line 124
    iget-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->getBestMediaFile()Lcom/auditude/ads/network/vast/model/VASTMediaFile;

    move-result-object v0

    .line 125
    if-eqz v0, :cond_0

    .line 127
    iput-object p1, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->url:Ljava/lang/String;

    .line 128
    iget-object v1, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->requiredFormat:Ljava/lang/String;

    iput-object v1, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->type:Ljava/lang/String;

    .line 132
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    const-string v1, "creativeview"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;

    move-result-object v0

    .line 133
    if-nez v0, :cond_1

    .line 135
    new-instance v0, Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;

    const-string v1, "creativeview"

    invoke-direct {v0, v1}, Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;-><init>(Ljava/lang/String;)V

    .line 136
    iget-object v1, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    invoke-virtual {v1, v0}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->addTrackingEvent(Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;)V

    .line 138
    :cond_1
    new-instance v1, Lcom/auditude/ads/network/vast/model/VASTTrackingUrl;

    const-string v2, "creativeview"

    invoke-direct {v1, p2, v2}, Lcom/auditude/ads/network/vast/model/VASTTrackingUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;->addTrackingUrl(Lcom/auditude/ads/network/vast/model/VASTTrackingUrl;)V

    .line 140
    iget-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->listener:Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager$VastAssetRepackagingCompletionListener;

    if-eqz v0, :cond_2

    .line 142
    iget-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->listener:Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager$VastAssetRepackagingCompletionListener;

    iget-object v1, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager$VastAssetRepackagingCompletionListener;->onRepackagingComplete(Lcom/auditude/ads/network/vast/model/VASTLinearCreative;Z)V

    .line 144
    :cond_2
    return-void
.end method

.method public repackage()V
    .locals 4

    .prologue
    .line 42
    new-instance v1, Lcom/auditude/creativerepackaging/AuditudeParameters;

    invoke-direct {v1}, Lcom/auditude/creativerepackaging/AuditudeParameters;-><init>()V

    .line 43
    iget v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->zoneId:I

    invoke-virtual {v1, v0}, Lcom/auditude/creativerepackaging/AuditudeParameters;->setZoneId(I)V

    .line 44
    iget-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->domain:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/auditude/creativerepackaging/AuditudeParameters;->setDomain(Ljava/lang/String;)V

    .line 45
    iget-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->rootAdId:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/auditude/creativerepackaging/AuditudeParameters;->setAdId(Ljava/lang/String;)V

    .line 46
    iget-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    iget-object v0, v0, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->adId:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/auditude/creativerepackaging/AuditudeParameters;->setExternalAdId(Ljava/lang/String;)V

    .line 48
    new-instance v2, Lcom/auditude/creativerepackaging/RepackagingParameters;

    invoke-direct {v2}, Lcom/auditude/creativerepackaging/RepackagingParameters;-><init>()V

    .line 49
    iget-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->requiredFormat:Ljava/lang/String;

    invoke-virtual {v2, v0}, Lcom/auditude/creativerepackaging/RepackagingParameters;->setRequiredFormat(Ljava/lang/String;)V

    .line 51
    const/4 v0, 0x0

    .line 52
    iget-object v3, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    if-eqz v3, :cond_0

    .line 54
    iget-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->getBestMediaFile()Lcom/auditude/ads/network/vast/model/VASTMediaFile;

    move-result-object v0

    .line 57
    :cond_0
    if-eqz v0, :cond_2

    iget-object v3, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->url:Ljava/lang/String;

    if-eqz v3, :cond_2

    .line 59
    iget-object v3, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->url:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->creativeUrlForSource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/auditude/creativerepackaging/RepackagingParameters;->setCreativeURL(Ljava/lang/String;)V

    .line 60
    iget v3, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->height:I

    invoke-virtual {v2, v3}, Lcom/auditude/creativerepackaging/RepackagingParameters;->setVideoHeight(I)V

    .line 61
    iget v0, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->width:I

    invoke-virtual {v2, v0}, Lcom/auditude/creativerepackaging/RepackagingParameters;->setVideoWidth(I)V

    .line 73
    :cond_1
    new-instance v0, Lcom/auditude/creativerepackaging/CreativeRepackagingService;

    invoke-direct {v0, v1, v2, p0}, Lcom/auditude/creativerepackaging/CreativeRepackagingService;-><init>(Lcom/auditude/creativerepackaging/AuditudeParameters;Lcom/auditude/creativerepackaging/RepackagingParameters;Lcom/auditude/creativerepackaging/CreativeRepackagingService$CreativeRepackagingServiceListener;)V

    .line 74
    :goto_0
    return-void

    .line 65
    :cond_2
    iget-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->listener:Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager$VastAssetRepackagingCompletionListener;

    if-eqz v0, :cond_1

    .line 67
    iget-object v0, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->listener:Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager$VastAssetRepackagingCompletionListener;

    iget-object v1, p0, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackager$VastAssetRepackagingCompletionListener;->onRepackagingComplete(Lcom/auditude/ads/network/vast/model/VASTLinearCreative;Z)V

    goto :goto_0
.end method
