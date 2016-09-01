.class public Lcom/auditude/ads/model/Ad;
.super Lcom/auditude/ads/model/BaseElement;
.source "SourceFile"


# instance fields
.field private allowMultipleAds:Ljava/lang/String;

.field private assets:Ljava/util/ArrayList;

.field private assetsBySegment:Ljava/util/HashMap;

.field private auditudeParams:Ljava/util/HashMap;

.field private dispatchError:Ljava/lang/Boolean;

.field private followRedirects:Ljava/lang/Boolean;

.field private isFromVmapDoc:Ljava/lang/Boolean;

.field private isNetworkAd:Z

.field private networkAdSource:Ljava/lang/Object;

.field private networkAdType:Ljava/lang/String;

.field private repackagingEnabled:Z

.field private trackingAssets:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lcom/auditude/ads/model/BaseElement;)V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 25
    invoke-direct {p0, p1}, Lcom/auditude/ads/model/BaseElement;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 11
    iput-boolean v1, p0, Lcom/auditude/ads/model/Ad;->repackagingEnabled:Z

    .line 14
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/model/Ad;->followRedirects:Ljava/lang/Boolean;

    .line 15
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/model/Ad;->dispatchError:Ljava/lang/Boolean;

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/model/Ad;->trackingAssets:Ljava/util/ArrayList;

    .line 20
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/model/Ad;->auditudeParams:Ljava/util/HashMap;

    .line 21
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/model/Ad;->isFromVmapDoc:Ljava/lang/Boolean;

    .line 26
    return-void
.end method

.method public static consolidateOnPageAsset(Ljava/util/ArrayList;Lcom/auditude/ads/model/Asset;)V
    .locals 4

    .prologue
    .line 219
    instance-of v0, p1, Lcom/auditude/ads/model/OnPageAsset;

    if-eqz v0, :cond_0

    if-nez p0, :cond_1

    .line 245
    :cond_0
    :goto_0
    return-void

    .line 224
    :cond_1
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Asset;

    .line 227
    if-eq v0, p1, :cond_2

    instance-of v2, v0, Lcom/auditude/ads/model/OnPageAsset;

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Lcom/auditude/ads/model/Asset;->getWidth()I

    move-result v3

    if-ne v2, v3, :cond_2

    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getHeight()I

    move-result v2

    invoke-virtual {p1}, Lcom/auditude/ads/model/Asset;->getHeight()I

    move-result v3

    if-ne v2, v3, :cond_2

    move-object v1, p1

    .line 229
    check-cast v1, Lcom/auditude/ads/model/OnPageAsset;

    invoke-static {v1}, Lcom/auditude/ads/model/Ad;->getCompanionPriority(Lcom/auditude/ads/model/OnPageAsset;)I

    move-result v3

    move-object v1, v0

    .line 230
    check-cast v1, Lcom/auditude/ads/model/OnPageAsset;

    invoke-static {v1}, Lcom/auditude/ads/model/Ad;->getCompanionPriority(Lcom/auditude/ads/model/OnPageAsset;)I

    move-result v1

    .line 233
    if-ge v1, v3, :cond_5

    move-object v2, v0

    .line 234
    :goto_1
    if-ge v1, v3, :cond_3

    move-object v0, p1

    .line 237
    :cond_3
    invoke-virtual {v2}, Lcom/auditude/ads/model/Asset;->getResourceType()Ljava/lang/String;

    move-result-object v1

    const-string v3, "static"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 239
    check-cast v0, Lcom/auditude/ads/model/OnPageAsset;

    move-object v1, v2

    check-cast v1, Lcom/auditude/ads/model/OnPageAsset;

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/OnPageAsset;->setStaticAsset(Lcom/auditude/ads/model/IOnPageAsset;)V

    .line 241
    :cond_4
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0

    :cond_5
    move-object v2, p1

    .line 233
    goto :goto_1
.end method

.method private static getCompanionPriority(Lcom/auditude/ads/model/OnPageAsset;)I
    .locals 3

    .prologue
    .line 249
    invoke-virtual {p0}, Lcom/auditude/ads/model/OnPageAsset;->getCreativeType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/auditude/ads/model/OnPageAsset;->getCreativeType()Ljava/lang/String;

    move-result-object v0

    const-string v1, "application/x-shockwave-flash"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 251
    const/4 v0, 0x0

    .line 260
    :goto_0
    return v0

    .line 255
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 256
    const-string v1, "static"

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    const-string v1, "iframe"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    const-string v1, "html"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    invoke-virtual {p0}, Lcom/auditude/ads/model/OnPageAsset;->getResourceType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0
.end method


# virtual methods
.method public final addAsset(Lcom/auditude/ads/model/Asset;)V
    .locals 1

    .prologue
    .line 120
    if-nez p1, :cond_0

    .line 129
    :goto_0
    return-void

    .line 122
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->assets:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 124
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/model/Ad;->assets:Ljava/util/ArrayList;

    .line 127
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->assets:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->assets:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Lcom/auditude/ads/model/Ad;->consolidateOnPageAsset(Ljava/util/ArrayList;Lcom/auditude/ads/model/Asset;)V

    goto :goto_0
.end method

.method public final addSegmentById(Ljava/lang/String;[Lcom/auditude/ads/model/Asset;)V
    .locals 1

    .prologue
    .line 192
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->assetsBySegment:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 194
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/model/Ad;->assetsBySegment:Ljava/util/HashMap;

    .line 197
    :cond_0
    if-eqz p2, :cond_1

    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 199
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->assetsBySegment:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    :cond_1
    return-void
.end method

.method public final addTrackingAsset(Lcom/auditude/ads/model/Asset;)V
    .locals 1

    .prologue
    .line 158
    if-eqz p1, :cond_0

    .line 160
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->trackingAssets:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    :cond_0
    return-void
.end method

.method public final getAllowMultipleAds()Ljava/lang/String;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->allowMultipleAds:Ljava/lang/String;

    return-object v0
.end method

.method public final getAssetById(Ljava/lang/String;)Lcom/auditude/ads/model/Asset;
    .locals 3

    .prologue
    .line 133
    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->assets:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 135
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->assets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 144
    :cond_1
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 135
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Asset;

    .line 137
    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->getID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0
.end method

.method public final getAssetsBySegment(Ljava/lang/String;)[Lcom/auditude/ads/model/Asset;
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->assetsBySegment:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->assetsBySegment:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 151
    :cond_0
    const/4 v0, 0x0

    .line 153
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->assetsBySegment:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/auditude/ads/model/Asset;

    goto :goto_0
.end method

.method public final getAuditudeParams()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->auditudeParams:Ljava/util/HashMap;

    return-object v0
.end method

.method public final getDispatchError()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->dispatchError:Ljava/lang/Boolean;

    return-object v0
.end method

.method public final getFollowRedirects()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->followRedirects:Ljava/lang/Boolean;

    return-object v0
.end method

.method public final getIsFromVmapDoc()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->isFromVmapDoc:Ljava/lang/Boolean;

    return-object v0
.end method

.method public final getIsNetworkAd()Z
    .locals 1

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/auditude/ads/model/Ad;->isNetworkAd:Z

    return v0
.end method

.method public final getNetworkAdSource()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->networkAdSource:Ljava/lang/Object;

    return-object v0
.end method

.method public final getNetworkAdType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->networkAdType:Ljava/lang/String;

    return-object v0
.end method

.method public final getTrackingAssetByType(Ljava/lang/String;)Lcom/auditude/ads/model/Asset;
    .locals 3

    .prologue
    .line 166
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->trackingAssets:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 168
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->trackingAssets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_3

    .line 187
    :cond_1
    const/4 v0, 0x0

    :cond_2
    :goto_0
    return-object v0

    .line 168
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Asset;

    .line 170
    instance-of v2, v0, Lcom/auditude/ads/model/ILinearAsset;

    if-eqz v2, :cond_4

    const-string v2, "linear"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 175
    :cond_4
    instance-of v2, v0, Lcom/auditude/ads/model/INonLinearAsset;

    if-eqz v2, :cond_5

    const-string v2, "nonlinear"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 180
    :cond_5
    instance-of v2, v0, Lcom/auditude/ads/model/IOnPageAsset;

    if-eqz v2, :cond_0

    const-string v2, "companion"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0
.end method

.method public final hasAssetsWithMimeType(Ljava/util/ArrayList;)Ljava/lang/Boolean;
    .locals 2

    .prologue
    .line 205
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->assets:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 207
    iget-object v0, p0, Lcom/auditude/ads/model/Ad;->assets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 214
    :cond_1
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    .line 207
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Asset;

    .line 208
    invoke-virtual {v0, p1}, Lcom/auditude/ads/model/Asset;->hasAssetsWithMimeType(Ljava/util/ArrayList;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 210
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public final isRepackagingEnabled()Z
    .locals 1

    .prologue
    .line 40
    iget-boolean v0, p0, Lcom/auditude/ads/model/Ad;->repackagingEnabled:Z

    return v0
.end method

.method public final setAllowMultipleAds(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 100
    iput-object p1, p0, Lcom/auditude/ads/model/Ad;->allowMultipleAds:Ljava/lang/String;

    .line 101
    return-void
.end method

.method public final setAuditudeParams(Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 35
    iput-object p1, p0, Lcom/auditude/ads/model/Ad;->auditudeParams:Ljava/util/HashMap;

    .line 36
    return-void
.end method

.method public final setDispatchError(Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 95
    iput-object p1, p0, Lcom/auditude/ads/model/Ad;->dispatchError:Ljava/lang/Boolean;

    .line 96
    return-void
.end method

.method public final setFollowRedirects(Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 85
    iput-object p1, p0, Lcom/auditude/ads/model/Ad;->followRedirects:Ljava/lang/Boolean;

    .line 86
    return-void
.end method

.method public final setIsFromVmapDoc(Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 110
    iput-object p1, p0, Lcom/auditude/ads/model/Ad;->isFromVmapDoc:Ljava/lang/Boolean;

    .line 111
    return-void
.end method

.method public final setIsNetworkAd(Z)V
    .locals 0

    .prologue
    .line 55
    iput-boolean p1, p0, Lcom/auditude/ads/model/Ad;->isNetworkAd:Z

    .line 56
    return-void
.end method

.method public final setNetworkAdSource(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 65
    iput-object p1, p0, Lcom/auditude/ads/model/Ad;->networkAdSource:Ljava/lang/Object;

    .line 66
    return-void
.end method

.method public final setNetworkAdType(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 75
    iput-object p1, p0, Lcom/auditude/ads/model/Ad;->networkAdType:Ljava/lang/String;

    .line 76
    return-void
.end method

.method public final setRepackagingEnabled(Z)V
    .locals 0

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/auditude/ads/model/Ad;->repackagingEnabled:Z

    .line 46
    return-void
.end method
