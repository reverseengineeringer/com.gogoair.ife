.class public Lcom/auditude/ads/model/tracking/Submissions;
.super Lcom/auditude/ads/model/BaseElement;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 9
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/auditude/ads/model/BaseElement;-><init>(Lcom/auditude/ads/model/BaseElement;)V

    .line 10
    return-void
.end method


# virtual methods
.method public getSubmissionById(Ljava/lang/String;)Lcom/auditude/ads/model/tracking/Submission;
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/auditude/ads/model/tracking/Submissions;->getTrackingEventByType(Ljava/lang/String;)Lcom/auditude/ads/model/tracking/TrackingEvent;

    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 18
    invoke-virtual {v0}, Lcom/auditude/ads/model/tracking/TrackingEvent;->getTrackingUrls()Ljava/util/ArrayList;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/tracking/TrackingUrl;

    .line 19
    instance-of v2, v0, Lcom/auditude/ads/model/tracking/Submission;

    if-eqz v2, :cond_1

    :goto_0
    check-cast v0, Lcom/auditude/ads/model/tracking/Submission;

    move-object v1, v0

    .line 22
    :cond_0
    return-object v1

    :cond_1
    move-object v0, v1

    .line 19
    goto :goto_0
.end method
