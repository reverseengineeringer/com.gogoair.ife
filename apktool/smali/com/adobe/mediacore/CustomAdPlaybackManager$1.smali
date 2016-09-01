.class Lcom/adobe/mediacore/CustomAdPlaybackManager$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/adobe/mediacore/SeekAdjustCompletedListener;


# instance fields
.field final synthetic this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/CustomAdPlaybackManager;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$1;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAdjustCompleted(J)V
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$1;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_seekAdjustCompletedListener:Lcom/adobe/mediacore/SeekAdjustCompletedListener;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$000(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/SeekAdjustCompletedListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$1;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$100(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaPlayerEvent$Type;->SEEK_ADJUST_COMPLETED:Lcom/adobe/mediacore/MediaPlayerEvent$Type;

    iget-object v2, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$1;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_seekAdjustCompletedListener:Lcom/adobe/mediacore/SeekAdjustCompletedListener;
    invoke-static {v2}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$000(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/SeekAdjustCompletedListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/adobe/mediacore/VideoEngineDispatcher;->removeEventListener(Lcom/adobe/mediacore/MediaPlayerEvent$Type;Lcom/adobe/mediacore/MediaPlayer$EventListener;)V

    :cond_0
    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$1;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentTime:J
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$200(Lcom/adobe/mediacore/CustomAdPlaybackManager;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$1;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentTime:J
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$200(Lcom/adobe/mediacore/CustomAdPlaybackManager;)J

    move-result-wide v0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$1;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    invoke-static {v0, v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$302(Lcom/adobe/mediacore/CustomAdPlaybackManager;Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$1;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # setter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I
    invoke-static {v0, v4}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$402(Lcom/adobe/mediacore/CustomAdPlaybackManager;I)I

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$1;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineAdapter:Lcom/adobe/mediacore/VideoEngineAdapter;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$500(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/VideoEngineAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/VideoEngineAdapter;->getTimeline()Lcom/adobe/mediacore/VideoEngineTimeline;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$1;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_startTimeOfSeekOrTrickPlay:J
    invoke-static {v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$600(Lcom/adobe/mediacore/CustomAdPlaybackManager;)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3, p1, p2}, Lcom/adobe/mediacore/VideoEngineTimeline;->getLastSkippedVPAIDAdBreak(JJ)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$1;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # invokes: Lcom/adobe/mediacore/CustomAdPlaybackManager;->setAdBreak(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z
    invoke-static {v1, v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$700(Lcom/adobe/mediacore/CustomAdPlaybackManager;Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->adsIterator()Ljava/util/Iterator;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$1;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # setter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I
    invoke-static {v1, v4}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$402(Lcom/adobe/mediacore/CustomAdPlaybackManager;I)I

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$1;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/timeline/advertising/Ad;

    # invokes: Lcom/adobe/mediacore/CustomAdPlaybackManager;->playCustomAd(Lcom/adobe/mediacore/timeline/advertising/Ad;Z)V
    invoke-static {v1, v0, v4}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$800(Lcom/adobe/mediacore/CustomAdPlaybackManager;Lcom/adobe/mediacore/timeline/advertising/Ad;Z)V

    goto :goto_0
.end method
