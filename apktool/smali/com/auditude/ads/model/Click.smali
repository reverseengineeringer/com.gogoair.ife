.class public Lcom/auditude/ads/model/Click;
.super Lcom/auditude/ads/model/BaseElement;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/model/IClick;


# instance fields
.field private altText:Ljava/lang/String;

.field private baseTrackingClick:Lcom/auditude/ads/model/Click;

.field private shouldAppendParState:Z

.field private target:Ljava/lang/String;

.field private title:Ljava/lang/String;

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/auditude/ads/model/BaseElement;)V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/auditude/ads/model/BaseElement;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 13
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/model/Click;->shouldAppendParState:Z

    .line 18
    return-void
.end method


# virtual methods
.method public final getAltText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/auditude/ads/model/Click;->altText:Ljava/lang/String;

    return-object v0
.end method

.method public final getAsset()Lcom/auditude/ads/model/IAsset;
    .locals 1

    .prologue
    .line 99
    invoke-virtual {p0}, Lcom/auditude/ads/model/Click;->getParent()Lcom/auditude/ads/model/BaseElement;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/IAsset;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/auditude/ads/model/Click;->getParent()Lcom/auditude/ads/model/BaseElement;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/IAsset;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getBaseTrackingClick()Lcom/auditude/ads/model/Click;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/auditude/ads/model/Click;->baseTrackingClick:Lcom/auditude/ads/model/Click;

    return-object v0
.end method

.method public final getShouldAppendParState()Z
    .locals 1

    .prologue
    .line 22
    iget-boolean v0, p0, Lcom/auditude/ads/model/Click;->shouldAppendParState:Z

    return v0
.end method

.method public final getTarget()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/auditude/ads/model/Click;->target:Ljava/lang/String;

    return-object v0
.end method

.method public final getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/auditude/ads/model/Click;->title:Ljava/lang/String;

    return-object v0
.end method

.method public final getUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 37
    iget-boolean v0, p0, Lcom/auditude/ads/model/Click;->shouldAppendParState:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/model/Click;->url:Ljava/lang/String;

    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/core/AuditudeEnv;->getReportingHelper()Lcom/auditude/ads/reporting/ReportingHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/reporting/ReportingHelper;->currentAdState()Ljava/util/HashMap;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/auditude/ads/util/AuditudeUtil;->getUrlWithState(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v0

    .line 50
    :goto_0
    invoke-static {v0}, Lcom/auditude/ads/util/AuditudeUtil;->substituteTags(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/model/Click;->url:Ljava/lang/String;

    goto :goto_0
.end method

.method public final isNetworkElement()Z
    .locals 1

    .prologue
    .line 32
    invoke-virtual {p0}, Lcom/auditude/ads/model/Click;->getParent()Lcom/auditude/ads/model/BaseElement;

    move-result-object v0

    instance-of v0, v0, Lcom/auditude/ads/model/Asset;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/auditude/ads/model/Click;->getParent()Lcom/auditude/ads/model/BaseElement;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Asset;

    invoke-virtual {v0}, Lcom/auditude/ads/model/Asset;->isNetworkAd()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final setAltText(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 85
    iput-object p1, p0, Lcom/auditude/ads/model/Click;->altText:Ljava/lang/String;

    .line 86
    return-void
.end method

.method public final setBaseTrackingClick(Lcom/auditude/ads/model/Click;)V
    .locals 0

    .prologue
    .line 65
    iput-object p1, p0, Lcom/auditude/ads/model/Click;->baseTrackingClick:Lcom/auditude/ads/model/Click;

    .line 66
    return-void
.end method

.method public final setShouldAppendParState(Z)V
    .locals 0

    .prologue
    .line 27
    iput-boolean p1, p0, Lcom/auditude/ads/model/Click;->shouldAppendParState:Z

    .line 28
    return-void
.end method

.method public final setTarget(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 94
    iput-object p1, p0, Lcom/auditude/ads/model/Click;->target:Ljava/lang/String;

    .line 95
    return-void
.end method

.method public final setTitle(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 75
    iput-object p1, p0, Lcom/auditude/ads/model/Click;->title:Ljava/lang/String;

    .line 76
    return-void
.end method

.method public final setUrl(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 55
    iput-object p1, p0, Lcom/auditude/ads/model/Click;->url:Ljava/lang/String;

    .line 56
    return-void
.end method
