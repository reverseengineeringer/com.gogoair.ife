.class Lcom/adobe/mediacore/DefaultMediaPlayer$14;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/adobe/mediacore/PostRollEndListener;


# instance fields
.field final synthetic this$0:Lcom/adobe/mediacore/DefaultMediaPlayer;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/DefaultMediaPlayer;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/DefaultMediaPlayer$14;->this$0:Lcom/adobe/mediacore/DefaultMediaPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 3

    iget-object v0, p0, Lcom/adobe/mediacore/DefaultMediaPlayer$14;->this$0:Lcom/adobe/mediacore/DefaultMediaPlayer;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$PlayerState;->COMPLETE:Lcom/adobe/mediacore/MediaPlayer$PlayerState;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/adobe/mediacore/DefaultMediaPlayer;->setStatus(Lcom/adobe/mediacore/MediaPlayer$PlayerState;Lcom/adobe/mediacore/MediaPlayerNotification$Error;)V

    iget-object v0, p0, Lcom/adobe/mediacore/DefaultMediaPlayer$14;->this$0:Lcom/adobe/mediacore/DefaultMediaPlayer;

    # getter for: Lcom/adobe/mediacore/DefaultMediaPlayer;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;
    invoke-static {v0}, Lcom/adobe/mediacore/DefaultMediaPlayer;->access$100(Lcom/adobe/mediacore/DefaultMediaPlayer;)Lcom/adobe/mediacore/VideoEngineDispatcher;

    move-result-object v0

    new-instance v1, Lcom/adobe/mediacore/MediaPlayerEvent;

    sget-object v2, Lcom/adobe/mediacore/MediaPlayerEvent$Type;->PLAY_COMPLETE:Lcom/adobe/mediacore/MediaPlayerEvent$Type;

    invoke-direct {v1, v2}, Lcom/adobe/mediacore/MediaPlayerEvent;-><init>(Lcom/adobe/mediacore/MediaPlayerEvent$Type;)V

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    return-void
.end method
