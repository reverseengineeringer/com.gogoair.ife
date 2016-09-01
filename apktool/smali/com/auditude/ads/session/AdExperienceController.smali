.class public Lcom/auditude/ads/session/AdExperienceController;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/util/event/IEventListener;


# static fields
.field private static final BREAK_TOLERANCE:I = 0x1f4


# instance fields
.field private adSettings:Lcom/auditude/ads/core/AdSettings;

.field private apiBridge:Lcom/auditude/ads/core/APIBridge;

.field private breakManager:Lcom/auditude/ads/session/BreakManager;

.field private chapterManager:Lcom/auditude/ads/session/ChapterManager;

.field private currentChapterIndex:I

.field private isManagingBreak:Z

.field private lastPosition:I

.field private mediaResumeTime:I

.field private response:Lcom/auditude/ads/response/AdResponse;

.field private skipAllBreaks:Z

.field private skipBreaksBeforeResumeTime:Z

.field private viewManager:Lcom/auditude/ads/view/ViewManager;


# direct methods
.method public constructor <init>(Lcom/auditude/ads/response/AdResponse;Lcom/auditude/ads/core/APIBridge;Lcom/auditude/ads/core/AdSettings;Landroid/view/ViewGroup;)V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-boolean v1, p0, Lcom/auditude/ads/session/AdExperienceController;->isManagingBreak:Z

    .line 28
    iput-boolean v1, p0, Lcom/auditude/ads/session/AdExperienceController;->skipBreaksBeforeResumeTime:Z

    .line 29
    iput-boolean v1, p0, Lcom/auditude/ads/session/AdExperienceController;->skipAllBreaks:Z

    .line 30
    const/4 v0, -0x1

    iput v0, p0, Lcom/auditude/ads/session/AdExperienceController;->currentChapterIndex:I

    .line 31
    iput v1, p0, Lcom/auditude/ads/session/AdExperienceController;->mediaResumeTime:I

    .line 32
    iput v1, p0, Lcom/auditude/ads/session/AdExperienceController;->lastPosition:I

    .line 42
    iput-object p1, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    .line 43
    iput-object p2, p0, Lcom/auditude/ads/session/AdExperienceController;->apiBridge:Lcom/auditude/ads/core/APIBridge;

    .line 44
    iput-object p3, p0, Lcom/auditude/ads/session/AdExperienceController;->adSettings:Lcom/auditude/ads/core/AdSettings;

    .line 46
    new-instance v0, Lcom/auditude/ads/view/ViewManager;

    invoke-direct {v0, p4, p2, p3}, Lcom/auditude/ads/view/ViewManager;-><init>(Landroid/view/ViewGroup;Lcom/auditude/ads/core/APIBridge;Lcom/auditude/ads/core/AdSettings;)V

    iput-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->viewManager:Lcom/auditude/ads/view/ViewManager;

    .line 47
    new-instance v0, Lcom/auditude/ads/session/ChapterManager;

    iget-object v1, p0, Lcom/auditude/ads/session/AdExperienceController;->viewManager:Lcom/auditude/ads/view/ViewManager;

    invoke-direct {v0, p2, v1, p3}, Lcom/auditude/ads/session/ChapterManager;-><init>(Lcom/auditude/ads/core/APIBridge;Lcom/auditude/ads/view/ViewManager;Lcom/auditude/ads/core/AdSettings;)V

    iput-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->chapterManager:Lcom/auditude/ads/session/ChapterManager;

    .line 48
    new-instance v0, Lcom/auditude/ads/session/BreakManager;

    iget-object v1, p0, Lcom/auditude/ads/session/AdExperienceController;->viewManager:Lcom/auditude/ads/view/ViewManager;

    invoke-direct {v0, p2, v1, p3}, Lcom/auditude/ads/session/BreakManager;-><init>(Lcom/auditude/ads/core/APIBridge;Lcom/auditude/ads/view/ViewManager;Lcom/auditude/ads/core/AdSettings;)V

    iput-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->breakManager:Lcom/auditude/ads/session/BreakManager;

    .line 51
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->apiBridge:Lcom/auditude/ads/core/APIBridge;

    const-string v1, "apiEvent"

    const/16 v2, 0x64

    invoke-virtual {v0, v1, p0, v2}, Lcom/auditude/ads/core/APIBridge;->addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;I)V

    .line 52
    return-void
.end method

.method private getBreakAtIndex(I)Lcom/auditude/ads/model/smil/Group;
    .locals 1

    .prologue
    .line 335
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getBreaks()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getBreaks()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gt v0, p1, :cond_1

    .line 337
    :cond_0
    const/4 v0, 0x0

    .line 340
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getBreaks()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Group;

    goto :goto_0
.end method

.method private getBreakBeforePosition(IZ)Lcom/auditude/ads/model/smil/Group;
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 388
    :try_start_0
    iget-boolean v0, p0, Lcom/auditude/ads/session/AdExperienceController;->skipAllBreaks:Z

    if-nez v0, :cond_0

    if-lez p1, :cond_0

    .line 390
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getBreaks()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getBreaks()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 394
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getBreaks()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    move v2, v0

    :goto_0
    const/4 v0, 0x1

    if-ge v2, v0, :cond_2

    :cond_0
    :goto_1
    move-object v0, v1

    .line 419
    :cond_1
    :goto_2
    return-object v0

    .line 396
    :cond_2
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getBreaks()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Group;

    .line 397
    invoke-direct {p0, v0, p1, p2}, Lcom/auditude/ads/session/AdExperienceController;->isGroupQualifiedForPosition(Lcom/auditude/ads/model/smil/Group;IZ)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 399
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->isWatched()Z

    move-result v2

    if-nez v2, :cond_3

    .line 401
    iget-boolean v2, p0, Lcom/auditude/ads/session/AdExperienceController;->skipBreaksBeforeResumeTime:Z

    if-eqz v2, :cond_1

    iget v2, p0, Lcom/auditude/ads/session/AdExperienceController;->mediaResumeTime:I

    if-lez v2, :cond_1

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getStartTime()I

    move-result v2

    iget v3, p0, Lcom/auditude/ads/session/AdExperienceController;->mediaResumeTime:I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    if-gt v2, v3, :cond_1

    move-object v0, v1

    .line 403
    goto :goto_2

    :cond_3
    move-object v0, v1

    .line 409
    goto :goto_2

    .line 394
    :cond_4
    add-int/lit8 v0, v2, -0x1

    move v2, v0

    goto :goto_0

    .line 415
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method private getChapterAtIndex(I)Lcom/auditude/ads/model/smil/Group;
    .locals 1

    .prologue
    .line 345
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gt v0, p1, :cond_1

    .line 347
    :cond_0
    const/4 v0, 0x0

    .line 350
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Group;

    goto :goto_0
.end method

.method private getNextBreak()Lcom/auditude/ads/model/smil/Group;
    .locals 1

    .prologue
    .line 330
    iget v0, p0, Lcom/auditude/ads/session/AdExperienceController;->currentChapterIndex:I

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/auditude/ads/session/AdExperienceController;->getBreakAtIndex(I)Lcom/auditude/ads/model/smil/Group;

    move-result-object v0

    return-object v0
.end method

.method private inSameChapter(II)Z
    .locals 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 355
    if-ne p1, p2, :cond_1

    .line 381
    :cond_0
    :goto_0
    return v2

    .line 357
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getBreaks()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getBreaks()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, v2, :cond_0

    move v1, v2

    .line 361
    :goto_1
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getBreaks()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_0

    .line 363
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->getBreaks()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Group;

    .line 364
    if-ge p1, p2, :cond_2

    .line 366
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getStartTime()I

    move-result v4

    if-lt v4, p1, :cond_3

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getStartTime()I

    move-result v0

    if-gt v0, p2, :cond_3

    move v2, v3

    .line 368
    goto :goto_0

    .line 373
    :cond_2
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getStartTime()I

    move-result v4

    if-lt v4, p2, :cond_3

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getStartTime()I

    move-result v0

    if-gt v0, p1, :cond_3

    move v2, v3

    .line 375
    goto :goto_0

    .line 361
    :cond_3
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1
.end method

.method private isGroupQualifiedForPosition(Lcom/auditude/ads/model/smil/Group;IZ)Z
    .locals 4

    .prologue
    const/16 v3, 0x1f4

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 424
    if-nez p1, :cond_1

    .line 432
    :cond_0
    :goto_0
    return v0

    .line 426
    :cond_1
    if-nez p3, :cond_2

    .line 428
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Group;->getStartTime()I

    move-result v2

    if-gt v2, p2, :cond_0

    move v0, v1

    goto :goto_0

    .line 432
    :cond_2
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Group;->getStartTime()I

    move-result v2

    if-lt v2, p2, :cond_3

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Group;->getStartTime()I

    move-result v2

    sub-int/2addr v2, p2

    if-le v2, v3, :cond_4

    :cond_3
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Group;->getStartTime()I

    move-result v2

    if-ge v2, p2, :cond_0

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Group;->getStartTime()I

    move-result v2

    sub-int v2, p2, v2

    if-gt v2, v3, :cond_0

    :cond_4
    move v0, v1

    goto :goto_0
.end method

.method private onBreakBeginNotification(Ljava/util/HashMap;)V
    .locals 2

    .prologue
    .line 107
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->breakManager:Lcom/auditude/ads/session/BreakManager;

    invoke-virtual {v0}, Lcom/auditude/ads/session/BreakManager;->isHandlingBreak()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 129
    :goto_0
    return-void

    .line 110
    :cond_0
    invoke-direct {p0, p1}, Lcom/auditude/ads/session/AdExperienceController;->onMediaPlaybackCompleteNotification(Ljava/util/HashMap;)V

    .line 113
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    iget-object v0, v0, Lcom/auditude/ads/core/AuditudeEnv;->shouldIgnoreNextBreak:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 115
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->apiBridge:Lcom/auditude/ads/core/APIBridge;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/APIBridge;->breakEnd(Ljava/util/HashMap;)V

    goto :goto_0

    .line 119
    :cond_1
    if-eqz p1, :cond_2

    const-string v0, "breakIndex"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 121
    const-string v0, "breakIndex"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 122
    if-ltz v0, :cond_2

    .line 124
    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/auditude/ads/session/AdExperienceController;->currentChapterIndex:I

    .line 128
    :cond_2
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->breakManager:Lcom/auditude/ads/session/BreakManager;

    invoke-direct {p0}, Lcom/auditude/ads/session/AdExperienceController;->getNextBreak()Lcom/auditude/ads/model/smil/Group;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/auditude/ads/session/BreakManager;->begin(Lcom/auditude/ads/model/smil/Group;)V

    goto :goto_0
.end method

.method private onBreakEndNotification(Ljava/util/HashMap;)V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 136
    const-string v0, "skipNextBreak"

    invoke-static {v0}, Lcom/auditude/ads/session/AdExceptions;->hasException(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 138
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->breakManager:Lcom/auditude/ads/session/BreakManager;

    invoke-virtual {v0}, Lcom/auditude/ads/session/BreakManager;->isHandlingBreak()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 140
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/auditude/ads/core/AuditudeEnv;->shouldPauseAdPatterns:Ljava/lang/Boolean;

    .line 141
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/auditude/ads/core/AuditudeEnv;->shouldIgnoreNextBreak:Ljava/lang/Boolean;

    .line 148
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/session/AdExperienceController;->isManagingBreak:Z

    .line 149
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->breakManager:Lcom/auditude/ads/session/BreakManager;

    invoke-virtual {v0}, Lcom/auditude/ads/session/BreakManager;->end()V

    .line 150
    return-void
.end method

.method private onMediaPlaybackCompleteNotification(Ljava/util/HashMap;)V
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->chapterManager:Lcom/auditude/ads/session/ChapterManager;

    invoke-virtual {v0}, Lcom/auditude/ads/session/ChapterManager;->isHandlingChapter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 196
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->chapterManager:Lcom/auditude/ads/session/ChapterManager;

    invoke-virtual {v0}, Lcom/auditude/ads/session/ChapterManager;->end()V

    .line 198
    :cond_0
    return-void
.end method

.method private onMediaPlaybackPausedNotification(Ljava/util/HashMap;)V
    .locals 1

    .prologue
    .line 205
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->chapterManager:Lcom/auditude/ads/session/ChapterManager;

    invoke-virtual {v0}, Lcom/auditude/ads/session/ChapterManager;->isHandlingChapter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->chapterManager:Lcom/auditude/ads/session/ChapterManager;

    invoke-virtual {v0}, Lcom/auditude/ads/session/ChapterManager;->pause()V

    .line 209
    :cond_0
    return-void
.end method

.method private onMediaPlaybackResumedNotification(Ljava/util/HashMap;)V
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->chapterManager:Lcom/auditude/ads/session/ChapterManager;

    invoke-virtual {v0}, Lcom/auditude/ads/session/ChapterManager;->isHandlingChapter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 219
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->chapterManager:Lcom/auditude/ads/session/ChapterManager;

    invoke-virtual {v0}, Lcom/auditude/ads/session/ChapterManager;->resume()V

    .line 226
    :goto_0
    return-void

    .line 224
    :cond_0
    invoke-direct {p0, p1}, Lcom/auditude/ads/session/AdExperienceController;->onMediaPlaybackStartedNotification(Ljava/util/HashMap;)V

    goto :goto_0
.end method

.method private onMediaPlaybackStartedNotification(Ljava/util/HashMap;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 154
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->chapterManager:Lcom/auditude/ads/session/ChapterManager;

    invoke-virtual {v0}, Lcom/auditude/ads/session/ChapterManager;->isHandlingChapter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 156
    invoke-direct {p0, p1}, Lcom/auditude/ads/session/AdExperienceController;->onMediaPlaybackResumedNotification(Ljava/util/HashMap;)V

    .line 187
    :goto_0
    return-void

    .line 161
    :cond_0
    iget v0, p0, Lcom/auditude/ads/session/AdExperienceController;->currentChapterIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/auditude/ads/session/AdExperienceController;->currentChapterIndex:I

    .line 163
    if-eqz p1, :cond_2

    .line 165
    const-string v0, "auditudeSkipBreaksBeforeResumeTime"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 167
    const-string v0, "auditudeSkipBreaksBeforeResumeTime"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/auditude/ads/util/ObjectUtil;->convertToBoolean(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/auditude/ads/session/AdExperienceController;->skipBreaksBeforeResumeTime:Z

    .line 170
    :cond_1
    const-string v0, "auditudeResumeTimeInMilliSeconds"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 172
    const-string v0, "auditudeResumeTimeInMilliSeconds"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/auditude/ads/util/ObjectUtil;->convertToInt(Ljava/lang/Object;I)I

    move-result v0

    iput v0, p0, Lcom/auditude/ads/session/AdExperienceController;->mediaResumeTime:I

    .line 177
    :cond_2
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->breakManager:Lcom/auditude/ads/session/BreakManager;

    invoke-virtual {v0}, Lcom/auditude/ads/session/BreakManager;->isHandlingBreak()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 179
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->breakManager:Lcom/auditude/ads/session/BreakManager;

    invoke-virtual {v0}, Lcom/auditude/ads/session/BreakManager;->end()V

    .line 183
    :cond_3
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->chapterManager:Lcom/auditude/ads/session/ChapterManager;

    iget v1, p0, Lcom/auditude/ads/session/AdExperienceController;->currentChapterIndex:I

    invoke-direct {p0, v1}, Lcom/auditude/ads/session/AdExperienceController;->getChapterAtIndex(I)Lcom/auditude/ads/model/smil/Group;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/auditude/ads/session/ChapterManager;->begin(Lcom/auditude/ads/model/smil/Group;)V

    .line 185
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/auditude/ads/core/AuditudeEnv;->shouldPauseAdPatterns:Ljava/lang/Boolean;

    .line 186
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/auditude/ads/core/AuditudeEnv;->shouldIgnoreNextBreak:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method private onMediaPlayheadUpdateNotification(Ljava/util/HashMap;Z)V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 256
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->breakManager:Lcom/auditude/ads/session/BreakManager;

    invoke-virtual {v0}, Lcom/auditude/ads/session/BreakManager;->isHandlingBreak()Z

    move-result v0

    if-nez v0, :cond_0

    if-nez p1, :cond_1

    .line 302
    :cond_0
    return-void

    .line 259
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->adSettings:Lcom/auditude/ads/core/AdSettings;

    const-string v1, "auditudeHandlesChapterBreaks"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 261
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 263
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v3, "position"

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 265
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, -0x1

    invoke-static {v0, v1}, Lcom/auditude/ads/util/ObjectUtil;->convertToInt(Ljava/lang/Object;I)I

    move-result v0

    .line 267
    if-lez v0, :cond_2

    .line 270
    iget-object v1, p0, Lcom/auditude/ads/session/AdExperienceController;->chapterManager:Lcom/auditude/ads/session/ChapterManager;

    invoke-virtual {v1, v0}, Lcom/auditude/ads/session/ChapterManager;->setPosition(I)V

    .line 271
    iput v0, p0, Lcom/auditude/ads/session/AdExperienceController;->lastPosition:I

    .line 273
    invoke-static {v0}, Lcom/auditude/ads/util/AuditudeUtil;->setContentPlayhead(I)V

    .line 275
    const-string v1, "Auditude"

    invoke-static {v1}, Lcom/auditude/ads/util/log/Log;->getLogger(Ljava/lang/String;)Lcom/auditude/ads/util/log/ILogger;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "position: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lcom/auditude/ads/util/log/ILogger;->info(Ljava/lang/Object;)V

    .line 277
    invoke-direct {p0, v0, p2}, Lcom/auditude/ads/session/AdExperienceController;->getBreakBeforePosition(IZ)Lcom/auditude/ads/model/smil/Group;

    move-result-object v1

    .line 278
    if-eqz v1, :cond_2

    .line 280
    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Group;->getIndex()I

    move-result v0

    if-lez v0, :cond_3

    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Group;->getIndex()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_1
    iput v0, p0, Lcom/auditude/ads/session/AdExperienceController;->currentChapterIndex:I

    .line 281
    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Group;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    .line 283
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/auditude/ads/session/AdExperienceController;->isManagingBreak:Z

    .line 284
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->apiBridge:Lcom/auditude/ads/core/APIBridge;

    invoke-virtual {v0, v5}, Lcom/auditude/ads/core/APIBridge;->pauseMainMedia(Ljava/util/HashMap;)V

    .line 286
    const-string v0, "breakBegin"

    invoke-virtual {p0, v0, v5}, Lcom/auditude/ads/session/AdExperienceController;->notify(Ljava/lang/String;Ljava/util/HashMap;)V

    goto :goto_0

    .line 280
    :cond_3
    const/4 v0, 0x0

    goto :goto_1

    .line 293
    :cond_4
    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Group;->end()V

    .line 295
    const-string v0, "mediaPlaybackComplete"

    invoke-virtual {p0, v0, v5}, Lcom/auditude/ads/session/AdExperienceController;->notify(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 296
    const-string v0, "mediaPlaybackStarted"

    invoke-virtual {p0, v0, v5}, Lcom/auditude/ads/session/AdExperienceController;->notify(Ljava/lang/String;Ljava/util/HashMap;)V

    goto/16 :goto_0
.end method

.method private onMediaSeekCompleteNotification(Ljava/util/HashMap;)V
    .locals 4

    .prologue
    .line 231
    iget-boolean v0, p0, Lcom/auditude/ads/session/AdExperienceController;->skipAllBreaks:Z

    if-nez v0, :cond_0

    if-nez p1, :cond_1

    .line 251
    :cond_0
    :goto_0
    return-void

    .line 235
    :cond_1
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 237
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v3, "position"

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 240
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, -0x1

    invoke-static {v0, v1}, Lcom/auditude/ads/util/ObjectUtil;->convertToInt(Ljava/lang/Object;I)I

    move-result v0

    .line 243
    iget v1, p0, Lcom/auditude/ads/session/AdExperienceController;->lastPosition:I

    invoke-direct {p0, v1, v0}, Lcom/auditude/ads/session/AdExperienceController;->inSameChapter(II)Z

    move-result v0

    if-nez v0, :cond_0

    .line 245
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/auditude/ads/session/AdExperienceController;->onMediaPlayheadUpdateNotification(Ljava/util/HashMap;Z)V

    goto :goto_0
.end method

.method private shouldPlayBreaksAtMarkers()Z
    .locals 2

    .prologue
    .line 325
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->adSettings:Lcom/auditude/ads/core/AdSettings;

    const-string v1, "auditudePlayBreaksAtMarkers"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->getPropertyAsBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public final HasBreak(I)Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 56
    if-gez p1, :cond_1

    invoke-direct {p0}, Lcom/auditude/ads/session/AdExperienceController;->getNextBreak()Lcom/auditude/ads/model/smil/Group;

    move-result-object v1

    .line 57
    :goto_0
    if-nez v1, :cond_2

    .line 59
    :cond_0
    :goto_1
    return v0

    .line 56
    :cond_1
    invoke-direct {p0, p1}, Lcom/auditude/ads/session/AdExperienceController;->getBreakAtIndex(I)Lcom/auditude/ads/model/smil/Group;

    move-result-object v1

    goto :goto_0

    .line 59
    :cond_2
    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Group;->isWatched()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Group;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_1
.end method

.method public final dispose()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 439
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->apiBridge:Lcom/auditude/ads/core/APIBridge;

    const-string v1, "apiEvent"

    invoke-virtual {v0, v1, p0}, Lcom/auditude/ads/core/APIBridge;->removeEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V

    .line 441
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->breakManager:Lcom/auditude/ads/session/BreakManager;

    invoke-virtual {v0}, Lcom/auditude/ads/session/BreakManager;->dispose()V

    .line 442
    iput-object v2, p0, Lcom/auditude/ads/session/AdExperienceController;->breakManager:Lcom/auditude/ads/session/BreakManager;

    .line 444
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->chapterManager:Lcom/auditude/ads/session/ChapterManager;

    invoke-virtual {v0}, Lcom/auditude/ads/session/ChapterManager;->dispose()V

    .line 445
    iput-object v2, p0, Lcom/auditude/ads/session/AdExperienceController;->chapterManager:Lcom/auditude/ads/session/ChapterManager;

    .line 447
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->viewManager:Lcom/auditude/ads/view/ViewManager;

    invoke-virtual {v0}, Lcom/auditude/ads/view/ViewManager;->dispose()V

    .line 448
    iput-object v2, p0, Lcom/auditude/ads/session/AdExperienceController;->viewManager:Lcom/auditude/ads/view/ViewManager;

    .line 450
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    if-eqz v0, :cond_0

    .line 452
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AdResponse;->dispose()V

    .line 453
    iput-object v2, p0, Lcom/auditude/ads/session/AdExperienceController;->response:Lcom/auditude/ads/response/AdResponse;

    .line 455
    :cond_0
    return-void
.end method

.method public final notify(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 1

    .prologue
    .line 69
    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 103
    :cond_0
    :goto_0
    return-void

    .line 71
    :cond_1
    const-string v0, "breakBegin"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 73
    invoke-direct {p0, p2}, Lcom/auditude/ads/session/AdExperienceController;->onBreakBeginNotification(Ljava/util/HashMap;)V

    goto :goto_0

    .line 75
    :cond_2
    const-string v0, "breakEnd"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 77
    invoke-direct {p0, p2}, Lcom/auditude/ads/session/AdExperienceController;->onBreakEndNotification(Ljava/util/HashMap;)V

    goto :goto_0

    .line 79
    :cond_3
    const-string v0, "mediaPlaybackStarted"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 81
    invoke-direct {p0, p2}, Lcom/auditude/ads/session/AdExperienceController;->onMediaPlaybackStartedNotification(Ljava/util/HashMap;)V

    goto :goto_0

    .line 83
    :cond_4
    const-string v0, "mediaPlaybackComplete"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 85
    invoke-direct {p0, p2}, Lcom/auditude/ads/session/AdExperienceController;->onMediaPlaybackCompleteNotification(Ljava/util/HashMap;)V

    goto :goto_0

    .line 87
    :cond_5
    const-string v0, "mediaPlaybackPaused"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 89
    invoke-direct {p0, p2}, Lcom/auditude/ads/session/AdExperienceController;->onMediaPlaybackPausedNotification(Ljava/util/HashMap;)V

    goto :goto_0

    .line 91
    :cond_6
    const-string v0, "mediaPlaybackResumed"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 93
    invoke-direct {p0, p2}, Lcom/auditude/ads/session/AdExperienceController;->onMediaPlaybackResumedNotification(Ljava/util/HashMap;)V

    goto :goto_0

    .line 95
    :cond_7
    const-string v0, "mediaSeekComplete"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 97
    invoke-direct {p0, p2}, Lcom/auditude/ads/session/AdExperienceController;->onMediaSeekCompleteNotification(Ljava/util/HashMap;)V

    goto :goto_0

    .line 99
    :cond_8
    const-string v0, "mediaProgress"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    invoke-direct {p0}, Lcom/auditude/ads/session/AdExperienceController;->shouldPlayBreaksAtMarkers()Z

    move-result v0

    invoke-direct {p0, p2, v0}, Lcom/auditude/ads/session/AdExperienceController;->onMediaPlayheadUpdateNotification(Ljava/util/HashMap;Z)V

    goto :goto_0
.end method

.method public onEvent(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 306
    instance-of v0, p2, Lcom/auditude/ads/event/AdPluginEvent;

    if-eqz v0, :cond_0

    check-cast p2, Lcom/auditude/ads/event/AdPluginEvent;

    invoke-virtual {p2}, Lcom/auditude/ads/event/AdPluginEvent;->getType()Ljava/lang/String;

    move-result-object v0

    const-string v1, "breakEnd"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 309
    iget-boolean v0, p0, Lcom/auditude/ads/session/AdExperienceController;->isManagingBreak:Z

    if-eqz v0, :cond_0

    .line 311
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/session/AdExperienceController;->isManagingBreak:Z

    .line 312
    iget-object v0, p0, Lcom/auditude/ads/session/AdExperienceController;->apiBridge:Lcom/auditude/ads/core/APIBridge;

    invoke-virtual {v0, v2}, Lcom/auditude/ads/core/APIBridge;->resumeMainMedia(Ljava/util/HashMap;)V

    .line 315
    iget v0, p0, Lcom/auditude/ads/session/AdExperienceController;->currentChapterIndex:I

    if-ltz v0, :cond_0

    .line 317
    const-string v0, "mediaPlaybackStarted"

    invoke-virtual {p0, v0, v2}, Lcom/auditude/ads/session/AdExperienceController;->notify(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 321
    :cond_0
    return-void
.end method
