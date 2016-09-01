.class Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/CustomAdPlaybackManager$2;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_customAdView:Lcom/adobe/mediacore/CustomAdView;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$1200(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/CustomAdView;

    move-result-object v0

    const-string v1, "about:blank"

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/CustomAdView;->loadUrl(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    const/4 v1, -0x1

    # setter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_lastKnownProgress:I
    invoke-static {v0, v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$1302(Lcom/adobe/mediacore/CustomAdPlaybackManager;I)I

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$100(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v1, v1, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    invoke-static {v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$300(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    move-result-object v1

    iget-object v3, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v3, v3, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAd:Lcom/adobe/mediacore/timeline/advertising/Ad;
    invoke-static {v3}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$900(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/adobe/mediacore/AdPlaybackEvent;->createCompleteEvent(Lcom/adobe/mediacore/timeline/advertising/AdBreak;Lcom/adobe/mediacore/timeline/advertising/Ad;)Lcom/adobe/mediacore/AdPlaybackEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$400(Lcom/adobe/mediacore/CustomAdPlaybackManager;)I

    move-result v0

    int-to-long v0, v0

    iget-object v3, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v3, v3, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    invoke-static {v3}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$300(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->size()J

    move-result-wide v4

    cmp-long v0, v0, v4

    if-gez v0, :cond_2

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$300(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->adsIterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v2

    :goto_0
    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$400(Lcom/adobe/mediacore/CustomAdPlaybackManager;)I

    move-result v0

    if-ge v1, v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/timeline/advertising/Ad;

    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/timeline/advertising/Ad;

    invoke-virtual {v0}, Lcom/adobe/mediacore/timeline/advertising/Ad;->getType()Lcom/adobe/mediacore/MediaResource$Type;

    move-result-object v1

    sget-object v3, Lcom/adobe/mediacore/MediaResource$Type;->CUSTOM:Lcom/adobe/mediacore/MediaResource$Type;

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v1, v1, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # invokes: Lcom/adobe/mediacore/CustomAdPlaybackManager;->playCustomAd(Lcom/adobe/mediacore/timeline/advertising/Ad;Z)V
    invoke-static {v1, v0, v2}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$800(Lcom/adobe/mediacore/CustomAdPlaybackManager;Lcom/adobe/mediacore/timeline/advertising/Ad;Z)V

    :goto_1
    return-void

    :cond_2
    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_complete:Z
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$1400(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdIndex:I
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$400(Lcom/adobe/mediacore/CustomAdPlaybackManager;)I

    move-result v0

    int-to-long v0, v0

    iget-object v3, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v3, v3, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    invoke-static {v3}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$300(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/mediacore/timeline/advertising/AdBreak;->size()J

    move-result-wide v4

    cmp-long v0, v0, v4

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v1, v1, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    invoke-static {v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$300(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    move-result-object v1

    # invokes: Lcom/adobe/mediacore/CustomAdPlaybackManager;->containCustomAdOnly(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z
    invoke-static {v0, v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$1500(Lcom/adobe/mediacore/CustomAdPlaybackManager;Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineAdapter:Lcom/adobe/mediacore/VideoEngineAdapter;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$500(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/VideoEngineAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/VideoEngineAdapter;->getTimeline()Lcom/adobe/mediacore/VideoEngineTimeline;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v1, v1, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    invoke-static {v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$300(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineTimeline;->removeVPAIDAdBreak(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)V

    :cond_3
    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$100(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v1, v1, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    invoke-static {v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$300(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/AdBreakPlaybackEvent;->createCompleteEvent(Lcom/adobe/mediacore/timeline/advertising/AdBreak;)Lcom/adobe/mediacore/AdBreakPlaybackEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    :cond_4
    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineAdapter:Lcom/adobe/mediacore/VideoEngineAdapter;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$500(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/VideoEngineAdapter;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$PlayerState;->PLAYING:Lcom/adobe/mediacore/MediaPlayer$PlayerState;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/mediacore/VideoEngineAdapter;->restorePlayer(Lcom/adobe/mediacore/MediaPlayer$PlayerState;Z)V

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_customAdView:Lcom/adobe/mediacore/CustomAdView;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$1200(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/CustomAdView;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/CustomAdView;->setVisibility(I)V

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_player:Lcom/adobe/mediacore/DefaultMediaPlayer;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$1600(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/DefaultMediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/DefaultMediaPlayer;->play()V

    goto/16 :goto_1

    :cond_5
    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$2;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$100(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    new-instance v1, Lcom/adobe/mediacore/MediaPlayerEvent;

    sget-object v2, Lcom/adobe/mediacore/MediaPlayerEvent$Type;->POST_ROLL_COMPLETE:Lcom/adobe/mediacore/MediaPlayerEvent$Type;

    invoke-direct {v1, v2}, Lcom/adobe/mediacore/MediaPlayerEvent;-><init>(Lcom/adobe/mediacore/MediaPlayerEvent$Type;)V

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    goto/16 :goto_1
.end method
