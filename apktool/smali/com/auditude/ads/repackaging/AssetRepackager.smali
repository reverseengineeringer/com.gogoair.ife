.class public Lcom/auditude/ads/repackaging/AssetRepackager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/creativerepackaging/CreativeRepackagingService$CreativeRepackagingServiceListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;
    }
.end annotation


# static fields
.field private static final EMPTY_EXTERNAL_AD_ID:Ljava/lang/String; = "0"

.field private static final PLATFORM_HOST:Ljava/lang/String; = "theplatform.com"

.field private static final PLATFORM_HOST_CREATIVEURL_QUERY_PARAM:Ljava/lang/String; = "creativeurl"


# instance fields
.field private asset:Lcom/auditude/ads/model/Asset;

.field private domain:Ljava/lang/String;

.field private listener:Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;

.field private requiredFormat:Ljava/lang/String;

.field private zoneId:I


# direct methods
.method public constructor <init>(Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;Lcom/auditude/ads/model/Asset;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p2, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->asset:Lcom/auditude/ads/model/Asset;

    .line 28
    iput-object p3, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->requiredFormat:Ljava/lang/String;

    .line 29
    iput-object p4, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->domain:Ljava/lang/String;

    .line 30
    iput p5, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->zoneId:I

    .line 31
    iput-object p1, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->listener:Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;

    .line 32
    return-void
.end method

.method private creativeUrlForSource(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v0, 0x0

    .line 77
    .line 80
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 83
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

    .line 85
    invoke-virtual {v1}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v1

    const-string v2, "&"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 86
    :goto_0
    array-length v2, v1

    if-lt v0, v2, :cond_1

    .line 116
    :cond_0
    :goto_1
    return-object p1

    .line 88
    :cond_1
    aget-object v2, v1, v0

    .line 89
    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 91
    array-length v3, v2

    if-ge v3, v5, :cond_3

    .line 86
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 97
    :cond_3
    const/4 v3, 0x0

    aget-object v3, v2, v3

    const-string v4, "creativeurl"

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_2

    .line 99
    array-length v0, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_4

    .line 101
    const-string p1, ""

    goto :goto_1

    .line 104
    :cond_4
    const/4 v0, 0x1

    :try_start_1
    aget-object p1, v2, v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 114
    :catch_0
    move-exception v0

    goto :goto_1
.end method


# virtual methods
.method public onError(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 144
    iget-object v0, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->listener:Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->listener:Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;

    iget-object v1, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->asset:Lcom/auditude/ads/model/Asset;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;->onRepackagingComplete(Lcom/auditude/ads/model/Asset;Z)V

    .line 148
    :cond_0
    return-void
.end method

.method public onURLAvaliable(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 121
    iget-object v0, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->asset:Lcom/auditude/ads/model/Asset;

    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getBestMediaFile()Lcom/auditude/ads/model/media/MediaFile;

    move-result-object v0

    .line 122
    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->asset:Lcom/auditude/ads/model/Asset;

    invoke-virtual {v1}, Lcom/auditude/ads/model/Asset;->getMediaFiles()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 124
    iget-object v0, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->asset:Lcom/auditude/ads/model/Asset;

    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getMediaFile()Lcom/auditude/ads/model/media/MediaFile;

    move-result-object v0

    .line 127
    :cond_0
    if-eqz v0, :cond_1

    .line 129
    iput-object p1, v0, Lcom/auditude/ads/model/media/MediaFile;->source:Ljava/lang/String;

    .line 130
    iget-object v1, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->requiredFormat:Ljava/lang/String;

    iput-object v1, v0, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    .line 133
    :cond_1
    new-instance v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    const-string v1, "creativeview"

    invoke-direct {v0, p2, v1}, Lcom/auditude/ads/model/tracking/TrackingUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    iget-object v1, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->asset:Lcom/auditude/ads/model/Asset;

    const-string v2, "creativeview"

    invoke-virtual {v1, v0, v2}, Lcom/auditude/ads/model/Asset;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    .line 136
    iget-object v0, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->listener:Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;

    if-eqz v0, :cond_2

    .line 138
    iget-object v0, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->listener:Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;

    iget-object v1, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->asset:Lcom/auditude/ads/model/Asset;

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;->onRepackagingComplete(Lcom/auditude/ads/model/Asset;Z)V

    .line 140
    :cond_2
    return-void
.end method

.method public repackage()V
    .locals 4

    .prologue
    .line 36
    new-instance v0, Lcom/auditude/creativerepackaging/AuditudeParameters;

    invoke-direct {v0}, Lcom/auditude/creativerepackaging/AuditudeParameters;-><init>()V

    .line 37
    iget v1, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->zoneId:I

    invoke-virtual {v0, v1}, Lcom/auditude/creativerepackaging/AuditudeParameters;->setZoneId(I)V

    .line 39
    iget-object v1, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->asset:Lcom/auditude/ads/model/Asset;

    invoke-virtual {v1}, Lcom/auditude/ads/model/Asset;->getParent()Lcom/auditude/ads/model/BaseElement;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/model/BaseElement;->getID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/auditude/creativerepackaging/AuditudeParameters;->setAdId(Ljava/lang/String;)V

    .line 40
    iget-object v1, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->asset:Lcom/auditude/ads/model/Asset;

    invoke-virtual {v1}, Lcom/auditude/ads/model/Asset;->isNetworkAd()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 42
    iget-object v1, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->asset:Lcom/auditude/ads/model/Asset;

    invoke-virtual {v1}, Lcom/auditude/ads/model/Asset;->getNetworkAdId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/auditude/creativerepackaging/AuditudeParameters;->setExternalAdId(Ljava/lang/String;)V

    .line 49
    :goto_0
    iget-object v1, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->domain:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/auditude/creativerepackaging/AuditudeParameters;->setDomain(Ljava/lang/String;)V

    .line 51
    new-instance v1, Lcom/auditude/creativerepackaging/RepackagingParameters;

    invoke-direct {v1}, Lcom/auditude/creativerepackaging/RepackagingParameters;-><init>()V

    .line 52
    iget-object v2, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->requiredFormat:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/auditude/creativerepackaging/RepackagingParameters;->setRequiredFormat(Ljava/lang/String;)V

    .line 54
    iget-object v2, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->asset:Lcom/auditude/ads/model/Asset;

    invoke-virtual {v2}, Lcom/auditude/ads/model/Asset;->getBestMediaFile()Lcom/auditude/ads/model/media/MediaFile;

    move-result-object v2

    .line 56
    if-eqz v2, :cond_2

    iget-object v3, v2, Lcom/auditude/ads/model/media/MediaFile;->source:Ljava/lang/String;

    if-eqz v3, :cond_2

    .line 58
    iget-object v3, v2, Lcom/auditude/ads/model/media/MediaFile;->source:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/auditude/ads/repackaging/AssetRepackager;->creativeUrlForSource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/auditude/creativerepackaging/RepackagingParameters;->setCreativeURL(Ljava/lang/String;)V

    .line 59
    iget v3, v2, Lcom/auditude/ads/model/media/MediaFile;->height:I

    invoke-virtual {v1, v3}, Lcom/auditude/creativerepackaging/RepackagingParameters;->setVideoHeight(I)V

    .line 60
    iget v2, v2, Lcom/auditude/ads/model/media/MediaFile;->width:I

    invoke-virtual {v1, v2}, Lcom/auditude/creativerepackaging/RepackagingParameters;->setVideoWidth(I)V

    .line 72
    :cond_0
    new-instance v2, Lcom/auditude/creativerepackaging/CreativeRepackagingService;

    invoke-direct {v2, v0, v1, p0}, Lcom/auditude/creativerepackaging/CreativeRepackagingService;-><init>(Lcom/auditude/creativerepackaging/AuditudeParameters;Lcom/auditude/creativerepackaging/RepackagingParameters;Lcom/auditude/creativerepackaging/CreativeRepackagingService$CreativeRepackagingServiceListener;)V

    .line 73
    :goto_1
    return-void

    .line 46
    :cond_1
    const-string v1, "0"

    invoke-virtual {v0, v1}, Lcom/auditude/creativerepackaging/AuditudeParameters;->setExternalAdId(Ljava/lang/String;)V

    goto :goto_0

    .line 64
    :cond_2
    iget-object v2, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->listener:Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;

    if-eqz v2, :cond_0

    .line 66
    iget-object v0, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->listener:Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;

    iget-object v1, p0, Lcom/auditude/ads/repackaging/AssetRepackager;->asset:Lcom/auditude/ads/model/Asset;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/auditude/ads/repackaging/AssetRepackager$AssetRepackagingCompletionListener;->onRepackagingComplete(Lcom/auditude/ads/model/Asset;Z)V

    goto :goto_1
.end method
