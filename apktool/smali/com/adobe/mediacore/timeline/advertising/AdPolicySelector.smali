.class public interface abstract Lcom/adobe/mediacore/timeline/advertising/AdPolicySelector;
.super Ljava/lang/Object;


# virtual methods
.method public abstract selectAdBreaksToPlay(Lcom/adobe/mediacore/timeline/advertising/AdPolicyInfo;)Ljava/util/List;
.end method

.method public abstract selectPolicyForAdBreak(Lcom/adobe/mediacore/timeline/advertising/AdPolicyInfo;)Lcom/adobe/mediacore/timeline/advertising/AdBreakPolicy;
.end method

.method public abstract selectPolicyForSeekIntoAd(Lcom/adobe/mediacore/timeline/advertising/AdPolicyInfo;)Lcom/adobe/mediacore/timeline/advertising/AdPolicy;
.end method

.method public abstract selectWatchedPolicyForAdBreak(Lcom/adobe/mediacore/timeline/advertising/AdPolicyInfo;)Lcom/adobe/mediacore/metadata/AdBreakAsWatched;
.end method
