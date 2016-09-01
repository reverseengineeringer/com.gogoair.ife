.class Lcom/gogoair/ife/views/PlayerActivity$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/mediacore/MediaPlayer$PlaybackEventListener;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/views/PlayerActivity;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 150
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPlayComplete()V
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-virtual {v0}, Lcom/gogoair/ife/views/PlayerActivity;->onBackPressed()V

    .line 227
    return-void
.end method

.method public onPlayStart()V
    .locals 6

    .prologue
    .line 211
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->timeToFirstFrame:J
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$2000(Lcom/gogoair/ife/views/PlayerActivity;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 222
    :cond_0
    :goto_0
    return-void

    .line 214
    :cond_1
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->createTimestamp:J
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$200(Lcom/gogoair/ife/views/PlayerActivity;)J

    move-result-wide v4

    sub-long/2addr v2, v4

    # setter for: Lcom/gogoair/ife/views/PlayerActivity;->timeToFirstFrame:J
    invoke-static {v0, v2, v3}, Lcom/gogoair/ife/views/PlayerActivity;->access$2002(Lcom/gogoair/ife/views/PlayerActivity;J)J

    .line 216
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getLogicalMediaId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 217
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Seeking to start position "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->savedPosition:I
    invoke-static {v3}, Lcom/gogoair/ife/views/PlayerActivity;->access$1800(Lcom/gogoair/ife/views/PlayerActivity;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->savedPosition:I
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1800(Lcom/gogoair/ife/views/PlayerActivity;)I

    move-result v0

    if-lez v0, :cond_0

    .line 219
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->savedPosition:I
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$1800(Lcom/gogoair/ife/views/PlayerActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/views/PlayerActivity;->seekTo(I)V

    goto :goto_0
.end method

.method public onPrepared()V
    .locals 4

    .prologue
    .line 166
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->getAccountingGradeDuration()J
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$1100(Lcom/gogoair/ife/views/PlayerActivity;)J

    move-result-wide v2

    # setter for: Lcom/gogoair/ife/views/PlayerActivity;->accountingGradeDuration:J
    invoke-static {v0, v2, v3}, Lcom/gogoair/ife/views/PlayerActivity;->access$1002(Lcom/gogoair/ife/views/PlayerActivity;J)J

    .line 168
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    const/4 v1, 0x1

    # setter for: Lcom/gogoair/ife/views/PlayerActivity;->playerPrepared:Z
    invoke-static {v0, v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$1202(Lcom/gogoair/ife/views/PlayerActivity;Z)Z

    .line 170
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v2}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v2

    invoke-interface {v2}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v2

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->loadClosedCaptioningTracks(Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/util/List;
    invoke-static {v1, v2}, Lcom/gogoair/ife/views/PlayerActivity;->access$1500(Lcom/gogoair/ife/views/PlayerActivity;Lcom/adobe/mediacore/MediaPlayerItem;)Ljava/util/List;

    move-result-object v1

    # setter for: Lcom/gogoair/ife/views/PlayerActivity;->closedCaptionTracks:Ljava/util/List;
    invoke-static {v0, v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$1302(Lcom/gogoair/ife/views/PlayerActivity;Ljava/util/List;)Ljava/util/List;

    .line 172
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->closedCaptionTracks:Ljava/util/List;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1300(Lcom/gogoair/ife/views/PlayerActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 173
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "Subtitles available, checking user\'s preferences"

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v1

    invoke-virtual {v1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getSelectedSubtitleIndex()I

    move-result v1

    # setter for: Lcom/gogoair/ife/views/PlayerActivity;->selectedClosedCaptionsIndex:I
    invoke-static {v0, v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$1602(Lcom/gogoair/ife/views/PlayerActivity;I)I

    .line 175
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->selectedClosedCaptionsIndex:I
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1600(Lcom/gogoair/ife/views/PlayerActivity;)I

    move-result v0

    if-nez v0, :cond_2

    .line 176
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "Subtitles off"

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$Visibility;->INVISIBLE:Lcom/adobe/mediacore/MediaPlayer$Visibility;

    invoke-interface {v0, v1}, Lcom/adobe/mediacore/MediaPlayer;->setCCVisibility(Lcom/adobe/mediacore/MediaPlayer$Visibility;)V

    .line 189
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->initializeMediaController()V
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1700(Lcom/gogoair/ife/views/PlayerActivity;)V

    .line 191
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "Media prepared. Ready to play it."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayerItem;->isProtected()Z

    move-result v0

    if-nez v0, :cond_1

    .line 195
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-virtual {v0}, Lcom/gogoair/ife/views/PlayerActivity;->start()V

    .line 198
    :cond_1
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v1

    invoke-virtual {v1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getPlaybackElapsed()I

    move-result v1

    # setter for: Lcom/gogoair/ife/views/PlayerActivity;->savedPosition:I
    invoke-static {v0, v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$1802(Lcom/gogoair/ife/views/PlayerActivity;I)I

    .line 200
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->startPlaybackObserver()V
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1900(Lcom/gogoair/ife/views/PlayerActivity;)V

    .line 201
    return-void

    .line 179
    :cond_2
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Setting subtitle index to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->selectedClosedCaptionsIndex:I
    invoke-static {v3}, Lcom/gogoair/ife/views/PlayerActivity;->access$1600(Lcom/gogoair/ife/views/PlayerActivity;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v0

    sget-object v1, Lcom/adobe/mediacore/MediaPlayer$Visibility;->VISIBLE:Lcom/adobe/mediacore/MediaPlayer$Visibility;

    invoke-interface {v0, v1}, Lcom/adobe/mediacore/MediaPlayer;->setCCVisibility(Lcom/adobe/mediacore/MediaPlayer$Visibility;)V

    .line 181
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->closedCaptionTracks:Ljava/util/List;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1300(Lcom/gogoair/ife/views/PlayerActivity;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->selectedClosedCaptionsIndex:I
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$1600(Lcom/gogoair/ife/views/PlayerActivity;)I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/info/ClosedCaptionsTrack;

    .line 182
    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v1

    invoke-interface {v1}, Lcom/adobe/mediacore/MediaPlayer;->getCurrentItem()Lcom/adobe/mediacore/MediaPlayerItem;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/adobe/mediacore/MediaPlayerItem;->selectClosedCaptionsTrack(Lcom/adobe/mediacore/info/ClosedCaptionsTrack;)Z

    move-result v0

    .line 183
    if-nez v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    const/4 v1, 0x0

    # setter for: Lcom/gogoair/ife/views/PlayerActivity;->selectedClosedCaptionsIndex:I
    invoke-static {v0, v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$1602(Lcom/gogoair/ife/views/PlayerActivity;I)I

    goto/16 :goto_0
.end method

.method public onProfileChanged(JJ)V
    .locals 0

    .prologue
    .line 161
    return-void
.end method

.method public onRatePlaying(F)V
    .locals 4

    .prologue
    .line 281
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "New playback rate is playing: ."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    return-void
.end method

.method public onRateSelected(F)V
    .locals 4

    .prologue
    .line 276
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "New playback rate has been selected: ."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    return-void
.end method

.method public onReplaceMediaPlayerItem()V
    .locals 3

    .prologue
    .line 205
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    const-string v2, "Media player item has been replaced."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    return-void
.end method

.method public onSizeAvailable(JJ)V
    .locals 7

    .prologue
    .line 154
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # setter for: Lcom/gogoair/ife/views/PlayerActivity;->movieWidth:J
    invoke-static {v0, p3, p4}, Lcom/gogoair/ife/views/PlayerActivity;->access$702(Lcom/gogoair/ife/views/PlayerActivity;J)J

    .line 155
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # setter for: Lcom/gogoair/ife/views/PlayerActivity;->movieHeight:J
    invoke-static {v0, p1, p2}, Lcom/gogoair/ife/views/PlayerActivity;->access$802(Lcom/gogoair/ife/views/PlayerActivity;J)J

    .line 156
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movieWidth:J
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$700(Lcom/gogoair/ife/views/PlayerActivity;)J

    move-result-wide v2

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movieHeight:J
    invoke-static {v1}, Lcom/gogoair/ife/views/PlayerActivity;->access$800(Lcom/gogoair/ife/views/PlayerActivity;)J

    move-result-wide v4

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->setPlayerViewSize(JJ)V
    invoke-static {v0, v2, v3, v4, v5}, Lcom/gogoair/ife/views/PlayerActivity;->access$900(Lcom/gogoair/ife/views/PlayerActivity;JJ)V

    .line 157
    return-void
.end method

.method public onStateChanged(Lcom/adobe/mediacore/MediaPlayer$PlayerState;Lcom/adobe/mediacore/MediaPlayerNotification;)V
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 236
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "INFO"

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->PLAYER_STATE_CHANGE:Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    invoke-virtual {v2}, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->getValue()I

    move-result v2

    iget-object v4, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v4}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v4

    invoke-virtual {v4}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getAppData()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcom/adobe/mediacore/MediaPlayer$PlayerState;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/gogoair/ife/utils/GVLogger;->logASP(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    .line 237
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "Player"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PlayerState: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/mediacore/MediaPlayer$PlayerState;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    sget-object v0, Lcom/gogoair/ife/views/PlayerActivity$11;->$SwitchMap$com$adobe$mediacore$MediaPlayer$PlayerState:[I

    invoke-virtual {p1}, Lcom/adobe/mediacore/MediaPlayer$PlayerState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 262
    :goto_0
    return-void

    .line 240
    :pswitch_0
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    const v2, 0x7f05001c

    invoke-virtual {v1, v2}, Lcom/gogoair/ife/views/PlayerActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    const v3, 0x7f05001b

    invoke-virtual {v2, v3}, Lcom/gogoair/ife/views/PlayerActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->showProgressDialog(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v1, v2}, Lcom/gogoair/ife/views/PlayerActivity;->access$000(Lcom/gogoair/ife/views/PlayerActivity;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 243
    :pswitch_1
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->mediaPlayer:Lcom/adobe/mediacore/MediaPlayer;
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$1400(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/adobe/mediacore/MediaPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/mediacore/MediaPlayer;->prepareToPlay()V

    goto :goto_0

    .line 246
    :pswitch_2
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->cancelProgressDialog()V
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$600(Lcom/gogoair/ife/views/PlayerActivity;)V

    goto :goto_0

    .line 250
    :pswitch_3
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->stopPlaybackObserver()V
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$2100(Lcom/gogoair/ife/views/PlayerActivity;)V

    goto :goto_0

    .line 253
    :pswitch_4
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->cancelProgressDialog()V
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$600(Lcom/gogoair/ife/views/PlayerActivity;)V

    .line 254
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->stopPlaybackObserver()V
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$2100(Lcom/gogoair/ife/views/PlayerActivity;)V

    .line 255
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "ERROR"

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NOVIDEO:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    invoke-virtual {v2}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->getValue()I

    move-result v2

    iget-object v4, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v4}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v4

    invoke-virtual {v4}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getAppData()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Lcom/adobe/mediacore/MediaPlayerNotification;->getDescription()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/gogoair/ife/utils/GVLogger;->logASP(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    .line 256
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    sget-object v1, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NOVIDEO:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    const-wide/16 v2, 0x0

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->goToLandingPage(Lcom/gogoair/ife/utils/Constants$GVErrorCode;J)V
    invoke-static {v0, v1, v2, v3}, Lcom/gogoair/ife/views/PlayerActivity;->access$2200(Lcom/gogoair/ife/views/PlayerActivity;Lcom/gogoair/ife/utils/Constants$GVErrorCode;J)V

    .line 257
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$3;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-virtual {v0}, Lcom/gogoair/ife/views/PlayerActivity;->finish()V

    goto :goto_0

    .line 238
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public onTimedMetadata(Lcom/adobe/mediacore/metadata/TimedMetadata;)V
    .locals 0

    .prologue
    .line 272
    return-void
.end method

.method public onTimelineUpdated()V
    .locals 0

    .prologue
    .line 267
    return-void
.end method

.method public onUpdated()V
    .locals 0

    .prologue
    .line 232
    return-void
.end method
