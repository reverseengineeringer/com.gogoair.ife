.class Lcom/adobe/mediacore/TimelineMonitor$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/adobe/mediacore/MediaPlayer$AdPlaybackEventListener;


# instance fields
.field final synthetic this$0:Lcom/adobe/mediacore/TimelineMonitor;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/TimelineMonitor;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAdBreakComplete(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)V
    .locals 3

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->getLastAd()Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getType()Lcom/adobe/mediacore/MediaResource$Type;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaResource$Type;->CUSTOM:Lcom/adobe/mediacore/MediaResource$Type;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    # setter for: Lcom/adobe/mediacore/TimelineMonitor;->_pendingAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    invoke-static {v0, v2}, Lcom/adobe/mediacore/TimelineMonitor;->access$202(Lcom/adobe/mediacore/TimelineMonitor;Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    iget-object v0, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    # setter for: Lcom/adobe/mediacore/TimelineMonitor;->_pendingAd:Lcom/adobe/mediacore/timeline/advertising/Ad;
    invoke-static {v0, v2}, Lcom/adobe/mediacore/TimelineMonitor;->access$502(Lcom/adobe/mediacore/TimelineMonitor;Lcom/adobe/mediacore/timeline/advertising/Ad;)Lcom/adobe/mediacore/timeline/advertising/Ad;

    iget-object v0, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    # invokes: Lcom/adobe/mediacore/TimelineMonitor;->onAdBreakComplete(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)V
    invoke-static {v0, p1}, Lcom/adobe/mediacore/TimelineMonitor;->access$700(Lcom/adobe/mediacore/TimelineMonitor;Lcom/adobe/mediacore/timeline/advertising/AdBreak;)V

    :cond_0
    return-void
.end method

.method public onAdBreakSkipped(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)V
    .locals 0

    return-void
.end method

.method public onAdBreakStart(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)V
    .locals 2

    invoke-virtual {p1}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->getFirstAd()Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getType()Lcom/adobe/mediacore/MediaResource$Type;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaResource$Type;->CUSTOM:Lcom/adobe/mediacore/MediaResource$Type;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    # invokes: Lcom/adobe/mediacore/TimelineMonitor;->onAdBreakStart(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)V
    invoke-static {v0, p1}, Lcom/adobe/mediacore/TimelineMonitor;->access$100(Lcom/adobe/mediacore/TimelineMonitor;Lcom/adobe/mediacore/timeline/advertising/AdBreak;)V

    iget-object v0, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    # getter for: Lcom/adobe/mediacore/TimelineMonitor;->_pendingAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    invoke-static {v0}, Lcom/adobe/mediacore/TimelineMonitor;->access$200(Lcom/adobe/mediacore/TimelineMonitor;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    # getter for: Lcom/adobe/mediacore/TimelineMonitor;->_pendingAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    invoke-static {v0}, Lcom/adobe/mediacore/TimelineMonitor;->access$200(Lcom/adobe/mediacore/TimelineMonitor;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/mediacore/TimelineMonitor;->_pendingAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    invoke-static {v0, v1}, Lcom/adobe/mediacore/TimelineMonitor;->access$202(Lcom/adobe/mediacore/TimelineMonitor;Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    :cond_0
    return-void
.end method

.method public onAdClick(Lcom/adobe/mediacore/timeline/advertising/AdBreak;Lcom/adobe/mediacore/timeline/advertising/Ad;Lcom/adobe/mediacore/timeline/advertising/AdClick;)V
    .locals 0

    return-void
.end method

.method public onAdComplete(Lcom/adobe/mediacore/timeline/advertising/AdBreak;Lcom/adobe/mediacore/timeline/advertising/Ad;)V
    .locals 4

    invoke-virtual {p2}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getType()Lcom/adobe/mediacore/MediaResource$Type;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaResource$Type;->CUSTOM:Lcom/adobe/mediacore/MediaResource$Type;

    if-ne v0, v1, :cond_1

    invoke-virtual {p2}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getContentTracker()Lcom/adobe/mediacore/timeline/advertising/ContentTracker;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    # getter for: Lcom/adobe/mediacore/TimelineMonitor;->_logger:Lcom/adobe/mediacore/logging/Logger;
    invoke-static {v0}, Lcom/adobe/mediacore/TimelineMonitor;->access$400(Lcom/adobe/mediacore/TimelineMonitor;)Lcom/adobe/mediacore/logging/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    # getter for: Lcom/adobe/mediacore/TimelineMonitor;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mediacore/TimelineMonitor;->access$300()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#CustomAdReporting"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Ad complete. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getContentTracker()Lcom/adobe/mediacore/timeline/advertising/ContentTracker;

    move-result-object v0

    invoke-interface {v0, p2}, Lcom/adobe/mediacore/timeline/advertising/ContentTracker;->onAdComplete(Lcom/adobe/mediacore/timeline/advertising/Ad;)V

    iget-object v0, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    # getter for: Lcom/adobe/mediacore/TimelineMonitor;->_pendingAd:Lcom/adobe/mediacore/timeline/advertising/Ad;
    invoke-static {v0}, Lcom/adobe/mediacore/TimelineMonitor;->access$500(Lcom/adobe/mediacore/TimelineMonitor;)Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    # getter for: Lcom/adobe/mediacore/TimelineMonitor;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/TimelineMonitor;->access$600(Lcom/adobe/mediacore/TimelineMonitor;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    # getter for: Lcom/adobe/mediacore/TimelineMonitor;->_pendingAd:Lcom/adobe/mediacore/timeline/advertising/Ad;
    invoke-static {v1}, Lcom/adobe/mediacore/TimelineMonitor;->access$500(Lcom/adobe/mediacore/TimelineMonitor;)Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/adobe/mediacore/AdPlaybackEvent;->createStartEvent(Lcom/adobe/mediacore/timeline/advertising/AdBreak;Lcom/adobe/mediacore/timeline/advertising/Ad;)Lcom/adobe/mediacore/AdPlaybackEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    iget-object v0, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    # getter for: Lcom/adobe/mediacore/TimelineMonitor;->_pendingAd:Lcom/adobe/mediacore/timeline/advertising/Ad;
    invoke-static {v0}, Lcom/adobe/mediacore/TimelineMonitor;->access$500(Lcom/adobe/mediacore/TimelineMonitor;)Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getContentTracker()Lcom/adobe/mediacore/timeline/advertising/ContentTracker;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    # getter for: Lcom/adobe/mediacore/TimelineMonitor;->_pendingAd:Lcom/adobe/mediacore/timeline/advertising/Ad;
    invoke-static {v0}, Lcom/adobe/mediacore/TimelineMonitor;->access$500(Lcom/adobe/mediacore/TimelineMonitor;)Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getContentTracker()Lcom/adobe/mediacore/timeline/advertising/ContentTracker;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    # getter for: Lcom/adobe/mediacore/TimelineMonitor;->_pendingAd:Lcom/adobe/mediacore/timeline/advertising/Ad;
    invoke-static {v1}, Lcom/adobe/mediacore/TimelineMonitor;->access$500(Lcom/adobe/mediacore/TimelineMonitor;)Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/mediacore/timeline/advertising/ContentTracker;->onAdStart(Lcom/adobe/mediacore/timeline/advertising/Ad;)V

    :cond_0
    iget-object v0, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/mediacore/TimelineMonitor;->_pendingAd:Lcom/adobe/mediacore/timeline/advertising/Ad;
    invoke-static {v0, v1}, Lcom/adobe/mediacore/TimelineMonitor;->access$502(Lcom/adobe/mediacore/TimelineMonitor;Lcom/adobe/mediacore/timeline/advertising/Ad;)Lcom/adobe/mediacore/timeline/advertising/Ad;

    :cond_1
    return-void
.end method

.method public onAdProgress(Lcom/adobe/mediacore/timeline/advertising/AdBreak;Lcom/adobe/mediacore/timeline/advertising/Ad;I)V
    .locals 4

    invoke-virtual {p2}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getType()Lcom/adobe/mediacore/MediaResource$Type;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaResource$Type;->CUSTOM:Lcom/adobe/mediacore/MediaResource$Type;

    if-ne v0, v1, :cond_0

    invoke-virtual {p2}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getContentTracker()Lcom/adobe/mediacore/timeline/advertising/ContentTracker;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    # getter for: Lcom/adobe/mediacore/TimelineMonitor;->_logger:Lcom/adobe/mediacore/logging/Logger;
    invoke-static {v0}, Lcom/adobe/mediacore/TimelineMonitor;->access$400(Lcom/adobe/mediacore/TimelineMonitor;)Lcom/adobe/mediacore/logging/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    # getter for: Lcom/adobe/mediacore/TimelineMonitor;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mediacore/TimelineMonitor;->access$300()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#CustomAdReporting"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Ad progress. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getContentTracker()Lcom/adobe/mediacore/timeline/advertising/ContentTracker;

    move-result-object v0

    invoke-interface {v0, p2, p3}, Lcom/adobe/mediacore/timeline/advertising/ContentTracker;->onAdProgress(Lcom/adobe/mediacore/timeline/advertising/Ad;I)V

    :cond_0
    return-void
.end method

.method public onAdStart(Lcom/adobe/mediacore/timeline/advertising/AdBreak;Lcom/adobe/mediacore/timeline/advertising/Ad;)V
    .locals 4

    invoke-virtual {p2}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getType()Lcom/adobe/mediacore/MediaResource$Type;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaResource$Type;->CUSTOM:Lcom/adobe/mediacore/MediaResource$Type;

    if-ne v0, v1, :cond_0

    invoke-virtual {p2}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getContentTracker()Lcom/adobe/mediacore/timeline/advertising/ContentTracker;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/TimelineMonitor$3;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    # getter for: Lcom/adobe/mediacore/TimelineMonitor;->_logger:Lcom/adobe/mediacore/logging/Logger;
    invoke-static {v0}, Lcom/adobe/mediacore/TimelineMonitor;->access$400(Lcom/adobe/mediacore/TimelineMonitor;)Lcom/adobe/mediacore/logging/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    # getter for: Lcom/adobe/mediacore/TimelineMonitor;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mediacore/TimelineMonitor;->access$300()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#CustomAdReporting"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Ad start. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/mediacore/logging/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getContentTracker()Lcom/adobe/mediacore/timeline/advertising/ContentTracker;

    move-result-object v0

    invoke-interface {v0, p2}, Lcom/adobe/mediacore/timeline/advertising/ContentTracker;->onAdStart(Lcom/adobe/mediacore/timeline/advertising/Ad;)V

    :cond_0
    return-void
.end method
