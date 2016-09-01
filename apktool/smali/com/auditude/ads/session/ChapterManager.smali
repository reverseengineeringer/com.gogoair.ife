.class public Lcom/auditude/ads/session/ChapterManager;
.super Lcom/auditude/ads/session/GroupManager;
.source "SourceFile"


# instance fields
.field private position:I


# direct methods
.method public constructor <init>(Lcom/auditude/ads/core/APIBridge;Lcom/auditude/ads/view/ViewManager;Lcom/auditude/ads/core/AdSettings;)V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0, p1, p2, p3}, Lcom/auditude/ads/session/GroupManager;-><init>(Lcom/auditude/ads/core/APIBridge;Lcom/auditude/ads/view/ViewManager;Lcom/auditude/ads/core/AdSettings;)V

    .line 10
    const/4 v0, 0x0

    iput v0, p0, Lcom/auditude/ads/session/ChapterManager;->position:I

    .line 15
    return-void
.end method


# virtual methods
.method public final getPosition()I
    .locals 1

    .prologue
    .line 19
    iget v0, p0, Lcom/auditude/ads/session/ChapterManager;->position:I

    return v0
.end method

.method protected groupEnd()V
    .locals 0

    .prologue
    .line 48
    return-void
.end method

.method public final isHandlingChapter()Z
    .locals 1

    .prologue
    .line 29
    invoke-virtual {p0}, Lcom/auditude/ads/session/ChapterManager;->isHandlingGroup()Z

    move-result v0

    return v0
.end method

.method public final pause()V
    .locals 0

    .prologue
    .line 35
    return-void
.end method

.method public final resume()V
    .locals 0

    .prologue
    .line 40
    return-void
.end method

.method public final setPosition(I)V
    .locals 0

    .prologue
    .line 24
    iput p1, p0, Lcom/auditude/ads/session/ChapterManager;->position:I

    .line 25
    return-void
.end method

.method protected showAdSource(Lcom/auditude/ads/view/model/AdViewSource;)V
    .locals 0

    .prologue
    .line 54
    return-void
.end method
