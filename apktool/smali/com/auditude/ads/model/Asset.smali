.class public Lcom/auditude/ads/model/Asset;
.super Lcom/auditude/ads/model/BaseElement;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/model/IAsset;


# static fields
.field public static final TYPE_COMPANION:Ljava/lang/String; = "companion"

.field public static final TYPE_LINEAR:Ljava/lang/String; = "linear"

.field public static final TYPE_NONLINEAR:Ljava/lang/String; = "nonlinear"

.field public static final TYPE_UNKNOWN:Ljava/lang/String; = "unknown"


# instance fields
.field private adParameters:Ljava/lang/String;

.field private apiFramework:Ljava/lang/String;

.field private auditudeParams:Ljava/util/HashMap;

.field private click:Lcom/auditude/ads/model/IClick;

.field private companionRequired:Ljava/lang/String;

.field private creativeType:Ljava/lang/String;

.field private customData:Ljava/util/HashMap;

.field private description:Ljava/lang/String;

.field private duration:I

.field private format:Ljava/lang/String;

.field private height:I

.field private isDisplayed:Z

.field private leadTime:I

.field private mediaFiles:Ljava/util/ArrayList;

.field private networkAdId:Ljava/lang/String;

.field private resourceType:Ljava/lang/String;

.field private skipOffset:I

.field private title:Ljava/lang/String;

.field private width:I


# direct methods
.method public constructor <init>(Lcom/auditude/ads/model/BaseElement;)V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/auditude/ads/model/BaseElement;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 30
    const/4 v0, -0x1

    iput v0, p0, Lcom/auditude/ads/model/Asset;->skipOffset:I

    .line 31
    const-string v0, "none"

    iput-object v0, p0, Lcom/auditude/ads/model/Asset;->companionRequired:Ljava/lang/String;

    .line 33
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/model/Asset;->auditudeParams:Ljava/util/HashMap;

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/model/Asset;->mediaFiles:Ljava/util/ArrayList;

    .line 47
    return-void
.end method


# virtual methods
.method public final AddMediaFile(Lcom/auditude/ads/model/media/MediaFile;)V
    .locals 1

    .prologue
    .line 294
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->mediaFiles:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 296
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/model/Asset;->mediaFiles:Ljava/util/ArrayList;

    .line 298
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->mediaFiles:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 299
    return-void
.end method

.method public CopyTo(Lcom/auditude/ads/model/Asset;)V
    .locals 4

    .prologue
    .line 353
    if-nez p1, :cond_0

    .line 378
    :goto_0
    return-void

    .line 358
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->auditudeParams:Ljava/util/HashMap;

    iput-object v0, p1, Lcom/auditude/ads/model/Asset;->auditudeParams:Ljava/util/HashMap;

    .line 359
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->customData:Ljava/util/HashMap;

    iput-object v0, p1, Lcom/auditude/ads/model/Asset;->customData:Ljava/util/HashMap;

    .line 363
    iget-object v0, p1, Lcom/auditude/ads/model/Asset;->click:Lcom/auditude/ads/model/IClick;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->click:Lcom/auditude/ads/model/IClick;

    if-eqz v0, :cond_1

    .line 365
    new-instance v0, Lcom/auditude/ads/model/Click;

    invoke-direct {v0, p1}, Lcom/auditude/ads/model/Click;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 366
    invoke-virtual {p1, v0}, Lcom/auditude/ads/model/Asset;->setClick(Lcom/auditude/ads/model/IClick;)V

    .line 370
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->click:Lcom/auditude/ads/model/IClick;

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/auditude/ads/model/Asset;->click:Lcom/auditude/ads/model/IClick;

    if-eqz v0, :cond_2

    .line 372
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->click:Lcom/auditude/ads/model/IClick;

    check-cast v0, Lcom/auditude/ads/model/Click;

    iget-object v1, p1, Lcom/auditude/ads/model/Asset;->click:Lcom/auditude/ads/model/IClick;

    instance-of v1, v1, Lcom/auditude/ads/model/Click;

    if-eqz v1, :cond_3

    iget-object v1, p1, Lcom/auditude/ads/model/Asset;->click:Lcom/auditude/ads/model/IClick;

    :goto_1
    check-cast v1, Lcom/auditude/ads/model/Click;

    .line 373
    const-string v2, "click"

    iget-object v3, p1, Lcom/auditude/ads/model/Asset;->click:Lcom/auditude/ads/model/IClick;

    invoke-interface {v3}, Lcom/auditude/ads/model/IClick;->getUrl()Ljava/lang/String;

    move-result-object v3

    .line 372
    invoke-virtual {v0, v1, v2, v3}, Lcom/auditude/ads/model/Click;->copyTrackingEventsTo(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    :cond_2
    const-string v0, "creativeview"

    invoke-virtual {p1}, Lcom/auditude/ads/model/Asset;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/auditude/ads/model/Asset;->copyTrackingEventsTo(Lcom/auditude/ads/model/BaseElement;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 372
    :cond_3
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public final Reset()V
    .locals 1

    .prologue
    .line 286
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/model/Asset;->isDisplayed:Z

    .line 289
    invoke-virtual {p0}, Lcom/auditude/ads/model/Asset;->resetTrackingEvents()V

    .line 290
    return-void
.end method

.method public final Show()V
    .locals 1

    .prologue
    .line 281
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/auditude/ads/model/Asset;->isDisplayed:Z

    .line 282
    return-void
.end method

.method public final getAdParameters()Ljava/lang/String;
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->adParameters:Ljava/lang/String;

    return-object v0
.end method

.method public final getApiFramework()Ljava/lang/String;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->apiFramework:Ljava/lang/String;

    return-object v0
.end method

.method public final getAuditudeParams()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->auditudeParams:Ljava/util/HashMap;

    return-object v0
.end method

.method public final getBestMediaFile()Lcom/auditude/ads/model/media/MediaFile;
    .locals 11

    .prologue
    const/4 v2, 0x5

    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 227
    new-array v7, v2, [Ljava/lang/String;

    const-string v0, "application/x-mpegurl"

    aput-object v0, v7, v6

    const-string v0, "video/mp4"

    aput-object v0, v7, v4

    const/4 v0, 0x2

    const-string v1, "video/m4v"

    aput-object v1, v7, v0

    const/4 v0, 0x3

    const-string v1, "video/x-flv"

    aput-object v1, v7, v0

    const/4 v0, 0x4

    const-string v1, "video/webm"

    aput-object v1, v7, v0

    .line 228
    new-array v8, v2, [I

    fill-array-data v8, :array_0

    .line 229
    const/4 v2, 0x0

    .line 232
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->mediaFiles:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    move v5, v6

    move v1, v6

    .line 234
    :goto_0
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->mediaFiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v5, v0, :cond_1

    :cond_0
    move-object v0, v2

    .line 267
    :goto_1
    return-object v0

    .line 236
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->mediaFiles:Ljava/util/ArrayList;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/media/MediaFile;

    .line 237
    iget-object v3, v0, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    aget-object v9, v7, v6

    invoke-virtual {v3, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 239
    aget v1, v8, v6

    goto :goto_1

    :cond_2
    move v3, v4

    .line 244
    :goto_2
    array-length v9, v7

    if-lt v3, v9, :cond_3

    .line 234
    add-int/lit8 v0, v5, 0x1

    move v5, v0

    goto :goto_0

    .line 246
    :cond_3
    iget-object v9, v0, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    aget-object v10, v7, v3

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6

    add-int/lit8 v9, v3, -0x1

    aget v9, v8, v9

    if-ge v1, v9, :cond_6

    .line 248
    if-eqz v2, :cond_7

    .line 250
    iget-object v9, v2, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    iget-object v10, v0, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    iget v9, v0, Lcom/auditude/ads/model/media/MediaFile;->bitrate:I

    iget v10, v2, Lcom/auditude/ads/model/media/MediaFile;->bitrate:I

    if-gt v9, v10, :cond_5

    :cond_4
    iget-object v9, v2, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    iget-object v10, v0, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_6

    .line 252
    :cond_5
    aget v1, v8, v3

    move-object v2, v0

    .line 244
    :cond_6
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 258
    :cond_7
    aget v1, v8, v3

    move-object v2, v0

    .line 259
    goto :goto_3

    .line 228
    nop

    :array_0
    .array-data 4
        0x32
        0x28
        0x1e
        0x14
        0xa
    .end array-data
.end method

.method public getClick()Lcom/auditude/ads/model/IClick;
    .locals 1

    .prologue
    .line 213
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->click:Lcom/auditude/ads/model/IClick;

    return-object v0
.end method

.method public final getCompanionRequired()Ljava/lang/String;
    .locals 1

    .prologue
    .line 335
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->companionRequired:Ljava/lang/String;

    return-object v0
.end method

.method public final getCreativeType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->creativeType:Ljava/lang/String;

    return-object v0
.end method

.method public final getCustomData()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->customData:Ljava/util/HashMap;

    return-object v0
.end method

.method public final getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->description:Ljava/lang/String;

    return-object v0
.end method

.method public final getDurationInMillis()I
    .locals 1

    .prologue
    .line 195
    iget v0, p0, Lcom/auditude/ads/model/Asset;->duration:I

    return v0
.end method

.method public final getFormat()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->format:Ljava/lang/String;

    return-object v0
.end method

.method public final getHeight()I
    .locals 1

    .prologue
    .line 186
    invoke-virtual {p0}, Lcom/auditude/ads/model/Asset;->getMediaFile()Lcom/auditude/ads/model/media/MediaFile;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/auditude/ads/model/Asset;->getMediaFile()Lcom/auditude/ads/model/media/MediaFile;

    move-result-object v0

    iget v0, v0, Lcom/auditude/ads/model/media/MediaFile;->height:I

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/auditude/ads/model/Asset;->height:I

    goto :goto_0
.end method

.method public final getIsSkippable()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 330
    iget v0, p0, Lcom/auditude/ads/model/Asset;->skipOffset:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public final getLeadTimeInMillis()I
    .locals 1

    .prologue
    .line 204
    iget v0, p0, Lcom/auditude/ads/model/Asset;->leadTime:I

    return v0
.end method

.method public final getMediaFile()Lcom/auditude/ads/model/media/MediaFile;
    .locals 2

    .prologue
    .line 222
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->mediaFiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->mediaFiles:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/media/MediaFile;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getMediaFiles()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 272
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->mediaFiles:Ljava/util/ArrayList;

    return-object v0
.end method

.method public final getNetworkAdId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 344
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->networkAdId:Ljava/lang/String;

    return-object v0
.end method

.method public getResourceType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->resourceType:Ljava/lang/String;

    return-object v0
.end method

.method public final getSkipOffset()I
    .locals 1

    .prologue
    .line 321
    iget v0, p0, Lcom/auditude/ads/model/Asset;->skipOffset:I

    return v0
.end method

.method public final getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    const-string v0, "unknown"

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 83
    invoke-virtual {p0}, Lcom/auditude/ads/model/Asset;->getMediaFile()Lcom/auditude/ads/model/media/MediaFile;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 85
    invoke-virtual {p0}, Lcom/auditude/ads/model/Asset;->getMediaFile()Lcom/auditude/ads/model/media/MediaFile;

    move-result-object v0

    iget-object v0, v0, Lcom/auditude/ads/model/media/MediaFile;->source:Ljava/lang/String;

    .line 86
    invoke-virtual {p0}, Lcom/auditude/ads/model/Asset;->isNetworkAd()Z

    move-result v1

    if-nez v1, :cond_0

    .line 88
    invoke-virtual {p0}, Lcom/auditude/ads/model/Asset;->getMediaFile()Lcom/auditude/ads/model/media/MediaFile;

    move-result-object v0

    iget-object v0, v0, Lcom/auditude/ads/model/media/MediaFile;->source:Ljava/lang/String;

    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/core/AuditudeEnv;->getReportingHelper()Lcom/auditude/ads/reporting/ReportingHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/reporting/ReportingHelper;->currentAdState()Ljava/util/HashMap;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/auditude/ads/util/AuditudeUtil;->getUrlWithState(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v0

    .line 93
    :cond_0
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getWidth()I
    .locals 1

    .prologue
    .line 177
    invoke-virtual {p0}, Lcom/auditude/ads/model/Asset;->getMediaFile()Lcom/auditude/ads/model/media/MediaFile;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/auditude/ads/model/Asset;->getMediaFile()Lcom/auditude/ads/model/media/MediaFile;

    move-result-object v0

    iget v0, v0, Lcom/auditude/ads/model/media/MediaFile;->width:I

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/auditude/ads/model/Asset;->width:I

    goto :goto_0
.end method

.method public final hasAssetsWithMimeType(Ljava/util/ArrayList;)Ljava/lang/Boolean;
    .locals 5

    .prologue
    .line 303
    if-eqz p1, :cond_1

    .line 305
    iget-object v0, p0, Lcom/auditude/ads/model/Asset;->mediaFiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 316
    :cond_1
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    .line 305
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/media/MediaFile;

    .line 307
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 309
    if-eqz v0, :cond_3

    iget-object v4, v0, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    if-eqz v4, :cond_3

    iget-object v4, v0, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 311
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public final isDisplayed()Z
    .locals 1

    .prologue
    .line 172
    iget-boolean v0, p0, Lcom/auditude/ads/model/Asset;->isDisplayed:Z

    return v0
.end method

.method public final isNetworkAd()Z
    .locals 1

    .prologue
    .line 167
    invoke-virtual {p0}, Lcom/auditude/ads/model/Asset;->getParent()Lcom/auditude/ads/model/BaseElement;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/auditude/ads/model/Asset;->getParent()Lcom/auditude/ads/model/BaseElement;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/Ad;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/auditude/ads/model/Asset;->getParent()Lcom/auditude/ads/model/BaseElement;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Ad;

    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->getIsNetworkAd()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final setAdParameters(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 144
    iput-object p1, p0, Lcom/auditude/ads/model/Asset;->adParameters:Ljava/lang/String;

    .line 145
    return-void
.end method

.method public final setApiFramework(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 135
    iput-object p1, p0, Lcom/auditude/ads/model/Asset;->apiFramework:Ljava/lang/String;

    .line 136
    return-void
.end method

.method public final setAuditudeParams(Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 162
    iput-object p1, p0, Lcom/auditude/ads/model/Asset;->auditudeParams:Ljava/util/HashMap;

    .line 163
    return-void
.end method

.method public setClick(Lcom/auditude/ads/model/IClick;)V
    .locals 0

    .prologue
    .line 217
    iput-object p1, p0, Lcom/auditude/ads/model/Asset;->click:Lcom/auditude/ads/model/IClick;

    .line 218
    return-void
.end method

.method public final setCompanionRequired(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 339
    iput-object p1, p0, Lcom/auditude/ads/model/Asset;->companionRequired:Ljava/lang/String;

    .line 340
    return-void
.end method

.method public final setCreativeType(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 126
    iput-object p1, p0, Lcom/auditude/ads/model/Asset;->creativeType:Ljava/lang/String;

    .line 127
    return-void
.end method

.method public final setCustomData(Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 153
    iput-object p1, p0, Lcom/auditude/ads/model/Asset;->customData:Ljava/util/HashMap;

    .line 154
    return-void
.end method

.method public final setDescription(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 64
    iput-object p1, p0, Lcom/auditude/ads/model/Asset;->description:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public final setDurationInMillis(I)V
    .locals 0

    .prologue
    .line 199
    iput p1, p0, Lcom/auditude/ads/model/Asset;->duration:I

    .line 200
    return-void
.end method

.method public final setFormat(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 73
    iput-object p1, p0, Lcom/auditude/ads/model/Asset;->format:Ljava/lang/String;

    .line 74
    return-void
.end method

.method public final setHeight(I)V
    .locals 0

    .prologue
    .line 190
    iput p1, p0, Lcom/auditude/ads/model/Asset;->height:I

    .line 191
    return-void
.end method

.method public final setLeadTimeInMillis(I)V
    .locals 0

    .prologue
    .line 208
    iput p1, p0, Lcom/auditude/ads/model/Asset;->leadTime:I

    .line 209
    return-void
.end method

.method public final setMediaFiles(Ljava/util/ArrayList;)V
    .locals 0

    .prologue
    .line 276
    iput-object p1, p0, Lcom/auditude/ads/model/Asset;->mediaFiles:Ljava/util/ArrayList;

    .line 277
    return-void
.end method

.method public setMimeType(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 105
    invoke-virtual {p0}, Lcom/auditude/ads/model/Asset;->getMediaFile()Lcom/auditude/ads/model/media/MediaFile;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 107
    invoke-virtual {p0}, Lcom/auditude/ads/model/Asset;->getMediaFile()Lcom/auditude/ads/model/media/MediaFile;

    move-result-object v0

    iput-object p1, v0, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    .line 109
    :cond_0
    return-void
.end method

.method public final setNetworkAdId(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 348
    iput-object p1, p0, Lcom/auditude/ads/model/Asset;->networkAdId:Ljava/lang/String;

    .line 349
    return-void
.end method

.method public setResourceType(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 117
    iput-object p1, p0, Lcom/auditude/ads/model/Asset;->resourceType:Ljava/lang/String;

    .line 118
    return-void
.end method

.method public final setSkipOffset(I)V
    .locals 0

    .prologue
    .line 325
    iput p1, p0, Lcom/auditude/ads/model/Asset;->skipOffset:I

    .line 326
    return-void
.end method

.method public final setTitle(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 55
    iput-object p1, p0, Lcom/auditude/ads/model/Asset;->title:Ljava/lang/String;

    .line 56
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 97
    invoke-virtual {p0}, Lcom/auditude/ads/model/Asset;->getMediaFile()Lcom/auditude/ads/model/media/MediaFile;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {p0}, Lcom/auditude/ads/model/Asset;->getMediaFile()Lcom/auditude/ads/model/media/MediaFile;

    move-result-object v0

    iput-object p1, v0, Lcom/auditude/ads/model/media/MediaFile;->source:Ljava/lang/String;

    .line 101
    :cond_0
    return-void
.end method

.method public final setWidth(I)V
    .locals 0

    .prologue
    .line 181
    iput p1, p0, Lcom/auditude/ads/model/Asset;->width:I

    .line 182
    return-void
.end method
