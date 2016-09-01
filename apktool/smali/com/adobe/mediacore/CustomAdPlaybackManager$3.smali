.class Lcom/adobe/mediacore/CustomAdPlaybackManager$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/adobe/mediacore/PauseAtPeriodEndListener;


# instance fields
.field final synthetic this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/CustomAdPlaybackManager;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$3;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPauseAtPeriodEnd(I)V
    .locals 10

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$3;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineAdapter:Lcom/adobe/mediacore/VideoEngineAdapter;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$500(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/VideoEngineAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/VideoEngineAdapter;->getTimeline()Lcom/adobe/mediacore/VideoEngineTimeline;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/adobe/mediacore/VideoEngineTimeline;->getAdBreakFromId(I)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    move-result-object v3

    if-eqz v3, :cond_4

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$3;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # invokes: Lcom/adobe/mediacore/CustomAdPlaybackManager;->setAdBreak(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z
    invoke-static {v0, v3}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$700(Lcom/adobe/mediacore/CustomAdPlaybackManager;Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z

    invoke-virtual {v3}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->adsIterator()Ljava/util/Iterator;

    move-result-object v4

    move v1, v2

    :goto_0
    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$3;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$400(Lcom/adobe/mediacore/CustomAdPlaybackManager;)I

    move-result v0

    if-ge v1, v0, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/timeline/advertising/Ad;

    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    :cond_2
    int-to-long v6, v1

    invoke-virtual {v3}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->size()J

    move-result-wide v8

    cmp-long v0, v6, v8

    if-gez v0, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v0, 0x0

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/timeline/advertising/Ad;

    :cond_3
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getType()Lcom/adobe/mediacore/MediaResource$Type;

    move-result-object v5

    sget-object v6, Lcom/adobe/mediacore/MediaResource$Type;->CUSTOM:Lcom/adobe/mediacore/MediaResource$Type;

    if-ne v5, v6, :cond_1

    iget-object v2, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$3;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # setter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I
    invoke-static {v2, v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$402(Lcom/adobe/mediacore/CustomAdPlaybackManager;I)I

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$3;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    const/4 v2, 0x1

    # invokes: Lcom/adobe/mediacore/CustomAdPlaybackManager;->playCustomAd(Lcom/adobe/mediacore/timeline/advertising/Ad;Z)V
    invoke-static {v1, v0, v2}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$800(Lcom/adobe/mediacore/CustomAdPlaybackManager;Lcom/adobe/mediacore/timeline/advertising/Ad;Z)V

    :goto_1
    return-void

    :cond_4
    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$3;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_complete:Z
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$1400(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$3;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # setter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_isCustomAdPlaying:Z
    invoke-static {v0, v2}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$1102(Lcom/adobe/mediacore/CustomAdPlaybackManager;Z)Z

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$3;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_player:Lcom/adobe/mediacore/DefaultMediaPlayer;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$1600(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/DefaultMediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/DefaultMediaPlayer;->play()V

    goto :goto_1

    :cond_5
    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$3;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$100(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    new-instance v1, Lcom/adobe/mediacore/MediaPlayerEvent;

    sget-object v2, Lcom/adobe/mediacore/MediaPlayerEvent$Type;->POST_ROLL_COMPLETE:Lcom/adobe/mediacore/MediaPlayerEvent$Type;

    invoke-direct {v1, v2}, Lcom/adobe/mediacore/MediaPlayerEvent;-><init>(Lcom/adobe/mediacore/MediaPlayerEvent$Type;)V

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    goto :goto_1
.end method
