.class public Lcom/auditude/ads/view/linear/VideoView;
.super Landroid/view/SurfaceView;
.source "SourceFile"

# interfaces
.implements Landroid/widget/MediaController$MediaPlayerControl;


# static fields
.field private static final STATE_ERROR:I = -0x1

.field private static final STATE_IDLE:I = 0x0

.field private static final STATE_PAUSED:I = 0x4

.field private static final STATE_PLAYBACK_COMPLETED:I = 0x5

.field private static final STATE_PLAYING:I = 0x3

.field private static final STATE_PREPARED:I = 0x2

.field private static final STATE_PREPARING:I = 0x1


# instance fields
.field private TAG:Ljava/lang/String;

.field private mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

.field private mCanPause:Z

.field private mCanSeekBack:Z

.field private mCanSeekForward:Z

.field private mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private mCurrentBufferPercentage:I

.field private mCurrentState:I

.field private mDuration:I

.field private mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mMediaController:Landroid/widget/MediaController;

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field mSHCallback:Landroid/view/SurfaceHolder$Callback;

.field private mSeekWhenPrepared:I

.field mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

.field private mSurfaceHeight:I

.field private mSurfaceHolder:Landroid/view/SurfaceHolder;

.field private mSurfaceWidth:I

.field private mTargetState:I

.field private mUri:Landroid/net/Uri;

.field private mVideoHeight:I

.field private mVideoWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 88
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 47
    const-string v0, "VideoView"

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->TAG:Ljava/lang/String;

    .line 67
    iput v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentState:I

    .line 68
    iput v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mTargetState:I

    .line 71
    iput-object v2, p0, Lcom/auditude/ads/view/linear/VideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 72
    iput-object v2, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 265
    new-instance v0, Lcom/auditude/ads/view/linear/VideoView$1;

    invoke-direct {v0, p0}, Lcom/auditude/ads/view/linear/VideoView$1;-><init>(Lcom/auditude/ads/view/linear/VideoView;)V

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    .line 275
    new-instance v0, Lcom/auditude/ads/view/linear/VideoView$2;

    invoke-direct {v0, p0}, Lcom/auditude/ads/view/linear/VideoView$2;-><init>(Lcom/auditude/ads/view/linear/VideoView;)V

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 341
    new-instance v0, Lcom/auditude/ads/view/linear/VideoView$3;

    invoke-direct {v0, p0}, Lcom/auditude/ads/view/linear/VideoView$3;-><init>(Lcom/auditude/ads/view/linear/VideoView;)V

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 355
    new-instance v0, Lcom/auditude/ads/view/linear/VideoView$4;

    invoke-direct {v0, p0}, Lcom/auditude/ads/view/linear/VideoView$4;-><init>(Lcom/auditude/ads/view/linear/VideoView;)V

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 408
    new-instance v0, Lcom/auditude/ads/view/linear/VideoView$5;

    invoke-direct {v0, p0}, Lcom/auditude/ads/view/linear/VideoView$5;-><init>(Lcom/auditude/ads/view/linear/VideoView;)V

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 449
    new-instance v0, Lcom/auditude/ads/view/linear/VideoView$6;

    invoke-direct {v0, p0}, Lcom/auditude/ads/view/linear/VideoView$6;-><init>(Lcom/auditude/ads/view/linear/VideoView;)V

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mSHCallback:Landroid/view/SurfaceHolder$Callback;

    .line 89
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->initVideoView()V

    .line 90
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .prologue
    .line 93
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/auditude/ads/view/linear/VideoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 94
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->initVideoView()V

    .line 95
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 98
    invoke-direct {p0, p1, p2, p3}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
    const-string v0, "VideoView"

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->TAG:Ljava/lang/String;

    .line 67
    iput v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentState:I

    .line 68
    iput v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mTargetState:I

    .line 71
    iput-object v2, p0, Lcom/auditude/ads/view/linear/VideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 72
    iput-object v2, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 265
    new-instance v0, Lcom/auditude/ads/view/linear/VideoView$1;

    invoke-direct {v0, p0}, Lcom/auditude/ads/view/linear/VideoView$1;-><init>(Lcom/auditude/ads/view/linear/VideoView;)V

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    .line 275
    new-instance v0, Lcom/auditude/ads/view/linear/VideoView$2;

    invoke-direct {v0, p0}, Lcom/auditude/ads/view/linear/VideoView$2;-><init>(Lcom/auditude/ads/view/linear/VideoView;)V

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 341
    new-instance v0, Lcom/auditude/ads/view/linear/VideoView$3;

    invoke-direct {v0, p0}, Lcom/auditude/ads/view/linear/VideoView$3;-><init>(Lcom/auditude/ads/view/linear/VideoView;)V

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 355
    new-instance v0, Lcom/auditude/ads/view/linear/VideoView$4;

    invoke-direct {v0, p0}, Lcom/auditude/ads/view/linear/VideoView$4;-><init>(Lcom/auditude/ads/view/linear/VideoView;)V

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 408
    new-instance v0, Lcom/auditude/ads/view/linear/VideoView$5;

    invoke-direct {v0, p0}, Lcom/auditude/ads/view/linear/VideoView$5;-><init>(Lcom/auditude/ads/view/linear/VideoView;)V

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 449
    new-instance v0, Lcom/auditude/ads/view/linear/VideoView$6;

    invoke-direct {v0, p0}, Lcom/auditude/ads/view/linear/VideoView$6;-><init>(Lcom/auditude/ads/view/linear/VideoView;)V

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mSHCallback:Landroid/view/SurfaceHolder$Callback;

    .line 99
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->initVideoView()V

    .line 100
    return-void
.end method

.method static synthetic access$0(Lcom/auditude/ads/view/linear/VideoView;I)V
    .locals 0

    .prologue
    .line 73
    iput p1, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoWidth:I

    return-void
.end method

.method static synthetic access$1(Lcom/auditude/ads/view/linear/VideoView;I)V
    .locals 0

    .prologue
    .line 74
    iput p1, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoHeight:I

    return-void
.end method

.method static synthetic access$10(Lcom/auditude/ads/view/linear/VideoView;)I
    .locals 1

    .prologue
    .line 76
    iget v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mSurfaceHeight:I

    return v0
.end method

.method static synthetic access$11(Lcom/auditude/ads/view/linear/VideoView;)I
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mTargetState:I

    return v0
.end method

.method static synthetic access$12(Lcom/auditude/ads/view/linear/VideoView;I)V
    .locals 0

    .prologue
    .line 68
    iput p1, p0, Lcom/auditude/ads/view/linear/VideoView;->mTargetState:I

    return-void
.end method

.method static synthetic access$13(Lcom/auditude/ads/view/linear/VideoView;)Landroid/media/MediaPlayer$OnCompletionListener;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    return-object v0
.end method

.method static synthetic access$14(Lcom/auditude/ads/view/linear/VideoView;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$15(Lcom/auditude/ads/view/linear/VideoView;)Landroid/media/MediaPlayer$OnErrorListener;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    return-object v0
.end method

.method static synthetic access$16(Lcom/auditude/ads/view/linear/VideoView;I)V
    .locals 0

    .prologue
    .line 80
    iput p1, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentBufferPercentage:I

    return-void
.end method

.method static synthetic access$17(Lcom/auditude/ads/view/linear/VideoView;I)V
    .locals 0

    .prologue
    .line 75
    iput p1, p0, Lcom/auditude/ads/view/linear/VideoView;->mSurfaceWidth:I

    return-void
.end method

.method static synthetic access$18(Lcom/auditude/ads/view/linear/VideoView;I)V
    .locals 0

    .prologue
    .line 76
    iput p1, p0, Lcom/auditude/ads/view/linear/VideoView;->mSurfaceHeight:I

    return-void
.end method

.method static synthetic access$19(Lcom/auditude/ads/view/linear/VideoView;Landroid/view/SurfaceHolder;)V
    .locals 0

    .prologue
    .line 71
    iput-object p1, p0, Lcom/auditude/ads/view/linear/VideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    return-void
.end method

.method static synthetic access$2(Lcom/auditude/ads/view/linear/VideoView;)I
    .locals 1

    .prologue
    .line 73
    iget v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoWidth:I

    return v0
.end method

.method static synthetic access$20(Lcom/auditude/ads/view/linear/VideoView;)V
    .locals 0

    .prologue
    .line 198
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->openVideo()V

    return-void
.end method

.method static synthetic access$21(Lcom/auditude/ads/view/linear/VideoView;Z)V
    .locals 0

    .prologue
    .line 484
    invoke-direct {p0, p1}, Lcom/auditude/ads/view/linear/VideoView;->release(Z)V

    return-void
.end method

.method static synthetic access$3(Lcom/auditude/ads/view/linear/VideoView;)I
    .locals 1

    .prologue
    .line 74
    iget v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoHeight:I

    return v0
.end method

.method static synthetic access$4(Lcom/auditude/ads/view/linear/VideoView;I)V
    .locals 0

    .prologue
    .line 67
    iput p1, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentState:I

    return-void
.end method

.method static synthetic access$5(Lcom/auditude/ads/view/linear/VideoView;)Landroid/media/MediaPlayer$OnPreparedListener;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    return-object v0
.end method

.method static synthetic access$6(Lcom/auditude/ads/view/linear/VideoView;)Landroid/media/MediaPlayer;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$7(Lcom/auditude/ads/view/linear/VideoView;)Landroid/widget/MediaController;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    return-object v0
.end method

.method static synthetic access$8(Lcom/auditude/ads/view/linear/VideoView;)I
    .locals 1

    .prologue
    .line 82
    iget v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mSeekWhenPrepared:I

    return v0
.end method

.method static synthetic access$9(Lcom/auditude/ads/view/linear/VideoView;)I
    .locals 1

    .prologue
    .line 75
    iget v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mSurfaceWidth:I

    return v0
.end method

.method private attachMediaController()V
    .locals 2

    .prologue
    .line 255
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 256
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0, p0}, Landroid/widget/MediaController;->setMediaPlayer(Landroid/widget/MediaController$MediaPlayerControl;)V

    .line 257
    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/VideoView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_1

    .line 258
    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/VideoView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 259
    :goto_0
    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v1, v0}, Landroid/widget/MediaController;->setAnchorView(Landroid/view/View;)V

    .line 260
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->isInPlaybackState()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/MediaController;->setEnabled(Z)V

    .line 262
    :cond_0
    return-void

    :cond_1
    move-object v0, p0

    .line 258
    goto :goto_0
.end method

.method private initVideoView()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 154
    iput v2, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoWidth:I

    .line 155
    iput v2, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoHeight:I

    .line 156
    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/VideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mSHCallback:Landroid/view/SurfaceHolder$Callback;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 157
    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/VideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 158
    invoke-virtual {p0, v3}, Lcom/auditude/ads/view/linear/VideoView;->setFocusable(Z)V

    .line 159
    invoke-virtual {p0, v3}, Lcom/auditude/ads/view/linear/VideoView;->setFocusableInTouchMode(Z)V

    .line 160
    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/VideoView;->requestFocus()Z

    .line 161
    iput v2, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentState:I

    .line 162
    iput v2, p0, Lcom/auditude/ads/view/linear/VideoView;->mTargetState:I

    .line 164
    invoke-virtual {p0, v3}, Lcom/auditude/ads/view/linear/VideoView;->setZOrderOnTop(Z)V

    .line 165
    invoke-virtual {p0, v3}, Lcom/auditude/ads/view/linear/VideoView;->setZOrderMediaOverlay(Z)V

    .line 166
    return-void
.end method

.method private isInPlaybackState()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 621
    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 622
    iget v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentState:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 623
    iget v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentState:I

    if-eqz v1, :cond_0

    .line 624
    iget v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentState:I

    if-eq v1, v0, :cond_0

    .line 621
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private openVideo()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, -0x1

    .line 199
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mUri:Landroid/net/Uri;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    if-nez v0, :cond_1

    .line 244
    :cond_0
    :goto_0
    return-void

    .line 205
    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.music.musicservicecommand"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 206
    const-string v1, "command"

    const-string v2, "pause"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 211
    invoke-direct {p0, v5}, Lcom/auditude/ads/view/linear/VideoView;->release(Z)V

    .line 213
    :try_start_0
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 214
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 215
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    .line 216
    const/4 v0, -0x1

    iput v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mDuration:I

    .line 217
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 218
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 219
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    .line 220
    const/4 v0, 0x0

    iput v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentBufferPercentage:I

    .line 221
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/VideoView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/auditude/ads/view/linear/VideoView;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 223
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 224
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 225
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setScreenOnWhilePlaying(Z)V

    .line 226
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 229
    const/4 v0, 0x1

    iput v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentState:I

    .line 230
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->attachMediaController()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 231
    :catch_0
    move-exception v0

    .line 232
    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unable to open content: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/auditude/ads/view/linear/VideoView;->mUri:Landroid/net/Uri;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 233
    iput v4, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentState:I

    .line 234
    iput v4, p0, Lcom/auditude/ads/view/linear/VideoView;->mTargetState:I

    .line 235
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-interface {v0, v1, v6, v5}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z

    goto/16 :goto_0

    .line 237
    :catch_1
    move-exception v0

    .line 238
    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unable to open content: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/auditude/ads/view/linear/VideoView;->mUri:Landroid/net/Uri;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 239
    iput v4, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentState:I

    .line 240
    iput v4, p0, Lcom/auditude/ads/view/linear/VideoView;->mTargetState:I

    .line 241
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    iget-object v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-interface {v0, v1, v6, v5}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z

    goto/16 :goto_0
.end method

.method private release(Z)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 485
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 486
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 487
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 488
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 489
    iput v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentState:I

    .line 490
    if-eqz p1, :cond_0

    .line 491
    iput v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mTargetState:I

    .line 494
    :cond_0
    return-void
.end method

.method private toggleMediaControlsVisiblity()V
    .locals 1

    .prologue
    .line 547
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 548
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 552
    :goto_0
    return-void

    .line 550
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->show()V

    goto :goto_0
.end method


# virtual methods
.method public canPause()Z
    .locals 1

    .prologue
    .line 628
    iget-boolean v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mCanPause:Z

    return v0
.end method

.method public canSeekBackward()Z
    .locals 1

    .prologue
    .line 632
    iget-boolean v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mCanSeekBack:Z

    return v0
.end method

.method public canSeekForward()Z
    .locals 1

    .prologue
    .line 636
    iget-boolean v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mCanSeekForward:Z

    return v0
.end method

.method public getAudioSessionId()I
    .locals 1

    .prologue
    .line 641
    const/4 v0, 0x0

    return v0
.end method

.method public getBufferPercentage()I
    .locals 1

    .prologue
    .line 614
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 615
    iget v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentBufferPercentage:I

    .line 617
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCurrentPosition()I
    .locals 1

    .prologue
    .line 594
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 595
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    .line 597
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDuration()I
    .locals 1

    .prologue
    .line 582
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 583
    iget v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mDuration:I

    if-lez v0, :cond_0

    .line 584
    iget v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mDuration:I

    .line 590
    :goto_0
    return v0

    .line 586
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    iput v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mDuration:I

    .line 587
    iget v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mDuration:I

    goto :goto_0

    .line 589
    :cond_1
    const/4 v0, -0x1

    iput v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mDuration:I

    .line 590
    iget v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mDuration:I

    goto :goto_0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 610
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 515
    const/4 v0, 0x4

    if-eq p1, v0, :cond_2

    .line 516
    const/16 v0, 0x18

    if-eq p1, v0, :cond_2

    .line 517
    const/16 v0, 0x19

    if-eq p1, v0, :cond_2

    .line 518
    const/16 v0, 0x52

    if-eq p1, v0, :cond_2

    .line 519
    const/4 v0, 0x5

    if-eq p1, v0, :cond_2

    .line 520
    const/4 v0, 0x6

    if-eq p1, v0, :cond_2

    move v0, v1

    .line 521
    :goto_0
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->isInPlaybackState()Z

    move-result v2

    if-eqz v2, :cond_6

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_6

    .line 522
    const/16 v0, 0x4f

    if-eq p1, v0, :cond_0

    .line 523
    const/16 v0, 0x55

    if-ne p1, v0, :cond_4

    .line 524
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 525
    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/VideoView;->pause()V

    .line 526
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->show()V

    .line 543
    :cond_1
    :goto_1
    return v1

    .line 515
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 528
    :cond_3
    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/VideoView;->start()V

    .line 529
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    goto :goto_1

    .line 532
    :cond_4
    const/16 v0, 0x56

    if-ne p1, v0, :cond_5

    .line 533
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 534
    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/VideoView;->pause()V

    .line 535
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->show()V

    goto :goto_1

    .line 539
    :cond_5
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->toggleMediaControlsVisiblity()V

    .line 543
    :cond_6
    invoke-super {p0, p1, p2}, Landroid/view/SurfaceView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_1
.end method

.method protected onMeasure(II)V
    .locals 4

    .prologue
    .line 105
    iget v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoWidth:I

    invoke-static {v0, p1}, Lcom/auditude/ads/view/linear/VideoView;->getDefaultSize(II)I

    move-result v1

    .line 106
    iget v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoHeight:I

    invoke-static {v0, p2}, Lcom/auditude/ads/view/linear/VideoView;->getDefaultSize(II)I

    move-result v0

    .line 107
    iget v2, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoWidth:I

    if-lez v2, :cond_0

    iget v2, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoHeight:I

    if-lez v2, :cond_0

    .line 108
    iget v2, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoWidth:I

    mul-int/2addr v2, v0

    iget v3, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoHeight:I

    mul-int/2addr v3, v1

    if-le v2, v3, :cond_1

    .line 110
    iget v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoHeight:I

    mul-int/2addr v0, v1

    iget v2, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoWidth:I

    div-int/2addr v0, v2

    .line 121
    :cond_0
    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/auditude/ads/view/linear/VideoView;->setMeasuredDimension(II)V

    .line 122
    return-void

    .line 111
    :cond_1
    iget v2, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoWidth:I

    mul-int/2addr v2, v0

    iget v3, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoHeight:I

    mul-int/2addr v3, v1

    if-ge v2, v3, :cond_0

    .line 113
    iget v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoWidth:I

    mul-int/2addr v1, v0

    iget v2, p0, Lcom/auditude/ads/view/linear/VideoView;->mVideoHeight:I

    div-int/2addr v1, v2

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .prologue
    .line 498
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 499
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->toggleMediaControlsVisiblity()V

    .line 501
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .prologue
    .line 506
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 507
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->toggleMediaControlsVisiblity()V

    .line 509
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public pause()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 563
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 564
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 565
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 566
    iput v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentState:I

    .line 569
    :cond_0
    iput v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mTargetState:I

    .line 570
    return-void
.end method

.method public resolveAdjustedSize(II)I
    .locals 2

    .prologue
    .line 125
    .line 126
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 127
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 129
    sparse-switch v1, :sswitch_data_0

    .line 150
    :goto_0
    :sswitch_0
    return p1

    .line 142
    :sswitch_1
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    goto :goto_0

    :sswitch_2
    move p1, v0

    .line 147
    goto :goto_0

    .line 129
    nop

    :sswitch_data_0
    .sparse-switch
        -0x80000000 -> :sswitch_1
        0x0 -> :sswitch_0
        0x40000000 -> :sswitch_2
    .end sparse-switch
.end method

.method public resume()V
    .locals 0

    .prologue
    .line 577
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->openVideo()V

    .line 578
    return-void
.end method

.method public seekTo(I)V
    .locals 1

    .prologue
    .line 601
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 602
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 603
    const/4 v0, 0x0

    iput v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mSeekWhenPrepared:I

    .line 607
    :goto_0
    return-void

    .line 605
    :cond_0
    iput p1, p0, Lcom/auditude/ads/view/linear/VideoView;->mSeekWhenPrepared:I

    goto :goto_0
.end method

.method public setMediaController(Landroid/widget/MediaController;)V
    .locals 1

    .prologue
    .line 247
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 248
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 250
    :cond_0
    iput-object p1, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaController:Landroid/widget/MediaController;

    .line 251
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->attachMediaController()V

    .line 252
    return-void
.end method

.method public setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V
    .locals 0

    .prologue
    .line 433
    iput-object p1, p0, Lcom/auditude/ads/view/linear/VideoView;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 434
    return-void
.end method

.method public setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V
    .locals 0

    .prologue
    .line 446
    iput-object p1, p0, Lcom/auditude/ads/view/linear/VideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 447
    return-void
.end method

.method public setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V
    .locals 0

    .prologue
    .line 422
    iput-object p1, p0, Lcom/auditude/ads/view/linear/VideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 423
    return-void
.end method

.method public setVideoPath(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 169
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/auditude/ads/view/linear/VideoView;->setVideoURI(Landroid/net/Uri;)V

    .line 170
    return-void
.end method

.method public setVideoURI(Landroid/net/Uri;)V
    .locals 1

    .prologue
    .line 173
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/auditude/ads/view/linear/VideoView;->setVideoURI(Landroid/net/Uri;Ljava/util/Map;)V

    .line 174
    return-void
.end method

.method public setVideoURI(Landroid/net/Uri;Ljava/util/Map;)V
    .locals 1

    .prologue
    .line 180
    iput-object p1, p0, Lcom/auditude/ads/view/linear/VideoView;->mUri:Landroid/net/Uri;

    .line 182
    const/4 v0, 0x0

    iput v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mSeekWhenPrepared:I

    .line 183
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->openVideo()V

    .line 184
    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/VideoView;->requestLayout()V

    .line 185
    invoke-virtual {p0}, Lcom/auditude/ads/view/linear/VideoView;->invalidate()V

    .line 186
    return-void
.end method

.method public start()V
    .locals 2

    .prologue
    const/4 v1, 0x3

    .line 555
    invoke-direct {p0}, Lcom/auditude/ads/view/linear/VideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 556
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 557
    iput v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentState:I

    .line 559
    :cond_0
    iput v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mTargetState:I

    .line 560
    return-void
.end method

.method public stopPlayback()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 189
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 190
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 191
    iget-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 192
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/view/linear/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 193
    iput v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mCurrentState:I

    .line 194
    iput v1, p0, Lcom/auditude/ads/view/linear/VideoView;->mTargetState:I

    .line 196
    :cond_0
    return-void
.end method

.method public suspend()V
    .locals 1

    .prologue
    .line 573
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/auditude/ads/view/linear/VideoView;->release(Z)V

    .line 574
    return-void
.end method
