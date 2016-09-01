.class Lcom/gogoair/ife/views/PlayerActivity$4$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic this$1:Lcom/gogoair/ife/views/PlayerActivity$4;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity$4;)V
    .locals 0

    .prologue
    .line 306
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$4$2;->this$1:Lcom/gogoair/ife/views/PlayerActivity$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .prologue
    .line 308
    if-nez p2, :cond_1

    .line 309
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$4$2;->this$1:Lcom/gogoair/ife/views/PlayerActivity$4;

    iget-object v0, v0, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$Visibility;->INVISIBLE:Lcom/adobe/mediacore/MediaPlayer$Visibility;

    invoke-interface {v0, v1}, Lcom/adobe/mediacore/MediaPlayer;->setCCVisibility(Lcom/adobe/mediacore/MediaPlayer$Visibility;)V

    .line 310
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$4$2;->this$1:Lcom/gogoair/ife/views/PlayerActivity$4;

    iget-object v0, v0, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    const/4 v1, 0x0

    # setter for: Lcom/gogoair/ife/views/PlayerActivity;->selectedClosedCaptionsIndex:I
    invoke-static {v0, v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$1602(Lcom/gogoair/ife/views/PlayerActivity;I)I

    .line 311
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$4$2;->this$1:Lcom/gogoair/ife/views/PlayerActivity$4;

    iget-object v0, v0, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v0

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$4$2;->this$1:Lcom/gogoair/ife/views/PlayerActivity$4;

    iget-object v1, v1, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->selectedClosedCaptionsIndex:I
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$1600(Lcom/gogoair/ife/views/PlayerActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->setSelectedSubtitleIndex(I)V

    .line 321
    :cond_0
    :goto_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 322
    return-void

    .line 313
    :cond_1
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$4$2;->this$1:Lcom/gogoair/ife/views/PlayerActivity$4;

    iget-object v0, v0, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$Visibility;->VISIBLE:Lcom/adobe/mediacore/MediaPlayer$Visibility;

    invoke-interface {v0, v1}, Lcom/adobe/mediacore/MediaPlayer;->setCCVisibility(Lcom/adobe/mediacore/MediaPlayer$Visibility;)V

    .line 314
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$4$2;->this$1:Lcom/gogoair/ife/views/PlayerActivity$4;

    iget-object v0, v0, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->closedCaptionTracks:Ljava/util/List;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1300(Lcom/gogoair/ife/views/PlayerActivity;)Ljava/util/List;

    move-result-object v0

    add-int/lit8 v1, p2, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/info/ClosedCaptionsTrack;

    .line 315
    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$4$2;->this$1:Lcom/gogoair/ife/views/PlayerActivity$4;

    iget-object v1, v1, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v1

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/adobe/mediacore/MediaPlayerItem;->selectClosedCaptionsTrack(Lcom/adobe/mediacore/info/ClosedCaptionsTrack;)Z

    move-result v0

    .line 316
    if-eqz v0, :cond_0

    .line 317
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$4$2;->this$1:Lcom/gogoair/ife/views/PlayerActivity$4;

    iget-object v0, v0, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # setter for: Lcom/gogoair/ife/views/PlayerActivity;->selectedClosedCaptionsIndex:I
    invoke-static {v0, p2}, Lcom/gogoair/ife/views/PlayerActivity;->access$1602(Lcom/gogoair/ife/views/PlayerActivity;I)I

    .line 318
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$4$2;->this$1:Lcom/gogoair/ife/views/PlayerActivity$4;

    iget-object v0, v0, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v0

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$4$2;->this$1:Lcom/gogoair/ife/views/PlayerActivity$4;

    iget-object v1, v1, Lcom/gogoair/ife/views/PlayerActivity$4;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->selectedClosedCaptionsIndex:I
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$1600(Lcom/gogoair/ife/views/PlayerActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->setSelectedSubtitleIndex(I)V

    goto :goto_0
.end method
