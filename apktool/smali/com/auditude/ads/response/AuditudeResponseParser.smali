.class public Lcom/auditude/ads/response/AuditudeResponseParser;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/loader/DataLoader$DataLoaderListener;
.implements Lcom/auditude/ads/response/IResponseParser;


# static fields
.field private static CRENABLED:Ljava/lang/String; = null

.field private static final MIME_TYPE_TEXT_HTML:Ljava/lang/String; = "text/html"

.field private static SCR:Ljava/lang/String;


# instance fields
.field private adRequest:Lcom/auditude/ads/loader/AdRequest;

.field private adResponse:Lcom/auditude/ads/response/AdResponse;

.field private ads:Ljava/util/HashMap;

.field private breaks:Ljava/util/ArrayList;

.field private chapters:Ljava/util/ArrayList;

.field private dataLoader:Lcom/auditude/ads/loader/DataLoader;

.field private listener:Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;

.field private parser:Lorg/xmlpull/v1/XmlPullParser;

.field private refs:Ljava/util/HashMap;

.field private submissions:Lcom/auditude/ads/model/tracking/Submissions;

.field private timeout:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    const-string v0, "scr"

    sput-object v0, Lcom/auditude/ads/response/AuditudeResponseParser;->SCR:Ljava/lang/String;

    .line 62
    const-string v0, "crenabled"

    sput-object v0, Lcom/auditude/ads/response/AuditudeResponseParser;->CRENABLED:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Lcom/auditude/ads/model/tracking/Submissions;

    invoke-direct {v0}, Lcom/auditude/ads/model/tracking/Submissions;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->breaks:Ljava/util/ArrayList;

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->chapters:Ljava/util/ArrayList;

    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->ads:Ljava/util/HashMap;

    .line 59
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->refs:Ljava/util/HashMap;

    .line 44
    return-void
.end method

.method private GetAssetForType(Ljava/lang/String;Lcom/auditude/ads/model/BaseElement;)Lcom/auditude/ads/model/Asset;
    .locals 1

    .prologue
    .line 933
    const-string v0, "linear"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 935
    new-instance v0, Lcom/auditude/ads/model/LinearAsset;

    invoke-direct {v0, p2}, Lcom/auditude/ads/model/LinearAsset;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 947
    :goto_0
    return-object v0

    .line 937
    :cond_0
    const-string v0, "nonlinear"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 939
    new-instance v0, Lcom/auditude/ads/model/NonLinearAsset;

    invoke-direct {v0, p2}, Lcom/auditude/ads/model/NonLinearAsset;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    goto :goto_0

    .line 941
    :cond_1
    const-string v0, "companion"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 943
    new-instance v0, Lcom/auditude/ads/model/OnPageAsset;

    invoke-direct {v0, p2}, Lcom/auditude/ads/model/OnPageAsset;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    goto :goto_0

    .line 947
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private NotifyError(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 954
    return-void
.end method

.method private applyAdsOnRefs()V
    .locals 4

    .prologue
    .line 175
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->refs:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 190
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->refs:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 191
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->refs:Ljava/util/HashMap;

    .line 192
    return-void

    .line 175
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 177
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/auditude/ads/model/smil/Ref;

    .line 178
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 180
    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->ads:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 182
    iget-object v3, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->ads:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Ad;

    .line 183
    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/smil/Ref;->setAd(Lcom/auditude/ads/model/Ad;)V

    .line 185
    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Ref;->getID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/auditude/ads/model/Ad;->getAssetsBySegment(Ljava/lang/String;)[Lcom/auditude/ads/model/Asset;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/smil/Ref;->setAssets([Lcom/auditude/ads/model/Asset;)V

    goto :goto_0
.end method

.method private hasMimeType(Ljava/util/ArrayList;Ljava/util/ArrayList;)Ljava/lang/Boolean;
    .locals 2

    .prologue
    .line 596
    if-eqz p1, :cond_1

    .line 598
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 605
    :cond_1
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    .line 598
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Asset;

    .line 599
    invoke-virtual {v0, p2}, Lcom/auditude/ads/model/Asset;->hasAssetsWithMimeType(Ljava/util/ArrayList;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 601
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method private parseAd()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 430
    new-instance v5, Lcom/auditude/ads/model/Ad;

    invoke-direct {v5, v3}, Lcom/auditude/ads/model/Ad;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 431
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v1, "id"

    invoke-static {v0, v1, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Lcom/auditude/ads/model/Ad;->setID(Ljava/lang/String;)V

    .line 434
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 435
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 436
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 439
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    move-object v2, v3

    .line 442
    :goto_0
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 443
    const/4 v8, 0x2

    if-ne v0, v8, :cond_9

    .line 445
    const-string v0, "wrapper"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 447
    const/4 v0, 0x1

    invoke-virtual {v5, v0}, Lcom/auditude/ads/model/Ad;->setIsNetworkAd(Z)V

    .line 448
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v1, "adSystem"

    invoke-interface {v0, v3, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Lcom/auditude/ads/model/Ad;->setNetworkAdType(Ljava/lang/String;)V

    .line 449
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v1, "adTagURI"

    invoke-interface {v0, v3, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Lcom/auditude/ads/model/Ad;->setNetworkAdSource(Ljava/lang/Object;)V

    move-object v0, v2

    .line 541
    :goto_1
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    move-object v2, v0

    move v0, v1

    .line 440
    goto :goto_0

    .line 451
    :cond_0
    const-string v0, "behavior"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 453
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v1, "type"

    invoke-static {v0, v1, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 454
    if-eqz v0, :cond_16

    .line 456
    sget-object v1, Lcom/auditude/ads/response/AuditudeResponseParser;->SCR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_16

    .line 460
    sget-object v1, Lcom/auditude/ads/response/AuditudeResponseParser;->CRENABLED:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 462
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {v5, v0}, Lcom/auditude/ads/model/Ad;->setRepackagingEnabled(Z)V

    move-object v0, v2

    .line 463
    goto :goto_1

    .line 466
    :cond_1
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    const-string v8, "&"

    const-string v9, "="

    invoke-static {v1, v8, v9}, Lcom/auditude/ads/util/StringUtil;->ConvertToKeysAndValues(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v2

    .line 469
    goto :goto_1

    .line 470
    :cond_2
    const-string v0, "submission"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 472
    invoke-direct {p0, v5}, Lcom/auditude/ads/response/AuditudeResponseParser;->parseSubmission(Lcom/auditude/ads/model/BaseElement;)V

    move-object v0, v2

    .line 473
    goto :goto_1

    .line 474
    :cond_3
    const-string v0, "asset"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 476
    invoke-direct {p0, v5}, Lcom/auditude/ads/response/AuditudeResponseParser;->parseAsset(Lcom/auditude/ads/model/Ad;)Lcom/auditude/ads/model/Asset;

    move-result-object v0

    .line 477
    if-eqz v0, :cond_16

    .line 479
    invoke-virtual {v5}, Lcom/auditude/ads/model/Ad;->getIsNetworkAd()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 481
    invoke-virtual {v5, v0}, Lcom/auditude/ads/model/Ad;->addTrackingAsset(Lcom/auditude/ads/model/Asset;)V

    .line 482
    instance-of v1, v0, Lcom/auditude/ads/model/ILinearAsset;

    if-nez v1, :cond_4

    instance-of v1, v0, Lcom/auditude/ads/model/INonLinearAsset;

    if-eqz v1, :cond_5

    .line 484
    :cond_4
    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getAuditudeParams()Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v5, v1}, Lcom/auditude/ads/model/Ad;->setAuditudeParams(Ljava/util/HashMap;)V

    .line 486
    :cond_5
    instance-of v1, v0, Lcom/auditude/ads/model/OnPageAsset;

    if-eqz v1, :cond_16

    .line 488
    new-instance v1, Lcom/auditude/ads/model/tracking/ParStateSubmission;

    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getUrl()Ljava/lang/String;

    move-result-object v8

    const-string v9, "creativeview"

    invoke-direct {v1, v8, v9}, Lcom/auditude/ads/model/tracking/ParStateSubmission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 489
    const-string v8, "creativeview"

    invoke-virtual {v0, v1, v8}, Lcom/auditude/ads/model/Asset;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    move-object v0, v2

    .line 491
    goto/16 :goto_1

    .line 494
    :cond_6
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v0, v2

    .line 497
    goto/16 :goto_1

    .line 498
    :cond_7
    const-string v0, "customdata"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 500
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v1, "type"

    invoke-static {v0, v1, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 501
    if-eqz v0, :cond_16

    .line 503
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    const-string v8, "&"

    invoke-virtual {v1, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v2

    .line 505
    goto/16 :goto_1

    .line 506
    :cond_8
    const-string v0, "smil"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 508
    invoke-direct {p0, v5}, Lcom/auditude/ads/response/AuditudeResponseParser;->parseAdSmil(Lcom/auditude/ads/model/Ad;)Ljava/util/HashMap;

    move-result-object v0

    goto/16 :goto_1

    .line 511
    :cond_9
    const/4 v8, 0x3

    if-ne v0, v8, :cond_16

    .line 513
    const-string v0, "ad"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 515
    invoke-virtual {v5}, Lcom/auditude/ads/model/Ad;->getID()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 518
    const/4 v0, 0x0

    .line 519
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v1}, Lcom/auditude/ads/response/AdResponse;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v1

    const-string v3, "repackageCreativeEnabled"

    invoke-virtual {v1, v3}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_a

    .line 521
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v1, "repackageCreativeEnabled"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 523
    :cond_a
    invoke-virtual {v5}, Lcom/auditude/ads/model/Ad;->getIsNetworkAd()Z

    move-result v1

    if-nez v1, :cond_b

    if-eqz v0, :cond_d

    .line 525
    :cond_b
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->ads:Ljava/util/HashMap;

    invoke-virtual {v5}, Lcom/auditude/ads/model/Ad;->getID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 545
    :cond_c
    :goto_2
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 546
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_f

    .line 561
    if-eqz v2, :cond_15

    .line 563
    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move-object v0, v4

    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_11

    .line 586
    :goto_5
    invoke-virtual {v6}, Ljava/util/HashMap;->clear()V

    .line 589
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 592
    return-void

    .line 529
    :cond_d
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v1, "validMimeTypes"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 530
    if-eqz v0, :cond_e

    invoke-direct {p0, v4, v0}, Lcom/auditude/ads/response/AuditudeResponseParser;->hasMimeType(Ljava/util/ArrayList;Ljava/util/ArrayList;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 532
    :cond_e
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->ads:Ljava/util/HashMap;

    invoke-virtual {v5}, Lcom/auditude/ads/model/Ad;->getID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 548
    :cond_f
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Asset;

    .line 549
    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 551
    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 552
    if-eqz v1, :cond_10

    const-string v8, "format"

    invoke-virtual {v1, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_10

    .line 554
    const-string v8, "format"

    invoke-virtual {v1, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/Asset;->setFormat(Ljava/lang/String;)V

    .line 557
    :cond_10
    invoke-virtual {v0, v7}, Lcom/auditude/ads/model/Asset;->setCustomData(Ljava/util/HashMap;)V

    .line 558
    invoke-virtual {v5, v0}, Lcom/auditude/ads/model/Ad;->addAsset(Lcom/auditude/ads/model/Asset;)V

    goto :goto_3

    .line 563
    :cond_11
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 565
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 566
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 567
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 569
    invoke-static {v1}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 571
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_12
    :goto_6
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_14

    .line 580
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Lcom/auditude/ads/model/Asset;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/auditude/ads/model/Asset;

    invoke-virtual {v5, v1, v0}, Lcom/auditude/ads/model/Ad;->addSegmentById(Ljava/lang/String;[Lcom/auditude/ads/model/Asset;)V

    :cond_13
    move-object v0, v2

    goto/16 :goto_4

    .line 571
    :cond_14
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 573
    invoke-virtual {v5, v0}, Lcom/auditude/ads/model/Ad;->getAssetById(Ljava/lang/String;)Lcom/auditude/ads/model/Asset;

    move-result-object v0

    .line 574
    if-eqz v0, :cond_12

    .line 576
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    :cond_15
    move-object v0, v4

    goto/16 :goto_5

    :cond_16
    move-object v0, v2

    goto/16 :goto_1
.end method

.method private parseAdSmil(Lcom/auditude/ads/model/Ad;)Ljava/util/HashMap;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v3, 0x0

    .line 610
    .line 612
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 614
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    move v2, v0

    move-object v1, v3

    move-object v0, v3

    .line 617
    :goto_0
    iget-object v5, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v5}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    .line 619
    if-ne v2, v9, :cond_3

    .line 621
    const-string v2, "par"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 623
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v1, "id"

    invoke-static {v0, v1, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 624
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 667
    :cond_0
    :goto_1
    iget-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    goto :goto_0

    .line 626
    :cond_1
    const-string v2, "ref"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 629
    iget-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v5, "asset"

    invoke-static {v2, v5, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 630
    invoke-static {v2}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 632
    const-string v5, "\\."

    invoke-virtual {v2, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 633
    array-length v5, v2

    if-ne v5, v8, :cond_2

    .line 635
    aget-object v2, v2, v7

    .line 645
    :goto_2
    invoke-static {v2}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 647
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 637
    :cond_2
    array-length v5, v2

    if-ne v5, v9, :cond_5

    .line 639
    invoke-virtual {p1}, Lcom/auditude/ads/model/Ad;->getID()Ljava/lang/String;

    move-result-object v5

    aget-object v6, v2, v7

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 641
    aget-object v2, v2, v8

    goto :goto_2

    .line 652
    :cond_3
    const/4 v6, 0x3

    if-ne v2, v6, :cond_0

    .line 654
    const-string v2, "par"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 656
    invoke-static {v1}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 658
    invoke-virtual {v4, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 661
    :cond_4
    const-string v2, "smil"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 670
    return-object v4

    :cond_5
    move-object v2, v3

    goto :goto_2
.end method

.method private parseAsset(Lcom/auditude/ads/model/Ad;)Lcom/auditude/ads/model/Asset;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v0, 0x0

    .line 675
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "contentType"

    invoke-static {v1, v2, v0}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lcom/auditude/ads/response/AuditudeResponseParser;->GetAssetForType(Ljava/lang/String;Lcom/auditude/ads/model/BaseElement;)Lcom/auditude/ads/model/Asset;

    move-result-object v1

    .line 676
    if-nez v1, :cond_0

    .line 757
    :goto_0
    return-object v0

    .line 678
    :cond_0
    iget-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v3, "id"

    invoke-static {v2, v3, v0}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/Asset;->setID(Ljava/lang/String;)V

    .line 679
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "runtime"

    invoke-static {v0, v2, v4}, Lcom/auditude/ads/util/XMLUtil;->attributeAsIntOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/Asset;->setDurationInMillis(I)V

    .line 680
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "timeOffset"

    const/16 v3, 0xf

    invoke-static {v0, v2, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsIntOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/Asset;->setLeadTimeInMillis(I)V

    .line 683
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "parameters"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "&"

    const-string v3, "="

    invoke-static {v0, v2, v3}, Lcom/auditude/ads/util/StringUtil;->ConvertToKeysAndValues(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    .line 684
    invoke-virtual {p1}, Lcom/auditude/ads/model/Ad;->getNetworkAdType()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/auditude/ads/model/Ad;->getNetworkAdType()Ljava/lang/String;

    move-result-object v2

    const-string v3, "VMAP"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "daisy_chaining"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 686
    const-string v2, "daisy_chaining"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 688
    :cond_1
    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/Asset;->setAuditudeParams(Ljava/util/HashMap;)V

    .line 690
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    .line 693
    :goto_1
    iget-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 694
    const/4 v3, 0x2

    if-ne v0, v3, :cond_7

    .line 696
    const-string v0, "mediaFile"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 698
    invoke-direct {p0, v1}, Lcom/auditude/ads/response/AuditudeResponseParser;->parseMediaFile(Lcom/auditude/ads/model/Asset;)Lcom/auditude/ads/model/media/MediaFile;

    move-result-object v2

    .line 699
    if-eqz v2, :cond_2

    .line 701
    iget-object v0, v2, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/Asset;->setCreativeType(Ljava/lang/String;)V

    .line 702
    const-string v0, "text/html"

    iget-object v3, v2, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "iframe"

    :goto_2
    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/Asset;->setResourceType(Ljava/lang/String;)V

    .line 703
    invoke-virtual {v1, v2}, Lcom/auditude/ads/model/Asset;->AddMediaFile(Lcom/auditude/ads/model/media/MediaFile;)V

    .line 727
    :cond_2
    :goto_3
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    goto :goto_1

    .line 702
    :cond_3
    const-string v0, "static"

    goto :goto_2

    .line 706
    :cond_4
    const-string v0, "click"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 708
    invoke-direct {p0, v1}, Lcom/auditude/ads/response/AuditudeResponseParser;->parseClick(Lcom/auditude/ads/model/Asset;)V

    goto :goto_3

    .line 710
    :cond_5
    const-string v0, "tracking"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 712
    invoke-direct {p0, v1}, Lcom/auditude/ads/response/AuditudeResponseParser;->parseTracking(Lcom/auditude/ads/model/Asset;)V

    goto :goto_3

    .line 714
    :cond_6
    const-string v0, "submission"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 716
    invoke-direct {p0, v1}, Lcom/auditude/ads/response/AuditudeResponseParser;->parseSubmission(Lcom/auditude/ads/model/BaseElement;)V

    goto :goto_3

    .line 719
    :cond_7
    const/4 v3, 0x3

    if-ne v0, v3, :cond_2

    .line 721
    const-string v0, "asset"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 731
    const-string v0, "linear"

    invoke-virtual {v1}, Lcom/auditude/ads/model/Asset;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 733
    const-string v0, "creativeprogress"

    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/Asset;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v0

    .line 734
    if-eqz v0, :cond_8

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v2

    if-eqz v2, :cond_8

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_8

    .line 736
    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    .line 737
    if-eqz v0, :cond_8

    .line 739
    new-instance v2, Lcom/auditude/ads/model/tracking/Submission;

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingUrl;->getUrl()Ljava/lang/String;

    move-result-object v3

    const-string v4, "start"

    invoke-direct {v2, v3, v4}, Lcom/auditude/ads/model/tracking/Submission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "start"

    invoke-virtual {v1, v2, v3}, Lcom/auditude/ads/model/Asset;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    .line 740
    new-instance v2, Lcom/auditude/ads/model/tracking/Submission;

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingUrl;->getUrl()Ljava/lang/String;

    move-result-object v3

    const-string v4, "firstquartile"

    invoke-direct {v2, v3, v4}, Lcom/auditude/ads/model/tracking/Submission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "firstquartile"

    invoke-virtual {v1, v2, v3}, Lcom/auditude/ads/model/Asset;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    .line 741
    new-instance v2, Lcom/auditude/ads/model/tracking/Submission;

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingUrl;->getUrl()Ljava/lang/String;

    move-result-object v3

    const-string v4, "midpoint"

    invoke-direct {v2, v3, v4}, Lcom/auditude/ads/model/tracking/Submission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "midpoint"

    invoke-virtual {v1, v2, v3}, Lcom/auditude/ads/model/Asset;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    .line 742
    new-instance v2, Lcom/auditude/ads/model/tracking/Submission;

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingUrl;->getUrl()Ljava/lang/String;

    move-result-object v3

    const-string v4, "thirdquartile"

    invoke-direct {v2, v3, v4}, Lcom/auditude/ads/model/tracking/Submission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "thirdquartile"

    invoke-virtual {v1, v2, v3}, Lcom/auditude/ads/model/Asset;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    .line 743
    new-instance v2, Lcom/auditude/ads/model/tracking/Submission;

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingUrl;->getUrl()Ljava/lang/String;

    move-result-object v0

    const-string v3, "complete"

    invoke-direct {v2, v0, v3}, Lcom/auditude/ads/model/tracking/Submission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "complete"

    invoke-virtual {v1, v2, v0}, Lcom/auditude/ads/model/Asset;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    .line 749
    :cond_8
    instance-of v0, v1, Lcom/auditude/ads/model/OnPageAsset;

    if-eqz v0, :cond_9

    .line 751
    invoke-virtual {v1}, Lcom/auditude/ads/model/Asset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 753
    invoke-virtual {v1}, Lcom/auditude/ads/model/Asset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Click;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/auditude/ads/model/Click;->setShouldAppendParState(Z)V

    :cond_9
    move-object v0, v1

    .line 757
    goto/16 :goto_0
.end method

.method private parseClick(Lcom/auditude/ads/model/Asset;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 832
    invoke-virtual {p1}, Lcom/auditude/ads/model/Asset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Click;

    .line 833
    if-nez v0, :cond_0

    .line 835
    new-instance v0, Lcom/auditude/ads/model/Click;

    invoke-direct {v0, p1}, Lcom/auditude/ads/model/Click;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 836
    invoke-virtual {p1, v0}, Lcom/auditude/ads/model/Asset;->setClick(Lcom/auditude/ads/model/IClick;)V

    .line 839
    :cond_0
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "href"

    invoke-static {v1, v2, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/Click;->setUrl(Ljava/lang/String;)V

    .line 840
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "title"

    invoke-static {v1, v2, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/Click;->setTitle(Ljava/lang/String;)V

    .line 841
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "id"

    invoke-static {v1, v2, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/Click;->setID(Ljava/lang/String;)V

    .line 844
    invoke-virtual {p1}, Lcom/auditude/ads/model/Asset;->isNetworkAd()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 846
    new-instance v1, Lcom/auditude/ads/model/tracking/TrackingUrl;

    invoke-virtual {v0}, Lcom/auditude/ads/model/Click;->getUrl()Ljava/lang/String;

    move-result-object v2

    const-string v3, "click"

    invoke-direct {v1, v2, v3}, Lcom/auditude/ads/model/tracking/TrackingUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "click"

    invoke-virtual {v0, v1, v2}, Lcom/auditude/ads/model/Click;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    .line 850
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v1

    .line 851
    iget-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 852
    const/4 v3, 0x2

    if-ne v1, v3, :cond_2

    .line 854
    const-string v1, "submission"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 856
    invoke-direct {p0, v0}, Lcom/auditude/ads/response/AuditudeResponseParser;->parseSubmission(Lcom/auditude/ads/model/BaseElement;)V

    goto :goto_0

    .line 859
    :cond_2
    const/4 v3, 0x3

    if-ne v1, v3, :cond_1

    const-string v1, "click"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 864
    return-void
.end method

.method private parseMediaFile(Lcom/auditude/ads/model/Asset;)Lcom/auditude/ads/model/media/MediaFile;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 820
    new-instance v0, Lcom/auditude/ads/model/media/MediaFile;

    invoke-direct {v0}, Lcom/auditude/ads/model/media/MediaFile;-><init>()V

    .line 822
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "src"

    invoke-static {v1, v2, v4}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/auditude/ads/model/media/MediaFile;->source:Ljava/lang/String;

    .line 823
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "width"

    invoke-static {v1, v2, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsIntOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/auditude/ads/model/media/MediaFile;->width:I

    .line 824
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "height"

    invoke-static {v1, v2, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsIntOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/auditude/ads/model/media/MediaFile;->height:I

    .line 825
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "type"

    invoke-static {v1, v2, v4}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/auditude/ads/model/media/MediaFile;->mimeType:Ljava/lang/String;

    .line 827
    return-object v0
.end method

.method private parsePar()Lcom/auditude/ads/model/smil/Par;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 354
    new-instance v1, Lcom/auditude/ads/model/smil/Par;

    invoke-direct {v1}, Lcom/auditude/ads/model/smil/Par;-><init>()V

    .line 356
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    .line 359
    :goto_0
    iget-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 361
    const/4 v3, 0x2

    if-ne v0, v3, :cond_3

    .line 363
    const-string v0, "meta"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 365
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "name"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 366
    const-string v2, "priority"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 368
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "content"

    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsIntOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/smil/Par;->setPriority(I)V

    .line 396
    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    goto :goto_0

    .line 371
    :cond_1
    const-string v0, "setvalue"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 373
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "ref"

    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 374
    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 376
    iget-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v3, "value"

    const-string v4, ""

    invoke-static {v2, v3, v4}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/auditude/ads/model/smil/Par;->addState(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 379
    :cond_2
    const-string v0, "ref"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 381
    invoke-direct {p0, v1}, Lcom/auditude/ads/response/AuditudeResponseParser;->parseRef(Lcom/auditude/ads/model/smil/Par;)Lcom/auditude/ads/model/smil/Ref;

    move-result-object v0

    .line 382
    if-eqz v0, :cond_0

    .line 384
    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/smil/Par;->addRef(Lcom/auditude/ads/model/smil/Ref;)V

    goto :goto_1

    .line 388
    :cond_3
    const/4 v3, 0x3

    if-ne v0, v3, :cond_0

    .line 390
    const-string v0, "par"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 399
    return-object v1
.end method

.method private parseRef(Lcom/auditude/ads/model/smil/Par;)Lcom/auditude/ads/model/smil/Ref;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 404
    new-instance v2, Lcom/auditude/ads/model/smil/Ref;

    invoke-direct {v2, p1}, Lcom/auditude/ads/model/smil/Ref;-><init>(Lcom/auditude/ads/model/smil/Par;)V

    .line 406
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const/4 v1, 0x0

    const-string v3, "src"

    invoke-interface {v0, v1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 407
    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "urn:ad:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    .line 409
    new-instance v1, Ljava/lang/String;

    const-string v3, "urn:ad:"

    invoke-direct {v1, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 412
    const-string v0, "#"

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_1

    .line 414
    const/4 v0, 0x0

    const-string v3, "#"

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 415
    const-string v3, "#"

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/auditude/ads/model/smil/Ref;->setID(Ljava/lang/String;)V

    .line 422
    :goto_0
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->refs:Ljava/util/HashMap;

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 425
    :cond_0
    return-object v2

    :cond_1
    move-object v0, v1

    .line 419
    goto :goto_0
.end method

.method private parseSMIL()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    const/4 v6, 0x0

    .line 196
    .line 198
    const/4 v0, 0x0

    .line 201
    const/4 v3, -0x1

    move v4, v5

    move v2, v6

    move v1, v6

    .line 206
    :cond_0
    :goto_0
    iget-object v7, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    .line 207
    if-ne v4, v5, :cond_7

    .line 209
    const-string v8, "head"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 211
    iget-object v4, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    invoke-direct {p0, v4}, Lcom/auditude/ads/response/AuditudeResponseParser;->parseSMILSubmissions(Lcom/auditude/ads/model/BaseElement;)V

    move v9, v3

    move v3, v1

    move-object v1, v0

    move v0, v9

    .line 262
    :goto_1
    iget-object v4, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v4

    move v9, v0

    move-object v0, v1

    move v1, v3

    move v3, v9

    .line 204
    goto :goto_0

    .line 213
    :cond_1
    const-string v8, "seq"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 215
    add-int/lit8 v3, v3, 0x1

    .line 216
    invoke-direct {p0}, Lcom/auditude/ads/response/AuditudeResponseParser;->parseSequence()Lcom/auditude/ads/model/smil/Sequence;

    move-result-object v7

    .line 217
    if-eqz v7, :cond_0

    .line 219
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getType()Lcom/auditude/ads/model/smil/SmilElementType;

    move-result-object v4

    invoke-virtual {v7}, Lcom/auditude/ads/model/smil/Sequence;->getType()Lcom/auditude/ads/model/smil/SmilElementType;

    move-result-object v8

    if-eq v4, v8, :cond_4

    .line 223
    :cond_2
    if-nez v3, :cond_3

    invoke-virtual {v7}, Lcom/auditude/ads/model/smil/Sequence;->isLinear()Z

    move-result v0

    if-nez v0, :cond_3

    .line 225
    new-instance v0, Lcom/auditude/ads/model/smil/Group;

    sget-object v4, Lcom/auditude/ads/model/smil/SmilElementType;->LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    iget-object v8, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v8}, Lcom/auditude/ads/response/AdResponse;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v8

    invoke-direct {v0, v4, v1, v8}, Lcom/auditude/ads/model/smil/Group;-><init>(Lcom/auditude/ads/model/smil/SmilElementType;ILcom/auditude/ads/core/AdSettings;)V

    .line 226
    invoke-virtual {v0, v6}, Lcom/auditude/ads/model/smil/Group;->setStartTime(I)V

    .line 227
    iget-object v4, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->breaks:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 230
    :cond_3
    new-instance v0, Lcom/auditude/ads/model/smil/Group;

    invoke-virtual {v7}, Lcom/auditude/ads/model/smil/Sequence;->getType()Lcom/auditude/ads/model/smil/SmilElementType;

    move-result-object v4

    iget-object v8, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v8}, Lcom/auditude/ads/response/AdResponse;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v8

    invoke-direct {v0, v4, v1, v8}, Lcom/auditude/ads/model/smil/Group;-><init>(Lcom/auditude/ads/model/smil/SmilElementType;ILcom/auditude/ads/core/AdSettings;)V

    .line 232
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->isLinear()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 234
    invoke-virtual {v0, v2}, Lcom/auditude/ads/model/smil/Group;->setStartTime(I)V

    .line 235
    iget-object v4, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->breaks:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 248
    :cond_4
    :goto_2
    invoke-virtual {v7}, Lcom/auditude/ads/model/smil/Sequence;->isLinear()Z

    move-result v4

    if-nez v4, :cond_5

    .line 251
    invoke-virtual {v7}, Lcom/auditude/ads/model/smil/Sequence;->getDuration()I

    move-result v4

    add-int/2addr v2, v4

    .line 254
    :cond_5
    invoke-virtual {v0, v7}, Lcom/auditude/ads/model/smil/Group;->addSequence(Lcom/auditude/ads/model/smil/Sequence;)V

    move v9, v3

    move v3, v1

    move-object v1, v0

    move v0, v9

    .line 256
    goto :goto_1

    .line 240
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 243
    invoke-virtual {v0, v2}, Lcom/auditude/ads/model/smil/Group;->setStartTime(I)V

    .line 244
    iget-object v4, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 257
    :cond_7
    const/4 v8, 0x3

    if-ne v4, v8, :cond_8

    const-string v4, "smil"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 264
    return-void

    :cond_8
    move v9, v3

    move v3, v1

    move-object v1, v0

    move v0, v9

    goto/16 :goto_1
.end method

.method private parseSMILData(Lcom/auditude/ads/model/BaseElement;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 898
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 900
    invoke-virtual {p1, v1}, Lcom/auditude/ads/model/BaseElement;->setState(Ljava/util/HashMap;)V

    .line 902
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    .line 905
    :goto_0
    iget-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 907
    const/4 v3, 0x2

    if-ne v0, v3, :cond_1

    .line 909
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 920
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    goto :goto_0

    .line 911
    :cond_1
    const/4 v3, 0x3

    if-ne v0, v3, :cond_0

    .line 913
    const-string v0, "data"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 915
    invoke-virtual {p1, v1}, Lcom/auditude/ads/model/BaseElement;->setState(Ljava/util/HashMap;)V

    .line 922
    return-void
.end method

.method private parseSMILSubmissions(Lcom/auditude/ads/model/BaseElement;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 868
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    .line 871
    :goto_0
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 873
    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    .line 875
    const-string v0, "data"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 877
    invoke-direct {p0, p1}, Lcom/auditude/ads/response/AuditudeResponseParser;->parseSMILData(Lcom/auditude/ads/model/BaseElement;)V

    .line 892
    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    goto :goto_0

    .line 879
    :cond_1
    const-string v0, "submission"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 881
    invoke-direct {p0, p1}, Lcom/auditude/ads/response/AuditudeResponseParser;->parseSubmission(Lcom/auditude/ads/model/BaseElement;)V

    goto :goto_1

    .line 884
    :cond_2
    const/4 v2, 0x3

    if-ne v0, v2, :cond_0

    .line 886
    const-string v0, "head"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 894
    return-void
.end method

.method private parseSequence()Lcom/auditude/ads/model/smil/Sequence;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 271
    new-instance v1, Lcom/auditude/ads/model/smil/Sequence;

    sget-object v0, Lcom/auditude/ads/model/smil/SmilElementType;->LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    invoke-direct {v1, v6, v0}, Lcom/auditude/ads/model/smil/Sequence;-><init>(Lcom/auditude/ads/model/BaseElement;Lcom/auditude/ads/model/smil/SmilElementType;)V

    .line 273
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    .line 276
    :goto_0
    iget-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 278
    const/4 v3, 0x2

    if-ne v0, v3, :cond_a

    .line 280
    const-string v0, "meta"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 282
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "name"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 283
    const-string v2, "dur"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 285
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "content"

    invoke-static {v0, v2, v5}, Lcom/auditude/ads/util/XMLUtil;->attributeAsIntOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/smil/Sequence;->setDuration(I)V

    .line 346
    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    goto :goto_0

    .line 287
    :cond_1
    const-string v2, "max-dur"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 289
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "content"

    invoke-static {v0, v2, v5}, Lcom/auditude/ads/util/XMLUtil;->attributeAsIntOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/smil/Sequence;->setMaxDuration(I)V

    goto :goto_1

    .line 291
    :cond_2
    const-string v2, "count"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 293
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "content"

    invoke-static {v0, v2, v5}, Lcom/auditude/ads/util/XMLUtil;->attributeAsIntOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/smil/Sequence;->setCount(I)V

    goto :goto_1

    .line 295
    :cond_3
    const-string v2, "max-count"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 297
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "content"

    invoke-static {v0, v2, v5}, Lcom/auditude/ads/util/XMLUtil;->attributeAsIntOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/smil/Sequence;->setMaxCount(I)V

    goto :goto_1

    .line 299
    :cond_4
    const-string v2, "creativemaxdur"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 301
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "content"

    invoke-static {v0, v2, v5}, Lcom/auditude/ads/util/XMLUtil;->attributeAsIntOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/smil/Sequence;->setCreativeMaxDuration(I)V

    goto :goto_1

    .line 303
    :cond_5
    const-string v2, "ctype"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 305
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "content"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 306
    const-string v2, "linear"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object v0, Lcom/auditude/ads/model/smil/SmilElementType;->LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    .line 307
    :goto_2
    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Sequence;->getType()Lcom/auditude/ads/model/smil/SmilElementType;

    move-result-object v2

    if-eq v0, v2, :cond_0

    .line 309
    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/smil/Sequence;->setType(Lcom/auditude/ads/model/smil/SmilElementType;)V

    goto :goto_1

    .line 306
    :cond_6
    sget-object v0, Lcom/auditude/ads/model/smil/SmilElementType;->NON_LINEAR:Lcom/auditude/ads/model/smil/SmilElementType;

    goto :goto_2

    .line 313
    :cond_7
    const-string v0, "setvalue"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 315
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "ref"

    invoke-static {v0, v2, v6}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 316
    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 318
    iget-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v3, "value"

    const-string v4, ""

    invoke-static {v2, v3, v4}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/auditude/ads/model/smil/Sequence;->addState(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 321
    :cond_8
    const-string v0, "par"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 323
    invoke-direct {p0}, Lcom/auditude/ads/response/AuditudeResponseParser;->parsePar()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    .line 324
    if-eqz v0, :cond_0

    .line 326
    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/smil/Sequence;->addPar(Lcom/auditude/ads/model/smil/Par;)V

    goto/16 :goto_1

    .line 329
    :cond_9
    const-string v0, "send"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 331
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "submission"

    invoke-static {v0, v2, v6}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 332
    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 334
    invoke-virtual {v1, v0}, Lcom/auditude/ads/model/smil/Sequence;->setSubmissionId(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 338
    :cond_a
    const/4 v3, 0x3

    if-ne v0, v3, :cond_0

    .line 340
    const-string v0, "seq"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 349
    return-object v1
.end method

.method private parseSubmission(Lcom/auditude/ads/model/BaseElement;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 926
    new-instance v0, Lcom/auditude/ads/model/tracking/Submission;

    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "action"

    invoke-interface {v1, v4, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 927
    iget-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v3, "id"

    invoke-interface {v2, v4, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/auditude/ads/model/tracking/Submission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 928
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "id"

    invoke-interface {v1, v4, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 926
    invoke-virtual {p1, v0, v1}, Lcom/auditude/ads/model/BaseElement;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    .line 929
    return-void
.end method

.method private parseTracking(Lcom/auditude/ads/model/Asset;)V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 762
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v1, "action"

    invoke-static {v0, v1, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 763
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v2, "actuate"

    invoke-static {v0, v2, v3}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 765
    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {v1}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 768
    new-instance v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    const-string v2, "creativeview"

    invoke-direct {v0, v1, v2}, Lcom/auditude/ads/model/tracking/TrackingUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "creativeview"

    invoke-virtual {p1, v0, v1}, Lcom/auditude/ads/model/Asset;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    .line 816
    :cond_0
    :goto_0
    return-void

    .line 773
    :cond_1
    const-string v2, "click"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 775
    invoke-virtual {p1}, Lcom/auditude/ads/model/Asset;->getClick()Lcom/auditude/ads/model/IClick;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Click;

    .line 776
    if-nez v0, :cond_2

    .line 778
    new-instance v0, Lcom/auditude/ads/model/Click;

    invoke-direct {v0, p1}, Lcom/auditude/ads/model/Click;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 779
    invoke-virtual {p1, v0}, Lcom/auditude/ads/model/Asset;->setClick(Lcom/auditude/ads/model/IClick;)V

    .line 781
    :cond_2
    new-instance v2, Lcom/auditude/ads/model/tracking/TrackingUrl;

    const-string v3, "click"

    invoke-direct {v2, v1, v3}, Lcom/auditude/ads/model/tracking/TrackingUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "click"

    invoke-virtual {v0, v2, v1}, Lcom/auditude/ads/model/Click;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    goto :goto_0

    .line 794
    :cond_3
    const-string v2, "%"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_0

    .line 796
    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 797
    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    .line 800
    :sswitch_0
    new-instance v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    const-string v2, "start"

    invoke-direct {v0, v1, v2}, Lcom/auditude/ads/model/tracking/TrackingUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "start"

    invoke-virtual {p1, v0, v1}, Lcom/auditude/ads/model/Asset;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    goto :goto_0

    .line 803
    :sswitch_1
    new-instance v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    const-string v2, "firstquartile"

    invoke-direct {v0, v1, v2}, Lcom/auditude/ads/model/tracking/TrackingUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "firstquartile"

    invoke-virtual {p1, v0, v1}, Lcom/auditude/ads/model/Asset;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    goto :goto_0

    .line 806
    :sswitch_2
    new-instance v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    const-string v2, "midpoint"

    invoke-direct {v0, v1, v2}, Lcom/auditude/ads/model/tracking/TrackingUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "midpoint"

    invoke-virtual {p1, v0, v1}, Lcom/auditude/ads/model/Asset;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    goto :goto_0

    .line 809
    :sswitch_3
    new-instance v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    const-string v2, "thirdquartile"

    invoke-direct {v0, v1, v2}, Lcom/auditude/ads/model/tracking/TrackingUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "thirdquartile"

    invoke-virtual {p1, v0, v1}, Lcom/auditude/ads/model/Asset;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    goto :goto_0

    .line 812
    :sswitch_4
    new-instance v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    const-string v2, "complete"

    invoke-direct {v0, v1, v2}, Lcom/auditude/ads/model/tracking/TrackingUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "complete"

    invoke-virtual {p1, v0, v1}, Lcom/auditude/ads/model/Asset;->addTrackingUrlForType(Lcom/auditude/ads/model/tracking/TrackingUrl;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 797
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x19 -> :sswitch_1
        0x32 -> :sswitch_2
        0x4b -> :sswitch_3
        0x64 -> :sswitch_4
    .end sparse-switch
.end method

.method private parseXML(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 114
    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 116
    const-string v0, "Adserver response is empty"

    invoke-direct {p0, v0}, Lcom/auditude/ads/response/AuditudeResponseParser;->NotifyError(Ljava/lang/String;)V

    .line 117
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 169
    :goto_0
    return-object v0

    .line 120
    :cond_0
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 122
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v0

    .line 123
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    .line 125
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    new-instance v2, Ljava/io/StringReader;

    invoke-direct {v2, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v2}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 127
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    move v5, v0

    move-object v0, v1

    move v1, v5

    .line 128
    :goto_1
    if-ne v1, v3, :cond_1

    .line 161
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 164
    invoke-direct {p0}, Lcom/auditude/ads/response/AuditudeResponseParser;->applyAdsOnRefs()V

    .line 165
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 130
    :cond_1
    packed-switch v1, :pswitch_data_0

    .line 158
    :cond_2
    :goto_2
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    goto :goto_1

    .line 133
    :pswitch_0
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 134
    const-string v2, "response"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 137
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_2

    .line 139
    :cond_3
    const-string v2, "error"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 141
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/auditude/ads/response/AuditudeResponseParser;->NotifyError(Ljava/lang/String;)V

    .line 142
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 144
    :cond_4
    const-string v2, "smil"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 146
    invoke-direct {p0}, Lcom/auditude/ads/response/AuditudeResponseParser;->parseSMIL()V

    goto :goto_2

    .line 148
    :cond_5
    const-string v2, "ad"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 150
    invoke-direct {p0}, Lcom/auditude/ads/response/AuditudeResponseParser;->parseAd()V

    goto :goto_2

    .line 169
    :cond_6
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto/16 :goto_0

    .line 130
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 958
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    if-eqz v0, :cond_0

    .line 960
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    invoke-virtual {v0}, Lcom/auditude/ads/loader/DataLoader;->cancel()V

    .line 962
    :cond_0
    return-void
.end method

.method public final dispose()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 966
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->breaks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 970
    iput-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->breaks:Ljava/util/ArrayList;

    .line 972
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 976
    iput-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->chapters:Ljava/util/ArrayList;

    .line 978
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->ads:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_3

    .line 982
    iput-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->ads:Ljava/util/HashMap;

    .line 984
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    if-eqz v0, :cond_0

    .line 986
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    invoke-virtual {v0, v2}, Lcom/auditude/ads/loader/DataLoader;->setDataLoaderListener(Lcom/auditude/ads/loader/DataLoader$DataLoaderListener;)V

    .line 987
    iput-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    .line 989
    :cond_0
    return-void

    .line 966
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Group;

    .line 968
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->dispose()V

    goto :goto_0

    .line 972
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Group;

    .line 974
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->dispose()V

    goto :goto_1

    .line 978
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 980
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Ad;

    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->dispose()V

    goto :goto_2
.end method

.method public loadAdRequest(Lcom/auditude/ads/response/AdResponse;Lcom/auditude/ads/loader/AdRequest;I)V
    .locals 4

    .prologue
    .line 67
    iput-object p1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    .line 68
    iput-object p2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->adRequest:Lcom/auditude/ads/loader/AdRequest;

    .line 69
    iput p3, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->timeout:I

    .line 71
    new-instance v0, Lcom/auditude/ads/loader/DataLoader;

    invoke-direct {v0}, Lcom/auditude/ads/loader/DataLoader;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    .line 72
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    invoke-virtual {v0, p0}, Lcom/auditude/ads/loader/DataLoader;->setDataLoaderListener(Lcom/auditude/ads/loader/DataLoader$DataLoaderListener;)V

    .line 73
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->adRequest:Lcom/auditude/ads/loader/AdRequest;

    invoke-virtual {v1}, Lcom/auditude/ads/loader/AdRequest;->getAdRequestUrl()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->adRequest:Lcom/auditude/ads/loader/AdRequest;

    invoke-virtual {v2}, Lcom/auditude/ads/loader/AdRequest;->getKeyValueString()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->timeout:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/auditude/ads/loader/DataLoader;->load(Ljava/lang/String;Ljava/lang/String;I)V

    .line 74
    return-void
.end method

.method public onRequestComplete(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 83
    :try_start_0
    invoke-direct {p0, p1}, Lcom/auditude/ads/response/AuditudeResponseParser;->parseXML(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 84
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    iget-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->breaks:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Lcom/auditude/ads/response/AdResponse;->setBreaks(Ljava/util/ArrayList;)V

    .line 85
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    iget-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Lcom/auditude/ads/response/AdResponse;->setChapters(Ljava/util/ArrayList;)V

    .line 86
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    iget-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    invoke-virtual {v1, v2}, Lcom/auditude/ads/response/AdResponse;->setSubmissions(Lcom/auditude/ads/model/tracking/Submissions;)V

    .line 87
    iget-object v1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->adResponse:Lcom/auditude/ads/response/AdResponse;

    iget-object v2, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->ads:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Lcom/auditude/ads/response/AdResponse;->setAds(Ljava/util/HashMap;)V

    .line 88
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->listener:Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;->onRequestComplete(Lcom/auditude/ads/exception/AssetException;)V

    .line 105
    :goto_0
    return-void

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->listener:Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;->onRequestFailed(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 97
    :catch_0
    move-exception v0

    .line 99
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_0

    .line 101
    :catch_1
    move-exception v0

    .line 103
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public onRequestFailed(Ljava/lang/Throwable;)V
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->listener:Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;

    invoke-interface {v0, p1}, Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;->onRequestFailed(Ljava/lang/Throwable;)V

    .line 110
    return-void
.end method

.method public setResponseParserListener(Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;)V
    .locals 0

    .prologue
    .line 77
    iput-object p1, p0, Lcom/auditude/ads/response/AuditudeResponseParser;->listener:Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;

    return-void
.end method
