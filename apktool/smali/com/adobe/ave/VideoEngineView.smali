.class public Lcom/adobe/ave/VideoEngineView;
.super Landroid/view/SurfaceView;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# static fields
.field static final TAG:Ljava/lang/String; = "VideoEngineView(j)"


# instance fields
.field mHolder:Landroid/view/SurfaceHolder;

.field private mLockedCanvas:Landroid/graphics/Canvas;

.field private m_nativeInstance:J

.field private m_surface:Landroid/view/Surface;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .prologue
    .line 59
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 44
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/ave/VideoEngineView;->m_nativeInstance:J

    .line 55
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/ave/VideoEngineView;->m_surface:Landroid/view/Surface;

    .line 61
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    .line 64
    const/4 v0, 0x1

    :try_start_0
    invoke-super {p0, v0}, Landroid/view/SurfaceView;->setSecure(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/adobe/ave/VideoEngineView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/ave/VideoEngineView;->mHolder:Landroid/view/SurfaceHolder;

    .line 73
    invoke-virtual {p0}, Lcom/adobe/ave/VideoEngineView;->useOverlay()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 74
    iget-object v0, p0, Lcom/adobe/ave/VideoEngineView;->mHolder:Landroid/view/SurfaceHolder;

    const v1, 0x32315659

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 78
    :goto_1
    iget-object v0, p0, Lcom/adobe/ave/VideoEngineView;->mHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 79
    return-void

    .line 65
    :catch_0
    move-exception v0

    .line 67
    const-string v0, "VideoEngineView(j)"

    const-string v1, "Exception caught while calling setSecure"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 76
    :cond_1
    iget-object v0, p0, Lcom/adobe/ave/VideoEngineView;->mHolder:Landroid/view/SurfaceHolder;

    const/4 v1, 0x4

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setFormat(I)V

    goto :goto_1
.end method

.method private getSurface()Landroid/view/Surface;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/adobe/ave/VideoEngineView;->m_surface:Landroid/view/Surface;

    return-object v0
.end method

.method private lockCanvas(IIII)V
    .locals 2

    .prologue
    .line 144
    invoke-virtual {p0}, Lcom/adobe/ave/VideoEngineView;->useOverlay()Z

    move-result v0

    if-nez v0, :cond_0

    .line 146
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, p1, p2, p3, p4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 147
    iget-object v1, p0, Lcom/adobe/ave/VideoEngineView;->mHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v1, v0}, Landroid/view/SurfaceHolder;->lockCanvas(Landroid/graphics/Rect;)Landroid/graphics/Canvas;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/ave/VideoEngineView;->mLockedCanvas:Landroid/graphics/Canvas;

    .line 149
    :cond_0
    return-void
.end method

.method private native nativeDrawBitmapToCanvas(JLandroid/graphics/Canvas;)V
.end method

.method private native nativeSurfaceChanged(JII)V
.end method

.method private native nativeSurfaceCreated(JII)V
.end method

.method private native nativeSurfaceDestroyed(J)V
.end method

.method private unlockCanvas()V
    .locals 2

    .prologue
    .line 156
    invoke-virtual {p0}, Lcom/adobe/ave/VideoEngineView;->useOverlay()Z

    move-result v0

    if-nez v0, :cond_0

    .line 158
    iget-object v0, p0, Lcom/adobe/ave/VideoEngineView;->mHolder:Landroid/view/SurfaceHolder;

    iget-object v1, p0, Lcom/adobe/ave/VideoEngineView;->mLockedCanvas:Landroid/graphics/Canvas;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 160
    :cond_0
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .prologue
    .line 195
    invoke-super {p0, p1}, Landroid/view/SurfaceView;->onDraw(Landroid/graphics/Canvas;)V

    .line 197
    iget-wide v0, p0, Lcom/adobe/ave/VideoEngineView;->m_nativeInstance:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 198
    iget-wide v0, p0, Lcom/adobe/ave/VideoEngineView;->m_nativeInstance:J

    invoke-direct {p0, v0, v1, p1}, Lcom/adobe/ave/VideoEngineView;->nativeDrawBitmapToCanvas(JLandroid/graphics/Canvas;)V

    .line 199
    :cond_0
    return-void
.end method

.method public setNativeInstance(J)V
    .locals 1

    .prologue
    .line 129
    iput-wide p1, p0, Lcom/adobe/ave/VideoEngineView;->m_nativeInstance:J

    .line 130
    return-void
.end method

.method public setWillNotDraw(Z)V
    .locals 0

    .prologue
    .line 184
    return-void
.end method

.method public setWillNotDrawCaption(Z)V
    .locals 0

    .prologue
    .line 168
    invoke-super {p0, p1}, Landroid/view/SurfaceView;->setWillNotDraw(Z)V

    .line 169
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 4

    .prologue
    .line 121
    iget-wide v0, p0, Lcom/adobe/ave/VideoEngineView;->m_nativeInstance:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 122
    iget-wide v0, p0, Lcom/adobe/ave/VideoEngineView;->m_nativeInstance:J

    invoke-virtual {p0}, Lcom/adobe/ave/VideoEngineView;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/adobe/ave/VideoEngineView;->getHeight()I

    move-result v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/adobe/ave/VideoEngineView;->nativeSurfaceChanged(JII)V

    .line 123
    :cond_0
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 6

    .prologue
    .line 85
    iget-object v1, p0, Lcom/adobe/ave/VideoEngineView;->mHolder:Landroid/view/SurfaceHolder;

    monitor-enter v1

    .line 87
    :try_start_0
    invoke-virtual {p0}, Lcom/adobe/ave/VideoEngineView;->useOverlay()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 89
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/ave/VideoEngineView;->m_surface:Landroid/view/Surface;

    .line 101
    :goto_0
    iget-wide v2, p0, Lcom/adobe/ave/VideoEngineView;->m_nativeInstance:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-eqz v0, :cond_0

    .line 102
    iget-wide v2, p0, Lcom/adobe/ave/VideoEngineView;->m_nativeInstance:J

    invoke-virtual {p0}, Lcom/adobe/ave/VideoEngineView;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/adobe/ave/VideoEngineView;->getHeight()I

    move-result v4

    invoke-direct {p0, v2, v3, v0, v4}, Lcom/adobe/ave/VideoEngineView;->nativeSurfaceCreated(JII)V

    .line 103
    :cond_0
    monitor-exit v1

    .line 104
    :goto_1
    return-void

    .line 94
    :cond_1
    iget-object v0, p0, Lcom/adobe/ave/VideoEngineView;->mHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->lockCanvas()Landroid/graphics/Canvas;

    move-result-object v0

    .line 95
    if-nez v0, :cond_2

    .line 96
    monitor-exit v1

    goto :goto_1

    .line 103
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 97
    :cond_2
    const/4 v2, -0x1

    :try_start_1
    invoke-virtual {v0, v2}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 98
    iget-object v2, p0, Lcom/adobe/ave/VideoEngineView;->mHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v2, v0}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 4

    .prologue
    .line 110
    iget-wide v0, p0, Lcom/adobe/ave/VideoEngineView;->m_nativeInstance:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 111
    iget-wide v0, p0, Lcom/adobe/ave/VideoEngineView;->m_nativeInstance:J

    invoke-direct {p0, v0, v1}, Lcom/adobe/ave/VideoEngineView;->nativeSurfaceDestroyed(J)V

    .line 113
    :cond_0
    invoke-virtual {p0}, Lcom/adobe/ave/VideoEngineView;->useOverlay()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 114
    iget-object v0, p0, Lcom/adobe/ave/VideoEngineView;->m_surface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 115
    :cond_1
    return-void
.end method

.method protected useOverlay()Z
    .locals 2

    .prologue
    .line 205
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    .line 206
    const/4 v0, 0x1

    .line 208
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
