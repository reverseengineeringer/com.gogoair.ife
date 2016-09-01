.class public Lcom/auditude/ads/network/vast/VASTAdLoader;
.super Lcom/auditude/ads/network/NetworkAdLoader;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/util/event/IEventListener;


# instance fields
.field private loader:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/auditude/ads/network/NetworkAdLoader;-><init>()V

    return-void
.end method

.method private addVASTProgressTracking(Lcom/auditude/ads/model/Asset;ILcom/auditude/ads/network/vast/model/VASTTrackingEvent;)V
    .locals 6

    .prologue
    const/4 v1, 0x1

    .line 475
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p3}, Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 515
    :cond_0
    return-void

    .line 480
    :cond_1
    invoke-virtual {p3}, Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v2

    .line 481
    const/4 v0, 0x0

    .line 483
    sparse-switch p2, :sswitch_data_0

    move-object v1, v0

    .line 504
    :goto_0
    if-eqz v1, :cond_0

    .line 506
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTTrackingUrl;

    .line 508
    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTTrackingUrl;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 509
    new-instance v3, Lcom/auditude/ads/model/tracking/TrackingUrl;

    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTTrackingUrl;->getUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getType()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/auditude/ads/model/tracking/TrackingUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 510
    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTTrackingUrl;->getOffset()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/auditude/ads/model/tracking/TrackingUrl;->setOffset(I)V

    .line 511
    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTTrackingUrl;->getOffsetIsPercent()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/auditude/ads/model/tracking/TrackingUrl;->setOffsetIsPercent(Ljava/lang/Boolean;)V

    .line 512
    invoke-virtual {v1, v3}, Lcom/auditude/ads/model/tracking/TrackingEvent;->addTrackingUrl(Lcom/auditude/ads/model/tracking/TrackingUrl;)V

    goto :goto_1

    .line 486
    :sswitch_0
    const-string v0, "start"

    invoke-virtual {p1, v0, v1}, Lcom/auditude/ads/model/Asset;->getTrackingEventByType(Ljava/lang/String;Z)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v0

    move-object v1, v0

    .line 487
    goto :goto_0

    .line 489
    :sswitch_1
    const-string v0, "firstquartile"

    invoke-virtual {p1, v0, v1}, Lcom/auditude/ads/model/Asset;->getTrackingEventByType(Ljava/lang/String;Z)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v0

    move-object v1, v0

    .line 490
    goto :goto_0

    .line 492
    :sswitch_2
    const-string v0, "midpoint"

    invoke-virtual {p1, v0, v1}, Lcom/auditude/ads/model/Asset;->getTrackingEventByType(Ljava/lang/String;Z)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v0

    move-object v1, v0

    .line 493
    goto :goto_0

    .line 495
    :sswitch_3
    const-string v0, "thirdquartile"

    invoke-virtual {p1, v0, v1}, Lcom/auditude/ads/model/Asset;->getTrackingEventByType(Ljava/lang/String;Z)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v0

    move-object v1, v0

    .line 496
    goto :goto_0

    .line 498
    :sswitch_4
    const-string v0, "complete"

    invoke-virtual {p1, v0, v1}, Lcom/auditude/ads/model/Asset;->getTrackingEventByType(Ljava/lang/String;Z)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v0

    move-object v1, v0

    .line 499
    goto :goto_0

    .line 483
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x19 -> :sswitch_1
        0x32 -> :sswitch_2
        0x4b -> :sswitch_3
        0x64 -> :sswitch_4
    .end sparse-switch
.end method

.method private addVASTTracking(Lcom/auditude/ads/model/Asset;Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;)V
    .locals 2

    .prologue
    .line 445
    if-nez p2, :cond_0

    .line 448
    :goto_0
    return-void

    .line 447
    :cond_0
    invoke-virtual {p2}, Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p2, Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;->type:Ljava/lang/String;

    invoke-direct {p0, p1, v0, v1}, Lcom/auditude/ads/network/vast/VASTAdLoader;->addVASTTrackingUrls(Lcom/auditude/ads/model/Asset;Ljava/util/ArrayList;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private addVASTTrackingUrls(Lcom/auditude/ads/model/Asset;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 6

    .prologue
    .line 452
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 472
    :cond_0
    return-void

    .line 457
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p1, p3, v0}, Lcom/auditude/ads/model/Asset;->getTrackingEventByType(Ljava/lang/String;Z)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v1

    .line 458
    if-eqz v1, :cond_0

    .line 460
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTTrackingUrl;

    .line 462
    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTTrackingUrl;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 466
    new-instance v3, Lcom/auditude/ads/model/tracking/TrackingUrl;

    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTTrackingUrl;->getUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getType()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/auditude/ads/model/tracking/TrackingUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTTrackingUrl;->getOffset()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/auditude/ads/model/tracking/TrackingUrl;->setOffset(I)V

    .line 468
    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTTrackingUrl;->getOffsetIsPercent()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/auditude/ads/model/tracking/TrackingUrl;->setOffsetIsPercent(Ljava/lang/Boolean;)V

    .line 469
    invoke-virtual {v1, v3}, Lcom/auditude/ads/model/tracking/TrackingEvent;->addTrackingUrl(Lcom/auditude/ads/model/tracking/TrackingUrl;)V

    goto :goto_0
.end method

.method private getCompanionAssets(Lcom/auditude/ads/network/vast/model/VASTInlineAd;)Ljava/util/ArrayList;
    .locals 9

    .prologue
    .line 388
    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->getCompanionAds()Ljava/util/ArrayList;

    move-result-object v0

    .line 389
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_4

    .line 391
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 393
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, v2

    .line 428
    :goto_1
    return-object v0

    .line 393
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTCompanionCreative;

    .line 395
    new-instance v4, Lcom/auditude/ads/model/OnPageAsset;

    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->getAd()Lcom/auditude/ads/model/Ad;

    move-result-object v1

    invoke-direct {v4, v1}, Lcom/auditude/ads/model/OnPageAsset;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 396
    const-string v1, "onpage"

    invoke-virtual {v4, v1}, Lcom/auditude/ads/model/OnPageAsset;->setFormat(Ljava/lang/String;)V

    .line 398
    invoke-direct {p0, v4, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->setAssetProperties(Lcom/auditude/ads/model/Asset;Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;)V

    .line 400
    iget-object v1, v0, Lcom/auditude/ads/network/vast/model/VASTCompanionCreative;->altText:Ljava/lang/String;

    invoke-virtual {v4, v1}, Lcom/auditude/ads/model/OnPageAsset;->setAltText(Ljava/lang/String;)V

    .line 402
    new-instance v5, Lcom/auditude/ads/model/Click;

    invoke-direct {v5, v4}, Lcom/auditude/ads/model/Click;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 403
    iget-object v1, v0, Lcom/auditude/ads/network/vast/model/VASTCompanionCreative;->clickThroughUrl:Ljava/lang/String;

    invoke-static {v1}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 405
    iget-object v1, v0, Lcom/auditude/ads/network/vast/model/VASTCompanionCreative;->clickThroughUrl:Ljava/lang/String;

    invoke-virtual {v5, v1}, Lcom/auditude/ads/model/Click;->setUrl(Ljava/lang/String;)V

    .line 407
    :cond_1
    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTCompanionCreative;->getClickTrackingUrls()Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 409
    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTCompanionCreative;->getClickTrackingUrls()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_3

    .line 414
    :cond_2
    invoke-virtual {v4, v5}, Lcom/auditude/ads/model/OnPageAsset;->setClick(Lcom/auditude/ads/model/IClick;)V

    .line 416
    new-instance v1, Lcom/auditude/ads/model/media/MediaFile;

    invoke-direct {v1}, Lcom/auditude/ads/model/media/MediaFile;-><init>()V

    .line 417
    iget-object v0, v0, Lcom/auditude/ads/network/vast/model/VASTCompanionCreative;->url:Ljava/lang/String;

    iput-object v0, v1, Lcom/auditude/ads/model/media/MediaFile;->source:Ljava/lang/String;

    .line 418
    invoke-virtual {v4}, Lcom/auditude/ads/model/OnPageAsset;->getWidth()I

    move-result v0

    iput v0, v1, Lcom/auditude/ads/model/media/MediaFile;->width:I

    .line 419
    invoke-virtual {v4}, Lcom/auditude/ads/model/OnPageAsset;->getHeight()I

    move-result v0

    iput v0, v1, Lcom/auditude/ads/model/media/MediaFile;->height:I

    .line 420
    invoke-virtual {v4, v1}, Lcom/auditude/ads/model/OnPageAsset;->AddMediaFile(Lcom/auditude/ads/model/media/MediaFile;)V

    .line 422
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 409
    :cond_3
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 411
    new-instance v7, Lcom/auditude/ads/model/tracking/TrackingUrl;

    const-string v8, "click"

    invoke-direct {v7, v1, v8}, Lcom/auditude/ads/model/tracking/TrackingUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "click"

    invoke-virtual {v5, v7, v1}, Lcom/auditude/ads/model/Click;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    goto :goto_2

    .line 428
    :cond_4
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private getLinearAsset(Lcom/auditude/ads/network/vast/model/VASTInlineAd;)Lcom/auditude/ads/model/Asset;
    .locals 8

    .prologue
    const/4 v1, 0x0

    const/4 v7, 0x0

    const/4 v0, -0x1

    .line 227
    iget-object v2, p1, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    if-nez v2, :cond_0

    move-object v0, v1

    .line 335
    :goto_0
    return-object v0

    .line 229
    :cond_0
    new-instance v2, Lcom/auditude/ads/model/LinearAsset;

    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->getAd()Lcom/auditude/ads/model/Ad;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/auditude/ads/model/LinearAsset;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 230
    iget-object v3, p1, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->errorUrl:Ljava/lang/String;

    iput-object v3, v2, Lcom/auditude/ads/model/LinearAsset;->errorUrl:Ljava/lang/String;

    .line 232
    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->getSkipOffset()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->getSkipOffset()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1

    .line 234
    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->getSkipOffset()Ljava/lang/String;

    move-result-object v3

    const-string v4, "(^[-.0-9]+:[-.0-9]+:[-.0-9]+$)"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 236
    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->getSkipOffset()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->parseDuration(Ljava/lang/String;)I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    .line 248
    :cond_1
    :goto_1
    invoke-virtual {v2, v0}, Lcom/auditude/ads/model/LinearAsset;->setSkipOffset(I)V

    .line 250
    iget-object v3, p1, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    .line 251
    iget v0, v3, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->duration:I

    mul-int/lit16 v0, v0, 0x3e8

    invoke-virtual {v2, v0}, Lcom/auditude/ads/model/LinearAsset;->setDurationInMillis(I)V

    .line 252
    iget-object v0, v3, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->id:Ljava/lang/String;

    invoke-virtual {v2, v0}, Lcom/auditude/ads/model/LinearAsset;->setID(Ljava/lang/String;)V

    .line 253
    iget-object v0, v3, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->apiFramework:Ljava/lang/String;

    invoke-virtual {v2, v0}, Lcom/auditude/ads/model/LinearAsset;->setApiFramework(Ljava/lang/String;)V

    .line 254
    iget-object v0, v3, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->adParameters:Ljava/lang/String;

    invoke-virtual {v2, v0}, Lcom/auditude/ads/model/LinearAsset;->setAdParameters(Ljava/lang/String;)V

    .line 257
    invoke-virtual {v3}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->getMediaFiles()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v3}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->getMediaFiles()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 259
    invoke-virtual {v3}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->getMediaFiles()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;

    .line 260
    instance-of v4, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;

    if-eqz v4, :cond_8

    .line 261
    :goto_2
    if-eqz v0, :cond_2

    .line 263
    iget v1, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->width:I

    invoke-virtual {v2, v1}, Lcom/auditude/ads/model/LinearAsset;->setWidth(I)V

    .line 264
    iget v0, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->height:I

    invoke-virtual {v2, v0}, Lcom/auditude/ads/model/LinearAsset;->setHeight(I)V

    .line 268
    :cond_2
    invoke-virtual {v3}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->getMediaFiles()Ljava/util/ArrayList;

    move-result-object v0

    .line 269
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 271
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_9

    .line 291
    :cond_3
    const-string v0, "video"

    invoke-virtual {v2, v0}, Lcom/auditude/ads/model/LinearAsset;->setFormat(Ljava/lang/String;)V

    .line 294
    iget-object v0, v3, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->click:Lcom/auditude/ads/network/vast/model/VASTClick;

    if-eqz v0, :cond_6

    .line 296
    new-instance v1, Lcom/auditude/ads/model/Click;

    invoke-direct {v1, v2}, Lcom/auditude/ads/model/Click;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 297
    iget-object v0, v3, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->click:Lcom/auditude/ads/network/vast/model/VASTClick;

    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTClick;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/Click;->setUrl(Ljava/lang/String;)V

    .line 300
    iget-object v0, v3, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->click:Lcom/auditude/ads/network/vast/model/VASTClick;

    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTClick;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    .line 301
    if-eqz v0, :cond_5

    .line 303
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_4
    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_a

    .line 313
    :cond_5
    invoke-virtual {v2, v1}, Lcom/auditude/ads/model/LinearAsset;->setClick(Lcom/auditude/ads/model/IClick;)V

    .line 317
    :cond_6
    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->getImpressionUrls()Ljava/util/ArrayList;

    move-result-object v0

    const-string v1, "creativeview"

    invoke-direct {p0, v2, v0, v1}, Lcom/auditude/ads/network/vast/VASTAdLoader;->addVASTTrackingUrls(Lcom/auditude/ads/model/Asset;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 319
    const-string v0, "creativeview"

    invoke-virtual {v3, v0}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;

    move-result-object v0

    invoke-direct {p0, v2, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->addVASTTracking(Lcom/auditude/ads/model/Asset;Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;)V

    .line 320
    const-string v0, "start"

    invoke-virtual {v3, v0}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;

    move-result-object v0

    invoke-direct {p0, v2, v7, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->addVASTProgressTracking(Lcom/auditude/ads/model/Asset;ILcom/auditude/ads/network/vast/model/VASTTrackingEvent;)V

    .line 321
    const/16 v0, 0x19

    const-string v1, "firstquartile"

    invoke-virtual {v3, v1}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;

    move-result-object v1

    invoke-direct {p0, v2, v0, v1}, Lcom/auditude/ads/network/vast/VASTAdLoader;->addVASTProgressTracking(Lcom/auditude/ads/model/Asset;ILcom/auditude/ads/network/vast/model/VASTTrackingEvent;)V

    .line 322
    const/16 v0, 0x32

    const-string v1, "midpoint"

    invoke-virtual {v3, v1}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;

    move-result-object v1

    invoke-direct {p0, v2, v0, v1}, Lcom/auditude/ads/network/vast/VASTAdLoader;->addVASTProgressTracking(Lcom/auditude/ads/model/Asset;ILcom/auditude/ads/network/vast/model/VASTTrackingEvent;)V

    .line 323
    const/16 v0, 0x4b

    const-string v1, "thirdquartile"

    invoke-virtual {v3, v1}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;

    move-result-object v1

    invoke-direct {p0, v2, v0, v1}, Lcom/auditude/ads/network/vast/VASTAdLoader;->addVASTProgressTracking(Lcom/auditude/ads/model/Asset;ILcom/auditude/ads/network/vast/model/VASTTrackingEvent;)V

    .line 324
    const/16 v0, 0x64

    const-string v1, "complete"

    invoke-virtual {v3, v1}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;

    move-result-object v1

    invoke-direct {p0, v2, v0, v1}, Lcom/auditude/ads/network/vast/VASTAdLoader;->addVASTProgressTracking(Lcom/auditude/ads/model/Asset;ILcom/auditude/ads/network/vast/model/VASTTrackingEvent;)V

    .line 327
    const-string v0, "progress"

    invoke-virtual {v3, v0}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;

    move-result-object v0

    invoke-direct {p0, v2, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->addVASTTracking(Lcom/auditude/ads/model/Asset;Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;)V

    .line 330
    const-string v0, "vasterror"

    invoke-virtual {v3, v0}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;

    move-result-object v0

    invoke-direct {p0, v2, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->addVASTTracking(Lcom/auditude/ads/model/Asset;Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;)V

    .line 333
    const-string v0, "skip"

    invoke-virtual {v3, v0}, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;

    move-result-object v0

    invoke-direct {p0, v2, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->addVASTTracking(Lcom/auditude/ads/model/Asset;Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;)V

    move-object v0, v2

    .line 335
    goto/16 :goto_0

    .line 238
    :cond_7
    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->getSkipOffset()Ljava/lang/String;

    move-result-object v3

    const-string v4, "%"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p1, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    if-eqz v3, :cond_1

    iget-object v3, p1, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    iget v3, v3, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->duration:I

    if-lez v3, :cond_1

    .line 240
    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->getSkipOffset()Ljava/lang/String;

    move-result-object v0

    const-string v3, "%"

    const-string v4, ""

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->convertToInt(Ljava/lang/String;)I

    move-result v0

    .line 241
    iget-object v3, p1, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    iget v3, v3, Lcom/auditude/ads/network/vast/model/VASTLinearCreative;->duration:I

    int-to-float v3, v3

    int-to-float v0, v0

    mul-float/2addr v0, v3

    const/high16 v3, 0x42c80000    # 100.0f

    div-float/2addr v0, v3

    const/high16 v3, 0x447a0000    # 1000.0f

    mul-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    goto/16 :goto_1

    :cond_8
    move-object v0, v1

    .line 260
    goto/16 :goto_2

    .line 271
    :cond_9
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;

    .line 273
    new-instance v4, Lcom/auditude/ads/model/media/MediaFile;

    invoke-direct {v4}, Lcom/auditude/ads/model/media/MediaFile;-><init>()V

    .line 274
    iget-object v5, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->id:Ljava/lang/String;

    iput-object v5, v4, Lcom/auditude/ads/model/media/MediaFile;->id:Ljava/lang/String;

    .line 275
    iget v5, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->bitrate:I

    iput v5, v4, Lcom/auditude/ads/model/media/MediaFile;->bitrate:I

    .line 276
    iget v5, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->width:I

    iput v5, v4, Lcom/auditude/ads/model/media/MediaFile;->width:I

    .line 277
    iget v5, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->height:I

    iput v5, v4, Lcom/auditude/ads/model/media/MediaFile;->height:I

    .line 278
    iget-object v5, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->url:Ljava/lang/String;

    iput-object v5, v4, Lcom/auditude/ads/model/media/MediaFile;->source:Ljava/lang/String;

    .line 279
    iget-object v5, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->type:Ljava/lang/String;

    iput-object v5, v4, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    .line 280
    iget-boolean v5, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->scalable:Z

    iput-boolean v5, v4, Lcom/auditude/ads/model/media/MediaFile;->scalable:Z

    .line 281
    iget-boolean v5, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->maintainAspectRatio:Z

    iput-boolean v5, v4, Lcom/auditude/ads/model/media/MediaFile;->maintainAspectRatio:Z

    .line 282
    iget-object v5, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->delivery:Ljava/lang/String;

    iput-object v5, v4, Lcom/auditude/ads/model/media/MediaFile;->delivery:Ljava/lang/String;

    .line 283
    iget-object v0, v0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->apiFramework:Ljava/lang/String;

    iput-object v0, v4, Lcom/auditude/ads/model/media/MediaFile;->apiFramework:Ljava/lang/String;

    .line 285
    invoke-virtual {v2, v4}, Lcom/auditude/ads/model/LinearAsset;->AddMediaFile(Lcom/auditude/ads/model/media/MediaFile;)V

    goto/16 :goto_3

    .line 303
    :cond_a
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 305
    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 309
    new-instance v5, Lcom/auditude/ads/model/tracking/TrackingUrl;

    const-string v6, "click"

    invoke-direct {v5, v0, v6}, Lcom/auditude/ads/model/tracking/TrackingUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "click"

    invoke-virtual {v1, v5, v0}, Lcom/auditude/ads/model/Click;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    goto/16 :goto_4
.end method

.method private getNonLinearAssets(Lcom/auditude/ads/network/vast/model/VASTInlineAd;)Ljava/util/ArrayList;
    .locals 7

    .prologue
    .line 340
    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->getNonLinearAds()Ljava/util/ArrayList;

    move-result-object v1

    .line 341
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 343
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 345
    const/4 v0, 0x0

    .line 346
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v0

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, v2

    .line 383
    :goto_1
    return-object v0

    .line 346
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTNonLinearCreative;

    .line 348
    new-instance v4, Lcom/auditude/ads/model/NonLinearAsset;

    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->getAd()Lcom/auditude/ads/model/Ad;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/auditude/ads/model/NonLinearAsset;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 349
    const-string v5, "overlay"

    invoke-virtual {v4, v5}, Lcom/auditude/ads/model/NonLinearAsset;->setFormat(Ljava/lang/String;)V

    .line 351
    invoke-direct {p0, v4, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->setAssetProperties(Lcom/auditude/ads/model/Asset;Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;)V

    .line 353
    new-instance v5, Lcom/auditude/ads/model/media/MediaFile;

    invoke-direct {v5}, Lcom/auditude/ads/model/media/MediaFile;-><init>()V

    .line 354
    iget-object v6, v0, Lcom/auditude/ads/network/vast/model/VASTNonLinearCreative;->url:Ljava/lang/String;

    iput-object v6, v5, Lcom/auditude/ads/model/media/MediaFile;->source:Ljava/lang/String;

    .line 355
    iget-object v6, v0, Lcom/auditude/ads/network/vast/model/VASTNonLinearCreative;->apiFramework:Ljava/lang/String;

    iput-object v6, v5, Lcom/auditude/ads/model/media/MediaFile;->apiFramework:Ljava/lang/String;

    .line 356
    iget v6, v0, Lcom/auditude/ads/network/vast/model/VASTNonLinearCreative;->width:I

    iput v6, v5, Lcom/auditude/ads/model/media/MediaFile;->width:I

    .line 357
    iget v6, v0, Lcom/auditude/ads/network/vast/model/VASTNonLinearCreative;->height:I

    iput v6, v5, Lcom/auditude/ads/model/media/MediaFile;->height:I

    .line 358
    invoke-virtual {v4, v5}, Lcom/auditude/ads/model/NonLinearAsset;->AddMediaFile(Lcom/auditude/ads/model/media/MediaFile;)V

    .line 360
    iget-object v5, v0, Lcom/auditude/ads/network/vast/model/VASTNonLinearCreative;->apiFramework:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/auditude/ads/model/NonLinearAsset;->setApiFramework(Ljava/lang/String;)V

    .line 362
    iget-object v5, v0, Lcom/auditude/ads/network/vast/model/VASTNonLinearCreative;->clickThroughUrl:Ljava/lang/String;

    invoke-static {v5}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 364
    new-instance v5, Lcom/auditude/ads/model/Click;

    invoke-direct {v5, v4}, Lcom/auditude/ads/model/Click;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 365
    iget-object v0, v0, Lcom/auditude/ads/network/vast/model/VASTNonLinearCreative;->clickThroughUrl:Ljava/lang/String;

    invoke-virtual {v5, v0}, Lcom/auditude/ads/model/Click;->setUrl(Ljava/lang/String;)V

    .line 366
    invoke-virtual {v4, v5}, Lcom/auditude/ads/model/NonLinearAsset;->setClick(Lcom/auditude/ads/model/IClick;)V

    .line 371
    :cond_1
    iget-object v0, p1, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->linearAd:Lcom/auditude/ads/network/vast/model/VASTLinearCreative;

    if-eqz v0, :cond_3

    if-nez v1, :cond_3

    .line 373
    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->getImpressionUrls()Ljava/util/ArrayList;

    move-result-object v0

    const-string v1, "creativeview"

    invoke-direct {p0, v4, v0, v1}, Lcom/auditude/ads/network/vast/VASTAdLoader;->addVASTTrackingUrls(Lcom/auditude/ads/model/Asset;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 374
    const/4 v1, 0x1

    move v0, v1

    .line 377
    :goto_2
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v1, v0

    goto :goto_0

    .line 383
    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    :cond_3
    move v0, v1

    goto :goto_2
.end method

.method private onLoadComplete(Lcom/auditude/ads/util/event/IEventDispatcher;)V
    .locals 1

    .prologue
    .line 127
    const-string v0, "complete"

    invoke-interface {p1, v0, p0}, Lcom/auditude/ads/util/event/IEventDispatcher;->removeEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 128
    const-string v0, "failed"

    invoke-interface {p1, v0, p0}, Lcom/auditude/ads/util/event/IEventDispatcher;->removeEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 129
    iget-object v0, p0, Lcom/auditude/ads/network/vast/VASTAdLoader;->loader:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->getDocument()Lcom/auditude/ads/network/vast/model/VASTDocument;

    move-result-object v0

    .line 131
    invoke-direct {p0, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->parseVastDocument(Lcom/auditude/ads/network/vast/model/VASTDocument;)V

    .line 132
    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->notifyComplete()V

    .line 133
    return-void
.end method

.method private onLoadFailed(Lcom/auditude/ads/util/event/IEventDispatcher;)V
    .locals 5

    .prologue
    const/16 v4, 0x455

    .line 209
    const-string v0, "complete"

    invoke-interface {p1, v0, p0}, Lcom/auditude/ads/util/event/IEventDispatcher;->removeEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 210
    const-string v0, "failed"

    invoke-interface {p1, v0, p0}, Lcom/auditude/ads/util/event/IEventDispatcher;->removeEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 213
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 214
    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->getAd()Lcom/auditude/ads/model/Ad;

    move-result-object v1

    .line 215
    if-eqz v1, :cond_0

    const-string v2, "AdId"

    invoke-virtual {v1}, Lcom/auditude/ads/model/Ad;->getID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    :cond_0
    const-string v1, "InternalErrorId"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    const-string v1, "Description"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Connection failed on:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->getSource()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    new-instance v1, Lcom/auditude/ads/event/AdPluginEvent;

    const-string v2, "NetworkAdResponseEmpty"

    invoke-direct {v1, v2, v0}, Lcom/auditude/ads/event/AdPluginEvent;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    invoke-virtual {p0, v1}, Lcom/auditude/ads/network/vast/VASTAdLoader;->notifyError(Lcom/auditude/ads/event/AdPluginEvent;)V

    .line 221
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Connection failed on:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->getSource()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v4, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->logError(ILjava/lang/String;)V

    .line 222
    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->notifyComplete()V

    .line 223
    return-void
.end method

.method private parseVastDocument(Lcom/auditude/ads/network/vast/model/VASTDocument;)V
    .locals 8

    .prologue
    const/16 v7, 0x454

    .line 137
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 138
    if-eqz p1, :cond_1

    .line 140
    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTDocument;->getAds()Ljava/util/ArrayList;

    move-result-object v0

    .line 141
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 143
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_5

    .line 188
    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_a

    move-object v0, v1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->setResult(Ljava/lang/Object;)V

    .line 189
    if-eqz v1, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->getAd()Lcom/auditude/ads/model/Ad;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->getDispatchError()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_b

    iget-boolean v0, p1, Lcom/auditude/ads/network/vast/model/VASTDocument;->reachedMaxWrapper:Z

    if-nez v0, :cond_b

    .line 192
    :cond_2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 193
    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->getAd()Lcom/auditude/ads/model/Ad;

    move-result-object v1

    .line 194
    if-eqz v1, :cond_3

    const-string v2, "AdId"

    invoke-virtual {v1}, Lcom/auditude/ads/model/Ad;->getID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    :cond_3
    const-string v1, "InternalErrorId"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    const-string v1, "Description"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "No ads returned from:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->getSource()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    new-instance v1, Lcom/auditude/ads/event/AdPluginEvent;

    const-string v2, "NetworkAdResponseEmpty"

    invoke-direct {v1, v2, v0}, Lcom/auditude/ads/event/AdPluginEvent;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    invoke-virtual {p0, v1}, Lcom/auditude/ads/network/vast/VASTAdLoader;->notifyError(Lcom/auditude/ads/event/AdPluginEvent;)V

    .line 199
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "No ads returned from:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->getSource()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v7, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->logError(ILjava/lang/String;)V

    .line 205
    :cond_4
    :goto_1
    return-void

    .line 143
    :cond_5
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTAd;

    .line 145
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTAd;->getInlineAds()Ljava/util/ArrayList;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 147
    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTAd;->getInlineAds()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_6
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTInlineAd;

    .line 149
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 152
    invoke-direct {p0, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->getLinearAsset(Lcom/auditude/ads/network/vast/model/VASTInlineAd;)Lcom/auditude/ads/model/Asset;

    move-result-object v5

    .line 153
    if-eqz v5, :cond_6

    .line 155
    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->getNetworkAdId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/auditude/ads/model/Asset;->setNetworkAdId(Ljava/lang/String;)V

    .line 156
    iget-object v6, v0, Lcom/auditude/ads/network/vast/model/VASTInlineAd;->companionRequired:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/auditude/ads/model/Asset;->setCompanionRequired(Ljava/lang/String;)V

    .line 157
    if-eqz v5, :cond_7

    .line 159
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    :cond_7
    invoke-direct {p0, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->getNonLinearAssets(Lcom/auditude/ads/network/vast/model/VASTInlineAd;)Ljava/util/ArrayList;

    move-result-object v5

    .line 164
    if-eqz v5, :cond_8

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lez v6, :cond_8

    .line 166
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 170
    :cond_8
    invoke-direct {p0, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->getCompanionAssets(Lcom/auditude/ads/network/vast/model/VASTInlineAd;)Ljava/util/ArrayList;

    move-result-object v0

    .line 171
    if-eqz v0, :cond_9

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_9

    .line 173
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 176
    :cond_9
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_6

    .line 178
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 188
    :cond_a
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 201
    :cond_b
    if-eqz p1, :cond_4

    iget-boolean v0, p1, Lcom/auditude/ads/network/vast/model/VASTDocument;->reachedMaxWrapper:Z

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->getAd()Lcom/auditude/ads/model/Ad;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->getDispatchError()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 203
    const/16 v0, 0x456

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/network/vast/VASTAdLoader;->logError(ILjava/lang/String;)V

    goto/16 :goto_1
.end method

.method private setAssetProperties(Lcom/auditude/ads/model/Asset;Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;)V
    .locals 1

    .prologue
    .line 433
    iget-object v0, p2, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->id:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/auditude/ads/model/Asset;->setID(Ljava/lang/String;)V

    .line 434
    iget v0, p2, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->width:I

    invoke-virtual {p1, v0}, Lcom/auditude/ads/model/Asset;->setWidth(I)V

    .line 435
    iget v0, p2, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->height:I

    invoke-virtual {p1, v0}, Lcom/auditude/ads/model/Asset;->setHeight(I)V

    .line 436
    iget-object v0, p2, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->adParameters:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/auditude/ads/model/Asset;->setAdParameters(Ljava/lang/String;)V

    .line 437
    iget-object v0, p2, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->creativeType:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/auditude/ads/model/Asset;->setCreativeType(Ljava/lang/String;)V

    .line 438
    iget-object v0, p2, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->resourceType:Ljava/lang/String;

    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "static"

    :goto_0
    invoke-virtual {p1, v0}, Lcom/auditude/ads/model/Asset;->setResourceType(Ljava/lang/String;)V

    .line 440
    const-string v0, "creativeview"

    invoke-virtual {p2, v0}, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->addVASTTracking(Lcom/auditude/ads/model/Asset;Lcom/auditude/ads/network/vast/model/VASTTrackingEvent;)V

    .line 441
    return-void

    .line 438
    :cond_0
    iget-object v0, p2, Lcom/auditude/ads/network/vast/model/VASTAdCreativeBase;->resourceType:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public cancel()V
    .locals 0

    .prologue
    .line 107
    return-void
.end method

.method public load()V
    .locals 8

    .prologue
    const/4 v2, 0x0

    .line 51
    invoke-super {p0}, Lcom/auditude/ads/network/NetworkAdLoader;->load()V

    .line 53
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v5

    .line 55
    const-string v0, "repackageCreativeEnabled"

    invoke-virtual {v5, v0}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 57
    const-string v0, "repackageCreativeEnabled"

    invoke-virtual {v5, v0}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    move v1, v0

    .line 60
    :goto_0
    const-string v0, "fallbackOnInvalidCreative"

    invoke-virtual {v5, v0}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 62
    const-string v0, "fallbackOnInvalidCreative"

    invoke-virtual {v5, v0}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    move v4, v0

    .line 67
    :goto_1
    const/4 v0, 0x0

    .line 68
    if-nez v1, :cond_4

    const-string v3, "validMimeTypes"

    invoke-virtual {v5, v3}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 70
    const-string v0, "validMimeTypes"

    invoke-virtual {v5, v0}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    move-object v3, v0

    .line 73
    :goto_2
    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->getAd()Lcom/auditude/ads/model/Ad;

    move-result-object v6

    .line 74
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 75
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Lcom/auditude/ads/model/Ad;->isRepackagingEnabled()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 76
    :cond_0
    new-instance v7, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackagerInfo;

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v2, 0x1

    :cond_1
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v0, "repackageCreativeFormat"

    invoke-virtual {v5, v0}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v5}, Lcom/auditude/ads/core/AdSettings;->getDomain()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5}, Lcom/auditude/ads/core/AdSettings;->getZoneId()I

    move-result v5

    invoke-direct {v7, v1, v0, v2, v5}, Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackagerInfo;-><init>(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;I)V

    .line 78
    new-instance v0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    const/4 v1, 0x6

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v1, v3, v7, v2}, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;-><init>(ILjava/util/ArrayList;Lcom/auditude/ads/network/vast/repackaging/VastAssetRepackagerInfo;Ljava/lang/Boolean;)V

    iput-object v0, p0, Lcom/auditude/ads/network/vast/VASTAdLoader;->loader:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    .line 79
    iget-object v0, p0, Lcom/auditude/ads/network/vast/VASTAdLoader;->loader:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    const-string v1, "complete"

    invoke-virtual {v0, v1, p0}, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 80
    iget-object v0, p0, Lcom/auditude/ads/network/vast/VASTAdLoader;->loader:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    const-string v1, "failed"

    invoke-virtual {v0, v1, p0}, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 82
    if-eqz v6, :cond_2

    .line 84
    new-instance v0, Lcom/auditude/ads/network/vast/model/VASTWrapperAd;

    invoke-direct {v0}, Lcom/auditude/ads/network/vast/model/VASTWrapperAd;-><init>()V

    .line 85
    invoke-virtual {v6}, Lcom/auditude/ads/model/Ad;->getAllowMultipleAds()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/auditude/ads/network/vast/model/VASTWrapperAd;->allowMultipleAds:Ljava/lang/String;

    .line 86
    invoke-virtual {v6}, Lcom/auditude/ads/model/Ad;->getFollowRedirects()Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/auditude/ads/network/vast/model/VASTWrapperAd;->followAdditionalWrappers:Ljava/lang/Boolean;

    .line 88
    new-instance v1, Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v6}, Lcom/auditude/ads/model/Ad;->getID()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/auditude/ads/network/vast/model/VASTAd;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 89
    invoke-virtual {v6}, Lcom/auditude/ads/model/Ad;->getIsFromVmapDoc()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/auditude/ads/network/vast/model/VASTAd;->setIsFromVmapDoc(Ljava/lang/Boolean;)V

    .line 90
    invoke-virtual {v1, v0}, Lcom/auditude/ads/network/vast/model/VASTAd;->setWrapperAd(Lcom/auditude/ads/network/vast/model/VASTWrapperAd;)V

    .line 91
    iget-object v0, p0, Lcom/auditude/ads/network/vast/VASTAdLoader;->loader:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    iput-object v1, v0, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->State:Ljava/lang/Object;

    .line 94
    :cond_2
    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->getSource()Ljava/lang/Object;

    move-result-object v1

    .line 96
    instance-of v0, v1, Ljava/lang/String;

    if-eqz v0, :cond_3

    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 98
    invoke-static {}, Lcom/auditude/ads/util/log/Log;->getLogger()Lcom/auditude/ads/util/log/ILogger;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Sending network ad request to: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    .line 100
    :cond_3
    iget-object v0, p0, Lcom/auditude/ads/network/vast/VASTAdLoader;->loader:Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;

    invoke-virtual {v0, v1}, Lcom/auditude/ads/network/vast/loader/VASTXMLLoader;->init(Ljava/lang/Object;)V

    .line 101
    return-void

    :cond_4
    move-object v3, v0

    goto/16 :goto_2

    :cond_5
    move v4, v2

    goto/16 :goto_1

    :cond_6
    move v1, v2

    goto/16 :goto_0
.end method

.method public onEvent(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .prologue
    .line 111
    const-string v0, "complete"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 113
    check-cast p2, Lcom/auditude/ads/util/event/Event;

    invoke-virtual {p2}, Lcom/auditude/ads/util/event/Event;->getOwner()Lcom/auditude/ads/util/event/IEventDispatcher;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->onLoadComplete(Lcom/auditude/ads/util/event/IEventDispatcher;)V

    .line 123
    :goto_0
    return-void

    .line 115
    :cond_0
    const-string v0, "failed"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 117
    check-cast p2, Lcom/auditude/ads/util/event/Event;

    invoke-virtual {p2}, Lcom/auditude/ads/util/event/Event;->getOwner()Lcom/auditude/ads/util/event/IEventDispatcher;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->onLoadFailed(Lcom/auditude/ads/util/event/IEventDispatcher;)V

    goto :goto_0

    .line 121
    :cond_1
    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/VASTAdLoader;->notifyComplete()V

    goto :goto_0
.end method
