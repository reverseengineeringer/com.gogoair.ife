.class Lcom/adobe/mediacore/DefaultMediaPlayer$13;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/adobe/mediacore/ProfileChangedListener;


# instance fields
.field final synthetic this$0:Lcom/adobe/mediacore/DefaultMediaPlayer;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/DefaultMediaPlayer;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/DefaultMediaPlayer$13;->this$0:Lcom/adobe/mediacore/DefaultMediaPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged(JJ)V
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/DefaultMediaPlayer$13;->this$0:Lcom/adobe/mediacore/DefaultMediaPlayer;

    # getter for: Lcom/adobe/mediacore/DefaultMediaPlayer;->_customAdPlaybackManager:Lcom/adobe/mediacore/CustomAdPlaybackManager;
    invoke-static {v0}, Lcom/adobe/mediacore/DefaultMediaPlayer;->access$300(Lcom/adobe/mediacore/DefaultMediaPlayer;)Lcom/adobe/mediacore/CustomAdPlaybackManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mediacore/CustomAdPlaybackManager;->getCustomAdView()Lcom/adobe/mediacore/CustomAdView;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/adobe/mediacore/CustomAdView;->setBitrate(J)V

    return-void
.end method
