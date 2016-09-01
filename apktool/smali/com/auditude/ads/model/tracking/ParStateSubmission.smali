.class public Lcom/auditude/ads/model/tracking/ParStateSubmission;
.super Lcom/auditude/ads/model/tracking/Submission;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0, p1, p2}, Lcom/auditude/ads/model/tracking/Submission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    return-void
.end method


# virtual methods
.method public getUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 19
    invoke-super {p0}, Lcom/auditude/ads/model/tracking/Submission;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 23
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/core/AuditudeEnv;->getReportingHelper()Lcom/auditude/ads/reporting/ReportingHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/reporting/ReportingHelper;->currentAdState()Ljava/util/HashMap;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/auditude/ads/util/AuditudeUtil;->getUrlWithState(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v0

    .line 26
    :cond_0
    return-object v0
.end method

.method public log(ZLjava/util/HashMap;)V
    .locals 4

    .prologue
    .line 32
    invoke-virtual {p0}, Lcom/auditude/ads/model/tracking/ParStateSubmission;->isLogged()Z

    move-result v0

    if-eqz v0, :cond_1

    if-nez p1, :cond_1

    .line 59
    :cond_0
    :goto_0
    return-void

    .line 35
    :cond_1
    invoke-virtual {p0}, Lcom/auditude/ads/model/tracking/ParStateSubmission;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 36
    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 39
    iget-object v1, p0, Lcom/auditude/ads/model/tracking/ParStateSubmission;->externalUrl:Ljava/lang/String;

    invoke-static {v1}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 41
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 42
    const-string v2, "v"

    const-string v3, "0"

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    invoke-static {v0, v1}, Lcom/auditude/ads/util/URLUtil;->appendURLParams(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v0

    .line 56
    :cond_2
    invoke-static {v0}, Lcom/auditude/ads/util/PingUtil;->pingUrl(Ljava/lang/String;)V

    .line 58
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/auditude/ads/model/tracking/ParStateSubmission;->setLogged(Z)V

    goto :goto_0
.end method
