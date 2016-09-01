.class Lcom/adobe/mediacore/CustomAdPlaybackManager$2$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/CustomAdPlaybackManager$2;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$1;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$1;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineAdapter:Lcom/adobe/mediacore/VideoEngineAdapter;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$500(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/VideoEngineAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/VideoEngineAdapter;->suspendPlayer()V

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$1;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v0, v0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$100(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$1;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v1, v1, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAdBreak:Lcom/adobe/mediacore/timeline/advertising/AdBreak;
    invoke-static {v1}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$300(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/AdBreak;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/mediacore/CustomAdPlaybackManager$2$1;->this$1:Lcom/adobe/mediacore/CustomAdPlaybackManager$2;

    iget-object v2, v2, Lcom/adobe/mediacore/CustomAdPlaybackManager$2;->this$0:Lcom/adobe/mediacore/CustomAdPlaybackManager;

    # getter for: Lcom/adobe/mediacore/CustomAdPlaybackManager;->_currentAd:Lcom/adobe/mediacore/timeline/advertising/Ad;
    invoke-static {v2}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->access$900(Lcom/adobe/mediacore/CustomAdPlaybackManager;)Lcom/adobe/mediacore/timeline/advertising/Ad;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/adobe/mediacore/AdPlaybackEvent;->createStartEvent(Lcom/adobe/mediacore/timeline/advertising/AdBreak;Lcom/adobe/mediacore/timeline/advertising/Ad;)Lcom/adobe/mediacore/AdPlaybackEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method
